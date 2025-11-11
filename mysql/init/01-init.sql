-- 创建数据库（如果不存在）
CREATE DATABASE IF NOT EXISTS spms;

-- 使用数据库
USE spms;




SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bom
-- ----------------------------
DROP TABLE IF EXISTS `bom`;
CREATE TABLE `bom` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '配方状态',
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '配方类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配方编码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配方名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKpie3hyurvbqny1k58t43yv9no` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of bom
-- ----------------------------
BEGIN;
INSERT INTO `bom` (`is_disabled`, `is_published`, `status`, `type`, `create_time`, `id`, `update_time`, `code`, `name`) VALUES (0, 0, 1, 1, 1762854146633, 1, 1762854146633, 'BOM0001', '笔记本电脑清单');
INSERT INTO `bom` (`is_disabled`, `is_published`, `status`, `type`, `create_time`, `id`, `update_time`, `code`, `name`) VALUES (0, 0, 1, 2, 1762854146646, 2, 1762854146646, 'BOM0002', '键盘安装清单');
INSERT INTO `bom` (`is_disabled`, `is_published`, `status`, `type`, `create_time`, `id`, `update_time`, `code`, `name`) VALUES (0, 0, 1, 2, 1762854146648, 3, 1762854146648, 'BOM0003', '屏幕贴膜清单');
COMMIT;

-- ----------------------------
-- Table structure for bom_detail
-- ----------------------------
DROP TABLE IF EXISTS `bom_detail`;
CREATE TABLE `bom_detail` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '数量',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FKo8njkrtvtxf133e8n6kl6lgj0` (`material_id`),
  CONSTRAINT `FKo8njkrtvtxf133e8n6kl6lgj0` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of bom_detail
-- ----------------------------
BEGIN;
INSERT INTO `bom_detail` (`is_disabled`, `is_published`, `quantity`, `create_time`, `id`, `material_id`, `update_time`) VALUES (0, 0, 1.000000, 0, 1, 2, 0);
INSERT INTO `bom_detail` (`is_disabled`, `is_published`, `quantity`, `create_time`, `id`, `material_id`, `update_time`) VALUES (0, 0, 1.000000, 0, 2, 3, 0);
INSERT INTO `bom_detail` (`is_disabled`, `is_published`, `quantity`, `create_time`, `id`, `material_id`, `update_time`) VALUES (0, 0, 1.000000, 0, 3, 2, 0);
INSERT INTO `bom_detail` (`is_disabled`, `is_published`, `quantity`, `create_time`, `id`, `material_id`, `update_time`) VALUES (0, 0, 1.000000, 0, 4, 3, 0);
COMMIT;

-- ----------------------------
-- Table structure for bom_details
-- ----------------------------
DROP TABLE IF EXISTS `bom_details`;
CREATE TABLE `bom_details` (
  `bom_entity_id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  `details_id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  PRIMARY KEY (`bom_entity_id`,`details_id`),
  KEY `FKktxf0e3xfvai26s0vaeww264j` (`details_id`),
  CONSTRAINT `FKe381an67lb456ylf0moirteor` FOREIGN KEY (`bom_entity_id`) REFERENCES `bom` (`id`),
  CONSTRAINT `FKktxf0e3xfvai26s0vaeww264j` FOREIGN KEY (`details_id`) REFERENCES `bom_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of bom_details
-- ----------------------------
BEGIN;
INSERT INTO `bom_details` (`bom_entity_id`, `details_id`) VALUES (1, 1);
INSERT INTO `bom_details` (`bom_entity_id`, `details_id`) VALUES (1, 2);
INSERT INTO `bom_details` (`bom_entity_id`, `details_id`) VALUES (2, 3);
INSERT INTO `bom_details` (`bom_entity_id`, `details_id`) VALUES (3, 4);
COMMIT;

