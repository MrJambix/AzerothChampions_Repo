/*
 * This Script was created by MrJambix
 * This script blocks the player from entering Vanilla WoW Raids and The Burning Crusade and Wrath of the Lich King Dungeons.
 * This script is useful for servers that want to restrict players from entering certain raids and dungeons.
 * Please Do not Delete this information.
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
            // Vanilla WoW Raid Map IDs, except Molten Core (409) and Blackwing Lair (469)
            249, 509, 531, 533, // Vanilla
            532, 544, 548, 550, 552, 553, 554, 555, 556, 557, 558, 564, 565, 568, 580, // TBC
            533, 603, 615, 616, 624, 631, 649, 724 // WotLK
        };

        if (blockedRaids.find(mapId) != blockedRaids.end())
        {
            player->GetSession()->SendNotification("You are not allowed to enter this raid.");
            player->TeleportTo(player->GetHomebindMapId(), player->GetHomebindPositionX(), player->GetHomebindPositionY(), player->GetHomebindPositionZ(), player->GetOrientation());
        }
    }
    else if (map->IsDungeon())
    {
        uint32 mapId = map->GetId();
        std::set<uint32> blockedDungeons = {
            // TBC Dungeons
            269, 540, 542, 543, 546, 547, 545, 548, 550, 553, 554, 556, 557, 558, 559,
            // WotLK Dungeons
            574, 575, 576, 578, 595, 599, 600, 601, 602, 604, 608, 619, 632, 650, 658, 668
        };

        if (blockedDungeons.find(mapId) != blockedDungeons.end())
        {
            player->GetSession()->SendNotification("You are not allowed to enter this dungeon.");
            player->TeleportTo(player->GetHomebindMapId(), player'sGetHomebindPositionX(), player->GetHomebindPositionY(), player->GetHomebindPositionZ(), player'sGetOrientation());
        }
    }
}
