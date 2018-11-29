/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : 127.0.0.1
 Source Database       : testdb

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : utf-8

 Date: 11/29/2018 12:12:02 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `ssd_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ssd_admin`;
CREATE TABLE `ssd_admin` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名称(登录帐号)',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(50) DEFAULT '' COMMENT '用户昵称',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别1-男2-女',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册ip',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录ip',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态 1-正常 2-禁用',
  `link_qq` char(11) NOT NULL DEFAULT '' COMMENT '联系qq',
  `link_phone` char(13) DEFAULT '' COMMENT '联系电话',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `ssd_admin`
-- ----------------------------
BEGIN;
INSERT INTO `ssd_admin` VALUES ('1', 'admin', '3d117ea32dc33da46c02cdb1bb90e972', '超级管理员', '1', '66', '2130706433', '1417662038', '2130706433', '1432653626', '1', '598550105', '18883878516', '1491814629');
COMMIT;

-- ----------------------------
--  Table structure for `ssd_admin_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `ssd_admin_auth_extend`;
CREATE TABLE `ssd_admin_auth_extend` (
  `group_id` int(10) unsigned NOT NULL COMMENT '用户组id',
  `extend_id` int(10) unsigned NOT NULL COMMENT '扩展表中的id',
  `type` tinyint(1) NOT NULL COMMENT '1-文章分类id',
  UNIQUE KEY `uid` (`group_id`,`extend_id`,`type`),
  KEY `uid_2` (`group_id`),
  KEY `extend_id` (`extend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `ssd_admin_auth_extend`
