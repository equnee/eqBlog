/*
Navicat MySQL Data Transfer

Source Server         : hello
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : eqblog

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2020-03-28 12:38:15
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
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('8', '大半夜了 我好困喔', '呜呜呜', 'e', '2019-6-7 2:28:02', null, '1', '1', 'upload/jaekyungjeong_.jpg');
INSERT INTO `articles` VALUES ('67', 'test3', ' 写就完事了其&nbsp;', 'equne', '2019-6-12 3:08:41', '2019-6-12 3:51:50', '1', '1', 'upload/p.jpg');
INSERT INTO `articles` VALUES ('68', 'testServlet', '企鹅', 'equne', '2019-6-12 9:49:29', '', '1', '1', 'upload/6.jpg');
INSERT INTO `articles` VALUES ('69', 'test333', '今天天气不错！', 'equne22', '2019-6-15 13:37:58', '', '1', '1', 'upload/CAADBAAD1AIAAlI5kwa2iZGFQuX_EgI.png');
INSERT INTO `articles` VALUES ('70', '日记1', '水蜜桃', 'equne', '2019-6-15 13:39:59', '', '1', '1', 'upload/fuck.jpg');
INSERT INTO `articles` VALUES ('71', '日记233333333', '水蜜桃', 'e', '2019-6-15 13:55:59', '', '2', '1', 'upload/fuck.jpg');
INSERT INTO `articles` VALUES ('72', '1234', '1234', 'equne', '2019-6-15 14:14:56', '', '1', '1', 'upload/6.jpg');

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
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', '1', '1', null);
INSERT INTO `comment` VALUES ('181', '53', 'equne', '点赞！', '2019-6-7 22:56:12', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('182', '8', 'equne', '我也是', '2019-6-10 19:03:52', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('183', '57', 'equne', 'nice', '2019-6-11 13:38:43', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('184', '8', 'e', '我同意', '2019-6-12 0:33:53', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('185', '8', 'e', '我同意', '2019-6-12 0:34:14', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('186', '61', 'equne', '我也想要', '2019-6-12 1:11:03', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('187', '63', 'e', '你好', '2019-6-12 1:28:21', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('188', '67', 'equne', '123', '2019-6-12 9:51:52', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('189', '68', 'equne', '太好看了吧！！', '2019-6-13 10:33:04', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('190', '68', 'Azhou', '想拥有', '2019-6-13 10:34:06', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('191', '69', 'equne22', '真的很不错~', '2019-6-15 13:38:15', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('192', '70', 'equne', '可爱', '2019-6-15 13:40:29', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('193', '70', 'equne', '可爱', '2019-6-15 13:40:31', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('194', '67', 'equne', '321', '2019-6-15 13:41:30', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('195', '71', 'e', '可爱', '2019-6-15 13:56:52', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('196', '71', 'e', '超可爱', '2019-6-15 13:57:42', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('197', '72', 'equne', '好看', '2019-6-15 14:15:19', '0:0:0:0:0:0:0:1');
INSERT INTO `comment` VALUES ('198', '67', 'testtest', '添加评论', '2020-3-27 17:20:48', '0:0:0:0:0:0:0:1');

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

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '', 'e', 'Blog admin', '123', '1', '1', 'image/1.png', '1', '1', '', null, null, null);
INSERT INTO `users` VALUES ('43', 'peach1@qq.com', 'equne', '我是蜜桃1号11', 'Qqq123', '2019-6-12 1:09:48', '2019-6-12 1:09:48', 'upload/6.jpg', '0:0:0:0:0:0:0:1', null, null, null, '游蜜桃', '2019-06-20');
INSERT INTO `users` VALUES ('44', '123456@qq.com', 'peach', '我是蜜桃2号', 'Qqq123', '2019-6-12 2:18:49', '2019-6-12 2:18:49', 'upload/', '0:0:0:0:0:0:0:1', null, null, null, '游蜜桃二', null);
INSERT INTO `users` VALUES ('45', '12345@qq.com', 'peach1', null, 'Qqq123', '2019-6-12 2:20:13', '2019-6-12 2:20:13', 'image/1.png', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `users` VALUES ('46', '1234555@qq.com', 'equne111', null, '123QQQq', '2019-6-12 2:55:31', '2019-6-12 2:55:31', '', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `users` VALUES ('47', '12223456@qq.com', 'Peaches22', null, 'Qqq123', '2019-6-12 3:02:55', '2019-6-12 3:02:55', 'image/1.png', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `users` VALUES ('50', '123456345@qq.com', 'equne22', '233', 'Qqq123', '2019-6-15 13:35:56', '2019-6-15 13:35:56', 'upload/fuck.jpg', '0:0:0:0:0:0:0:1', null, null, null, '蜜桃', '2019-02-06');
INSERT INTO `users` VALUES ('51', '31074457212@qq.com', 'equneqq', null, 'Qqq123', '2019-6-15 14:01:16', '2019-6-15 14:01:16', 'image/1.png', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `users` VALUES ('52', 'equne2@qq.com', 'equne1', null, 'Qqq111', '2019-10-19 20:54:24', '2019-10-19 20:54:24', 'image/1.png', '0:0:0:0:0:0:0:1', null, null, null, null, null);
INSERT INTO `users` VALUES ('53', 'test@test.com', 'testtest', null, 'Qqq123', '2020-3-27 17:19:50', '2020-3-27 17:19:50', 'image/1.png', '0:0:0:0:0:0:0:1', null, null, null, null, null);
