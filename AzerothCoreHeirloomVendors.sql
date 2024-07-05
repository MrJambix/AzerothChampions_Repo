/*
-- ############################################################################################################# --
-- 
--  ____    __                                         ______  __              ____                    __      
-- /\  _`\ /\ \__                  __                 /\__  _\/\ \            /\  _`\                 /\ \__   
-- \ \,\L\_\ \ ,_\  __  __     __ /\_\     __      ___\/_/\ \/\ \ \___      __\ \ \L\ \     __    ____\ \ ,_\  
--  \/_\__ \\ \ \/ /\ \/\ \  /'_ `\/\ \  /'__`\  /' _ `\ \ \ \ \ \  _ `\  /'__`\ \  _ <'  /'__`\ /',__\\ \ \/  
--    /\ \L\ \ \ \_\ \ \_\ \/\ \L\ \ \ \/\ \L\.\_/\ \/\ \ \ \ \ \ \ \ \ \/\  __/\ \ \L\ \/\  __//\__, `\\ \ \_ 
--    \ `\____\ \__\\/`____ \ \____ \ \_\ \__/.\_\ \_\ \_\ \ \_\ \ \_\ \_\ \____\\ \____/\ \____\/\____/ \ \__\
--     \/_____/\/__/ `/___/> \/___L\ \/_/\/__/\/_/\/_/\/_/  \/_/  \/_/\/_/\/____/ \/___/  \/____/\/___/   \/__/
--                     /\___/ /\____/                                                                         
--                     \/__/  \_/__/               http://stygianthebest.github.io  ---- OUTDATED SOURCE ----                                                  
--
-- ############################################################################################################# --
--
-- 	Heirloom Vendors (in Starting Zones)
-- 	By <Unknown>
-- 
-- 	Ported to AzerothCore by StygianTheBest
--
-- Places heirloom vendors in all of the player starting zones and prices their inventory.
--
--
-- Update it on 7/5/2024 /Works 
-- AZEROTHCHAMPION.COM
--
-- ############################################################################################################# --
*/


USE acore_world;
SET @boa := 601704;
SET @Guid := 601704;
DELETE FROM creature_template WHERE entry = @boa;

INSERT INTO creature_template (
entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3,
KillCredit1, KillCredit2, modelid1, modelid2, modelid3, modelid4,
name, subname, IconName, gossip_menu_id, minlevel, maxlevel, exp, faction,
npcflag, speed_walk, speed_run, scale, rank, dmgschool, baseattacktime,
rangeattacktime, unit_class, unit_flags, unit_flags2, dynamicflags, family,
trainer_type, trainer_spell, trainer_class, trainer_race, type, type_flags,
lootid, pickpocketloot, skinloot, PetSpellDataId, VehicleId, mingold, maxgold,
AIName, MovementType, HoverHeight, RacialLeader, movementId, RegenHealth,
mechanic_immune_mask, flags_extra, ScriptName, VerifiedBuild
)
VALUES (
@boa, 0, 0, 0, 0, 0, 25900, 0, 0, 0,
'GlowingSoul', 'HeirloomMerchant', NULL, 0, 63, 64, 1, 35, 130, 1,
1.14286, 1, 0, 0, 2000, 2000, 2, 33024, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0,
0, 0, 0, 0, 0, 0, '', 0, 1, 0, 0, 1, 0, 2, '', 12340
);