-- ----------------------------
-- Table structure for coderule
-- ----------------------------
DROP TABLE IF EXISTS `coderule`;
CREATE TABLE `coderule` (
  `current_sn` int(10) unsigned DEFAULT '0' COMMENT '当前序列号',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `is_system` tinyint(3) unsigned DEFAULT '0' COMMENT '是否内置参数',
  `rule_field` tinyint(3) unsigned DEFAULT '0' COMMENT '规则字段',
  `sn_length` tinyint(3) unsigned DEFAULT '4' COMMENT '流水号起始长度',
  `sn_type` tinyint(3) unsigned DEFAULT '1' COMMENT '流水号更新方式',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '编码前缀',
  `template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '编码规则模板',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKauctv1uhnhycn072red54fgnh` (`rule_field`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of coderule
-- ----------------------------
BEGIN;
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 1, 4, 4, 1762854145806, 1, 1762854145808, 'RO', '');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (1, 0, 0, 1, 2, 4, 3, 1762854145815, 2, 1762854145816, 'SUP', 'yyyy');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (6, 0, 0, 1, 3, 4, 4, 1762854145818, 3, 1762854145820, 'SRG', '');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (3, 0, 0, 1, 4, 4, 4, 1762854145822, 4, 1762854145823, 'ST', '');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (1, 0, 0, 1, 5, 4, 3, 1762854145825, 5, 1762854145826, 'CT', 'yyyy');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (3, 0, 0, 1, 6, 4, 3, 1762854145828, 6, 1762854145829, 'MA', 'yyyy');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (1, 0, 0, 1, 7, 4, 4, 1762854145831, 7, 1762854145832, 'UT', '');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 8, 4, 1, 1762854145834, 8, 1762854145835, 'PC', 'yyyymmdd');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 9, 4, 1, 1762854145839, 9, 1762854145840, 'SL', 'yyyymmdd');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 10, 4, 1, 1762854145842, 10, 1762854145843, 'PL', 'yyyymmdd');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 11, 4, 1, 1762854145845, 11, 1762854145846, 'ODR', 'yyyymmdd');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 12, 4, 1, 1762854145848, 12, 1762854145849, 'PK', 'yyyymmdd');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 13, 4, 1, 1762854145850, 13, 1762854145851, 'RET', 'yyyymmdd');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 14, 4, 1, 1762854145854, 14, 1762854145854, 'IN', 'yyyymmdd');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 15, 4, 1, 1762854145856, 15, 1762854145857, 'OUT', 'yyyymmdd');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 16, 4, 1, 1762854145859, 16, 1762854145860, 'MV', 'yyyymmdd');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 17, 4, 2, 1762854145864, 17, 1762854145865, 'DE', 'yyyymm');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (3, 0, 0, 1, 18, 4, 3, 1762854145867, 18, 1762854145868, 'OP', 'yyyy');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 19, 4, 4, 1762854145870, 19, 1762854145871, 'DP', '');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (3, 0, 0, 1, 20, 4, 4, 1762854145873, 20, 1762854145874, 'BOM', '');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (1, 0, 0, 1, 21, 4, 4, 1762854145876, 21, 1762854145878, 'RT', '');
INSERT INTO `coderule` (`current_sn`, `is_disabled`, `is_published`, `is_system`, `rule_field`, `sn_length`, `sn_type`, `create_time`, `id`, `update_time`, `prefix`, `template`) VALUES (0, 0, 0, 1, 22, 4, 2, 1762854145880, 22, 1762854145881, 'CON', 'yyyymm');
COMMIT;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `is_system` tinyint(3) unsigned DEFAULT '0' COMMENT '内置配置',
  `type` tinyint(3) unsigned DEFAULT '0' COMMENT '配置类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `config` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '字符串值',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配置描述',
  `flag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则字段',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配置名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK2everu8o94mumut1mhxmv91f5` (`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of config
-- ----------------------------
BEGIN;
INSERT INTO `config` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `update_time`, `config`, `description`, `flag`, `name`) VALUES (0, 0, 1, 1, 1762854145885, 1, 1762854145887, '1', '邮箱验证码登录时，如果未注册则自动注册后登陆', 'AUTO_REGISTER_EMAIL_LOGIN', '邮箱自动注册');
INSERT INTO `config` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `update_time`, `config`, `description`, `flag`, `name`) VALUES (0, 0, 1, 1, 1762854145892, 2, 1762854145895, '1', '完成数量超过计划数量时，订单将自动被标记为完成', 'ORDER_AUTO_FINISH', '订单自动标记完成');
INSERT INTO `config` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `update_time`, `config`, `description`, `flag`, `name`) VALUES (0, 0, 1, 1, 1762854145898, 3, 1762854145899, '1', '允许在任何情况下手动完成订单', 'ORDER_MANUAL_FINISH', '订单手动标记完成');
INSERT INTO `config` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `update_time`, `config`, `description`, `flag`, `name`) VALUES (0, 0, 1, 1, 1762854145901, 4, 1762854145902, '0', '开启此项后，创建入库单则进入入库中状态', 'INPUT_BILL_AUTO_AUDIT', '入库单自动审核');
INSERT INTO `config` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `update_time`, `config`, `description`, `flag`, `name`) VALUES (0, 0, 1, 1, 1762854145904, 5, 1762854145904, '0', '开启此项后，创建出库单则进入出库中状态', 'OUTPUT_BILL_AUTO_AUDIT', '出库单自动审核');
INSERT INTO `config` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `update_time`, `config`, `description`, `flag`, `name`) VALUES (0, 0, 1, 1, 1762854145906, 6, 1762854145907, '0', '开启此项后，创建移库单则进入移库中状态', 'MOVE_BILL_AUTO_AUDIT', '移库单自动审核');
INSERT INTO `config` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `update_time`, `config`, `description`, `flag`, `name`) VALUES (0, 0, 1, 1, 1762854145908, 7, 1762854145909, '0', '开启此项后，创建采购单则进入采购中状态', 'PURCHASE_BILL_AUTO_AUDIT', '采购单自动审核');
INSERT INTO `config` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `update_time`, `config`, `description`, `flag`, `name`) VALUES (0, 0, 1, 1, 1762854145910, 8, 1762854145911, '0', '开启此项后，创建销售单则进入销售中状态', 'SALE_BILL_AUTO_AUDIT', '销售单开启自动审核');
INSERT INTO `config` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `update_time`, `config`, `description`, `flag`, `name`) VALUES (0, 0, 1, 1, 1762854145914, 9, 1762854145915, '1', '开启订单报工模式后，工序将无法进行报工，此项开启则表示为粗放型报工管理模式', 'ORDER_ENABLE_SUBMIT_WORK', '订单报工模式');
INSERT INTO `config` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `update_time`, `config`, `description`, `flag`, `name`) VALUES (0, 0, 1, 1, 1762854145917, 10, 1762854145918, '0', '开启此项后，订单创建即开始进入生产环节', 'ORDER_AUTO_START_AFTER_AUDIT', '订单审核后自动开始');
INSERT INTO `config` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `update_time`, `config`, `description`, `flag`, `name`) VALUES (0, 0, 1, 1, 1762854145920, 11, 1762854145920, '0', '开启此项后，创建领料单则进入领料中状态', 'PICKING_BILL_AUTO_AUDIT', '领料单自动审核');
COMMIT;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `status` bigint(20) unsigned DEFAULT '1' COMMENT '合同状态',
  `type` bigint(20) unsigned DEFAULT '0' COMMENT '合同类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `end_time` bigint(20) unsigned DEFAULT '0' COMMENT '结束时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `start_time` bigint(20) unsigned DEFAULT '0' COMMENT '开始时间',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同编码',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '合同内容',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '合同名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1iouaf2huua6pv0ogbbm62bfe` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of contract
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contract_document
-- ----------------------------
DROP TABLE IF EXISTS `contract_document`;
CREATE TABLE `contract_document` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `size` bigint(20) unsigned DEFAULT '0' COMMENT '文件大小',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展名',
  `hash_md5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'MD5',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '名称',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '附件地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of contract_document
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contract_document_list
-- ----------------------------
DROP TABLE IF EXISTS `contract_document_list`;
CREATE TABLE `contract_document_list` (
  `contract_entity_id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  `document_list_id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  PRIMARY KEY (`contract_entity_id`,`document_list_id`),
  UNIQUE KEY `UKjjgkf1ledy1bfyll5aytalqac` (`document_list_id`),
  CONSTRAINT `FKe7rxxmnmmu0267lr19npa9a8i` FOREIGN KEY (`document_list_id`) REFERENCES `contract_document` (`id`),
  CONSTRAINT `FKfmudm08hriuh2gepfb8yjuhgr` FOREIGN KEY (`contract_entity_id`) REFERENCES `contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of contract_document_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for contract_participant_list
-- ----------------------------
DROP TABLE IF EXISTS `contract_participant_list`;
CREATE TABLE `contract_participant_list` (
  `contract_entity_id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  `participant_list_id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  PRIMARY KEY (`contract_entity_id`,`participant_list_id`),
  UNIQUE KEY `UKtebnyho7mvhadw09mvvvbk02k` (`participant_list_id`),
  CONSTRAINT `FK2u2ymyh5y6iqy7r33dccfmvqe` FOREIGN KEY (`participant_list_id`) REFERENCES `participant` (`id`),
  CONSTRAINT `FKdkyr0wsreed85r2y4as6rn3qj` FOREIGN KEY (`contract_entity_id`) REFERENCES `contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of contract_participant_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '客户编码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '客户名称',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '联系电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKrm1bp9bhtiih5foj17t8l500j` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
INSERT INTO `customer` (`is_disabled`, `is_published`, `create_time`, `id`, `update_time`, `code`, `name`, `phone`) VALUES (0, 0, 1762854146598, 1, 1762854146598, 'CT20250001', '腾讯科技', '17666666666');
COMMIT;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `order_no` tinyint(3) unsigned DEFAULT '0' COMMENT '排序号',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` bigint(20) unsigned DEFAULT '0' COMMENT '父级ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'code',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '部门名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKq8ymhgj6pt1msox0o3bg51uvo` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `code`, `name`) VALUES (0, 0, 0, 1762854145713, 1, 0, 1762854145715, 'a1', '生产部');
INSERT INTO `department` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `code`, `name`) VALUES (0, 0, 0, 1762854145726, 2, 1, 1762854145727, 'aaa1', '材料部');
COMMIT;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `alarm` tinyint(3) unsigned DEFAULT '0' COMMENT '报警状态',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `is_reporting` tinyint(3) unsigned DEFAULT '1' COMMENT '开启采集',
  `rate` int(10) unsigned DEFAULT '1000' COMMENT '采集频率',
  `status` tinyint(3) unsigned DEFAULT '4' COMMENT '设备状态',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `part_count` bigint(20) unsigned DEFAULT '0' COMMENT '实时产量',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '设备编码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '设备名称',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '设备UUID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsf41cw48kowh1b6ysrdjob3ch` (`code`),
  UNIQUE KEY `UKoesoxj95nuiic4anb0i5fh9b1` (`name`),
  UNIQUE KEY `UKlcsquslb3ig7l6wsbwijoet4a` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of device
-- ----------------------------
BEGIN;
INSERT INTO `device` (`alarm`, `is_disabled`, `is_published`, `is_reporting`, `rate`, `status`, `create_time`, `id`, `part_count`, `update_time`, `code`, `name`, `uuid`) VALUES (0, 0, 0, 1, 1000, 4, 1762854146572, 1, 0, 1762854146577, 'Simulator001', '设备1', 'Simulator001');
INSERT INTO `device` (`alarm`, `is_disabled`, `is_published`, `is_reporting`, `rate`, `status`, `create_time`, `id`, `part_count`, `update_time`, `code`, `name`, `uuid`) VALUES (0, 0, 0, 1, 1000, 4, 1762854146580, 2, 0, 1762854146580, 'Simulator002', '设备2', 'Simulator002');
COMMIT;

-- ----------------------------
-- Table structure for device_parameters
-- ----------------------------
DROP TABLE IF EXISTS `device_parameters`;
CREATE TABLE `device_parameters` (
  `device_entity_id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  `parameters_id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  PRIMARY KEY (`device_entity_id`,`parameters_id`),
  KEY `FKn16ax9mffsfihxliyyvttlcps` (`parameters_id`),
  CONSTRAINT `FKe75y8677pdp8ffbxdftwp0i6s` FOREIGN KEY (`device_entity_id`) REFERENCES `device` (`id`),
  CONSTRAINT `FKn16ax9mffsfihxliyyvttlcps` FOREIGN KEY (`parameters_id`) REFERENCES `parameter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of device_parameters
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `category` int(10) unsigned DEFAULT '1' COMMENT '文件类别',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `platform` tinyint(3) unsigned DEFAULT '0' COMMENT '存储平台',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `size` bigint(20) unsigned DEFAULT '0' COMMENT '文件大小',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展名',
  `hash_md5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'MD5',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '名称',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文件路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for input
-- ----------------------------
DROP TABLE IF EXISTS `input`;
CREATE TABLE `input` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '入库状态',
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '入库类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `move_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `purchase_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `structure_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `reject_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '驳回原因',
  `bill_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '入库单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK15yhty80i4paforcs57p7j54l` (`bill_code`),
  KEY `FKbnxby77v9jfx91i8waigxawtp` (`move_id`),
  KEY `FK1u8btujur7hk9q9xppsy4fwsk` (`order_id`),
  KEY `FK9pheuhppqb76ef0flca0wgst4` (`purchase_id`),
  KEY `FK3vn6rao25e4ggv8bmy07rpkoa` (`structure_id`),
  CONSTRAINT `FK1u8btujur7hk9q9xppsy4fwsk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK3vn6rao25e4ggv8bmy07rpkoa` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`),
  CONSTRAINT `FK9pheuhppqb76ef0flca0wgst4` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`),
  CONSTRAINT `FKbnxby77v9jfx91i8waigxawtp` FOREIGN KEY (`move_id`) REFERENCES `move` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of input
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for input_detail
-- ----------------------------
DROP TABLE IF EXISTS `input_detail`;
CREATE TABLE `input_detail` (
  `finish_quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '已入库数量',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_finished` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已完成',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '入库数量',
  `bill_id` bigint(20) unsigned NOT NULL COMMENT '单据ID',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FKceaekk98navc5trjl02urg3bc` (`material_id`),
  CONSTRAINT `FKceaekk98navc5trjl02urg3bc` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of input_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '库存数量',
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '存储类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `storage_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `structure_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FKpqt1c0swd2uf3qovrs2p3ok60` (`material_id`),
  KEY `FK9ub600j8dsrb90rbdn5c7muly` (`storage_id`),
  KEY `FKgd3qr3pw2gujxyxmw6m0wdx5x` (`structure_id`),
  CONSTRAINT `FK9ub600j8dsrb90rbdn5c7muly` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`),
  CONSTRAINT `FKgd3qr3pw2gujxyxmw6m0wdx5x` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`),
  CONSTRAINT `FKpqt1c0swd2uf3qovrs2p3ok60` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of inventory
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `material_type` bigint(20) unsigned DEFAULT '1' COMMENT '物料类型',
  `purchase_price` double(20,6) unsigned DEFAULT '0.000000' COMMENT '采购标准价',
  `sale_price` double(20,6) unsigned DEFAULT '0.000000' COMMENT '销售标准价',
  `use_type` bigint(20) unsigned DEFAULT '1' COMMENT '使用方式',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `unit_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '物料编码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '物料名称',
  `spc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规格型号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKt9kjl2b3iqg9sv9xe06fcxcya` (`code`),
  UNIQUE KEY `UKj8lh9456buiw3bl8pg6kbuwln` (`name`),
  KEY `FKffb619hl9g5jnro5kpyxfsld6` (`unit_id`),
  CONSTRAINT `FKffb619hl9g5jnro5kpyxfsld6` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of material
-- ----------------------------
BEGIN;
INSERT INTO `material` (`is_disabled`, `is_published`, `material_type`, `purchase_price`, `sale_price`, `use_type`, `create_time`, `id`, `unit_id`, `update_time`, `code`, `name`, `spc`) VALUES (0, 0, 2, 28000.000000, 29999.000000, 1, 1762854146595, 1, 1, 1762854146596, 'MA20250001', 'MacBook Pro M4 Max', '32G-1TB');
INSERT INTO `material` (`is_disabled`, `is_published`, `material_type`, `purchase_price`, `sale_price`, `use_type`, `create_time`, `id`, `unit_id`, `update_time`, `code`, `name`, `spc`) VALUES (0, 0, 2, 0.000000, 0.000000, 1, 1762854146628, 2, 1, 1762854146628, 'MA20250002', '键盘', '');
INSERT INTO `material` (`is_disabled`, `is_published`, `material_type`, `purchase_price`, `sale_price`, `use_type`, `create_time`, `id`, `unit_id`, `update_time`, `code`, `name`, `spc`) VALUES (0, 0, 2, 0.000000, 0.000000, 1, 1762854146629, 3, 1, 1762854146630, 'MA20250003', '屏幕', '');
COMMIT;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `role` tinyint(3) unsigned DEFAULT '6' COMMENT '类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `room_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  PRIMARY KEY (`id`),
  KEY `FKficnsbehqhov44rpjl0mrb3fu` (`room_id`),
  KEY `FKswb523yn1xw3806ojrfpcyadl` (`user_id`),
  CONSTRAINT `FKficnsbehqhov44rpjl0mrb3fu` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FKswb523yn1xw3806ojrfpcyadl` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of member
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `order_no` tinyint(3) unsigned DEFAULT '0' COMMENT '排序号',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` bigint(20) unsigned DEFAULT '0' COMMENT '父级ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '名称',
  `component` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组件路径',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '菜单图标',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '菜单路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 99, 1762854146552, 1, 0, 1762854146552, '首页', '/console/index/index', '', '/console');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 88, 1762854146553, 2, 0, 1762854146553, '资产管理', '', '', '');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146554, 3, 2, 1762854146554, '物料管理', '', '', '/console/asset/material/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146554, 4, 2, 1762854146554, '合同管理', '', '', '/console/asset/contract/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146555, 5, 2, 1762854146555, '设备管理', '', '', '/console/asset/device/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 77, 1762854146555, 6, 0, 1762854146555, '渠道管理', '', '', '');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146556, 7, 6, 1762854146556, '供应商管理', '', '', '/console/channel/supplier/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146556, 8, 6, 1762854146556, '采购单价', '', '', '/console/channel/purchasePrice/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146556, 9, 6, 1762854146556, '采购管理', '', '', '/console/channel/purchase/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146557, 10, 6, 1762854146557, '客户管理', '', '', '/console/channel/customer/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146557, 11, 6, 1762854146557, '销售单价', '', '', '/console/channel/salePrice/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146557, 12, 6, 1762854146557, '销售管理', '', '', '/console/channel/sale/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 66, 1762854146558, 13, 0, 1762854146558, '仓储管理', '', '', '');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146558, 14, 13, 1762854146558, '库存概览', '', '', '/console/wms/inventory/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146559, 15, 13, 1762854146559, '入库管理', '', '', '/console/wms/input/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146559, 16, 13, 1762854146559, '出库管理', '', '', '/console/wms/output/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146562, 17, 13, 1762854146562, '移库管理', '', '', '/console/wms/move/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 55, 1762854146563, 18, 0, 1762854146563, '生产管理', '', '', '');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146563, 19, 18, 1762854146563, '物料领取', '', '', '/console/mes/picking/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146564, 20, 18, 1762854146564, '计划管理', '', '', '/console/mes/plan/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146564, 21, 18, 1762854146564, '订单管理', '', '', '/console/mes/order/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146564, 22, 18, 1762854146564, '生产工艺', '', '', '/console/mes/routing/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146565, 23, 18, 1762854146565, '生产工序', '', '', '/console/mes/operation/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146565, 24, 18, 1762854146565, '生产配方', '', '', '/console/mes/bom/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 44, 1762854146565, 25, 0, 1762854146565, '设备物联', '', '', '');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146566, 26, 25, 1762854146566, '设备概览', '', '', '/console/iot/monitor/preview');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146566, 27, 25, 1762854146566, '参数管理', '', '', '/console/iot/parameter/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 3, 1762854146567, 28, 0, 1762854146567, '系统管理', '', '', '');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146567, 29, 28, 1762854146567, '仓库管理', '', '', '/console/factory/storage/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146568, 30, 28, 1762854146568, '生产单元', '', '', '/console/factory/structure/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146568, 31, 28, 1762854146568, '员工管理', '', '', '/console/personnel/user/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146568, 32, 28, 1762854146568, '角色管理', '', '', '/console/personnel/role/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146569, 33, 28, 1762854146569, '部门管理', '', '', '/console/personnel/department/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146569, 34, 28, 1762854146569, '计量单位', '', '', '/console/system/unit/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146569, 35, 28, 1762854146569, '编码规则', '', '', '/console/system/coderule/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 2, 1762854146570, 36, 0, 1762854146570, '超管配置', '', '', '');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146570, 37, 36, 1762854146570, '权限管理', '', '', '/console/system/permission/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146571, 38, 36, 1762854146571, '菜单管理', '', '', '/console/system/menu/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146571, 39, 36, 1762854146571, '系统配置', '', '', '/console/system/config/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146571, 40, 36, 1762854146571, '应用管理', '', '', '/console/open/app/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146572, 41, 36, 1762854146572, '通知管理', '', '', '/console/open/notify/list');
