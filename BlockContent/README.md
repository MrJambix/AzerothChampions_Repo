# AzerothCore Raid and Dungeon Blocker

## Overview
This repository contains the source code for a custom AzerothCore script that blocks access to specific raids and dungeons from the Vanilla, The Burning Crusade, and Wrath of the Lich King expansions, while allowing access to selected raids such as Molten Core and Blackwing Lair. The script is intended for AzerothCore servers that wish to customize player access to content.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [File Descriptions](#file-descriptions)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Contributing](#contributing)

## Introduction
This project provides AzerothCore server administrators with a tool to control player access to legacy content. By selectively blocking access to certain instances, server maintainers can enhance progression systems or tailor the gameplay experience to their community's preferences.

## Features
- Block access to all specified raids and dungeons for Vanilla, TBC, and WotLK.
- Allow exceptions for specific instances like Molten Core and Blackwing Lair.
- Easy integration with existing AzerothCore setups.

## File Descriptions
- `block_expansion_content.cpp`: Contains the main functionality of the script including conditions for instance access.
- `block_expansion_content.h`: Header file declaring the `block_expansion_content` class and its functions.
