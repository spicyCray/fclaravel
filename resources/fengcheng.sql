/*
 Navicat Premium Data Transfer

 Source Server         : 风程测试服务器
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 211.149.226.139:3306
 Source Schema         : fengcheng

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 15/04/2020 22:13:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accredit
-- ----------------------------
DROP TABLE IF EXISTS `accredit`;
CREATE TABLE `accredit`  (
  `acId` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '授权用户id',
  `cid` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户id',
  `type` int(11) NOT NULL COMMENT '授权类型 0:所有客户资料, 1: 不要手机号资料',
  `juid` int(11) NOT NULL COMMENT '接受授权人',
  `createTime` int(11) NOT NULL COMMENT '第一次开始授权时间',
  PRIMARY KEY (`acId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accredit_config
-- ----------------------------
DROP TABLE IF EXISTS `accredit_config`;
CREATE TABLE `accredit_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accredit_uid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'im用户id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '行为规则',
  `log` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志规则',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统行为表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for action_log
-- ----------------------------
DROP TABLE IF EXISTS `action_log`;
CREATE TABLE `action_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '行为id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '触发行为的数据id',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行行为的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `action_ip_ix`(`action_ip`) USING BTREE,
  INDEX `action_id_ix`(`action_id`) USING BTREE,
  INDEX `user_id_ix`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行为日志表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for active
-- ----------------------------
DROP TABLE IF EXISTS `active`;
CREATE TABLE `active`  (
  `activeid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createTime` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`activeid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 329 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `place_id` int(11) NULL DEFAULT NULL COMMENT '广告位ID',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告名称',
  `cover_id` int(11) NULL DEFAULT NULL COMMENT '广告图片',
  `photolist` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '辅助图片',
  `url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告链接',
  `listurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅助链接',
  `background` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告背景',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '广告描述',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '广告位状态',
  `sort` int(11) NOT NULL COMMENT '排序',
  `count` int(11) NOT NULL COMMENT '点击次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ad_place
-- ----------------------------
DROP TABLE IF EXISTS `ad_place`;
CREATE TABLE `ad_place`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告位名称',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用名称',
  `show_type` int(11) NOT NULL DEFAULT 5 COMMENT '广告位类型',
  `show_num` int(11) NOT NULL DEFAULT 5 COMMENT '显示条数',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `template` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告位模板',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '广告位状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for addons
-- ----------------------------
DROP TABLE IF EXISTS `addons`;
CREATE TABLE `addons`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置',
  `author` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '作者',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '版本号',
  `isinstall` int(10) NULL DEFAULT 0 COMMENT '是否安装',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '安装时间',
  `has_adminlist` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有后台列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '插件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for address_list
-- ----------------------------
DROP TABLE IF EXISTS `address_list`;
CREATE TABLE `address_list`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `uid` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0,未添加,1已添加',
  `reg` int(11) NOT NULL COMMENT '是否注册0未注册 1 已注册',
  `updateTime` int(11) NOT NULL COMMENT '更新事件',
  `tab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `mobile`(`mobile`(255)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for address_list_update
-- ----------------------------
DROP TABLE IF EXISTS `address_list_update`;
CREATE TABLE `address_list_update`  (
  `uid` int(11) NOT NULL,
  `updateTime` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for approve
-- ----------------------------
DROP TABLE IF EXISTS `approve`;
CREATE TABLE `approve`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `duty` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `department` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门',
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL COMMENT '0,未认证，1已认证，2 解除认证',
  `approve` int(11) NOT NULL DEFAULT 0 COMMENT '0,未审核，已通过，未通过',
  `uid` int(11) NOT NULL COMMENT '认证用户id',
  `sellContent` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销售内容',
  `reason` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拒绝理由',
  `approveTime` int(11) NOT NULL,
  `createTime` int(11) NOT NULL COMMENT '提交认证时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主图',
  `theme` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动时间',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动地址',
  `quota` int(11) NOT NULL COMMENT '限额',
  `browse` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '浏览次数',
  `content` varchar(9999) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件显示名',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '资源ID',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联记录ID',
  `download` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下载次数',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '附件大小',
  `dir` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_record_status`(`record_id`, `status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attribute
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段注释',
  `length` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模型id',
  `is_must` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `validate_rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `validate_time` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `error_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `validate_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `auto_rule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `auto_time` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `auto_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `model_id`(`model_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `auth_extend`;
CREATE TABLE `auth_extend`  (
  `group_id` mediumint(10) UNSIGNED NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) UNSIGNED NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE INDEX `group_extend_type`(`group_id`, `extend_id`, `type`) USING BTREE,
  INDEX `uid`(`group_id`) USING BTREE,
  INDEX `group_id`(`extend_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组与分类的对应关系表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组类型',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) UNSIGNED NOT NULL COMMENT '用户组id',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1-url;2-主菜单',
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `group` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限节点分组',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `module`(`module`, `status`, `type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标志',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `list_row` tinyint(3) UNSIGNED NOT NULL DEFAULT 10 COMMENT '列表每页行数',
  `meta_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '外链',
  `allow_publish` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否允许发布内容',
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '可见性',
  `reply` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否允许回复',
  `check` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `extend` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展设置',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `icon` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类图标',
  `groups` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级频道ID',
  `title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '频道标题',
  `url` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '频道连接',
  `type` int(2) NOT NULL DEFAULT 0 COMMENT '导航类型',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '导航排序',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导航颜色',
  `band_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标识点颜色',
  `band_text` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标志点文字',
  `active` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '当前链接',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `target` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '新窗口打开',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系方式',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户名称',
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户公司',
  `duty` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户职务',
  `clientStatus` int(11) NOT NULL DEFAULT 1 COMMENT '客户状态',
  `clientGrade` int(11) NOT NULL DEFAULT 1 COMMENT '级别',
  `clientSource` int(11) NOT NULL DEFAULT 8 COMMENT '来源',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户地域',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `contact` int(11) NOT NULL COMMENT '初次接触时间',
  `qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  `uid` int(11) NOT NULL,
  `wx` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信',
  `follow` int(11) NOT NULL COMMENT '跟进次数',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `finallyFollowTime` int(11) NOT NULL COMMENT '最后填写跟进时间',
  `areaId` int(11) NOT NULL,
  `cityId` int(11) NOT NULL,
  `provinceId` int(11) NOT NULL,
  `tab` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `updateTime` int(11) NOT NULL COMMENT '最后更新时间',
  `tid` int(11) NOT NULL,
  `nextFollowTime` int(11) NOT NULL COMMENT '下次跟进时间',
  `del` int(11) NOT NULL COMMENT '是否删除 0， 1',
  `t` int(11) NOT NULL,
  `tuid` int(11) NOT NULL COMMENT '授权给我的id',
  `first_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custom` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `third_party_id` int(11) NOT NULL COMMENT '第三方id',
  `group_id` int(11) NOT NULL COMMENT '分组id',
  `group_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36428 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for client_company
-- ----------------------------
DROP TABLE IF EXISTS `client_company`;
CREATE TABLE `client_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司名称',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司地址',
  `industry` int(11) NOT NULL DEFAULT 1 COMMENT '职业',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司网址',
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公司图片',
  `cid` int(11) NOT NULL COMMENT '所属用户',
  `updateTime` int(11) NOT NULL DEFAULT 0 COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cid`(`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 403 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for client_config
-- ----------------------------
DROP TABLE IF EXISTS `client_config`;
CREATE TABLE `client_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for client_copy1
-- ----------------------------
DROP TABLE IF EXISTS `client_copy1`;
CREATE TABLE `client_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系方式',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户名称',
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户公司',
  `duty` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户职务',
  `clientStatus` int(11) NOT NULL DEFAULT 1 COMMENT '客户状态',
  `clientGrade` int(11) NOT NULL DEFAULT 1 COMMENT '级别',
  `clientSource` int(11) NOT NULL DEFAULT 8 COMMENT '来源',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户地域',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `contact` int(11) NOT NULL COMMENT '初次接触时间',
  `qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  `uid` int(11) NOT NULL,
  `wx` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信',
  `follow` int(11) NOT NULL COMMENT '跟进次数',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `finallyFollowTime` int(11) NOT NULL COMMENT '最后填写跟进时间',
  `areaId` int(11) NOT NULL,
  `cityId` int(11) NOT NULL,
  `provinceId` int(11) NOT NULL,
  `tab` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `updateTime` int(11) NOT NULL COMMENT '最后更新时间',
  `tid` int(11) NOT NULL,
  `nextFollowTime` int(11) NOT NULL COMMENT '下次跟进时间',
  `del` int(11) NOT NULL COMMENT '是否删除 0， 1',
  `t` int(11) NOT NULL,
  `tuid` int(11) NOT NULL COMMENT '授权给我的id',
  `first_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `custom` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `third_party_id` int(11) NOT NULL COMMENT '第三方id',
  `group_id` int(11) NOT NULL COMMENT '分组id',
  `group_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36428 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for client_group
-- ----------------------------
DROP TABLE IF EXISTS `client_group`;
CREATE TABLE `client_group`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `third_party_id` int(11) NOT NULL,
  `group_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `edit_time` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 125 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for client_mobile
-- ----------------------------
DROP TABLE IF EXISTS `client_mobile`;
CREATE TABLE `client_mobile`  (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` int(11) NOT NULL COMMENT '客户id',
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1517 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for client_relation
-- ----------------------------
DROP TABLE IF EXISTS `client_relation`;
CREATE TABLE `client_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2' COMMENT '性别',
  `age` int(11) NOT NULL COMMENT '年龄',
  `hobby` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '爱好',
  `character` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '性格',
  `birthday` int(11) NOT NULL COMMENT '生日',
  `help` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '急需帮助',
  `cid` int(11) NOT NULL COMMENT '所属用户',
  `updateTime` int(11) NOT NULL DEFAULT 0 COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cid`(`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 266 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for code
-- ----------------------------
DROP TABLE IF EXISTS `code`;
CREATE TABLE `code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `createTime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'text' COMMENT '配置类型',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置分组',
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置说明',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '小图标',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置值',
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `group`(`group`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(11) NOT NULL COMMENT '0.男,1女',
  `wx` int(11) NOT NULL COMMENT '0,未添加,1已添加',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `importTime` int(11) NOT NULL COMMENT '导入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `pid` int(11) NOT NULL,
  `createTime` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `image` int(11) NOT NULL COMMENT '图片id',
  `updateTime` int(11) NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contract_model
-- ----------------------------
DROP TABLE IF EXISTS `contract_model`;
CREATE TABLE `contract_model`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `createTime` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `updateTime` int(11) NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_form
-- ----------------------------
DROP TABLE IF EXISTS `custom_form`;
CREATE TABLE `custom_form`  (
  `cu_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` int(11) NOT NULL COMMENT '客户id',
  `uid` int(11) NOT NULL,
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `third_party_id` int(11) NOT NULL COMMENT '第三方id',
  PRIMARY KEY (`cu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 547 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for demand
-- ----------------------------
DROP TABLE IF EXISTS `demand`;
CREATE TABLE `demand`  (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `pid` int(11) NOT NULL,
  `createTime` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `image` int(11) NOT NULL COMMENT '图片id',
  `updateTime` int(11) NOT NULL,
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for demand_model
-- ----------------------------
DROP TABLE IF EXISTS `demand_model`;
CREATE TABLE `demand_model`  (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `createTime` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `updateTime` int(11) NOT NULL,
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for deploy
-- ----------------------------
DROP TABLE IF EXISTS `deploy`;
CREATE TABLE `deploy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `api` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL COMMENT '0默认选择, 1未选择, 2选中',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for district
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `level` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `upid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 45052 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '中国省市区乡镇数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doc
-- ----------------------------
DROP TABLE IF EXISTS `doc`;
CREATE TABLE `doc`  (
  `docid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`docid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 238 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `name` int(40) NULL DEFAULT NULL COMMENT '同一根节点下标识不重复',
  `title` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档标题',
  `category_id` int(10) UNSIGNED NOT NULL COMMENT '所属分类',
  `description` char(140) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `model_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '内容模型ID',
  `position` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '多个推荐则将其推荐值相加',
  `link_id` int(10) NULL DEFAULT 0 COMMENT '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换',
  `cover_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '封面',
  `display` int(3) NULL DEFAULT 1 COMMENT '是否可见',
  `deadline` int(10) NULL DEFAULT 0 COMMENT '活动结束时间',
  `attach` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '附件数量',
  `view` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览量',
  `comment` int(10) NULL DEFAULT 0 COMMENT '评论数',
  `extend` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '扩展统计字段',
  `level` int(10) NULL DEFAULT 0 COMMENT '越高排序越靠前',
  `is_top` int(2) NOT NULL DEFAULT 0 COMMENT '是否置顶',
  `create_time` int(10) NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '数据状态',
  `start_time` int(10) NOT NULL COMMENT '活动开始时间',
  `look_back` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动回顾',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_status`(`category_id`, `status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for document_article
-- ----------------------------
DROP TABLE IF EXISTS `document_article`;
CREATE TABLE `document_article`  (
  `doc_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tags` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动地址',
  `quota` int(11) NOT NULL COMMENT '参加活动限制人数',
  `join_num` int(11) NOT NULL,
  `tickets` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '请选择对应门票格式(190-220对应外场,内场)',
  `point_lng` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地图经度',
  `point_lat` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地图纬度',
  `tissue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动组织机构内容',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动介绍内容',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动详细介绍',
  `guest` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动嘉宾信息',
  `flow` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动流程 格式要求(时间|流程)',
  PRIMARY KEY (`doc_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for document_photo
-- ----------------------------
DROP TABLE IF EXISTS `document_photo`;
CREATE TABLE `document_photo`  (
  `doc_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `photo_list` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`doc_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for egress_bill
-- ----------------------------
DROP TABLE IF EXISTS `egress_bill`;
CREATE TABLE `egress_bill`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(10, 2) NOT NULL COMMENT '金额',
  `billType` int(11) NOT NULL COMMENT '消费类型',
  `consumeTime` int(11) NOT NULL COMMENT '消费时间',
  `project` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属项目',
  `explain` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消费说明',
  `uid` int(11) NOT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '票据,图片',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈标题',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈内容',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈建议图片',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈人',
  `status` int(11) NOT NULL,
  `platform` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` int(11) NOT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feedback_reply
-- ----------------------------
DROP TABLE IF EXISTS `feedback_reply`;
CREATE TABLE `feedback_reply`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL,
  `reply` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复内容',
  `createTime` int(11) NOT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件保存位置',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flock
-- ----------------------------
DROP TABLE IF EXISTS `flock`;
CREATE TABLE `flock`  (
  `flock_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '群名称',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`flock_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flock_member
-- ----------------------------
DROP TABLE IF EXISTS `flock_member`;
CREATE TABLE `flock_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `flock_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '群id',
  `create_time` int(11) NOT NULL COMMENT '加入群时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跟进内容',
  `followMode` int(11) NOT NULL COMMENT '跟进方式',
  `clientStatus` int(11) NOT NULL COMMENT '客户状态',
  `nextFollow` int(11) NOT NULL COMMENT '下次跟进时间',
  `uid` int(11) NOT NULL COMMENT '跟进人',
  `createTime` int(11) NOT NULL COMMENT '跟进时间',
  `cid` int(11) NOT NULL,
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timerId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推送id',
  `updateTime` int(11) NOT NULL,
  `third_party_id` int(11) NOT NULL COMMENT '第三方id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1190 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend`  (
  `friend_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '发起添加人',
  `uid_remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `buid` int(11) NOT NULL COMMENT '接受人',
  `buid_remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `create_time` int(11) NOT NULL COMMENT '成为好友时间',
  PRIMARY KEY (`friend_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for friend_apply
-- ----------------------------
DROP TABLE IF EXISTS `friend_apply`;
CREATE TABLE `friend_apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `buid` int(11) NOT NULL,
  `msg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验证信息',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0未读,1已同意,2拒绝',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for get_repetition
-- ----------------------------
DROP TABLE IF EXISTS `get_repetition`;
CREATE TABLE `get_repetition`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL COMMENT '吐槽id',
  `uid` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '是否掉落.  0:未掉落, 1: 已掉落',
  `taskId` int(11) NOT NULL,
  `createTime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for get_serve
-- ----------------------------
DROP TABLE IF EXISTS `get_serve`;
CREATE TABLE `get_serve`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serveId` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `fid` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买好友的用户id',
  `createTime` int(11) NOT NULL,
  `endTime` int(11) NOT NULL COMMENT '服务到期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for get_task
-- ----------------------------
DROP TABLE IF EXISTS `get_task`;
CREATE TABLE `get_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `createTime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for help
-- ----------------------------
DROP TABLE IF EXISTS `help`;
CREATE TABLE `help`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL COMMENT '帮助类型',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hooks
-- ----------------------------
DROP TABLE IF EXISTS `hooks`;
CREATE TABLE `hooks`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `addons` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 \'，\'分割',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for im_user
-- ----------------------------
DROP TABLE IF EXISTS `im_user`;
CREATE TABLE `im_user`  (
  `imId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `updateTime` int(11) NOT NULL COMMENT '更新时间',
  `uid` int(11) NOT NULL COMMENT '绑定风程用户id',
  PRIMARY KEY (`imId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for invite
-- ----------------------------
DROP TABLE IF EXISTS `invite`;
CREATE TABLE `invite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inviteId` int(11) NOT NULL,
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL COMMENT '0,邀请存入数据,1,已经注册成功,2,被邀请人消费后获取红包',
  `createTime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for invite_task
-- ----------------------------
DROP TABLE IF EXISTS `invite_task`;
CREATE TABLE `invite_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邀请任务标题',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邀请任务内容',
  `inviteMoney` int(11) NOT NULL COMMENT '邀请人获得金钱',
  `inviteBeMoney` int(11) NOT NULL COMMENT '被邀请人获得金钱',
  `photo` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邀请图片',
  `maxMoney` int(11) NOT NULL COMMENT '最大能获取的值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for invite_user
-- ----------------------------
DROP TABLE IF EXISTS `invite_user`;
CREATE TABLE `invite_user`  (
  `iu_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `doc_id` int(11) NOT NULL COMMENT '文章id ',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`iu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '标识ID',
  `ftype` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:友情链接 1:合作单位',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `cover_id` int(11) NOT NULL DEFAULT 0 COMMENT '封面图片ID',
  `descrip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `hits` tinyint(7) NOT NULL DEFAULT 0 COMMENT '点击率',
  `update_time` int(10) NOT NULL DEFAULT 0 COMMENT '更新时间',
  `uid` int(7) NOT NULL DEFAULT 0 COMMENT '用户ID ',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `nickname` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NOT NULL COMMENT '生日',
  `qq` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT 0 COMMENT '用户积分',
  `signature` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户签名',
  `pos_province` int(11) NULL DEFAULT 0 COMMENT '用户所在省份',
  `pos_city` int(11) NULL DEFAULT 0 COMMENT '用户所在城市',
  `pos_district` int(11) NULL DEFAULT 0 COMMENT '用户所在县城',
  `pos_community` int(11) NULL DEFAULT 0 COMMENT '用户所在区域',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐值',
  `login` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '注册IP',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT 0 COMMENT '最后登录IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '会员状态',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_extend
-- ----------------------------
DROP TABLE IF EXISTS `member_extend`;
CREATE TABLE `member_extend`  (
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `education` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for member_extend_group
-- ----------------------------
DROP TABLE IF EXISTS `member_extend_group`;
CREATE TABLE `member_extend_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组数据表',
  `profile_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '扩展分组名称',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `visiable` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否可见，1可见，0不可见',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '字段状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_extend_setting
-- ----------------------------
DROP TABLE IF EXISTS `member_extend_setting`;
CREATE TABLE `member_extend_setting`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段注释',
  `length` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `is_must` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '菜单类别（admin后台，user会员中心）',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类图标',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `url` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  `tip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '继承的模型',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模型图标',
  `relation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `is_user_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否会员中心显示',
  `need_pk` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '新建表时是否需要主键字段',
  `field_sort` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表单字段排序',
  `field_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `field_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '字段列表',
  `attribute_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `list_grid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '列表定义',
  `list_row` smallint(2) UNSIGNED NOT NULL DEFAULT 10 COMMENT '列表数据长度',
  `search_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `template_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表显示模板',
  `template_add` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编辑模板',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `engine_type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文档模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notepad
-- ----------------------------
DROP TABLE IF EXISTS `notepad`;
CREATE TABLE `notepad`  (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` varchar(2500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `uid` int(11) NOT NULL,
  `updateTime` int(11) NOT NULL COMMENT '修改时间',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`jid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notepad_color
-- ----------------------------
DROP TABLE IF EXISTS `notepad_color`;
CREATE TABLE `notepad_color`  (
  `colorId` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  PRIMARY KEY (`colorId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务标题',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务内容',
  `money` decimal(10, 2) NOT NULL COMMENT '支付金额',
  `status` int(11) NOT NULL COMMENT '订单状态0默认(待支付),1已经支付,2,已领取',
  `data` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买订单额外信息',
  `uid` int(11) NOT NULL COMMENT '支付用户',
  `integral` int(11) NOT NULL COMMENT '抵扣红包',
  `serveId` int(11) NOT NULL COMMENT '支付服务id',
  `serveTime` int(11) NOT NULL COMMENT '购买时间',
  `createTime` int(11) NOT NULL COMMENT '订单创建时间',
  `payType` int(11) NOT NULL COMMENT '1,支付宝  2: 微信',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 384 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `cover_id` int(11) NULL DEFAULT 0,
  `create_time` int(11) NULL DEFAULT NULL COMMENT '项目创建时间',
  `update_time` int(11) NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目地址',
  `money` decimal(11, 0) NULL DEFAULT 0 COMMENT '投资金额单位 :  万',
  `type` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目类型',
  `collect` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目收藏人数',
  `view` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览量',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '项目简介',
  `stage` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目类型',
  `domain` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目领域',
  `synopsis` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目一句话介绍',
  `images` int(64) NULL DEFAULT NULL COMMENT '项目图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单页' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `size` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大小',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13638 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `partyA` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '甲方',
  `partyB` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '乙方',
  `image` int(11) NOT NULL COMMENT '图片id',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `uid` int(11) NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称钱两位',
  `company` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for public_relations_info
-- ----------------------------
DROP TABLE IF EXISTS `public_relations_info`;
CREATE TABLE `public_relations_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for push_remind
-- ----------------------------
DROP TABLE IF EXISTS `push_remind`;
CREATE TABLE `push_remind`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1,去设置,2取消',
  `createTime` int(11) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records`  (
  `recordsId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户名称',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(11) NOT NULL COMMENT '通话时长',
  `dial_time` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `createTime` int(11) NOT NULL COMMENT '通话时长',
  PRIMARY KEY (`recordsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 2,
  `agency_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`pid`) USING BTREE,
  INDEX `region_type`(`type`) USING BTREE,
  INDEX `agency_id`(`agency_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2763 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for repetition
-- ----------------------------
DROP TABLE IF EXISTS `repetition`;
CREATE TABLE `repetition`  (
  `repeatId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '重复提醒内容',
  `startTime` int(11) NOT NULL COMMENT '开始时间',
  `typeId` int(11) NOT NULL COMMENT '重复周期',
  `uid` int(11) NOT NULL,
  `top` int(11) NOT NULL COMMENT '是否置顶',
  `updateTime` int(11) NOT NULL,
  `createTime` int(11) NOT NULL,
  `timerId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`repeatId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for repetition_task
-- ----------------------------
DROP TABLE IF EXISTS `repetition_task`;
CREATE TABLE `repetition_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `award` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reply_follow
-- ----------------------------
DROP TABLE IF EXISTS `reply_follow`;
CREATE TABLE `reply_follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `uid` int(11) NOT NULL COMMENT '回复人id',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gid` int(11) NOT NULL COMMENT '跟进id',
  `createTime` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for returned_money
-- ----------------------------
DROP TABLE IF EXISTS `returned_money`;
CREATE TABLE `returned_money`  (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `money` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '金额',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '回款类型1）银行转账 2）支付宝 3）微信 4）现金 5）支票 6）其他',
  `hTime` int(11) NOT NULL COMMENT '回款时间',
  `project` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `evidence` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '凭据',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`hid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rewrite
-- ----------------------------
DROP TABLE IF EXISTS `rewrite`;
CREATE TABLE `rewrite`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '伪静态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日程标题',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日程内容',
  `cid` int(11) NOT NULL COMMENT '客户id',
  `companyName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `startTime` int(11) NOT NULL COMMENT '开始时间',
  `endTime` int(11) NOT NULL,
  `remind` int(11) NOT NULL DEFAULT 1 COMMENT '提醒方式',
  `repetition` int(11) NOT NULL DEFAULT 1 COMMENT '重复方式',
  `status` int(11) NOT NULL COMMENT '是否完成,(0,1)',
  `uid` int(11) NOT NULL COMMENT '创建日程用户',
  `createTime` int(11) NOT NULL COMMENT '日程创建时间',
  `typeId` int(11) NOT NULL COMMENT '日程类型',
  `cName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` int(11) NOT NULL COMMENT '客户生日时间',
  `timerId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '重复定时任务id',
  `follow_id` int(11) NOT NULL COMMENT '跟进id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 290 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scheme
-- ----------------------------
DROP TABLE IF EXISTS `scheme`;
CREATE TABLE `scheme`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `pid` int(11) NOT NULL,
  `createTime` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `image` int(11) NOT NULL COMMENT '图片id',
  `updateTime` int(11) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scheme_model
-- ----------------------------
DROP TABLE IF EXISTS `scheme_model`;
CREATE TABLE `scheme_model`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `createTime` int(11) NOT NULL,
  `updateTime` int(11) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for seo_rule
-- ----------------------------
DROP TABLE IF EXISTS `seo_rule`;
CREATE TABLE `seo_rule`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则标题',
  `app` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `controller` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `action` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态',
  `seo_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO标题',
  `seo_keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO关键词',
  `seo_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SEO描述',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serve
-- ----------------------------
DROP TABLE IF EXISTS `serve`;
CREATE TABLE `serve`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `money` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',
  `createTime` int(11) NOT NULL COMMENT '功能上线时间',
  `freeTime` int(11) NOT NULL COMMENT '免费时间',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for smss_invite
-- ----------------------------
DROP TABLE IF EXISTS `smss_invite`;
CREATE TABLE `smss_invite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invite_uid` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` int(11) NOT NULL COMMENT '邀请时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sync_login
-- ----------------------------
DROP TABLE IF EXISTS `sync_login`;
CREATE TABLE `sync_login`  (
  `uid` int(11) NOT NULL,
  `openid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `access_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `refresh_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_message
-- ----------------------------
DROP TABLE IF EXISTS `system_message`;
CREATE TABLE `system_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送人',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送内容',
  `type` int(11) NOT NULL COMMENT '0,发送所有用户,1发送个人',
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户id',
  `createTime` int(11) NOT NULL COMMENT '发送时间',
  `url` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `award` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transfer
-- ----------------------------
DROP TABLE IF EXISTS `transfer`;
CREATE TABLE `transfer`  (
  `trId` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '移交用户id',
  `cid` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户id',
  `type` int(11) NOT NULL COMMENT '授权类型 0:所有客户资料, 1: 不要手机号资料',
  `juid` int(11) NOT NULL COMMENT '接受移交',
  `createTime` int(11) NOT NULL COMMENT '第一次开始授权时间',
  PRIMARY KEY (`trId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for unfinished_schedule
-- ----------------------------
DROP TABLE IF EXISTS `unfinished_schedule`;
CREATE TABLE `unfinished_schedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日程标题',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日程内容',
  `cid` int(11) NOT NULL COMMENT '客户id',
  `companyName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `startTime` int(11) NOT NULL COMMENT '开始时间',
  `endTime` int(11) NOT NULL,
  `remind` int(11) NOT NULL DEFAULT 1 COMMENT '提醒方式',
  `repetition` int(11) NOT NULL DEFAULT 1 COMMENT '重复方式',
  `status` int(11) NOT NULL COMMENT '是否完成,(0,1)',
  `uid` int(11) NOT NULL COMMENT '创建日程用户',
  `createTime` int(11) NOT NULL COMMENT '日程创建时间',
  `typeId` int(11) NOT NULL COMMENT '日程类型',
  `cName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` int(11) NOT NULL,
  `scheduleId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定时任务id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for update
-- ----------------------------
DROP TABLE IF EXISTS `update`;
CREATE TABLE `update`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'pingtai',
  `type` int(11) NOT NULL COMMENT '是否强制更新0,不强制,1强制',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for use_statistics
-- ----------------------------
DROP TABLE IF EXISTS `use_statistics`;
CREATE TABLE `use_statistics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `controller` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问控制器',
  `createTime` int(11) NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 257127 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加密参数',
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'QQ',
  `wx` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `lastTime` int(11) NOT NULL COMMENT '最后登录时间',
  `lastLoginIp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录ip',
  `verify` int(11) NOT NULL DEFAULT 0 COMMENT '是否开启好友验证1开启,默认0',
  `integral` int(11) NOT NULL COMMENT '用户积分,红包',
  `teamId` int(11) NOT NULL COMMENT '所在团队id',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '用户状态',
  `clientId` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户短标识,用于推送',
  `approve` int(11) NOT NULL COMMENT '用户认证(0,1)',
  `serve` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '对应served的所有服务信息',
  `createTime` int(11) NOT NULL COMMENT '注册时间',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `birthday` int(11) NOT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(11) NOT NULL DEFAULT 2 COMMENT '0,男，1女，2未设置',
  `account` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `clientNum` int(11) NOT NULL,
  `scheduleNum` int(11) NOT NULL,
  `followNum` int(11) NOT NULL,
  `wxStatus` int(11) NOT NULL,
  `platform` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `access_token` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `allowance` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `allowance_updated_at` int(11) NOT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  `auth_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password_hash` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data_update_time` int(11) NOT NULL COMMENT '数据最后同步时间',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