INSERT INTO `menu` (`is_disabled`, `is_published`, `order_no`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `component`, `icon`, `path`) VALUES (0, 0, 0, 1762854146572, 42, 36, 1762854146572, 'MCP工具', '', '', '/console/system/mcp/tools');
COMMIT;

-- ----------------------------
-- Table structure for move
-- ----------------------------
DROP TABLE IF EXISTS `move`;
CREATE TABLE `move` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '移库状态',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `storage_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `reject_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '驳回原因',
  `bill_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '移库单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6u3ivhth6a6cwrutaq5yr3omn` (`bill_code`),
  KEY `FKdp2vmjrsmdb1j7s58hxdhhse2` (`storage_id`),
  CONSTRAINT `FKdp2vmjrsmdb1j7s58hxdhhse2` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of move
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for move_detail
-- ----------------------------
DROP TABLE IF EXISTS `move_detail`;
CREATE TABLE `move_detail` (
  `finish_quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '已移动数量',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_finished` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已完成',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '移动数量',
  `bill_id` bigint(20) unsigned NOT NULL COMMENT '单据ID',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `inventory_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK37n0pvpey3m7jqer5exs50ddp` (`inventory_id`),
  CONSTRAINT `FK37n0pvpey3m7jqer5exs50ddp` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of move_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for notify
-- ----------------------------
DROP TABLE IF EXISTS `notify`;
CREATE TABLE `notify` (
  `channel` tinyint(3) unsigned DEFAULT '1' COMMENT '通知渠道',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `scene` tinyint(3) unsigned DEFAULT '1' COMMENT '通知场景',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '备注信息',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '通知令牌',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '通知地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notify
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for open_app
-- ----------------------------
DROP TABLE IF EXISTS `open_app`;
CREATE TABLE `open_app` (
  `arithmetic` tinyint(3) unsigned DEFAULT '1' COMMENT '加密算法',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_internal` tinyint(3) unsigned DEFAULT '0' COMMENT '是否内部应用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `app_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'AppKey',
  `app_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '应用名称',
  `app_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'AppSecret',
  `ip_white_list` text COLLATE utf8mb4_unicode_ci COMMENT 'IP白名单',
  `private_key` text COLLATE utf8mb4_unicode_ci COMMENT '私钥',
  `public_key` text COLLATE utf8mb4_unicode_ci COMMENT '公钥',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '应用地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK3ns1hceidc7sgjhb0bwfsilvk` (`app_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of open_app
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '工序编码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '工序名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKnuqnmas03f6xg1m6l7olgc37s` (`code`),
  UNIQUE KEY `UKi35laipdti1a2a4vdo7wpy5t4` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of operation
-- ----------------------------
BEGIN;
INSERT INTO `operation` (`is_disabled`, `is_published`, `create_time`, `id`, `update_time`, `code`, `name`) VALUES (0, 0, 1762854146620, 1, 1762854146621, 'OP20250001', '键盘安装');
INSERT INTO `operation` (`is_disabled`, `is_published`, `create_time`, `id`, `update_time`, `code`, `name`) VALUES (0, 0, 1762854146622, 2, 1762854146623, 'OP20250002', '屏幕贴膜');
INSERT INTO `operation` (`is_disabled`, `is_published`, `create_time`, `id`, `update_time`, `code`, `name`) VALUES (0, 0, 1762854146624, 3, 1762854146624, 'OP20250003', '系统安装');
COMMIT;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `finish_quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '完成数量',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_finished` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已完成',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `ng_quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '异常数量',
  `quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '数量',
  `bill_id` bigint(20) unsigned NOT NULL COMMENT '单据ID',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `finish_quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '已完成数量',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `ng_quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '异常数量',
  `quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '生产数量',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '订单状态',
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '订单类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `customer_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `deliver_time` bigint(20) unsigned DEFAULT '0' COMMENT '交付时间',
  `finish_time` bigint(20) unsigned DEFAULT '0' COMMENT '完成时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `plan_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `start_time` bigint(20) unsigned DEFAULT '0' COMMENT '开始时间',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `reject_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '驳回原因',
  `bill_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKfanf2yko6q03ur7k7q1218vwr` (`bill_code`),
  KEY `FK624gtjin3po807j3vix093tlf` (`customer_id`),
  KEY `FK8gd7n10uskjwh4utbbxdr7yt3` (`material_id`),
  KEY `FKrquk20ly0e6d7ycmc6jen944d` (`plan_id`),
  CONSTRAINT `FK624gtjin3po807j3vix093tlf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK8gd7n10uskjwh4utbbxdr7yt3` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  CONSTRAINT `FKrquk20ly0e6d7ycmc6jen944d` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for output
-- ----------------------------
DROP TABLE IF EXISTS `output`;
CREATE TABLE `output` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '出库状态',
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '出库类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `move_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `picking_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `sale_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `reject_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '驳回原因',
  `bill_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '出库单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK2xw9hdd9xjeik0ghfrrledgwa` (`bill_code`),
  KEY `FKnfglrrv212mto32t4f9iw62tw` (`move_id`),
  KEY `FK2emh7p6lgwcup3xf9nhked6ym` (`picking_id`),
  KEY `FKnuce2sl5bfcuaoo40psflufod` (`sale_id`),
  CONSTRAINT `FK2emh7p6lgwcup3xf9nhked6ym` FOREIGN KEY (`picking_id`) REFERENCES `picking` (`id`),
  CONSTRAINT `FKnfglrrv212mto32t4f9iw62tw` FOREIGN KEY (`move_id`) REFERENCES `move` (`id`),
  CONSTRAINT `FKnuce2sl5bfcuaoo40psflufod` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of output
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for output_detail
-- ----------------------------
DROP TABLE IF EXISTS `output_detail`;
CREATE TABLE `output_detail` (
  `finish_quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '已出库数量',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_finished` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已完成',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '出库数量',
  `bill_id` bigint(20) unsigned NOT NULL COMMENT '单据ID',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `inventory_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK30x6ywqj7y40fvl24pl6jrdfp` (`inventory_id`),
  KEY `FK88029s2w7bv4ohe8vvpjotup8` (`material_id`),
  CONSTRAINT `FK30x6ywqj7y40fvl24pl6jrdfp` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`),
  CONSTRAINT `FK88029s2w7bv4ohe8vvpjotup8` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of output_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `data_type` tinyint(3) unsigned DEFAULT '0' COMMENT '数据类型',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `is_system` tinyint(3) unsigned DEFAULT '0' COMMENT '是否内置参数',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数编码',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参数标题',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1oaqj037k4ywcedjncso1c0y6` (`code`),
  UNIQUE KEY `UKcb7yusyni4xxoeaj8jj7i8l4y` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of parameter
-- ----------------------------
BEGIN;
INSERT INTO `parameter` (`data_type`, `is_disabled`, `is_published`, `is_system`, `create_time`, `id`, `update_time`, `code`, `label`) VALUES (2, 0, 0, 1, 1762854146012, 1, 1762854146016, 'Status', '运行状态');
INSERT INTO `parameter` (`data_type`, `is_disabled`, `is_published`, `is_system`, `create_time`, `id`, `update_time`, `code`, `label`) VALUES (2, 0, 0, 1, 1762854146024, 2, 1762854146027, 'Alarm', '报警状态');
INSERT INTO `parameter` (`data_type`, `is_disabled`, `is_published`, `is_system`, `create_time`, `id`, `update_time`, `code`, `label`) VALUES (1, 0, 0, 1, 1762854146030, 3, 1762854146033, 'PartCnt', '实时产量');
COMMIT;

-- ----------------------------
-- Table structure for participant
-- ----------------------------
DROP TABLE IF EXISTS `participant`;
CREATE TABLE `participant` (
  `certificate_type` bigint(20) unsigned DEFAULT '0' COMMENT '证件类型',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `role` bigint(20) unsigned DEFAULT '1' COMMENT '参与人角色',
  `type` bigint(20) unsigned DEFAULT '0' COMMENT '身份类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '电子邮箱',
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '证件号',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '参与方名称',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of participant
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `is_system` tinyint(3) unsigned DEFAULT '0' COMMENT '系统权限',
  `type` tinyint(3) unsigned DEFAULT '0' COMMENT '权限类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` bigint(20) unsigned DEFAULT '0' COMMENT '父级ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '名称',
  `identity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '权限标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK9u83m5u6ookgmn5xccdnippbp` (`identity`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 1, 1762854145511, 1, 0, 1762854145642, 'MCP工具', 'mcp:tools');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 1, 1762854145695, 2, 1, 1762854145697, 'modifyEmailByName', 'b4566812d9928eeaaa7d741d02f97753b97bea81');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 1, 1762854145698, 3, 1, 1762854145700, 'OpenAppService_disableAppByName', 'c2b990f2d6e22aecdedac6adc3507db7bbec4836');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 1, 1762854145701, 4, 1, 1762854145702, 'MaterialService_addMaterial', '699c50bb24058b89ff86e17c486b0a5553cfb16c');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 1, 1762854145704, 5, 1, 1762854145705, 'PurchaseService_createPurchaseBill', 'e1e9cbf14bf636288cf8ebf78f57c1300b48a1a2');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146071, 6, 0, 1762854146072, '合同', 'Contract');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146076, 7, 6, 1762854146077, '合同-生效合同', 'Contract_enforce');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146079, 8, 6, 1762854146080, '合同-终止合同', 'Contract_stop');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146084, 9, 6, 1762854146086, '合同-发布', 'Contract_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146088, 10, 6, 1762854146089, '合同-查询详情', 'Contract_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146091, 11, 6, 1762854146092, '合同-不分页查询', 'Contract_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146094, 12, 6, 1762854146095, '合同-分页查询', 'Contract_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146097, 13, 6, 1762854146098, '合同-添加', 'Contract_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146100, 14, 6, 1762854146101, '合同-修改', 'Contract_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146103, 15, 6, 1762854146104, '合同-删除', 'Contract_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146106, 16, 0, 1762854146107, '参与方', 'Participant');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146111, 17, 16, 1762854146112, '参与方-发布', 'Participant_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146113, 18, 16, 1762854146114, '参与方-查询详情', 'Participant_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146116, 19, 16, 1762854146117, '参与方-不分页查询', 'Participant_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146119, 20, 16, 1762854146120, '参与方-分页查询', 'Participant_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146121, 21, 16, 1762854146122, '参与方-添加', 'Participant_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146125, 22, 16, 1762854146126, '参与方-修改', 'Participant_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146127, 23, 16, 1762854146128, '参与方-删除', 'Participant_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146129, 24, 0, 1762854146130, '设备', 'Device');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146132, 25, 24, 1762854146133, '设备-发布', 'Device_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146135, 26, 24, 1762854146136, '设备-查询详情', 'Device_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146137, 27, 24, 1762854146138, '设备-不分页查询', 'Device_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146139, 28, 24, 1762854146140, '设备-分页查询', 'Device_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146141, 29, 24, 1762854146142, '设备-添加', 'Device_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146143, 30, 24, 1762854146144, '设备-修改', 'Device_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146145, 31, 24, 1762854146146, '设备-删除', 'Device_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146147, 32, 0, 1762854146148, '物料', 'Material');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146149, 33, 32, 1762854146150, '物料-发布', 'Material_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146151, 34, 32, 1762854146152, '物料-查询详情', 'Material_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146153, 35, 32, 1762854146153, '物料-不分页查询', 'Material_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146154, 36, 32, 1762854146155, '物料-分页查询', 'Material_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146156, 37, 32, 1762854146157, '物料-添加', 'Material_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146158, 38, 32, 1762854146159, '物料-修改', 'Material_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146160, 39, 32, 1762854146161, '物料-删除', 'Material_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146162, 40, 32, 1762854146162, '物料-创建导出任务', 'Material_export');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146164, 41, 0, 1762854146165, '客户', 'Customer');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146167, 42, 41, 1762854146170, '客户-发布', 'Customer_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146171, 43, 41, 1762854146172, '客户-查询详情', 'Customer_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146173, 44, 41, 1762854146174, '客户-不分页查询', 'Customer_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146175, 45, 41, 1762854146176, '客户-分页查询', 'Customer_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146177, 46, 41, 1762854146178, '客户-添加', 'Customer_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146179, 47, 41, 1762854146179, '客户-修改', 'Customer_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146180, 48, 41, 1762854146181, '客户-删除', 'Customer_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146182, 49, 0, 1762854146183, '采购单', 'Purchase');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146185, 50, 49, 1762854146186, '采购单-添加明细的完成数量', 'Purchase_addFinish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146187, 51, 49, 1762854146188, '采购单-驳回', 'Purchase_reject');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146189, 52, 49, 1762854146189, '采购单-审核', 'Purchase_audit');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146191, 53, 49, 1762854146191, '采购单-发布', 'Purchase_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146192, 54, 49, 1762854146193, '采购单-查询详情', 'Purchase_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146194, 55, 49, 1762854146195, '采购单-不分页查询', 'Purchase_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146196, 56, 49, 1762854146197, '采购单-分页查询', 'Purchase_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146198, 57, 49, 1762854146198, '采购单-添加', 'Purchase_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146200, 58, 49, 1762854146200, '采购单-修改', 'Purchase_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146201, 59, 0, 1762854146202, '采购价格', 'PurchasePrice');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146203, 60, 59, 1762854146204, '采购价格-查询物料和供应商的价格', 'PurchasePrice_getByMaterialAndSupplier');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146205, 61, 59, 1762854146205, '采购价格-发布', 'PurchasePrice_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146206, 62, 59, 1762854146207, '采购价格-查询详情', 'PurchasePrice_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146208, 63, 59, 1762854146209, '采购价格-不分页查询', 'PurchasePrice_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146209, 64, 59, 1762854146210, '采购价格-分页查询', 'PurchasePrice_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146211, 65, 59, 1762854146212, '采购价格-添加', 'PurchasePrice_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146213, 66, 59, 1762854146213, '采购价格-修改', 'PurchasePrice_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146214, 67, 59, 1762854146215, '采购价格-删除', 'PurchasePrice_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146216, 68, 0, 1762854146217, '销售单', 'Sale');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146218, 69, 68, 1762854146219, '销售单-添加明细的完成数量', 'Sale_addFinish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146220, 70, 68, 1762854146220, '销售单-驳回', 'Sale_reject');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146221, 71, 68, 1762854146221, '销售单-审核', 'Sale_audit');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146222, 72, 68, 1762854146223, '销售单-发布', 'Sale_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146224, 73, 68, 1762854146225, '销售单-查询详情', 'Sale_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146226, 74, 68, 1762854146226, '销售单-不分页查询', 'Sale_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146227, 75, 68, 1762854146228, '销售单-分页查询', 'Sale_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146229, 76, 68, 1762854146230, '销售单-添加', 'Sale_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146231, 77, 68, 1762854146232, '销售单-修改', 'Sale_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146233, 78, 0, 1762854146233, '销售价格', 'SalePrice');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146235, 79, 78, 1762854146235, '销售价格-查询物料和客户的价格', 'SalePrice_getByMaterialAndCustomer');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146236, 80, 78, 1762854146237, '销售价格-发布', 'SalePrice_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146238, 81, 78, 1762854146239, '销售价格-查询详情', 'SalePrice_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146240, 82, 78, 1762854146241, '销售价格-不分页查询', 'SalePrice_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146242, 83, 78, 1762854146243, '销售价格-分页查询', 'SalePrice_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146244, 84, 78, 1762854146244, '销售价格-添加', 'SalePrice_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146246, 85, 78, 1762854146247, '销售价格-修改', 'SalePrice_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146248, 86, 78, 1762854146249, '销售价格-删除', 'SalePrice_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146250, 87, 0, 1762854146252, '供应商', 'Supplier');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146254, 88, 87, 1762854146255, '供应商-发布', 'Supplier_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146256, 89, 87, 1762854146256, '供应商-查询详情', 'Supplier_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146257, 90, 87, 1762854146258, '供应商-不分页查询', 'Supplier_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146259, 91, 87, 1762854146259, '供应商-分页查询', 'Supplier_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146260, 92, 87, 1762854146261, '供应商-添加', 'Supplier_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146262, 93, 87, 1762854146263, '供应商-修改', 'Supplier_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146264, 94, 0, 1762854146264, '成员', 'Member');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146266, 95, 94, 1762854146267, '成员-发布', 'Member_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146268, 96, 94, 1762854146268, '成员-查询详情', 'Member_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146269, 97, 94, 1762854146270, '成员-不分页查询', 'Member_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146271, 98, 94, 1762854146272, '成员-分页查询', 'Member_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146273, 99, 94, 1762854146274, '成员-添加', 'Member_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146275, 100, 94, 1762854146275, '成员-修改', 'Member_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146276, 101, 94, 1762854146277, '成员-删除', 'Member_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146278, 102, 0, 1762854146278, '房间', 'Room');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146280, 103, 102, 1762854146280, '房间-发布', 'Room_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146281, 104, 102, 1762854146282, '房间-不分页查询', 'Room_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146283, 105, 102, 1762854146284, '房间-分页查询', 'Room_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146285, 106, 102, 1762854146285, '房间-添加', 'Room_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146286, 107, 102, 1762854146287, '房间-修改', 'Room_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146288, 108, 102, 1762854146288, '房间-删除', 'Room_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146289, 109, 0, 1762854146290, '仓库', 'Storage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146291, 110, 109, 1762854146292, '仓库-发布', 'Storage_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146293, 111, 109, 1762854146293, '仓库-查询详情', 'Storage_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146295, 112, 109, 1762854146295, '仓库-不分页查询', 'Storage_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146296, 113, 109, 1762854146297, '仓库-分页查询', 'Storage_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146298, 114, 109, 1762854146299, '仓库-添加', 'Storage_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146299, 115, 109, 1762854146300, '仓库-修改', 'Storage_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146304, 116, 109, 1762854146305, '仓库-删除', 'Storage_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146306, 117, 0, 1762854146306, '生产单元', 'Structure');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146309, 118, 117, 1762854146309, '生产单元-发布', 'Structure_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146310, 119, 117, 1762854146311, '生产单元-查询详情', 'Structure_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146312, 120, 117, 1762854146312, '生产单元-不分页查询', 'Structure_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146314, 121, 117, 1762854146314, '生产单元-分页查询', 'Structure_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146316, 122, 117, 1762854146316, '生产单元-添加', 'Structure_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146317, 123, 117, 1762854146318, '生产单元-修改', 'Structure_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146319, 124, 117, 1762854146320, '生产单元-删除', 'Structure_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146321, 125, 0, 1762854146322, '采集参数', 'Parameter');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146324, 126, 125, 1762854146325, '采集参数-发布', 'Parameter_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146326, 127, 125, 1762854146326, '采集参数-查询详情', 'Parameter_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146327, 128, 125, 1762854146328, '采集参数-不分页查询', 'Parameter_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146329, 129, 125, 1762854146329, '采集参数-分页查询', 'Parameter_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146330, 130, 125, 1762854146331, '采集参数-添加', 'Parameter_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146332, 131, 125, 1762854146333, '采集参数-修改', 'Parameter_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146334, 132, 125, 1762854146334, '采集参数-删除', 'Parameter_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146335, 133, 0, 1762854146335, 'McpController', 'Mcp');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146337, 134, 0, 1762854146337, 'BOM', 'Bom');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146338, 135, 134, 1762854146339, 'BOM-发布', 'Bom_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146340, 136, 134, 1762854146341, 'BOM-查询详情', 'Bom_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146342, 137, 134, 1762854146343, 'BOM-不分页查询', 'Bom_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146343, 138, 134, 1762854146344, 'BOM-分页查询', 'Bom_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146345, 139, 134, 1762854146345, 'BOM-添加', 'Bom_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146346, 140, 134, 1762854146347, 'BOM-修改', 'Bom_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146348, 141, 134, 1762854146349, 'BOM-删除', 'Bom_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146350, 142, 0, 1762854146350, '工序', 'Operation');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146352, 143, 142, 1762854146352, '工序-发布', 'Operation_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146353, 144, 142, 1762854146353, '工序-查询详情', 'Operation_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146354, 145, 142, 1762854146355, '工序-不分页查询', 'Operation_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146355, 146, 142, 1762854146356, '工序-分页查询', 'Operation_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146358, 147, 142, 1762854146359, '工序-添加', 'Operation_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146360, 148, 142, 1762854146360, '工序-修改', 'Operation_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146361, 149, 142, 1762854146362, '工序-删除', 'Operation_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146363, 150, 0, 1762854146364, '生产订单', 'Order');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146366, 151, 150, 1762854146366, '生产订单-手动设置为生产完成待入库状态', 'Order_setBillDetailsAllFinished');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146367, 152, 150, 1762854146368, '生产订单-订单报工', 'Order_addOrderDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146369, 153, 150, 1762854146369, '生产订单-暂停生产', 'Order_pause');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146370, 154, 150, 1762854146370, '生产订单-开始生产', 'Order_start');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146371, 155, 150, 1762854146372, '生产订单-添加明细的完成数量', 'Order_addFinish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146372, 156, 150, 1762854146373, '生产订单-驳回', 'Order_reject');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146374, 157, 150, 1762854146375, '生产订单-审核', 'Order_audit');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146375, 158, 150, 1762854146376, '生产订单-发布', 'Order_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146377, 159, 150, 1762854146377, '生产订单-查询详情', 'Order_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146378, 160, 150, 1762854146378, '生产订单-不分页查询', 'Order_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146379, 161, 150, 1762854146380, '生产订单-分页查询', 'Order_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146380, 162, 150, 1762854146381, '生产订单-添加', 'Order_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146382, 163, 150, 1762854146383, '生产订单-修改', 'Order_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146384, 164, 0, 1762854146384, '领料单', 'Picking');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146386, 165, 164, 1762854146387, '领料单-添加明细的完成数量', 'Picking_addFinish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146387, 166, 164, 1762854146388, '领料单-驳回', 'Picking_reject');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146389, 167, 164, 1762854146389, '领料单-审核', 'Picking_audit');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146390, 168, 164, 1762854146391, '领料单-发布', 'Picking_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146392, 169, 164, 1762854146392, '领料单-查询详情', 'Picking_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146393, 170, 164, 1762854146393, '领料单-不分页查询', 'Picking_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146394, 171, 164, 1762854146395, '领料单-分页查询', 'Picking_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146395, 172, 164, 1762854146396, '领料单-添加', 'Picking_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146396, 173, 164, 1762854146397, '领料单-修改', 'Picking_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146397, 174, 0, 1762854146398, '生产计划', 'Plan');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146399, 175, 174, 1762854146399, '生产计划-添加明细的完成数量', 'Plan_addFinish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146400, 176, 174, 1762854146400, '生产计划-驳回', 'Plan_reject');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146400, 177, 174, 1762854146401, '生产计划-审核', 'Plan_audit');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146401, 178, 174, 1762854146402, '生产计划-发布', 'Plan_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146402, 179, 174, 1762854146403, '生产计划-查询详情', 'Plan_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146403, 180, 174, 1762854146404, '生产计划-不分页查询', 'Plan_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146405, 181, 174, 1762854146405, '生产计划-分页查询', 'Plan_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146406, 182, 174, 1762854146406, '生产计划-添加', 'Plan_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146407, 183, 174, 1762854146407, '生产计划-修改', 'Plan_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146408, 184, 0, 1762854146408, '生产工艺', 'Routing');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146409, 185, 184, 1762854146409, '生产工艺-发布', 'Routing_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146410, 186, 184, 1762854146410, '生产工艺-查询详情', 'Routing_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146411, 187, 184, 1762854146411, '生产工艺-不分页查询', 'Routing_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146412, 188, 184, 1762854146412, '生产工艺-分页查询', 'Routing_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146413, 189, 184, 1762854146413, '生产工艺-添加', 'Routing_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146414, 190, 184, 1762854146414, '生产工艺-修改', 'Routing_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146415, 191, 184, 1762854146415, '生产工艺-删除', 'Routing_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146416, 192, 0, 1762854146416, '工序配置', 'RoutingOperation');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146417, 193, 192, 1762854146418, '工序配置-发布', 'RoutingOperation_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146418, 194, 192, 1762854146419, '工序配置-查询详情', 'RoutingOperation_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146419, 195, 192, 1762854146420, '工序配置-不分页查询', 'RoutingOperation_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146420, 196, 192, 1762854146420, '工序配置-分页查询', 'RoutingOperation_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146421, 197, 192, 1762854146422, '工序配置-添加', 'RoutingOperation_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146422, 198, 192, 1762854146423, '工序配置-修改', 'RoutingOperation_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146423, 199, 192, 1762854146424, '工序配置-删除', 'RoutingOperation_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146424, 200, 0, 1762854146425, '测试API', 'OpenTest');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146426, 201, 0, 1762854146426, '开放应用', 'OpenApp');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146427, 202, 201, 1762854146427, '开放应用-重置密钥对', 'OpenApp_resetKeyPair');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146428, 203, 201, 1762854146428, '开放应用-重置密钥', 'OpenApp_resetSecret');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146429, 204, 201, 1762854146429, '开放应用-添加', 'OpenApp_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146430, 205, 201, 1762854146430, '开放应用-发布', 'OpenApp_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146431, 206, 201, 1762854146431, '开放应用-查询详情', 'OpenApp_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146432, 207, 201, 1762854146432, '开放应用-不分页查询', 'OpenApp_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146433, 208, 201, 1762854146433, '开放应用-分页查询', 'OpenApp_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146434, 209, 201, 1762854146434, '开放应用-禁用', 'OpenApp_disable');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146435, 210, 201, 1762854146435, '开放应用-修改', 'OpenApp_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146436, 211, 201, 1762854146436, '开放应用-删除', 'OpenApp_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146437, 212, 201, 1762854146437, '开放应用-启用', 'OpenApp_enable');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146438, 213, 0, 1762854146438, '通知钩子', 'Notify');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146440, 214, 213, 1762854146440, '通知钩子-发布', 'Notify_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146441, 215, 213, 1762854146442, '通知钩子-查询详情', 'Notify_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146442, 216, 213, 1762854146443, '通知钩子-不分页查询', 'Notify_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146443, 217, 213, 1762854146444, '通知钩子-分页查询', 'Notify_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146444, 218, 213, 1762854146444, '通知钩子-禁用', 'Notify_disable');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146445, 219, 213, 1762854146445, '通知钩子-添加', 'Notify_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146446, 220, 213, 1762854146446, '通知钩子-修改', 'Notify_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146447, 221, 213, 1762854146447, '通知钩子-删除', 'Notify_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146448, 222, 213, 1762854146448, '通知钩子-启用', 'Notify_enable');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146449, 223, 0, 1762854146449, 'OauthController', 'Oauth');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146450, 224, 0, 1762854146450, '部门', 'Department');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146451, 225, 224, 1762854146452, '部门-发布', 'Department_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146452, 226, 224, 1762854146452, '部门-查询详情', 'Department_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146453, 227, 224, 1762854146453, '部门-分页查询', 'Department_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146454, 228, 224, 1762854146454, '部门-添加', 'Department_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146455, 229, 224, 1762854146455, '部门-修改', 'Department_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146456, 230, 224, 1762854146456, '部门-删除', 'Department_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146456, 231, 0, 1762854146457, '角色', 'Role');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146458, 232, 231, 1762854146458, '角色-授权菜单', 'Role_authorizeMenu');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146458, 233, 231, 1762854146459, '角色-授权权限', 'Role_authorizePermission');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146459, 234, 231, 1762854146460, '角色-发布', 'Role_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146460, 235, 231, 1762854146460, '角色-查询详情', 'Role_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146461, 236, 231, 1762854146461, '角色-不分页查询', 'Role_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146462, 237, 231, 1762854146462, '角色-分页查询', 'Role_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146463, 238, 231, 1762854146463, '角色-禁用', 'Role_disable');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146464, 239, 231, 1762854146464, '角色-添加', 'Role_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146464, 240, 231, 1762854146465, '角色-修改', 'Role_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146465, 241, 231, 1762854146466, '角色-删除', 'Role_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146466, 242, 231, 1762854146467, '角色-启用', 'Role_enable');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146467, 243, 0, 1762854146467, '用户', 'User');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146468, 244, 243, 1762854146469, '用户-发布', 'User_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146469, 245, 243, 1762854146470, '用户-查询详情', 'User_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146470, 246, 243, 1762854146470, '用户-不分页查询', 'User_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146471, 247, 243, 1762854146471, '用户-分页查询', 'User_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146472, 248, 243, 1762854146472, '用户-禁用', 'User_disable');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146473, 249, 243, 1762854146473, '用户-添加', 'User_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146473, 250, 243, 1762854146474, '用户-修改', 'User_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146474, 251, 243, 1762854146474, '用户-删除', 'User_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146475, 252, 243, 1762854146475, '用户-启用', 'User_enable');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146476, 253, 0, 1762854146476, '首页', 'Index');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146477, 254, 0, 1762854146477, '编码规则', 'CodeRule');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146478, 255, 254, 1762854146478, '编码规则-发布', 'CodeRule_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146479, 256, 254, 1762854146479, '编码规则-查询详情', 'CodeRule_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146480, 257, 254, 1762854146480, '编码规则-不分页查询', 'CodeRule_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146481, 258, 254, 1762854146481, '编码规则-分页查询', 'CodeRule_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146482, 259, 254, 1762854146482, '编码规则-添加', 'CodeRule_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146483, 260, 254, 1762854146483, '编码规则-修改', 'CodeRule_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146483, 261, 254, 1762854146484, '编码规则-删除', 'CodeRule_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146484, 262, 0, 1762854146485, '系统配置', 'Config');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146485, 263, 262, 1762854146486, '系统配置-发布', 'Config_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146486, 264, 262, 1762854146487, '系统配置-查询详情', 'Config_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146487, 265, 262, 1762854146487, '系统配置-不分页查询', 'Config_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146488, 266, 262, 1762854146488, '系统配置-分页查询', 'Config_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146489, 267, 262, 1762854146489, '系统配置-添加', 'Config_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146490, 268, 262, 1762854146490, '系统配置-修改', 'Config_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146491, 269, 262, 1762854146491, '系统配置-删除', 'Config_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146491, 270, 0, 1762854146492, '文件', 'File');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146492, 271, 270, 1762854146493, '文件-发布', 'File_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146493, 272, 270, 1762854146494, '文件-查询详情', 'File_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146494, 273, 270, 1762854146495, '文件-不分页查询', 'File_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146495, 274, 270, 1762854146495, '文件-分页查询', 'File_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146496, 275, 270, 1762854146496, '文件-添加', 'File_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146497, 276, 270, 1762854146497, '文件-修改', 'File_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146498, 277, 270, 1762854146498, '文件-删除', 'File_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146499, 278, 0, 1762854146499, '菜单', 'Menu');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146500, 279, 278, 1762854146500, '菜单-发布', 'Menu_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146501, 280, 278, 1762854146501, '菜单-查询详情', 'Menu_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146502, 281, 278, 1762854146502, '菜单-分页查询', 'Menu_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146503, 282, 278, 1762854146503, '菜单-添加', 'Menu_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146503, 283, 278, 1762854146504, '菜单-修改', 'Menu_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146504, 284, 278, 1762854146505, '菜单-删除', 'Menu_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146505, 285, 0, 1762854146505, '权限', 'Permission');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146506, 286, 285, 1762854146506, '权限-发布', 'Permission_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146507, 287, 285, 1762854146507, '权限-查询详情', 'Permission_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146508, 288, 285, 1762854146508, '权限-不分页查询', 'Permission_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146509, 289, 285, 1762854146509, '权限-分页查询', 'Permission_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146509, 290, 285, 1762854146510, '权限-添加', 'Permission_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146510, 291, 285, 1762854146510, '权限-修改', 'Permission_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146511, 292, 285, 1762854146511, '权限-删除', 'Permission_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146512, 293, 0, 1762854146512, '系统状态', 'Status');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146513, 294, 0, 1762854146513, '单位', 'Unit');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146514, 295, 294, 1762854146514, '单位-发布', 'Unit_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146515, 296, 294, 1762854146515, '单位-查询详情', 'Unit_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146516, 297, 294, 1762854146516, '单位-不分页查询', 'Unit_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146516, 298, 294, 1762854146517, '单位-分页查询', 'Unit_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146517, 299, 294, 1762854146517, '单位-添加', 'Unit_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146518, 300, 294, 1762854146518, '单位-修改', 'Unit_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146519, 301, 294, 1762854146519, '单位-删除', 'Unit_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146519, 302, 0, 1762854146520, '入库', 'Input');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146521, 303, 302, 1762854146521, '入库-添加明细的完成数量', 'Input_addFinish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146521, 304, 302, 1762854146522, '入库-驳回', 'Input_reject');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146522, 305, 302, 1762854146522, '入库-审核', 'Input_audit');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146523, 306, 302, 1762854146523, '入库-发布', 'Input_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146524, 307, 302, 1762854146524, '入库-查询详情', 'Input_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146525, 308, 302, 1762854146525, '入库-不分页查询', 'Input_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146526, 309, 302, 1762854146526, '入库-分页查询', 'Input_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146527, 310, 302, 1762854146527, '入库-添加', 'Input_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146527, 311, 302, 1762854146528, '入库-修改', 'Input_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146528, 312, 0, 1762854146528, '入库', 'Inventory');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146529, 313, 312, 1762854146530, '入库-发布', 'Inventory_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146530, 314, 312, 1762854146530, '入库-查询详情', 'Inventory_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146531, 315, 312, 1762854146531, '入库-不分页查询', 'Inventory_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146532, 316, 312, 1762854146532, '入库-分页查询', 'Inventory_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146533, 317, 312, 1762854146533, '入库-添加', 'Inventory_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146533, 318, 312, 1762854146534, '入库-修改', 'Inventory_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146534, 319, 312, 1762854146534, '入库-删除', 'Inventory_delete');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146535, 320, 0, 1762854146535, '移库', 'Move');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146536, 321, 320, 1762854146536, '移库-添加明细的完成数量', 'Move_addFinish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146537, 322, 320, 1762854146537, '移库-驳回', 'Move_reject');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146538, 323, 320, 1762854146538, '移库-审核', 'Move_audit');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146538, 324, 320, 1762854146539, '移库-发布', 'Move_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146539, 325, 320, 1762854146539, '移库-查询详情', 'Move_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146540, 326, 320, 1762854146540, '移库-不分页查询', 'Move_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146541, 327, 320, 1762854146541, '移库-分页查询', 'Move_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146542, 328, 320, 1762854146542, '移库-添加', 'Move_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146542, 329, 320, 1762854146543, '移库-修改', 'Move_update');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146543, 330, 0, 1762854146543, '出库', 'Output');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146544, 331, 330, 1762854146545, '出库-添加明细的完成数量', 'Output_addFinish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146545, 332, 330, 1762854146545, '出库-驳回', 'Output_reject');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146546, 333, 330, 1762854146546, '出库-审核', 'Output_audit');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146547, 334, 330, 1762854146547, '出库-发布', 'Output_publish');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146548, 335, 330, 1762854146548, '出库-查询详情', 'Output_getDetail');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146548, 336, 330, 1762854146549, '出库-不分页查询', 'Output_getList');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146549, 337, 330, 1762854146550, '出库-分页查询', 'Output_getPage');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146550, 338, 330, 1762854146551, '出库-添加', 'Output_add');
