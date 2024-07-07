# Heirloom Vendor SQL Script

## Overview
This repository contains an SQL script for adding heirloom vendors to various starting zones in an AzerothCore-based World of Warcraft server. The script includes the creation and configuration of NPC vendors who sell heirloom items. This script is up-to-date as of July 5, 2024.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)


## Introduction
Heirloom items are special items in World of Warcraft that scale with the player's level, making them highly valuable for leveling characters. This script adds vendors that sell these items in all starting zones, ensuring new characters have access to heirloom gear right from the beginning.

## Features
- Adds heirloom vendors to all starting zones.
- Configures each vendor with a comprehensive list of heirloom items.
- Sets appropriate prices for each heirloom item.
- Ensures compatibility with the latest AzerothCore database schema.

## Prerequisites
- An operational AzerothCore World of Warcraft server.
- Access to the server's MySQL or MariaDB database.
- A database management tool such as HeidiSQL, MySQL Workbench, or phpMyAdmin.

## Installation
1. **Download the Script**:
   Clone this repository or download the SQL script file directly.

   ```bash
   git clone https://github.com/MrJambix/AZCORE_Files.git
   cd AZCORE_Files
   
2. **Access the Database**:
Connect to your AzerothCore database using your preferred database management tool.

3. **Execute the Script**:
Run the downloaded SQL script to insert the heirloom vendor data into your world database.

-- Use your database management tool to execute the following:
SOURCE path/to/AzerothCoreHeirloomVendors.sql;

Usage
After installation, the heirloom vendors will be available in the following starting zones:

Northshire Valley (Human)
Coldridge Valley (Dwarf and Gnome)
Shadowglen (Night Elf)
Crash Site (Draenei)
Valley of Trials (Orc and Troll)
Deathknell (Undead)
Camp Narache (Tauren)
The Sunspire (Blood Elf)
The Heart of Acherus (Death Knight)
Each vendor offers a variety of heirloom items, including weapons, armor, and trinkets, priced appropriately for ease of use.

Original code created by [Stygian ](http://stygianthebest.github.io )
