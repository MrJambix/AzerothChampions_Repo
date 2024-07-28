CREATE TABLE `player_class_talents` (
    `player_guid` INT UNSIGNED NOT NULL,
    `class_id` TINYINT UNSIGNED NOT NULL,
    `talent_id` INT UNSIGNED NOT NULL,
    `rank` TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (`player_guid`, `class_id`, `talent_id`)
);