INSERT INTO `permission` (`is_disabled`, `is_published`, `is_system`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `identity`) VALUES (0, 0, 1, 0, 1762854146551, 339, 330, 1762854146551, '出库-修改', 'Output_update');
COMMIT;

-- ----------------------------
-- Table structure for personal_token
-- ----------------------------
DROP TABLE IF EXISTS `personal_token`;
CREATE TABLE `personal_token` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '令牌名称',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '令牌',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6q8ucmksq907uma5lvp7a4nmn` (`token`),
  KEY `FKo9xrju78lrge8vmqwnn4jepcp` (`user_id`),
  CONSTRAINT `FKo9xrju78lrge8vmqwnn4jepcp` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_token
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for picking
-- ----------------------------
DROP TABLE IF EXISTS `picking`;
CREATE TABLE `picking` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '领料状态',
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '领料类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `structure_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `reject_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '驳回原因',
  `bill_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '领料单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKjt8mxdi2b8uie8d2vdi2ihh5c` (`bill_code`),
  KEY `FKp1dr0fjd4s38aewmmu45fmoaq` (`order_id`),
  KEY `FKp6uyvu8790s9ur2xuo75lij51` (`structure_id`),
  CONSTRAINT `FKp1dr0fjd4s38aewmmu45fmoaq` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKp6uyvu8790s9ur2xuo75lij51` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of picking
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for picking_detail
-- ----------------------------
DROP TABLE IF EXISTS `picking_detail`;
CREATE TABLE `picking_detail` (
  `finish_quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '已出库数量',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_finished` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已完成',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '领料数量',
  `bill_id` bigint(20) unsigned NOT NULL COMMENT '单据ID',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FKj2yro1m297pl5n54j2k497akt` (`material_id`),
  CONSTRAINT `FKj2yro1m297pl5n54j2k497akt` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of picking_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '计划状态',
  `type` tinyint(3) unsigned DEFAULT '1' COMMENT '计划类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `customer_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `deliver_time` bigint(20) unsigned DEFAULT '0' COMMENT '交付时间',
  `finish_time` bigint(20) unsigned DEFAULT '0' COMMENT '完成时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `start_time` bigint(20) unsigned DEFAULT '0' COMMENT '开始时间',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `reject_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '驳回原因',
  `bill_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '生产计划号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKgqqodh8vbwnk1nykxp33ql3hd` (`bill_code`),
  KEY `FKwxvxsdrgs6bwhatruyf2adj5` (`customer_id`),
  CONSTRAINT `FKwxvxsdrgs6bwhatruyf2adj5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for plan_detail
-- ----------------------------
DROP TABLE IF EXISTS `plan_detail`;
CREATE TABLE `plan_detail` (
  `finish_quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '已完成数量',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_finished` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已完成',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '生产数量',
  `bill_id` bigint(20) unsigned NOT NULL COMMENT '单据ID',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FKrnqnv2a34btthbch10q1xeqk3` (`material_id`),
  CONSTRAINT `FKrnqnv2a34btthbch10q1xeqk3` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '采购状态',
  `total_price` double(20,6) unsigned DEFAULT '0.000000' COMMENT '总金额',
  `total_real_price` double(20,6) unsigned DEFAULT '0.000000' COMMENT '实际金额',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '采购事由',
  `reject_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '驳回原因',
  `bill_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '采购单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKqp00bhw4f273ma612435lyj6d` (`bill_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of purchase
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_detail`;
CREATE TABLE `purchase_detail` (
  `finish_quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '已入库数量',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_finished` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已完成',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `price` double(20,6) unsigned DEFAULT '0.000000' COMMENT '采购单价',
  `quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '采购数量',
  `bill_id` bigint(20) unsigned NOT NULL COMMENT '单据ID',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `supplier_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK9kk9qqvhmhu856xl86i3xyo0t` (`material_id`),
  KEY `FKb4ye2u947c3bjheohdo0qpo4` (`supplier_id`),
  CONSTRAINT `FK9kk9qqvhmhu856xl86i3xyo0t` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  CONSTRAINT `FKb4ye2u947c3bjheohdo0qpo4` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of purchase_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for purchase_price
