CREATE TABLE `player_class_spells` (
    `player_guid` INT UNSIGNED NOT NULL,
    `class_id` TINYINT UNSIGNED NOT NULL,
    `spell_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`player_guid`, `class_id`, `spell_id`)
);
