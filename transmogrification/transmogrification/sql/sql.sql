DROP TABLE IF EXISTS `item_trade`;
CREATE TABLE IF NOT EXISTS `item_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realm` int(11) NOT NULL DEFAULT 0,
  `realmName` text NOT NULL,
  `accountId` int(11) NOT NULL DEFAULT 0,
  `ownerGuid` int(11) NOT NULL DEFAULT 0,
  `ownerName` text NOT NULL,
  `itemEntry` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `class` tinyint(2) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `duration` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0,
  `buyerGuid` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=selling, 1=sold, 2=canceled, 3=expired, 4=returned',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