-- ----------------------------
DROP TABLE IF EXISTS `purchase_price`;
CREATE TABLE `purchase_price` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `price` double(20,6) unsigned DEFAULT '0.000000' COMMENT '采购单价',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `supplier_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK241ccguqhen2wjm0r6wfcdo3c` (`material_id`),
  KEY `FKhdgnjpecjkxsukpf6bacdc55e` (`supplier_id`),
  CONSTRAINT `FK241ccguqhen2wjm0r6wfcdo3c` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  CONSTRAINT `FKhdgnjpecjkxsukpf6bacdc55e` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of purchase_price
-- ----------------------------
BEGIN;
INSERT INTO `purchase_price` (`is_disabled`, `is_published`, `price`, `create_time`, `id`, `material_id`, `supplier_id`, `update_time`) VALUES (0, 0, 28000.000000, 1762854146609, 1, 1, 1, 1762854146610);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '角色编码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '角色名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKc36say97xydpmgigg38qv5l2p` (`code`),
  UNIQUE KEY `UK8sewwnpamngi6b1dwaa88askk` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `menu_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FKfg4e2mb2318tph615gh44ll3` (`menu_id`),
  KEY `FKqyvxw2gg2qk0wld3bqfcb58vq` (`role_id`),
  CONSTRAINT `FKfg4e2mb2318tph615gh44ll3` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `FKqyvxw2gg2qk0wld3bqfcb58vq` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `permission_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FKf8yllw1ecvwqy3ehyxawqa1qp` (`permission_id`),
  KEY `FKa6jx8n8xkesmjmv6jqug6bg68` (`role_id`),
  CONSTRAINT `FKa6jx8n8xkesmjmv6jqug6bg68` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKf8yllw1ecvwqy3ehyxawqa1qp` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `code` int(10) unsigned NOT NULL COMMENT '房间号',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_hot` tinyint(3) unsigned DEFAULT '0' COMMENT '是否热门',
  `is_official` tinyint(3) unsigned DEFAULT '0' COMMENT '是否官方',
  `is_private` tinyint(3) unsigned DEFAULT '0' COMMENT '是否私有房间',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `order_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '房间排序',
  `size` int(10) unsigned NOT NULL DEFAULT '100000' COMMENT '房间大小',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `owner_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '房间简介',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '房间名称',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '房间密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKarevbfcloncxciyi0vbx1m4he` (`code`),
  UNIQUE KEY `UK4l8mm4fqoos6fcbx76rvqxer` (`name`),
  KEY `FKbx9snvq7gghcs7i2hjasjln6f` (`owner_id`),
  CONSTRAINT `FKbx9snvq7gghcs7i2hjasjln6f` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of room
