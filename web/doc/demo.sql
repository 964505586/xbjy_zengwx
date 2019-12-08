/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 08/12/2019 18:07:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(255) NULL DEFAULT NULL COMMENT '创建人',
  `del_flag` int(2) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '研发部', '2019-10-22 09:41:25', 1, NULL);
INSERT INTO `sys_dept` VALUES (2, '推广部', '2019-10-24 09:41:28', 1, NULL);
INSERT INTO `sys_dept` VALUES (3, '行政部', '2019-10-04 09:41:33', 1, NULL);
INSERT INTO `sys_dept` VALUES (4, '财务部', '2019-10-17 09:41:38', 1, NULL);
INSERT INTO `sys_dept` VALUES (5, '总裁办公室', '2019-10-17 09:41:42', 1, NULL);
INSERT INTO `sys_dept` VALUES (6, '秘书部', '2019-10-09 09:41:46', 1, NULL);
INSERT INTO `sys_dept` VALUES (7, '外交部', '2019-10-22 09:58:11', 2, NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `p_id` int(11) NULL DEFAULT NULL,
  `type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1一级，2二级',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `order_by` int(2) NULL DEFAULT NULL COMMENT '排序',
  `creat_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `del_flag` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否删除1是，0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, -1, '1', '系统管理', NULL, 1, '2019-11-29 11:49:00', 1, '0');
INSERT INTO `sys_menu` VALUES (2, -1, '1', '订单管理', NULL, 2, '2019-11-29 11:49:25', 1, '0');
INSERT INTO `sys_menu` VALUES (3, 1, '2', '部门管理', '/sys/dept/list', 1, '2019-11-29 11:49:57', 1, '0');
INSERT INTO `sys_menu` VALUES (4, 1, '2', '用户管理', '/sys/user/list', 2, '2019-11-29 11:50:23', 1, '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `age` int(3) NULL DEFAULT NULL,
  `sex` int(2) NULL DEFAULT NULL COMMENT '性别：1男，0女',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `birth_date` date NULL DEFAULT NULL COMMENT '出生日期',
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_by` int(11) NULL DEFAULT NULL,
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '是否删除1是，0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', '1275ee31148c5450ff6f5561396cb593cb1c2c1a', '马云123', 55, 1, 'xxx@qq.com', '2019-10-24', '2019-12-03 23:01:40', 1, NULL);
INSERT INTO `sys_user` VALUES (2, 1, 'admin2', '1275ee31148c5450ff6f5561396cb593cb1c2c1a', '马云1', 231, 0, NULL, '2019-10-20', '2019-12-03 23:01:40', 1, NULL);
INSERT INTO `sys_user` VALUES (3, 2, 'admin3', '123', '马云2', 23, 0, NULL, '2019-10-16', '2019-12-03 23:01:40', 1, NULL);
INSERT INTO `sys_user` VALUES (4, 3, 'admin4', '1', '马云4', 1, 0, NULL, '2019-10-19', '2019-12-03 23:01:40', 1, NULL);
INSERT INTO `sys_user` VALUES (5, 4, 'admin5', '1', '1', 1, 0, NULL, '2019-10-19', '2019-12-03 23:01:40', 1, NULL);
INSERT INTO `sys_user` VALUES (6, 2, 'admin6', 'ea612c47979198e0b6808282771f2095', '1', 1, 1, NULL, '2019-10-18', '2019-12-03 23:01:40', 1, NULL);
INSERT INTO `sys_user` VALUES (7, 5, 'admin7', '123', '董明珠', 60, 0, NULL, '2019-10-15', '2019-12-03 23:01:40', 1, NULL);
INSERT INTO `sys_user` VALUES (10, 2, 'hello', '8054c59b9a60d356a3e634ea20c976096691b05f', '马', 23, 0, '122@qq.com', '2019-10-11', '2019-12-03 23:01:40', 1, 0);
INSERT INTO `sys_user` VALUES (11, NULL, 'dsasa', 'e56301840768cde69c9b9e7a3c63cbd2', 'sd', 12, 1, '12', '2019-12-13', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (12, NULL, 'zxcvb', '567eeb54d5bb0e5976ee62b525c00536', '65', 89, 1, '645', '2019-12-12', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (13, NULL, 'admin', '62c4cbb2617b200d0889a181c1a2dcd9', 'asdasf', 12, 1, '24332', '2019-12-20', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (14, NULL, 'sadsa', '5b32d96a40f48d2d1bb8e4085e3673df', 'sadas', 21, 1, 'safdaf', '2019-12-13', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (15, NULL, 'sadff', '11b6f1039e9f2cac608a32bcf2399736', 'gfsdfasf', 34, 1, 'asdasd', '2019-12-21', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (16, NULL, 'vdfdsds', 'a7c3a082ff643c92d80b76a48e595b79', 'asd', 64, 1, 'sadasd', '2019-12-28', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (17, NULL, 'sdasdsad', '7523ea1febf004a5b020938b2b0e5a06', 'asfdasfdas', 23, 1, '2342344', '2019-12-09', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (18, NULL, 'dsad', NULL, 'sadsad', 67, 0, 'asdasd', '1997-10-19', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (19, NULL, 'dsad', NULL, 'sadsad', 67, 0, 'asdasd', '1997-10-19', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (20, NULL, 'dsad', NULL, 'sadsad', 67, 0, 'asdasd', '1997-10-19', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (21, NULL, 'sadsadasd', NULL, 'sadasdas', 78, 0, 'dsadasdas', '1997-10-19', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (22, NULL, 'sadsadasd', NULL, 'sadasdas', 78, 0, 'dsadasdas', '1997-10-19', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (23, NULL, 'sadsadasd', NULL, 'sadasdas', 78, 0, 'dsadasdas', '1997-10-19', '2019-12-03 23:01:40', NULL, 0);
INSERT INTO `sys_user` VALUES (24, NULL, 'user', 'a07893c1e6413694386372b42703394c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