-- Text
DELETE FROM npc_text WHERE ID=601017;
INSERT INTO npc_text (ID, text0_0, text0_1, lang0, Probability0, em0_0, em0_1, em0_2, em0_3, em0_4, em0_5, text1_0, text1_1, lang1, Probability1, em1_0, em1_1, em1_2, em1_3, em1_4, em1_5, text2_0, text2_1, lang2, Probability2, em2_0, em2_1, em2_2, em2_3, em2_4, em2_5, text3_0, text3_1, lang3, Probability3, em3_0, em3_1, em3_2, em3_3, em3_4, em3_5, text4_0, text4_1, lang4, Probability4, em4_0, em4_1, em4_2, em4_3, em4_4, em4_5, text5_0, text5_1, lang5, Probability5, em5_0, em5_1, em5_2, em5_3, em5_4, em5_5, text6_0, text6_1, lang6, Probability6, em6_0, em6_1, em6_2, em6_3, em6_4, em6_5, text7_0, text7_1, lang7, Probability7, em7_0, em7_1, em7_2, em7_3, em7_4, em7_5, VerifiedBuild) VALUES (601017, 'Greetings $N. I carry artifacts forged from the old world to help you in your journey.', NULL, 0, 0, 0, 6, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Items
DELETE FROM npc_vendor WHERE entry=@boa;
INSERT INTO npc_vendor (entry,slot,item,maxcount,incrtime,ExtendedCost) VALUES
(@boa,0,42943,0,0,0), -- Bloodied Arcanite Reaper
(@boa,0,42944,0,0,0), -- Balanced Heartseeker
(@boa,0,42945,0,0,0), -- Venerable Dal'Rend's Sacred Charge
(@boa,0,42946,0,0,0), -- Charmed Ancient Bone Bow
(@boa,0,42947,0,0,0), -- Dignified Headmaster's Charge
(@boa,0,42948,0,0,0), -- Devout Aurastone Hammer
(@boa,0,42949,0,0,0), -- Polished Spaulders of Valor
(@boa,0,42950,0,0,0), -- Champion Herod's Shoulder
(@boa,0,42951,0,0,0), -- Mystical Pauldrons of Elements
(@boa,0,42952,0,0,0), -- Stained Shadowcraft Spaulders
(@boa,0,42984,0,0,0), -- Preened Ironfeather Shoulders
(@boa,0,42985,0,0,0), -- Tattered Dreadmist Mantle
(@boa,0,42991,0,0,0), -- Swift Hand of Justice
(@boa,0,42992,0,0,0), -- Discerning Eye of the Beast
(@boa,0,44091,0,0,0), -- Sharpened Scarlet Kris
(@boa,0,44092,0,0,0), -- Reforged Truesilver Champion
(@boa,0,44093,0,0,0), -- Upgraded Dwarven Hand Cannon
(@boa,0,44094,0,0,0), -- The Blessed Hammer of Grace
(@boa,0,44095,0,0,0), -- Grand Staff of Jordan
(@boa,0,44096,0,0,0), -- Battleworn Thrash Blade
(@boa,0,44097,0,0,0), -- Inherited Insignia of the Horde
(@boa,0,44098,0,0,0), -- Inherited Insignia of the Alliance
(@boa,0,44099,0,0,0), -- Strengthened Stockade Pauldrons
(@boa,0,44100,0,0,0), -- Pristine Lightforge Spaulders
(@boa,0,44101,0,0,0), -- Prized Beastmaster's Mantle
(@boa,0,44102,0,0,0), -- Aged Pauldrons of The Five Thunders
(@boa,0,44103,0,0,0), -- Exceptional Stormshroud Shoulders
(@boa,0,44105,0,0,0), -- Lasting Feralheart Spaulders
(@boa,0,44107,0,0,0), -- Exquisite Sunderseer Mantle
(@boa,0,48677,0,0,0), -- Champion's Deathdealer Breastplate
(@boa,0,48685,0,0,0), -- Polished Breastplate of Valor
(@boa,0,48687,0,0,0), -- Preened Ironfeather Breastplate
(@boa,0,48689,0,0,0), -- Stained Shadowcraft Tunic
(@boa,0,48683,0,0,0), -- Mystical Vest of Elements
(@boa,0,48691,0,0,0), -- Tattered Dreadmist Robe
(@boa,0,48716,0,0,0), -- Venerable Mass of McGowan
(@boa,0,48718,0,0,0), -- Repurposed Lava Dredger
(@boa,0,50255,0,0,0); -- Dread Pirate Ring

-- ######################################################--
-- NPC SPAWN POINTS
-- ######################################################--

DELETE FROM creature WHERE id1=@boa;
INSERT INTO creature (guid,id1,map,spawnMask,phaseMask,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags) VALUES
(@Guid,@boa,0,1,1,0,-9022.275391,-76.134964,88.489632,5.9219,100,0,4274,3994,0,0,0,0), -- Human (Northshire Valley)
(@Guid+1,@boa,0,1,1,0,-6170.66,350.627,400.116,1.93837,100,0,4274,3994,0,0,0,0), -- Dwarf and Gnome (Coldridge Valley)
(@Guid+2,@boa,1,1,1,0,10411.7,781.667,1322.71,5.26217,100,0,4274,3994,0,0,0,0), -- NightElf (Shadowglen)
(@Guid+3,@boa,530,1,1,0,-4112.79,-13749,73.5646,4.35504,100,0,4274,3994,0,0,0,0), -- Draenei (Crash Site)
(@Guid+4,@boa,1,1,1,0,-597.151,-4210.22,38.4318,4.08879,100,0,4274,3994,0,0,0,0), -- Orc and Troll (Valley of Trial)
(@Guid+5,@boa,0,1,1,0,1883.85,1614.12,93.4042,4.55138,100,0,4274,3994,0,0,0,0), -- Undead (Deathknell)
(@Guid+6,@boa,1,1,1,0,-2899.01,-231.723,53.8403,4.66684,100,0,4274,3994,0,0,0,0), -- Tauren (Camp Narache)
(@Guid+7,@boa,530,1,1,0,10359.4,-6408.47,38.5311,1.88496,100,0,4274,3994,0,0,0,0), -- BloodElf (The Sunspire)
(@Guid+8,@boa,609,1,1,0,2435.74,-5610.41,420.092,3.71887,100,0,4274,3994,0,0,0,0), -- DeathKnight (The Heart of Acherus) #1
(@Guid+9,@boa,0,1,1,0,2435.74,-5610.41,420.092,3.71887,100,0,4274,3994,0,0,0,0); -- DeathKnight (The Heart of Acherus) #2

-- ######################################################--
-- CURRENCY CONVERSION
-- ######################################################--
SET @1c :=1; -- 1 Copper
SET @1s :=100; -- 1 Silver
SET @5S :=500; -- 5 Silver
SET @10s :=1000; -- 10 Silver
SET @25s :=2500; -- 25 Silver
SET @50s :=5000; -- 50 Silver
SET @75s :=7500; -- 75 Silver
SET @1g :=10000; -- 1 Gold
SET @2g :=20000; -- 2 Gold
SET @3g :=30000; -- 3 Gold
SET @4g :=40000; -- 4 Gold
SET @5G :=50000; -- 5 Gold
SET @10g :=100000; -- 10 Gold
SET @15G :=150000; -- 15 Gold
SET @18g :=180000; -- 18 Gold
SET @20g :=200000; -- 20 Gold
SET @25g :=250000; -- 25 Gold
SET @30G :=300000; -- 30 Gold
SET @40g :=400000; -- 40 Gold
SET @50G :=500000; -- 50 Gold
SET @75g :=750000; -- 75 Gold
SET @100g :=1000000; -- 100 Gold
SET @250g :=2500000; -- 250 Gold
SET @300g :=3000000; -- 300 Gold
SET @350g :=3500000; -- 350 Gold
SET @375G :=3750000; -- 375 Gold
SET @500g :=5000000; -- 500 Gold
SET @750G :=7500000; -- 750 Gold
SET @1000G :=10000000; -- 1000 Gold
SET @1500G :=15000000; -- 1500 Gold
SET @2500G :=25000000; -- 2500 Gold
SET @5000g :=50000000; -- 5000 Gold
SET @7500G :=75000000; -- 7500 Gold
SET @10000g :=100000000; -- 10000 Gold
SET @12500G :=125000000; -- 12500 Gold
SET @15000G :=150000000; -- 15000 Gold
SET @20000g :=200000000; -- 20000 Gold
SET @25000G :=250000000; -- 20000 Gold
SET @50000G :=500000000; -- 50000 Gold
SET @75000G :=750000000; -- 75000 Gold

-- ######################################################--
-- HEIRLOOM PRICES
-- ######################################################--

UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 42943; -- Bloodied Arcanite Reaper
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 42944; -- Balanced Heartseeker
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 42945; -- Venerable Dal'Rend's Sacred Charge
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 42946; -- Charmed Ancient Bone Bow
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 42947; -- Dignified Headmaster's Charge
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 42948; -- Devout Aurastone Hammer
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42949; -- Polished Spaulders of Valor
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42950; -- Champion Herod's Shoulder
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42951; -- Mystical Pauldrons of Elements
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42952; -- Stained Shadowcraft Spaulders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42984; -- Preened Ironfeather Shoulders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 42985; -- Tattered Dreadmist Mantle
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 42991; -- Swift Hand of Justice
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 42992; -- Discerning Eye of the Beast
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 44091; -- Sharpened Scarlet Kris
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 44092; -- Reforged Truesilver Champion
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 44093; -- Upgraded Dwarven Hand Cannon
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 44094; -- The Blessed Hammer of Grace
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 44095; -- Grand Staff of Jordan
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 44096; -- Battleworn Thrash Blade
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 44097; -- Inherited Insignia of the Horde
UPDATE item_template SET sellprice=@5G, buyprice=@375G WHERE entry = 44098; -- Inherited Insignia of the Alliance
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44099; -- Strengthened Stockade Pauldrons
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44100; -- Pristine Lightforge Spaulders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44101; -- Prized Beastmaster's Mantle
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44102; -- Aged Pauldrons of The Five Thunders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44103; -- Exceptional Stormshroud Shoulders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44105; -- Lasting Feralheart Spaulders
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 44107; -- Exquisite Sunderseer Mantle
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48677; -- Champion's Deathdealer Breastplate
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48685; -- Polished Breastplate of Valor
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48687; -- Preened Ironfeather Breastplate
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48689; -- Stained Shadowcraft Tunic
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48683; -- Mystical Vest of Elements
UPDATE item_template SET sellprice=@5G, buyprice=@1000G WHERE entry = 48691; -- Tattered Dreadmist Robe
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 48716; -- Venerable Mass of McGowan
UPDATE item_template SET sellprice=@5G, buyprice=@750G WHERE entry = 48718; -- Repurposed Lava Dredger
UPDATE item_template SET sellprice=@5G, buyprice=@500g WHERE entry = 50255; -- Dread Pirate Ring