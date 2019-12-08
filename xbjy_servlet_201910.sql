/*
 Navicat Premium Data Transfer

 Source Server         : mater
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : xbjy_servlet_201910

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 05/12/2019 15:32:33
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '研发部', '2019-10-22 09:41:25', 1, 0);
INSERT INTO `sys_dept` VALUES (2, '推广部', '2019-10-24 09:41:28', 1, 0);
INSERT INTO `sys_dept` VALUES (3, '行政部', '2019-10-04 09:41:33', 1, 0);
INSERT INTO `sys_dept` VALUES (4, '财务部', '2019-10-17 09:41:38', 1, 0);
INSERT INTO `sys_dept` VALUES (5, '总裁办', '2019-10-17 09:41:42', 1, 0);
INSERT INTO `sys_dept` VALUES (6, '秘书部', '2019-10-09 09:41:46', 1, 0);
INSERT INTO `sys_dept` VALUES (7, '外交部', '2019-10-22 09:58:11', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, -1, '1', '系统管理', NULL, 1, '2019-11-29 11:49:00', 1, '0');
INSERT INTO `sys_menu` VALUES (2, -1, '1', '订单管理', NULL, 2, '2019-11-29 11:49:25', 1, '0');
INSERT INTO `sys_menu` VALUES (3, 1, '2', '部门管理', '/sys/dept/list', 1, '2019-11-29 11:49:57', 1, '0');
INSERT INTO `sys_menu` VALUES (4, 1, '2', '用户管理', '/sys/user/list', 2, '2019-11-29 11:50:23', 1, '0');
INSERT INTO `sys_menu` VALUES (5, 2, '2', '添加订单', NULL, 1, '2019-11-29 15:32:22', 1, '0');

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
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_by` int(11) NULL DEFAULT NULL,
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '是否删除1是，0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', '8c9c869a78d48696f280c3837ea606e2', '张三', 20, 1, '123@qq.com', '2019-12-04', '2019-12-04 14:56:04', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