-- ----------------------------
BEGIN;
INSERT INTO `room` (`code`, `is_disabled`, `is_hot`, `is_official`, `is_private`, `is_published`, `order_number`, `size`, `create_time`, `id`, `owner_id`, `update_time`, `description`, `name`, `password`) VALUES (666, 0, 1, 1, 0, 0, 0, 100000, 1762854145796, 1, 1, 1762854145799, '', '广场', '');
INSERT INTO `room` (`code`, `is_disabled`, `is_hot`, `is_official`, `is_private`, `is_published`, `order_number`, `size`, `create_time`, `id`, `owner_id`, `update_time`, `description`, `name`, `password`) VALUES (888, 0, 1, 0, 0, 0, 0, 100000, 1762854145802, 2, 1, 1762854145804, '', '测试', '');
COMMIT;

-- ----------------------------
-- Table structure for routing
-- ----------------------------
DROP TABLE IF EXISTS `routing`;
CREATE TABLE `routing` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `is_routing_bom` tinyint(3) unsigned DEFAULT '0' COMMENT '使用工艺BOM',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '工艺状态',
  `bom_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '工艺编码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '工艺名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6n93wrxlrx0kdrhm19636our3` (`code`),
  KEY `FK1h2w6kntcjla2cuyv2146e292` (`bom_id`),
  KEY `FK6xr3w55e0ucsaix9l5u4koh8x` (`material_id`),
  CONSTRAINT `FK1h2w6kntcjla2cuyv2146e292` FOREIGN KEY (`bom_id`) REFERENCES `bom` (`id`),
  CONSTRAINT `FK6xr3w55e0ucsaix9l5u4koh8x` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of routing
