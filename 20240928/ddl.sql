-- default_table.`attribute` definition

CREATE TABLE `attribute` (
  `attribute_id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_img` varchar(100) DEFAULT NULL COMMENT '属性图片',
  `type` int NOT NULL DEFAULT '1' COMMENT '1为基本属性，可随等级成长；2为额外属性，只能通过装备、技能等方式获得',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='属性表';


-- default_table.attribute_name definition

CREATE TABLE `attribute_name` (
  `attribute_id` int unsigned NOT NULL,
  `language_id` int unsigned NOT NULL DEFAULT '1',
  `attribute_name` varchar(100) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='属性名称表';


-- default_table.attribute_value definition

CREATE TABLE `attribute_value` (
  `indiv_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  `level_id` int unsigned NOT NULL,
  `value` decimal(18,2) NOT NULL,
  PRIMARY KEY (`indiv_id`,`attribute_id`,`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='单位-属性-等级对应数据数值';


-- default_table.computing_life_cycle definition

CREATE TABLE `computing_life_cycle` (
  `cycle_id` int NOT NULL AUTO_INCREMENT,
  `cycle_order` int DEFAULT '1',
  `type` varchar(10) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cycle_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- default_table.equip_id definition

CREATE TABLE `equip_id` (
  `equip_id` int NOT NULL,
  `skill_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- default_table.equipment definition

CREATE TABLE `equipment` (
  `equip_id` int unsigned NOT NULL AUTO_INCREMENT,
  `equip_img` varchar(100) DEFAULT NULL,
  `consumption` int NOT NULL DEFAULT '0',
  `attribute_expression` varchar(1024) NOT NULL COMMENT '增加的属性数值表达式',
  `sub_equips` varchar(256) DEFAULT NULL COMMENT '子装备(合成路径)',
  PRIMARY KEY (`equip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='装备表(buff等状态效果也定义为装备)';


-- default_table.equipment_name definition

CREATE TABLE `equipment_name` (
  `equip_id` int unsigned NOT NULL,
  `language_id` int unsigned NOT NULL,
  `equip_name` varchar(100) NOT NULL,
  PRIMARY KEY (`language_id`,`equip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- default_table.formula_default definition

CREATE TABLE `formula_default` (
  `formula_id` int NOT NULL AUTO_INCREMENT,
  `formula_type` varchar(100) NOT NULL,
  `default_v` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`formula_id`,`formula_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- default_table.formula_impl definition

CREATE TABLE `formula_impl` (
  `attribute_id` int NOT NULL,
  `formula_id` int NOT NULL,
  `formula_impl` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- default_table.game_info definition

CREATE TABLE `game_info` (
  `game_id` int unsigned NOT NULL AUTO_INCREMENT,
  `game_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `game_name` varchar(40) NOT NULL,
  `game_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE KEY `game_info_un` (`game_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- default_table.indiv_name definition

CREATE TABLE `indiv_name` (
  `indiv_id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int unsigned NOT NULL DEFAULT '1',
  `indiv_name` varchar(100) NOT NULL,
  PRIMARY KEY (`indiv_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- default_table.indiv_skill definition

CREATE TABLE `indiv_skill` (
  `indiv_id` int NOT NULL,
  `skill_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='人物-技能关联表';


-- default_table.individual definition

CREATE TABLE `individual` (
  `indiv_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '英雄单位标识',
  `indiv_img` varchar(100) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`indiv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- default_table.`language` definition

CREATE TABLE `language` (
  `language_id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- default_table.`level` definition

CREATE TABLE `level` (
  `level_id` int unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int unsigned NOT NULL DEFAULT '1',
  `level_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`level_id`,`language_id`),
  KEY `level_level_id_IDX` (`level_id`,`language_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='等级定义表';


-- default_table.skill_def definition

CREATE TABLE `skill_def` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(100) NOT NULL,
  `skill_img` varchar(100) DEFAULT NULL,
  `skill_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='技能定义表';


-- default_table.skill_sub definition

CREATE TABLE `skill_sub` (
  `skill_id` int NOT NULL,
  `skill_levle` int NOT NULL DEFAULT '1',
  `cycle_id` int NOT NULL,
  `consumption` varchar(100) NOT NULL DEFAULT '0',
  `cd` varchar(100) NOT NULL DEFAULT '0',
  `check_and_do` varchar(2048) NOT NULL,
  PRIMARY KEY (`skill_id`,`skill_levle`,`cycle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- default_table.version definition

CREATE TABLE `version` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT,
  `version_code` varchar(100) NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='版本记录';