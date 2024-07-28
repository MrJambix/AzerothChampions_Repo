#include "ScriptMgr.h"
#include "Player.h"
#include "Chat.h"
#include "DatabaseEnv.h"
#include "Spell.h"
#include "WorldSession.h"

class npc_class_switch : public CreatureScript
{
public:
    npc_class_switch() : CreatureScript("npc_class_switch") { }

    struct npc_class_switchAI : public ScriptedAI
    {
        npc_class_switchAI(Creature* creature) : ScriptedAI(creature) { }

        void OnGossipHello(Player* player)
        {
            ClearGossipMenuFor(player);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, "I want to switch my class.", GOSSIP_SENDER_MAIN, 1);
            SendGossipMenuFor(player, 1, me->GetGUID());
        }

        void OnGossipSelect(Player* player, uint32 sender, uint32 action)
        {
            ClearGossipMenuFor(player);

            if (sender == GOSSIP_SENDER_MAIN && action == 1)
            {
                QueryResult result = CharacterDatabase.PQuery("SELECT class_id, class_name FROM class_switch_options WHERE npc_entry = %u", me->GetEntry());

                if (result)
                {
                    do
                    {
                        Field* fields = result->Fetch();
                        uint8 classId = fields[0].GetUInt8();
                        std::string className = fields[1].GetString();
                        AddGossipItemFor(player, GOSSIP_ICON_CHAT, className, GOSSIP_SENDER_MAIN, classId);
                    } while (result->NextRow());

                    SendGossipMenuFor(player, 1, me->GetGUID());
                }
                else
                {
                    ChatHandler(player->GetSession()).SendSysMessage("No class switch options available.");
                    CloseGossipMenuFor(player);
                }
            }
            else if (action >= 1 && action <= 11) // Class IDs range from 1 to 11
            {
                uint8 newClass = action;
                uint8 oldClass = player->getClass();

                // Save current spells and talents
                SavePlayerSpells(player);
                SavePlayerTalents(player);

                // Unequip class-specific gear
                for (uint8 slot = EQUIPMENT_SLOT_START; slot < EQUIPMENT_SLOT_END; ++slot)
                {
                    if (Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
                    {
                        if (!player->CanUseItem(item)) // If the item is not usable by the new class
                        {
                            player->RemoveItem(INVENTORY_SLOT_BAG_0, slot, true);
                            player->GetSession()->SendItemRemoved(item->GetGUID());
                            player->AddItemToInventory(item);
                        }
                    }
                }

                // Reset talents
                player->resetTalents(true);

                // Unlearn all spells
                player->RemoveAllSpells();

                // Set new class
                player->SetClass(newClass);
                player->InitTalentForLevel();

                // Learn class-specific spells
                player->LearnDefaultClassSpells();

                // Restore spells and talents if switching back to old class
                if (newClass != oldClass)
                {
                    RestorePlayerSpells(player, newClass);
                    RestorePlayerTalents(player, newClass);
                }

                ChatHandler(player->GetSession()).SendSysMessage("Your class has been switched.");
                CloseGossipMenuFor(player);
            }
        }

        void SavePlayerSpells(Player* player)
        {
            uint32 playerGuid = player->GetGUID().GetCounter();
            uint8 classId = player->getClass();

            CharacterDatabase.PExecute("DELETE FROM player_class_spells WHERE player_guid = %u AND class_id = %u", playerGuid, classId);

            const PlayerSpellMap& spellMap = player->GetSpellMap();
            for (const auto& spellPair : spellMap)
            {
                if (spellPair.second->state == PLAYERSPELL_REMOVED || IsPassiveSpell(spellPair.first))
                    continue;

                CharacterDatabase.PExecute("INSERT INTO player_class_spells (player_guid, class_id, spell_id) VALUES (%u, %u, %u)", playerGuid, classId, spellPair.first);
            }
        }

        void RestorePlayerSpells(Player* player, uint8 newClass)
        {
            uint32 playerGuid = player->GetGUID().GetCounter();

            QueryResult result = CharacterDatabase.PQuery("SELECT spell_id FROM player_class_spells WHERE player_guid = %u AND class_id = %u", playerGuid, newClass);

            if (result)
            {
                do
                {
                    Field* fields = result->Fetch();
                    uint32 spellId = fields[0].GetUInt32();
                    player->LearnSpell(spellId, false);
                } while (result->NextRow());
            }
        }

        void SavePlayerTalents(Player* player)
        {
            uint32 playerGuid = player->GetGUID().GetCounter();
            uint8 classId = player->getClass();

            CharacterDatabase.PExecute("DELETE FROM player_class_talents WHERE player_guid = %u AND class_id = %u", playerGuid, classId);

            for (uint32 spec = 0; spec < MAX_TALENT_SPECS; ++spec)
            {
                for (auto const& talent : player->GetSpecTab(spec))
                {
                    if (talent.second->CurrentRank > 0)
                    {
                        CharacterDatabase.PExecute("INSERT INTO player_class_talents (player_guid, class_id, talent_id, rank) VALUES (%u, %u, %u, %u)",
                            playerGuid, classId, talent.first, talent.second->CurrentRank);
                    }
                }
            }
        }

        void RestorePlayerTalents(Player* player, uint8 newClass)
        {
            uint32 playerGuid = player->GetGUID().GetCounter();

            QueryResult result = CharacterDatabase.PQuery("SELECT talent_id, rank FROM player_class_talents WHERE player_guid = %u AND class_id = %u", playerGuid, newClass);

            if (result)
            {
                do
                {
                    Field* fields = result->Fetch();
                    uint32 talentId = fields[0].GetUInt32();
                    uint8 rank = fields[1].GetUInt8();
                    player->LearnTalent(talentId, rank);
                } while (result->NextRow());
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_class_switchAI(creature);
    }
};

void AddSC_npc_class_switch()
{
    new npc_class_switch();
}
