/*
 Navicat MySQL Data Transfer

 Source Server         : www.52clover.cn
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : www.52clover.cn:3306
 Source Schema         : clover

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 23/08/2020 03:51:18
*/

CREATE DATABASE IF NOT EXISTS clover default charset utf8 COLLATE utf8_general_ci;

use clover;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for interface
-- ----------------------------
DROP TABLE IF EXISTS `interface`;
CREATE TABLE `interface` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `team` varchar(64) DEFAULT NULL COMMENT '团队',
  `project` varchar(256) DEFAULT NULL COMMENT '项目',
  `name` varchar(64) DEFAULT NULL COMMENT '用例名称',
  `method` varchar(64) DEFAULT NULL COMMENT '请求方法',
  `host` varchar(64) DEFAULT NULL COMMENT '测试域名',
  `path` varchar(64) DEFAULT NULL COMMENT '请求路径',
  `header` json DEFAULT NULL COMMENT 'http请求头',
  `params` json DEFAULT NULL COMMENT 'http请求参数',
  `verify` json DEFAULT NULL COMMENT '响应断言',
  `extract` json DEFAULT NULL COMMENT '提取响应参数',
  `enable` int DEFAULT NULL COMMENT '0有效，1无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  `body` json DEFAULT NULL COMMENT 'http请求体',
  `sub_type` varchar(64) DEFAULT NULL COMMENT '[suite|interface]',
  `type` varchar(64) DEFAULT NULL COMMENT '套件类型',
  `status` tinyint DEFAULT '1',
  `timeout` int DEFAULT '120',
  `retry` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ix_interface_name` (`name`),
  KEY `ix_interface_project` (`project`),
  KEY `ix_interface_team` (`team`),
  KEY `ix_interface_sub_type` (`sub_type`),
  KEY `ix_interface_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Table structure for keyword
-- ----------------------------
DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) DEFAULT NULL COMMENT '关键字名称',
  `description` varchar(256) DEFAULT NULL COMMENT '关键字功能描述',
  `keyword` text COMMENT '关键字代码',
  `classify` varchar(32) DEFAULT NULL COMMENT '关键字类型',
  `enable` int DEFAULT NULL COMMENT '0有效，1无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `ix_keyword_classify` (`classify`),
  KEY `ix_keyword_description` (`description`),
  KEY `ix_keyword_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `team` varchar(64) DEFAULT NULL COMMENT '团队',
  `project` varchar(256) DEFAULT NULL COMMENT '项目',
  `name` varchar(64) DEFAULT NULL COMMENT '套件名称',
  `type` varchar(64) DEFAULT NULL COMMENT '报告类型[interface|automation]',
  `interface` json DEFAULT NULL COMMENT '测试接口个数',
  `start` datetime DEFAULT NULL COMMENT '测试开始时间',
  `end` datetime DEFAULT NULL COMMENT '测试结束时间',
  `duration` float DEFAULT NULL COMMENT '测试持续时间',
  `platform` json DEFAULT NULL COMMENT 'clover，python和平台信息',
  `detail` json DEFAULT NULL COMMENT '用例执行细节信息',
  `log` json DEFAULT NULL COMMENT '用例执行日志信息',
  `enable` int DEFAULT NULL COMMENT '0有效，1无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `ix_report_name` (`name`),
  KEY `ix_report_project` (`project`),
  KEY `ix_report_team` (`team`),
  KEY `ix_report_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Table structure for suite
-- ----------------------------
DROP TABLE IF EXISTS `suite`;
CREATE TABLE `suite` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `team` varchar(64) DEFAULT NULL COMMENT '团队',
  `project` varchar(256) DEFAULT NULL COMMENT '项目',
  `type` varchar(64) DEFAULT NULL COMMENT '套件类型',
  `cases` json DEFAULT NULL COMMENT '测试用例列表',
  `enable` int DEFAULT NULL COMMENT '0有效，1无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  `name` varchar(64) DEFAULT NULL COMMENT '套件名称',
  `sub_type` varchar(64) DEFAULT NULL COMMENT '[suite|interface]',
  `status` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ix_suite_project` (`project`),
  KEY `ix_suite_team` (`team`),
  KEY `ix_suite_type` (`type`),
  KEY `ix_suite_name` (`name`),
  KEY `ix_suite_sub_type` (`sub_type`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `team` varchar(64) DEFAULT NULL COMMENT '团队',
  `project` varchar(256) DEFAULT NULL COMMENT '项目',
  `name` varchar(64) DEFAULT NULL COMMENT '任务名称',
  `cron` varchar(64) DEFAULT NULL COMMENT '表达式',
  `variable` json DEFAULT NULL COMMENT '触发变量',
  `enable` int DEFAULT NULL COMMENT '0有效，1无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `ix_task_cron` (`cron`),
  KEY `ix_task_name` (`name`),
  KEY `ix_task_project` (`project`),
  KEY `ix_task_team` (`team`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `team` varchar(64) DEFAULT NULL COMMENT '团队',
  `project` varchar(256) DEFAULT NULL COMMENT '项目',
  `owner` varchar(64) DEFAULT NULL COMMENT '负责人',
  `enable` int DEFAULT NULL COMMENT '0有效，1无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `ix_team_owner` (`owner`),
  KEY `ix_team_project` (`project`),
  KEY `ix_team_team` (`team`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- ----------------------------
-- Table structure for variable
-- ----------------------------
DROP TABLE IF EXISTS `variable`;
CREATE TABLE `variable` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `team` varchar(64) DEFAULT NULL COMMENT '团队',
  `project` varchar(256) DEFAULT NULL COMMENT '项目',
  `owner` varchar(64) DEFAULT NULL COMMENT '负责人',
  `name` varchar(64) DEFAULT NULL COMMENT '变量名',
  `value` varchar(64) DEFAULT NULL COMMENT '变量值',
  `enable` int DEFAULT NULL COMMENT '0有效，1无效',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `ix_variable_name` (`name`),
  KEY `ix_variable_owner` (`owner`),
  KEY `ix_variable_project` (`project`),
  KEY `ix_variable_team` (`team`),
  KEY `ix_variable_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
