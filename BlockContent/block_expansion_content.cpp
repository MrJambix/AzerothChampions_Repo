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
            249, 509, 531, 533, // Vanilla
            532, 544, 548, 550, 552, 553, 554, 555, 556, 557, 558, 564, 565, 568, 580, // TBC
            533, 603, 615, 616, 624, 631, 649, 724 // WotLK
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
            269, 540, 542, 543, 546, 547, 545, 548, 550, 553, 554, 556, 557, 558, 559, // TBC
            574, 575, 576, 578, 595, 599, 600, 601, 602, 604, 608, 619, 632, 650, 658, 668 // WotLK
        };

        if (blockedDungeons.find(mapId) != blockedDungeons.end())
        {
            player->GetSession()->SendNotification("You are not allowed to enter this dungeon.");
            player->TeleportTo(player->m_homebindMapId, player's m_homebindX, player's m_homebindY, player's m_homebindZ, player's GetOrientation());
        }
    }
}
