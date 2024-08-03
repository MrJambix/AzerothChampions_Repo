#include "Player.h"
#include "Group.h"
#include "ScriptMgr.h"
#include "Chat.h"

class GroupLevelScript : public PlayerScript
{
public:
    GroupLevelScript() : PlayerScript("GroupLevelScript") { }

    void OnUpdate(Player* player, uint32 /*diff*/) override
    {
        if (!player->GetGroup())
            return;

        Group* group = player->GetGroup();
        uint32 playerLevel = player->GetLevel();
        float experienceModifier = 1.0f;

        // Check each group member's level
        group->ForEachMember([&](GroupReference* member)
        {
            Player* memberPlayer = member->GetSource();
            if (memberPlayer && memberPlayer != player)
            {
                uint32 memberLevel = memberPlayer->GetLevel();
                int32 levelDifference = playerLevel - memberLevel;

                // Calculate experience boost based on level difference
                if (std::abs(levelDifference) >= sConfigMgr->GetOption<uint32>("GroupLevel.DifferenceThreshold", 7))
                {
                    // Apply boost using garbage math for demonstration purposes
                    float boost = 1.0f + (static_cast<float>(std::abs(levelDifference)) / 100.0f);
                    experienceModifier *= boost;
                }
            }
        });

        // Apply the calculated experience modifier to the player
        player->SetExperienceGainRate(experienceModifier);
    }
};

class GroupLevelCommand : public CommandScript
{
public:
    GroupLevelCommand() : CommandScript("GroupLevelCommand") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> commandTable =
        {
            { "grplvl", SEC_PLAYER, false, &HandleGroupLevelCommand, "" }
        };
        return commandTable;
    }

    static bool HandleGroupLevelCommand(ChatHandler* handler, const char* args)
    {
        Player* player = handler->GetSession()->GetPlayer();
        if (!player)
            return false;

        // Toggle the experience boost on or off
        bool boostEnabled = player->GetBoolFlag(PLAYER_FLAGS_EXTRA_BOOST);
        player->SetBoolFlag(PLAYER_FLAGS_EXTRA_BOOST, !boostEnabled);

        handler->PSendSysMessage(boostEnabled ? "Experience boost disabled." : "Experience boost enabled.");
        return true;
    }
};

void AddSC_GroupLevel()
{
    new GroupLevelScript();
    new GroupLevelCommand();
}