-- ----------------------------
BEGIN;
INSERT INTO `routing` (`is_disabled`, `is_published`, `is_routing_bom`, `status`, `bom_id`, `create_time`, `id`, `material_id`, `update_time`, `code`, `name`) VALUES (0, 0, 0, 1, 1, 1762854146656, 1, 1, 1762854146656, 'RT0001', '笔记本安装');
COMMIT;

-- ----------------------------
-- Table structure for routing_operation
-- ----------------------------
DROP TABLE IF EXISTS `routing_operation`;
CREATE TABLE `routing_operation` (
  `is_auto_next` tinyint(3) unsigned DEFAULT '0' COMMENT '是否自动流转',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `order_no` tinyint(3) unsigned DEFAULT '0' COMMENT '排序号',
  `bom_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `operation_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `routing_id` bigint(20) unsigned NOT NULL COMMENT '工艺ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK90cnh93afjly7a8m924ypqm1t` (`bom_id`),
  KEY `FKg7xkw9b55lt8i5nvv1c1y4syt` (`operation_id`),
  CONSTRAINT `FK90cnh93afjly7a8m924ypqm1t` FOREIGN KEY (`bom_id`) REFERENCES `bom` (`id`),
  CONSTRAINT `FKg7xkw9b55lt8i5nvv1c1y4syt` FOREIGN KEY (`operation_id`) REFERENCES `operation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of routing_operation
-- ----------------------------
BEGIN;
INSERT INTO `routing_operation` (`is_auto_next`, `is_disabled`, `is_published`, `order_no`, `bom_id`, `create_time`, `id`, `operation_id`, `routing_id`, `update_time`) VALUES (1, 0, 0, 0, 2, 1762854146658, 1, 1, 1, 1762854146658);
INSERT INTO `routing_operation` (`is_auto_next`, `is_disabled`, `is_published`, `order_no`, `bom_id`, `create_time`, `id`, `operation_id`, `routing_id`, `update_time`) VALUES (1, 0, 0, 0, 3, 1762854146659, 2, 2, 1, 1762854146659);
INSERT INTO `routing_operation` (`is_auto_next`, `is_disabled`, `is_published`, `order_no`, `bom_id`, `create_time`, `id`, `operation_id`, `routing_id`, `update_time`) VALUES (0, 0, 0, 0, NULL, 1762854146659, 3, 3, 1, 1762854146659);
COMMIT;

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '销售状态',
  `total_price` double(20,6) unsigned DEFAULT '0.000000' COMMENT '总金额',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `customer_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '销售说明',
  `reject_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '驳回原因',
  `bill_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '销售单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK39t6naeqb62voxrabug0drfw` (`bill_code`),
  KEY `FKjw88ojfoqquyd9f1obip1ar0g` (`customer_id`),
  CONSTRAINT `FKjw88ojfoqquyd9f1obip1ar0g` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sale
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sale_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_detail`;
CREATE TABLE `sale_detail` (
  `finish_quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '已出库数量',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_finished` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已完成',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `price` double(20,6) unsigned DEFAULT '0.000000' COMMENT '销售单价',
  `quantity` double(20,6) unsigned DEFAULT '0.000000' COMMENT '销售数量',
  `bill_id` bigint(20) unsigned NOT NULL COMMENT '单据ID',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FKe5m82ya2k28ol39d2o5o15ddb` (`material_id`),
  CONSTRAINT `FKe5m82ya2k28ol39d2o5o15ddb` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sale_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sale_price
-- ----------------------------
DROP TABLE IF EXISTS `sale_price`;
CREATE TABLE `sale_price` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `price` double(20,6) unsigned DEFAULT '0.000000' COMMENT '销售单价',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `customer_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `material_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK524c9m1ao3emli8ixpgimuk3n` (`customer_id`),
  KEY `FKr57ehfj8dn7kal9wk7vuo0whq` (`material_id`),
  CONSTRAINT `FK524c9m1ao3emli8ixpgimuk3n` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKr57ehfj8dn7kal9wk7vuo0whq` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sale_price
-- ----------------------------
BEGIN;
INSERT INTO `sale_price` (`is_disabled`, `is_published`, `price`, `create_time`, `customer_id`, `id`, `material_id`, `update_time`) VALUES (0, 0, 29999.000000, 1762854146602, 1, 1, 1, 1762854146607);
COMMIT;

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` bigint(20) unsigned DEFAULT '0' COMMENT '父级ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '名称',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '仓库编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK5feqkpj7ajt76agx8mmj404qb` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of storage
-- ----------------------------
BEGIN;
INSERT INTO `storage` (`is_disabled`, `is_published`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `code`) VALUES (0, 0, 1762854146611, 1, 0, 1762854146611, '东部大仓', 'SRG0001');
INSERT INTO `storage` (`is_disabled`, `is_published`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `code`) VALUES (0, 0, 1762854146614, 2, 1, 1762854146614, '东部1仓', 'SRG0002');
INSERT INTO `storage` (`is_disabled`, `is_published`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `code`) VALUES (0, 0, 1762854146615, 3, 1, 1762854146615, '东部2仓', 'SRG0003');
INSERT INTO `storage` (`is_disabled`, `is_published`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `code`) VALUES (0, 0, 1762854146616, 4, 0, 1762854146616, '西部大仓', 'SRG0004');
INSERT INTO `storage` (`is_disabled`, `is_published`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `code`) VALUES (0, 0, 1762854146618, 5, 4, 1762854146618, '西部1仓', 'SRG0005');
INSERT INTO `storage` (`is_disabled`, `is_published`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `code`) VALUES (0, 0, 1762854146619, 6, 4, 1762854146619, '西部2仓', 'SRG0006');
COMMIT;

-- ----------------------------
-- Table structure for structure
-- ----------------------------
DROP TABLE IF EXISTS `structure`;
CREATE TABLE `structure` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `type` bigint(20) unsigned DEFAULT '1' COMMENT '生产单元类型',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` bigint(20) unsigned DEFAULT '0' COMMENT '父级ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '名称',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '生产单元编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1bpwbbouiq0njm3sx2cbuppey` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of structure
-- ----------------------------
BEGIN;
INSERT INTO `structure` (`is_disabled`, `is_published`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `code`) VALUES (0, 0, 1, 1762854146659, 1, 0, 1762854146659, '笔记本电脑产线', 'ST0001');
INSERT INTO `structure` (`is_disabled`, `is_published`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `code`) VALUES (0, 0, 1, 1762854146662, 2, 1, 1762854146662, '工位1', 'ST0002');
INSERT INTO `structure` (`is_disabled`, `is_published`, `type`, `create_time`, `id`, `parent_id`, `update_time`, `name`, `code`) VALUES (0, 0, 1, 1762854146665, 3, 1, 1762854146665, '工位2', 'ST0003');
COMMIT;

-- ----------------------------
-- Table structure for structure_operation_list
-- ----------------------------
DROP TABLE IF EXISTS `structure_operation_list`;
CREATE TABLE `structure_operation_list` (
  `operation_list_id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  `structure_entity_id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  PRIMARY KEY (`operation_list_id`,`structure_entity_id`),
  KEY `FKccvms6vrn8otk3qg7f9h73trd` (`structure_entity_id`),
  CONSTRAINT `FKccvms6vrn8otk3qg7f9h73trd` FOREIGN KEY (`structure_entity_id`) REFERENCES `structure` (`id`),
  CONSTRAINT `FKryftbiwfvnkiwj4tlile3ytt4` FOREIGN KEY (`operation_list_id`) REFERENCES `operation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of structure_operation_list
-- ----------------------------
BEGIN;
INSERT INTO `structure_operation_list` (`operation_list_id`, `structure_entity_id`) VALUES (1, 2);
INSERT INTO `structure_operation_list` (`operation_list_id`, `structure_entity_id`) VALUES (2, 2);
INSERT INTO `structure_operation_list` (`operation_list_id`, `structure_entity_id`) VALUES (3, 2);
INSERT INTO `structure_operation_list` (`operation_list_id`, `structure_entity_id`) VALUES (1, 3);
INSERT INTO `structure_operation_list` (`operation_list_id`, `structure_entity_id`) VALUES (2, 3);
INSERT INTO `structure_operation_list` (`operation_list_id`, `structure_entity_id`) VALUES (3, 3);
COMMIT;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '供应商编码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '供应商名称',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '联系电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKu0lh6hby20ok7au7646wrewl` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of supplier
-- ----------------------------
BEGIN;
INSERT INTO `supplier` (`is_disabled`, `is_published`, `create_time`, `id`, `update_time`, `code`, `name`, `phone`) VALUES (0, 0, 1762854146601, 1, 1762854146601, 'SUP20250001', 'Apple中国', '17666666666');
COMMIT;

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '单位编码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '单位名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKcsaj16dw8fhmuj2q7n9qagq35` (`code`),
  UNIQUE KEY `UKaa58c9de9eu0v585le47w25my` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of unit
-- ----------------------------
BEGIN;
INSERT INTO `unit` (`is_disabled`, `is_published`, `create_time`, `id`, `update_time`, `code`, `name`) VALUES (0, 0, 1762854146581, 1, 1762854146581, 'UT0001', '台');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `gender` tinyint(3) unsigned DEFAULT '0' COMMENT '性别',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '邮箱',
  `id_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '身份证号',
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号',
  `real_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '真实姓名',
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码盐',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK589idila9li6a4arw1t8ht1gx` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`gender`, `is_disabled`, `is_published`, `create_time`, `id`, `update_time`, `avatar`, `email`, `id_card`, `nickname`, `password`, `phone`, `real_name`, `salt`) VALUES (0, 0, 0, 1762854145733, 1, 1762854145754, '', 'admin@hamm.cn', '', '凌小云', 'e73c259d3d28c759b6985bb792f91689ddbc28f6', '17666666666', '', 'mjfc');
INSERT INTO `user` (`gender`, `is_disabled`, `is_published`, `create_time`, `id`, `update_time`, `avatar`, `email`, `id_card`, `nickname`, `password`, `phone`, `real_name`, `salt`) VALUES (0, 0, 0, 1762854145756, 2, 1762854145761, '', 'admin@hamm.com', '', '张三', 'e73c259d3d28c759b6985bb792f91689ddbc28f6', '13888888888', '', 'mjfc');
COMMIT;

-- ----------------------------
-- Table structure for user_department
-- ----------------------------
DROP TABLE IF EXISTS `user_department`;
CREATE TABLE `user_department` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `department_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  PRIMARY KEY (`id`),
  KEY `FKh9wprwvoo5il7qqahjc7hgcax` (`department_id`),
  KEY `FK1alh47saqbwnimxd9o564o4vm` (`user_id`),
  CONSTRAINT `FK1alh47saqbwnimxd9o564o4vm` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKh9wprwvoo5il7qqahjc7hgcax` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_department
-- ----------------------------
BEGIN;
INSERT INTO `user_department` (`is_disabled`, `is_published`, `create_time`, `department_id`, `id`, `update_time`, `user_id`) VALUES (0, 0, 1762854145762, 1, 1, 1762854145785, 1);
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  PRIMARY KEY (`id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_third_login
-- ----------------------------
DROP TABLE IF EXISTS `user_third_login`;
CREATE TABLE `user_third_login` (
  `gender` tinyint(3) unsigned DEFAULT '0' COMMENT '性别',
  `is_disabled` tinyint(3) unsigned DEFAULT '0' COMMENT '是否禁用',
  `is_published` tinyint(3) unsigned DEFAULT '0' COMMENT '是否已发布',
  `platform` tinyint(3) unsigned DEFAULT '0' COMMENT '所属平台',
  `create_time` bigint(20) unsigned DEFAULT '0' COMMENT '创建时间',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `update_time` bigint(20) unsigned DEFAULT '0' COMMENT '修改时间',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT 'ID',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `nick_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `third_user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'userId',
  PRIMARY KEY (`id`),
  KEY `FKg8pnsbdscmxvafckqhn1bgsgv` (`user_id`),
  CONSTRAINT `FKg8pnsbdscmxvafckqhn1bgsgv` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_third_login
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
