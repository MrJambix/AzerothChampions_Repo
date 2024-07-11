/*
 * This Script was created by MrJambix
 * This script blocks the player from entering Vanilla WoW Raids and The Burning Crusade and Wrath of the Lich King Dungeons.
 * This script is useful for servers that want to restrict players from entering certain raids and dungeons.
 * Please Do not Delete this information.
 * ### Credits to MrJambix ###
 * ### Discord: MrJambix ###
 */

#ifndef BLOCK_EXPANSION_CONTENT_H
#define BLOCK_EXPANSION_CONTENT_H

#include "ScriptMgr.h"
#include "Player.h"
#include "Map.h"

class block_expansion_content : public PlayerScript
{
public:
    block_expansion_content(); // Constructor declaration.
    void OnMapEnter(Player* player, Map* map) override; // Override for handling map entry.
};

// Declaration of function to add this script to the server's script system.
void AddBlockExpansionContentScript();

#endif // BLOCK_EXPANSION_CONTENT_H