-- ----------------------------
BEGIN;
INSERT INTO `ssd_admin_auth_extend` VALUES ('1', '1', '1'), ('1', '2', '1'), ('1', '3', '1'), ('2', '1', '1'), ('2', '2', '1'), ('2', '3', '1'), ('2', '4', '1'), ('2', '5', '1'), ('2', '6', '1'), ('2', '7', '1'), ('2', '8', '1'), ('2', '9', '1'), ('2', '10', '1'), ('2', '11', '1'), ('2', '12', '1'), ('2', '13', '1'), ('2', '14', '1'), ('2', '15', '1'), ('2', '16', '1'), ('2', '17', '1'), ('2', '18', '1'), ('2', '19', '1'), ('2', '20', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ssd_admin_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `ssd_admin_auth_group`;
CREATE TABLE `ssd_admin_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '组名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '管理员标识组类型',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '组名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `default_url` varchar(255) NOT NULL DEFAULT '' COMMENT '默认url',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-正常 1-禁用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `rules` text COMMENT '规则id,逗号隔开',
  PRIMARY KEY (`id`),
  UNIQUE KEY `module` (`model`,`title`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `ssd_admin_auth_group`
-- ----------------------------
BEGIN;
INSERT INTO `ssd_admin_auth_group` VALUES ('1', '', '1', '系统管理员', '负责对系统的调度', '/index/index', '0', '0', ''), ('2', '', '1', '普通管理员', '普通管理员', '/user/index', '0', '0', ''), ('3', 'admin', '1', '高级运营', '负责对系统的调度', '/index/index', '0', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `ssd_admin_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `ssd_admin_auth_group_access`;
CREATE TABLE `ssd_admin_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` int(10) unsigned DEFAULT NULL COMMENT '组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
--  Records of `ssd_admin_auth_group_access`
-- ----------------------------
BEGIN;
INSERT INTO `ssd_admin_auth_group_access` VALUES ('1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ssd_admin_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `ssd_admin_auth_rule`;
CREATE TABLE `ssd_admin_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限认证规则id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `module` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限状态 是否有效(0:无效,1:有效)-1删除',
  `type` tinyint(1) unsigned NOT NULL COMMENT '1-url 2-主菜单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `ssd_admin_auth_rule`
-- ----------------------------
BEGIN;
INSERT INTO `ssd_admin_auth_rule` VALUES ('1', '首页', 'admin', 'Admin/index/index', '1', '2'), ('2', '系统', 'admin', 'Admin/system/index', '1', '2'), ('3', '系统设置', 'admin', 'Admin/system/group', '1', '1'), ('4', '菜单管理', 'admin', 'Admin/menu/index', '1', '1'), ('5', '新增', 'admin', 'Admin/menu/add', '1', '1'), ('6', '删除', 'admin', 'Admin/menu/del', '1', '1'), ('7', '编辑', 'admin', 'Admin/menu/edit', '1', '1'), ('8', '用户管理', 'admin', 'Admin/user/group', '1', '1'), ('9', '用户信息', 'admin', 'Admin/user/index', '1', '1'), ('10', '权限管理', 'admin', 'Admin/authmanage/index', '1', '1'), ('11', '创建', 'admin', 'Admin/user/add', '1', '1'), ('12', '删除', 'admin', 'Admin/user/del', '1', '1'), ('13', '启用禁用', 'admin', 'Admin/User/change_status', '1', '1'), ('14', '成员授权', 'admin', 'Admin/authmanage/user', '1', '1'), ('15', '访问授权', 'admin', 'Admin/authmanage/access', '1', '1'), ('16', '新增', 'admin', 'Admin/authmanage/add', '1', '1'), ('17', '编辑', 'admin', 'Admin/authmanage/edit', '1', '1'), ('18', '删除', 'admin', 'Admin/authmanage/del', '1', '1'), ('19', '状态', 'admin', 'Admin/authmanage/change_status', '1', '1'), ('20', '写入权限', 'admin', 'Admin/authmanage/writerule', '1', '1'), ('21', '添加成员', 'admin', 'Admin/authmanage/addtogroup', '1', '1'), ('22', '解除授权', 'admin', 'Admin/authmanage/removeFromGroup', '1', '1'), ('23', '分类管理', 'admin', 'Admin/category/index', '1', '1'), ('24', '新增分类', 'admin', 'Admin/Category/add', '1', '1'), ('25', '保存', 'admin', 'Admin/Category/save', '1', '1'), ('26', '编辑', 'admin', 'Admin/Category/edit', '1', '1'), ('27', '删除', 'admin', 'Admin/Category/del', '1', '1'), ('28', '网站内容', 'admin', 'Admin/sitecontent/index', '1', '2'), ('29', '分类授权', 'admin', 'Admin/Authmanage/category', '1', '1'), ('30', '回收站', 'admin', 'Admin/Recycle/index', '1', '1'), ('31', '网站配置', 'admin', 'Admin/Config/index', '1', '1'), ('32', '添加配置', 'admin', 'Admin/config/add', '1', '1'), ('33', '修改配置', 'admin', 'Admin/config/edit', '1', '1'), ('34', '效果管理', 'admin', 'Admin/sitecontent/effect_group', '1', '1'), ('35', '首页幻灯片', 'admin', 'Admin/slide/index', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `ssd_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ssd_admin_menu`;
CREATE TABLE `ssd_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `pid` int(11) unsigned NOT NULL COMMENT '上级菜单id leave0=顶级菜单 level1=分组菜单 level2=菜单url level3=方法名称',
  `sort` int(9) NOT NULL DEFAULT '0' COMMENT '排序 值越小越靠前 sort asc',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `descript` varchar(255) NOT NULL DEFAULT '' COMMENT '描述 对该菜单的简要描述',
  `icon_class` varchar(50) NOT NULL DEFAULT '' COMMENT 'icon样式',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '显示状态 1-正常 2-禁用',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除，0-未删除，1-已删除',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `title` (`url`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `ssd_admin_menu`
-- ----------------------------
BEGIN;
INSERT INTO `ssd_admin_menu` VALUES ('1', '首页', '0', '0', 'index/index', '', 'home', '1', '0', '1488120738', '1542257911'), ('3', '管理用户', '33', '1', 'admin/admin_list', '', 'am-icon-user', '1', '0', '1488120738', '1542257911'), ('4', '菜单管理', '33', '0', 'admin/menu', '', 'am-icon-list', '1', '0', '1488120738', '1542257911'), ('5', '添加', '4', '1', 'admin/menu_add', '后台菜单添加', '', '1', '0', '1488120738', '1542257911'), ('6', '编辑', '4', '0', 'admin/menu_edit', '后台菜单编辑功能', '', '1', '0', '1488120738', '1542257911'), ('7', '添加新用户', '3', '0', 'admin/admin_add', '添加后台用户', '', '1', '0', '1488120738', '1542257911'), ('8', '编辑', '3', '1', 'admin/admin_edit', '后台用户修改', '', '1', '0', '1488122258', '1542257911'), ('33', '后台管理', '0', '4', '', '后台用户管理', 'user-secret', '1', '0', '1490151103', '1542257911'), ('34', '权限组管理', '33', '2', 'auth_group/list', '后台权限组管理', 'am-icon-list', '1', '0', '1490151191', '1542257911'), ('35', '添加权限组', '34', '0', 'auth_group/add', '添加权限组', '', '1', '0', '1490162921', '1542257911'), ('36', '修改权限组', '34', '1', 'auth_group/edit', '修改权限组', '', '1', '0', '1490162932', '1542257911'), ('37', '授权访问', '34', '2', 'auth_group/access', '授权访问', '', '1', '0', '1490169724', '1542257911'), ('38', '用户授权', '34', '3', 'auth_group/user_access', '权限组设置用户', '', '1', '0', '1490259780', '1542257911'), ('39', '解除用户授权', '34', '4', 'auth_group/user_access_del', '解除用户授权', '', '1', '0', '1490265733', '1542257911'), ('40', '添加用户授权', '34', '5', 'auth_group/user_access_add', '添加用户授权', '', '1', '0', '1490265764', '1542257911');
COMMIT;

-- ----------------------------
--  Table structure for `ssd_config`
-- ----------------------------
DROP TABLE IF EXISTS `ssd_config`;
CREATE TABLE `ssd_config` (
  `key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '数组key',
  `value` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置值',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '使用状态，1-正常，0-禁用',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

SET FOREIGN_KEY_CHECKS = 1;
