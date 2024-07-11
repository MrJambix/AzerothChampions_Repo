/*
 * This Script was created by MrJambix
 * This script blocks the player from entering Vanilla WoW Raids and The Burning Crusade and Wrath of the Lich King Dungeons.
 * This script is useful for servers that want to restrict players from entering certain raids and dungeons.
 * Please do not delete this information.
 * ### Credits to MrJambix ###
 * ### Discord: MrJambix ###
 */

#include "block_expansion_content.h"

block_expansion_content::block_expansion_content() : PlayerScript("block_expansion_content") {}

void block_expansion_content::OnMapEnter(Player* player, Map* map)
{
    if (map->IsRaid())
    {
        uint32 mapId = map->GetId();
        std::set<uint32> blockedRaids = {
            // Vanilla WoW Raids
            249, // Onyxia's Lair
            509, // Ruins of Ahn'Qiraj
            531, // Temple of Ahn'Qiraj
            533, // Naxxramas
            // The Burning Crusade Raids
            532, // Karazhan
            544, // Magtheridon's Lair
            548, // Serpentshrine Cavern
            550, // Tempest Keep
            552, // The Arcatraz
            553, // The Botanica
            554, // The Mechanar
            555, // Shadow Labyrinth
            556, // Sethekk Halls
            557, // Mana-Tombs
            558, // Auchenai Crypts
            564, // Black Temple
            565, // Gruul's Lair
            568, // Zul'Aman
            580, // Sunwell Plateau
            // Wrath of the Lich King Raids
            533, // Naxxramas (Revisited in WotLK)
            603, // Ulduar
            615, // The Obsidian Sanctum
            616, // The Eye of Eternity
            624, // Vault of Archavon
            631, // Icecrown Citadel
            649, // Trial of the Crusader
            724, // The Ruby Sanctum
        };

        if (blockedRaids.find(mapId) != blockedRaids.end())
        {
            player->GetSession()->SendNotification("You are not allowed to enter this raid.");
            player->TeleportTo(player->m_homebindMapId, player->m_homebindX, player->m_homebindY, player->m_homebindZ, player->GetOrientation());
        }
    }
    else if (map->IsDungeon())
    {
        uint32 mapId = map->GetId();
        std::set<uint32> blockedDungeons = {
            // The Burning Crusade Dungeons
            269, // Opening of the Dark Portal
            540, // The Shattered Halls
            542, // The Blood Furnace
            543, // Hellfire Ramparts
            546, // The Underbog
            547, // The Slave Pens
            545, // The Steamvault
            548, // Coilfang Reservoir
            550, // Tempest Keep: The Arcatraz
            553, // Tempest Keep: The Botanica
            554, // Tempest Keep: The Mechanar
            556, // Auchindoun: Sethekk Halls
            557, // Auchindoun: Mana-Tombs
            558, // Auchindoun: Auchenai Crypts
            559, // Auchindoun: Shadow Labyrinth
            // Wrath of the Lich King Dungeons
            574, // Utgarde Keep
            575, // Utgarde Pinnacle
            576, // The Nexus
            578, // The Oculus
            595, // The Culling of Stratholme
            599, // Halls of Stone
            600, // Drak'Tharon Keep
            601, // The Violet Hold
            602, // Halls of Lightning
            604, // Gundrak
            608, // The Violet Hold
            619, // Ahn'kahet: The Old Kingdom
            632, // The Forge of Souls
            650, // Trial of the Champion
            658, // Pit of Saron
            668, // Halls of Reflection
        };

        if (blockedDungeons.find(mapId) != blockedDungeons.end())
        {
            player->GetSession()->SendNotification("You are not allowed to enter this dungeon.");
            player->TeleportTo(player->m_homebindMapId, player->m_homebindX, player's m_homebindY, player's m_homebindZ, player's GetOrientation());
        }
    }
}
