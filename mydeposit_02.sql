/*
Navicat MySQL Data Transfer

Source Server         : mytest
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : mydeposit_02

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-11-17 15:58:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `income`
-- ----------------------------
DROP TABLE IF EXISTS `income`;
CREATE TABLE `income` (
  `in_id` varchar(255) NOT NULL,
  `in_content` varchar(255) DEFAULT NULL COMMENT '收入来源',
  `in_amount` double DEFAULT NULL COMMENT '收入金额',
  `in_time` datetime DEFAULT NULL,
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of income
-- ----------------------------
INSERT INTO `income` VALUES ('05580bc3-8ab7-404c-adb5-91c8fd3e6801', '卖书', '75', '2019-11-01 17:19:35');
INSERT INTO `income` VALUES ('18ddd2dc-4779-4d2b-9d69-68e04e3f56a1', '红包', '111', '2019-11-07 13:07:41');
INSERT INTO `income` VALUES ('4b666491-d8af-4893-9361-da8019ab8908', '红包', '88', '2019-11-01 17:19:55');
INSERT INTO `income` VALUES ('77824560-01d8-4b2c-b004-f332e066b5ee', '红包', '111', '2019-11-07 13:07:40');
INSERT INTO `income` VALUES ('8001b8cf-550e-4bc1-9b0d-83f2e738fac3', '微信红包', '123', '2019-11-01 17:22:03');
INSERT INTO `income` VALUES ('a8620710-bd95-4ccb-a20d-d32a629292c7', '奖学金', '1200', '2019-11-01 17:23:02');
INSERT INTO `income` VALUES ('af63ee25-9616-4f02-bf12-77b42e58b237', '卖废品', '800', '2019-10-28 12:05:26');
INSERT INTO `income` VALUES ('b44ffa1e-257a-451a-bd16-0402e92564ae', '工资', '1000', '2019-11-01 17:22:19');
INSERT INTO `income` VALUES ('dbaae601-07ed-46b0-ab33-2fce5d590d59', '支付宝红包', '789', '2019-11-01 17:22:12');
INSERT INTO `income` VALUES ('f80989ba-9be4-4a08-a6e3-1696087a41c5', '生活费', '1', '2019-11-01 17:23:34');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123');
INSERT INTO `user` VALUES ('13', 'zhang', 'chao123');
INSERT INTO `user` VALUES ('14', 'chao', 'chao123');
