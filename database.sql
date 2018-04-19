/*
 Navicat Premium Data Transfer

 Source Server         : SONG
 Source Server Type    : MySQL
 Source Server Version : 50639
 Source Host           : localhost:3306
 Source Schema         : minions

 Target Server Type    : MySQL
 Target Server Version : 50639
 File Encoding         : 65001

 Date: 19/04/2018 17:09:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `userId` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  KEY `user_index` (`userId`),
  CONSTRAINT `user_index` FOREIGN KEY (`userId`) REFERENCES `users` (`index`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of records
-- ----------------------------
BEGIN;
INSERT INTO `records` VALUES (1, '1', '111');
INSERT INTO `records` VALUES (1, '1', '111');
INSERT INTO `records` VALUES (2, 'hello', '2018-4-19');
INSERT INTO `records` VALUES (0, ' fff', ' 2018-4-18 ');
INSERT INTO `records` VALUES (0, ' ssss', ' 2018-4-18 ');
INSERT INTO `records` VALUES (0, ' I am login', ' 2018-4-18 ');
INSERT INTO `records` VALUES (1, ' Hi, everyone, this is yahui talking!', ' 2018-4-18 ');
INSERT INTO `records` VALUES (0, ' this is song', ' 2018-4-18 ');
INSERT INTO `records` VALUES (1, ' this is yahui', ' 2018-4-18 ');
INSERT INTO `records` VALUES (0, ' this is song', ' 2018-4-18 ');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `index` int(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isLogin` int(255) DEFAULT '0',
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (0, 'song', '123', 0);
INSERT INTO `users` VALUES (1, 'yahui', '456', 0);
INSERT INTO `users` VALUES (2, 'syh', '789', 0);
INSERT INTO `users` VALUES (3, ' jj', ' jj', 0);
INSERT INTO `users` VALUES (4, ' gg', ' gg', 0);
INSERT INTO `users` VALUES (5, ' Faisal', ' 12', 0);
INSERT INTO `users` VALUES (6, ' new', ' new', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
