CREATE TABLE `class_switch_options` (
    `npc_entry` INT UNSIGNED NOT NULL,
    `class_id` TINYINT UNSIGNED NOT NULL,
    `class_name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`npc_entry`, `class_id`)
);
