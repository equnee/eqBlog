/*
Navicat MySQL Data Transfer

Source Server         : hello
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : eqblog

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2020-03-28 12:22:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `a_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `u_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `a_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `a_updatetime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `t_id` int(11) DEFAULT NULL,
  `a_visible` tinyint(4) DEFAULT NULL,
  `a_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` int(11) NOT NULL,
  `c_usr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `c_com` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `c_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `u_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `u_introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `u_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `u_regtime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `u_lastlogtime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `u_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `u_logip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `q_id` int(11) DEFAULT NULL,
  `

u_answer` varchar(255) DEFAULT NULL,
  `u_count` varchar(255) DEFAULT NULL,
  `u_realname` varchar(255) DEFAULT NULL,
  `u_birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
