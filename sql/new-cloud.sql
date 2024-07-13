/*
 Navicat Premium Data Transfer

 Source Server         : mysql3307
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3307
 Source Schema         : ry-cloud

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 23/05/2024 16:43:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (5, 'sys_goods_gl', '商品管理', NULL, NULL, 'SysGoodsGl', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'gl', '商品管理', 'liuhao', '0', '/', '{}', 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18', NULL);
INSERT INTO `gen_table` VALUES (9, 'sys_car', '购物车', NULL, NULL, 'SysCar', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'car', '购物车', 'liuhao', '0', '/', '{\"parentMenuId\":2042}', 'admin', '2024-02-28 12:29:25', '', '2024-02-28 12:31:36', NULL);
INSERT INTO `gen_table` VALUES (10, 'sys_order', '支付宝订单', NULL, NULL, 'SysOrder', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'order', '交易订单', 'liuhao', '0', '/', '{\"parentMenuId\":\"2042\"}', 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24', NULL);
INSERT INTO `gen_table` VALUES (12, 'sys_room_info', '房间表', NULL, NULL, 'SysRoomInfo', 'crud', '', 'com.ruoyi.system', 'system', 'info', '房间', 'ruoyi', '0', '/', NULL, 'admin', '2024-03-01 10:14:56', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (14, 'sys_eva', '商品评价表', NULL, NULL, 'SysEva', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'eva', '菜品评价', 'liuhao', '0', '/', '{\"parentMenuId\":\"2073\"}', 'admin', '2024-03-01 14:07:49', '', '2024-03-01 14:46:29', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (9, 5, 'Goods_id', '商品id', 'int', 'Long', 'goodsId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (10, 5, 'Goods_name', '商品名', 'varchar(50)', 'String', 'goodsName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (11, 5, 'Goods_price', '商品价格', 'double(10,2)', 'Double', 'goodsPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (12, 5, 'Goods_status', '商品状态', 'varchar(50)', 'String', 'goodsStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'goods_status', 4, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (13, 5, 'Goods_pj', '商品评价', 'varchar(255)', 'String', 'goodsPj', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (14, 5, 'Goods_likes', '商品喜欢度', 'int', 'Long', 'goodsLikes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (15, 5, 'Goods_img', '商品图片', 'varchar(255)', 'String', 'goodsImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 7, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (41, 9, 'id', '购物车Id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-02-28 12:29:25', '', '2024-02-28 12:31:36');
INSERT INTO `gen_table_column` VALUES (42, 9, 'car_name', '购物车商品名', 'varchar(255)', 'String', 'carName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-02-28 12:29:25', '', '2024-02-28 12:31:36');
INSERT INTO `gen_table_column` VALUES (43, 9, 'car_quantity', '购物车商品数量', 'varchar(255)', 'String', 'carQuantity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-02-28 12:29:25', '', '2024-02-28 12:31:36');
INSERT INTO `gen_table_column` VALUES (44, 9, 'car_prices', '购物车商品价格', 'double(10,2)', 'BigDecimal', 'carPrices', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-02-28 12:29:25', '', '2024-02-28 12:31:36');
INSERT INTO `gen_table_column` VALUES (45, 9, 'car_username', '购物车主姓名', 'varchar(255)', 'String', 'carUsername', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-02-28 12:29:25', '', '2024-02-28 12:31:36');
INSERT INTO `gen_table_column` VALUES (46, 10, 'id', NULL, 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (47, 10, 'user_name', '购买人', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (48, 10, 'name', '订单名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (49, 10, 'order_id', '订单id', 'varchar(255)', 'String', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (50, 10, 'alipay_no', '支付宝订单号', 'varchar(255)', 'String', 'alipayNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (51, 10, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (52, 10, 'pay_time', '更新时间', 'datetime', 'Date', 'payTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (53, 10, 'goods_id', '商品id', 'int', 'Long', 'goodsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (54, 10, 'total', '总价格', 'double(10,2)', 'BigDecimal', 'total', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (55, 10, 'state', '状态', 'varchar(255)', 'String', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_order2_state', 10, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (56, 10, 'location', '配送地址', 'varchar(255)', 'String', 'location', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (57, 10, 'get_date', '配送日期', 'datetime', 'Date', 'getDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (66, 12, 'room_id', '主键', 'int', 'Long', 'roomId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, 12, 'room_name', '房间名称', 'varchar(255)', 'String', 'roomName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, 12, 'room_info', '房间信息', 'varchar(255)', 'String', 'roomInfo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, 12, 'room_prices', '房间价格', 'double(10,2)', 'BigDecimal', 'roomPrices', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, 12, 'room_status', '房间状态', 'varchar(255)', 'String', 'roomStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, 12, 'room_img', '房间图片', 'varchar(255)', 'String', 'roomImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, 12, 'room_date1', '房间开始时间', 'datetime', 'Date', 'roomDate1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, 12, 'room_date2', '房间到期时间', 'datetime', 'Date', 'roomDate2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, 12, 'room_usename', '房间订购者', 'varchar(255)', 'String', 'roomUsename', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 9, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, 14, 'eva_id', '评价ID', 'int', 'Long', 'evaId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-01 14:07:49', '', '2024-03-01 14:46:29');
INSERT INTO `gen_table_column` VALUES (82, 14, 'eva_username', '评价者', 'varchar(255)', 'String', 'evaUsername', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-03-01 14:07:49', '', '2024-03-01 14:46:29');
INSERT INTO `gen_table_column` VALUES (83, 14, 'eva_goodsname', '被评价商品', 'varchar(255)', 'String', 'evaGoodsname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-03-01 14:07:49', '', '2024-03-01 14:46:29');
INSERT INTO `gen_table_column` VALUES (84, 14, 'eva_contents', '评价内容', 'text', 'String', 'evaContents', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2024-03-01 14:07:49', '', '2024-03-01 14:46:29');
INSERT INTO `gen_table_column` VALUES (85, 14, 'eva_userimg', '评价头像', 'varchar(255)', 'String', 'evaUserimg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'fileUpload', '', 5, 'admin', '2024-03-01 14:07:49', '', '2024-03-01 14:46:29');
INSERT INTO `gen_table_column` VALUES (86, 14, 'eva_create', '评价日期', 'date', 'Date', 'evaCreate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-03-01 14:07:50', '', '2024-03-01 14:46:29');

-- ----------------------------
-- Table structure for sys_car
-- ----------------------------
DROP TABLE IF EXISTS `sys_car`;
CREATE TABLE `sys_car`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '购物车Id',
  `car_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '购物车商品名',
  `car_quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '购物车商品数量',
  `car_prices` double(10, 2) NULL DEFAULT NULL COMMENT '购物车商品价格',
  `car_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '购物车主姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_car
-- ----------------------------

-- ----------------------------
-- Table structure for sys_car_copy1
-- ----------------------------
DROP TABLE IF EXISTS `sys_car_copy1`;
CREATE TABLE `sys_car_copy1`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '购物车Id',
  `car_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '购物车商品名',
  `car_quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '购物车商品数量',
  `car_prices` double(10, 2) NULL DEFAULT NULL COMMENT '购物车商品价格',
  `car_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '购物车主姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_car_copy1
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-02-24 21:23:52', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-02-24 21:23:52', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-02-24 21:23:52', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-02-24 21:23:52', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-02-24 21:23:52', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '惠誉酒店', 0, '老板', '15888888888', 'huiyv@qq.com', '0', '0', 'admin', '2024-02-24 21:23:52', 'admin', '2024-02-25 10:38:02');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '天津店', 1, '老板', '15888888888', 'huiyv@qq.com', '0', '0', 'admin', '2024-02-24 21:23:52', 'admin', '2024-02-25 10:40:52');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '总管部门', 1, '老板', '15888888888', 'huiyv@qq.com', '0', '0', 'admin', '2024-02-24 21:23:52', 'admin', '2024-02-25 10:41:15');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '营销部门', 3, '员工', '15888888888', 'yg@qq.com', '0', '0', 'admin', '2024-02-24 21:23:52', 'admin', '2024-02-25 10:41:36');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '未上架', '0', 'goods_status', NULL, 'warning', 'N', '0', 'admin', '2024-02-25 08:49:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '已上架', '1', 'goods_status', NULL, 'success', 'N', '0', 'admin', '2024-02-25 08:49:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 2, '已下架', '2', 'goods_status', NULL, 'danger', 'N', '0', 'admin', '2024-02-25 08:50:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '未上架', '0', 'sys_room_status', NULL, 'warning', 'N', '0', 'admin', '2024-02-25 16:31:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '已上架', '1', 'sys_room_status', NULL, 'success', 'N', '0', 'admin', '2024-02-25 16:31:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 2, '已下架', '2', 'sys_room_status', NULL, 'danger', 'N', '0', 'admin', '2024-02-25 16:32:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 4, '已预约', '3', 'sys_room_status', NULL, 'primary', 'N', '0', 'admin', '2024-02-25 16:32:27', 'admin', '2024-02-25 16:32:34', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 5, '空闲', '4', 'sys_room_status', NULL, 'info', 'N', '0', 'admin', '2024-02-25 16:33:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '6人房', '6人房', 'sys_room_info', NULL, 'default', 'N', '0', 'admin', '2024-02-26 11:43:21', 'admin', '2024-02-26 12:04:32', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '5人房', '5人房', 'sys_room_info', NULL, 'default', 'N', '0', 'admin', '2024-02-26 11:43:50', 'admin', '2024-02-26 12:04:37', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '大桌', '大桌', 'sys_room_info', NULL, 'default', 'N', '0', 'admin', '2024-02-26 11:44:24', 'admin', '2024-02-26 12:04:40', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '小桌', '小桌', 'sys_room_info', NULL, 'default', 'N', '0', 'admin', '2024-02-26 11:44:34', 'admin', '2024-02-26 12:04:43', NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, '未支付', '0', 'sys_order_statu', NULL, 'danger', 'N', '0', 'admin', '2024-02-26 21:10:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, '已支付', '1', 'sys_order_statu', NULL, 'success', 'N', '0', 'admin', '2024-02-26 21:10:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 1, '已支付', 'TRADE_SUCCESS', 'sys_order2_state', NULL, 'success', 'N', '0', 'admin', '2024-02-28 11:21:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 1, '已退款', '1', 'sys_order2_state', NULL, 'danger', 'N', '0', 'admin', '2024-02-28 11:21:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 2, '未支付', '2', 'sys_order2_state', NULL, 'primary', 'N', '0', 'admin', '2024-02-28 11:22:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 3, '已配送', '3', 'sys_order2_state', NULL, 'success', 'N', '0', 'admin', '2024-02-29 14:44:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 0, '已取消', '4', 'sys_order2_state', NULL, 'warning', 'N', '0', 'admin', '2024-02-29 14:44:49', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '商品状态', 'goods_status', '0', 'admin', '2024-02-25 08:48:39', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '房间状态', 'sys_room_status', '0', 'admin', '2024-02-25 16:30:33', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '房间信息标签', 'sys_room_info', '0', 'admin', '2024-02-26 11:15:37', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '订单信息', 'sys_order_statu', '0', 'admin', '2024-02-26 21:09:45', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '支付订单状态', 'sys_order2_state', '0', 'admin', '2024-02-28 11:20:59', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_eva
-- ----------------------------
DROP TABLE IF EXISTS `sys_eva`;
CREATE TABLE `sys_eva`  (
  `eva_id` int NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `eva_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评价者',
  `eva_goodsname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '被评价商品',
  `eva_contents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评价内容',
  `eva_userimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评价头像',
  `eva_create` date NULL DEFAULT NULL COMMENT '评价日期',
  PRIMARY KEY (`eva_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_eva
-- ----------------------------
INSERT INTO `sys_eva` VALUES (3, 'admin', '餐饮1套餐', '好吃的！', NULL, '2024-03-01');
INSERT INTO `sys_eva` VALUES (4, 'admin', '餐饮1套餐', '我觉得可以第二次吃了', NULL, '2024-03-01');
INSERT INTO `sys_eva` VALUES (5, 'admin', '餐饮2套餐', '不好吃', NULL, '2024-03-01');
INSERT INTO `sys_eva` VALUES (6, 'admin', '餐饮1套餐', '可以的', NULL, '2024-03-01');
INSERT INTO `sys_eva` VALUES (7, 'guke5', '餐饮1套餐', '不好吃', NULL, '2024-03-18');
INSERT INTO `sys_eva` VALUES (10, 'guke', '餐饮1套餐', '美味可口', NULL, '2024-05-14');
INSERT INTO `sys_eva` VALUES (11, 'guke6', '餐饮1套餐', '好吃', NULL, '2024-05-16');
INSERT INTO `sys_eva` VALUES (12, 'qw1', '餐饮3套餐', '好吃', NULL, '2024-05-23');

-- ----------------------------
-- Table structure for sys_goods_gl
-- ----------------------------
DROP TABLE IF EXISTS `sys_goods_gl`;
CREATE TABLE `sys_goods_gl`  (
  `Goods_id` int NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `Goods_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名',
  `Goods_price` double(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `Goods_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '商品状态',
  `Goods_pj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品评价',
  `Goods_likes` int NULL DEFAULT 0 COMMENT '商品喜欢度',
  `Goods_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`Goods_id`, `Goods_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_goods_gl
-- ----------------------------
INSERT INTO `sys_goods_gl` VALUES (1, '餐饮1套餐', 50.00, '1', '此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。', 20, 'http://127.0.0.1:9300/statics/2024/04/13/s3_20240413002849A001.jpg');
INSERT INTO `sys_goods_gl` VALUES (3, '餐饮3套餐', 3.00, '1', '此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。', 6, 'http://127.0.0.1:9300/statics/2024/03/04/shiwu1_20240304172837A004.jpg');
INSERT INTO `sys_goods_gl` VALUES (4, '餐饮4套餐', 5.20, '2', '此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。', 0, 'http://127.0.0.1:9300/statics/2024/03/04/shiwu2_20240304172842A005.jpg');
INSERT INTO `sys_goods_gl` VALUES (5, '餐饮5套餐', 5.50, '1', '此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。', 0, 'http://127.0.0.1:9300/statics/2024/03/04/QJ8241778073_20240304172848A006.jpg');
INSERT INTO `sys_goods_gl` VALUES (6, '餐饮6套餐', 6.60, '2', '此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。', 0, 'http://127.0.0.1:9300/statics/2024/03/04/201307241514163757_20240304172854A007.jpg');
INSERT INTO `sys_goods_gl` VALUES (8, '餐饮8套餐', 50.00, '2', NULL, 0, 'http://127.0.0.1:9300/statics/2024/03/04/shiwu1_20240304172858A008.jpg');
INSERT INTO `sys_goods_gl` VALUES (9, '餐饮10', 2.00, '0', NULL, 0, 'http://127.0.0.1:9300/statics/2024/03/18/shiwu1_20240318155704A002.jpg');
INSERT INTO `sys_goods_gl` VALUES (10, '餐饮9套餐', 150.00, '2', NULL, 0, 'http://127.0.0.1:9300/statics/2024/05/14/s3_20240514201204A001.jpg');
INSERT INTO `sys_goods_gl` VALUES (11, '商品99', 2.00, '1', NULL, 0, 'http://127.0.0.1:9300/statics/2024/05/23/201307241514163757_20240523163801A002.jpg');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-02-24 21:23:52', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`access_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 303 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2024-02-24 21:32:56');
INSERT INTO `sys_logininfor` VALUES (101, '', '127.0.0.1', '0', '退出成功', '2024-02-24 22:05:22');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '0', '登录成功', '2024-02-24 22:05:27');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '0', '登录成功', '2024-02-25 08:27:17');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '0', '退出成功', '2024-02-25 10:54:30');
INSERT INTO `sys_logininfor` VALUES (105, 'guke', '127.0.0.1', '0', '登录成功', '2024-02-25 10:54:39');
INSERT INTO `sys_logininfor` VALUES (106, 'guke', '127.0.0.1', '0', '退出成功', '2024-02-25 10:54:48');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '0', '登录成功', '2024-02-25 10:56:36');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '0', '登录成功', '2024-02-25 16:24:23');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '0', '退出成功', '2024-02-26 10:36:39');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '0', '登录成功', '2024-02-26 10:36:42');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '0', '退出成功', '2024-02-26 18:36:44');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '0', '退出成功', '2024-02-28 11:17:38');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '0', '登录成功', '2024-02-28 11:17:41');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '0', '登录成功', '2024-02-29 11:42:45');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-01 09:21:40');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-01 09:21:43');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-01 16:10:43');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-01 16:15:16');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-01 16:17:45');
INSERT INTO `sys_logininfor` VALUES (120, '顾客', '127.0.0.1', '1', '登录用户不存在', '2024-03-01 16:18:10');
INSERT INTO `sys_logininfor` VALUES (121, 'guke', '127.0.0.1', '0', '登录成功', '2024-03-01 16:18:17');
INSERT INTO `sys_logininfor` VALUES (122, 'guke', '127.0.0.1', '0', '退出成功', '2024-03-01 16:19:16');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-01 16:19:25');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-01 16:22:21');
INSERT INTO `sys_logininfor` VALUES (125, 'guke', '127.0.0.1', '0', '登录成功', '2024-03-01 16:22:28');
INSERT INTO `sys_logininfor` VALUES (126, 'guke', '127.0.0.1', '0', '退出成功', '2024-03-01 16:22:52');
INSERT INTO `sys_logininfor` VALUES (127, 'yg', '127.0.0.1', '1', '登录用户不存在', '2024-03-01 16:22:57');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-01 16:23:04');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-01 16:23:25');
INSERT INTO `sys_logininfor` VALUES (130, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-03-01 16:23:51');
INSERT INTO `sys_logininfor` VALUES (131, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-03-01 16:24:19');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-01 16:24:26');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-01 16:25:41');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-01 16:25:46');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-01 16:34:27');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-01 16:34:53');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-04 17:04:20');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-05 10:34:31');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-05 10:34:59');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-05 10:35:55');
INSERT INTO `sys_logininfor` VALUES (141, 'guke2', '127.0.0.1', '0', '注册成功', '2024-03-05 10:42:30');
INSERT INTO `sys_logininfor` VALUES (142, 'guke2', '127.0.0.1', '0', '登录成功', '2024-03-05 10:42:48');
INSERT INTO `sys_logininfor` VALUES (143, 'guke2', '127.0.0.1', '0', '退出成功', '2024-03-05 10:43:09');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-05 10:43:16');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-05 11:02:10');
INSERT INTO `sys_logininfor` VALUES (146, 'guke3', '127.0.0.1', '0', '注册成功', '2024-03-05 11:02:28');
INSERT INTO `sys_logininfor` VALUES (147, 'guke3', '127.0.0.1', '0', '登录成功', '2024-03-05 11:02:41');
INSERT INTO `sys_logininfor` VALUES (148, 'guke3', '127.0.0.1', '0', '退出成功', '2024-03-05 11:07:16');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-05 11:07:22');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-05 11:09:46');
INSERT INTO `sys_logininfor` VALUES (151, 'guke3', '127.0.0.1', '0', '登录成功', '2024-03-05 11:10:04');
INSERT INTO `sys_logininfor` VALUES (152, 'guke3', '127.0.0.1', '0', '退出成功', '2024-03-05 11:10:25');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-05 11:10:33');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-08 11:06:26');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-12 16:46:07');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-14 17:13:18');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-17 15:37:38');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-18 14:03:12');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-18 14:06:05');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-18 15:25:29');
INSERT INTO `sys_logininfor` VALUES (161, 'guke4', '127.0.0.1', '0', '注册成功', '2024-03-18 15:26:24');
INSERT INTO `sys_logininfor` VALUES (162, 'guke4', '127.0.0.1', '0', '登录成功', '2024-03-18 15:26:42');
INSERT INTO `sys_logininfor` VALUES (163, 'guke4', '127.0.0.1', '0', '退出成功', '2024-03-18 15:29:50');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-18 15:29:59');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-18 15:31:05');
INSERT INTO `sys_logininfor` VALUES (166, 'guke1', '127.0.0.1', '1', '登录用户不存在', '2024-03-18 15:31:13');
INSERT INTO `sys_logininfor` VALUES (167, 'guke', '127.0.0.1', '0', '登录成功', '2024-03-18 15:31:19');
INSERT INTO `sys_logininfor` VALUES (168, 'guke', '127.0.0.1', '0', '退出成功', '2024-03-18 15:31:49');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-18 15:31:54');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-18 15:32:21');
INSERT INTO `sys_logininfor` VALUES (171, 'guke', '127.0.0.1', '0', '登录成功', '2024-03-18 15:32:27');
INSERT INTO `sys_logininfor` VALUES (172, 'guke', '127.0.0.1', '0', '退出成功', '2024-03-18 15:32:56');
INSERT INTO `sys_logininfor` VALUES (173, 'guke2', '127.0.0.1', '0', '登录成功', '2024-03-18 15:33:05');
INSERT INTO `sys_logininfor` VALUES (174, 'guke2', '127.0.0.1', '0', '退出成功', '2024-03-18 15:35:26');
INSERT INTO `sys_logininfor` VALUES (175, 'guke', '127.0.0.1', '0', '登录成功', '2024-03-18 15:35:31');
INSERT INTO `sys_logininfor` VALUES (176, 'guke', '127.0.0.1', '0', '退出成功', '2024-03-18 15:40:42');
INSERT INTO `sys_logininfor` VALUES (177, 'guke2', '127.0.0.1', '0', '登录成功', '2024-03-18 15:40:47');
INSERT INTO `sys_logininfor` VALUES (178, 'guke2', '127.0.0.1', '0', '退出成功', '2024-03-18 15:42:26');
INSERT INTO `sys_logininfor` VALUES (179, 'guke5', '127.0.0.1', '0', '注册成功', '2024-03-18 15:42:57');
INSERT INTO `sys_logininfor` VALUES (180, 'guke5', '127.0.0.1', '0', '登录成功', '2024-03-18 15:43:04');
INSERT INTO `sys_logininfor` VALUES (181, 'guke5', '127.0.0.1', '0', '退出成功', '2024-03-18 15:48:16');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-18 15:48:22');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-18 15:50:27');
INSERT INTO `sys_logininfor` VALUES (184, 'guke', '127.0.0.1', '0', '登录成功', '2024-03-18 15:50:33');
INSERT INTO `sys_logininfor` VALUES (185, 'guke', '127.0.0.1', '0', '退出成功', '2024-03-18 15:52:09');
INSERT INTO `sys_logininfor` VALUES (186, 'guke6', '127.0.0.1', '0', '注册成功', '2024-03-18 15:53:17');
INSERT INTO `sys_logininfor` VALUES (187, 'guke6', '127.0.0.1', '0', '登录成功', '2024-03-18 15:53:27');
INSERT INTO `sys_logininfor` VALUES (188, 'guke6', '127.0.0.1', '0', '退出成功', '2024-03-18 15:56:05');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-18 15:56:11');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-23 10:27:56');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-23 12:03:34');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-23 12:03:40');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-26 13:24:47');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-26 14:56:05');
INSERT INTO `sys_logininfor` VALUES (195, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-03-26 14:56:14');
INSERT INTO `sys_logininfor` VALUES (196, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-03-26 14:57:25');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-26 14:57:31');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-26 14:58:04');
INSERT INTO `sys_logininfor` VALUES (199, 'yonggong', '127.0.0.1', '1', '登录用户不存在', '2024-03-26 14:58:15');
INSERT INTO `sys_logininfor` VALUES (200, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-03-26 14:58:23');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-26 14:59:29');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-26 15:01:14');
INSERT INTO `sys_logininfor` VALUES (203, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-03-26 15:01:19');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-26 15:01:24');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-26 15:01:56');
INSERT INTO `sys_logininfor` VALUES (206, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-03-26 15:02:03');
INSERT INTO `sys_logininfor` VALUES (207, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-03-26 15:02:14');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-26 15:02:22');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-26 15:04:49');
INSERT INTO `sys_logininfor` VALUES (210, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-03-26 15:04:56');
INSERT INTO `sys_logininfor` VALUES (211, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-03-26 15:05:09');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-26 15:05:16');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-26 15:05:30');
INSERT INTO `sys_logininfor` VALUES (214, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-03-26 15:05:36');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-26 21:21:31');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-27 08:04:11');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '0', '退出成功', '2024-03-27 08:07:02');
INSERT INTO `sys_logininfor` VALUES (218, 'guke', '127.0.0.1', '0', '登录成功', '2024-03-27 08:07:09');
INSERT INTO `sys_logininfor` VALUES (219, 'guke', '127.0.0.1', '0', '退出成功', '2024-03-27 08:07:19');
INSERT INTO `sys_logininfor` VALUES (220, 'guke', '127.0.0.1', '0', '登录成功', '2024-03-27 08:18:10');
INSERT INTO `sys_logininfor` VALUES (221, 'guke', '127.0.0.1', '0', '退出成功', '2024-03-27 08:18:16');
INSERT INTO `sys_logininfor` VALUES (222, 'guke', '127.0.0.1', '0', '登录成功', '2024-03-27 08:31:56');
INSERT INTO `sys_logininfor` VALUES (223, 'guke', '127.0.0.1', '0', '退出成功', '2024-03-27 08:33:44');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '0', '登录成功', '2024-03-27 08:33:50');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '0', '登录成功', '2024-04-07 11:26:50');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '0', '登录成功', '2024-04-09 16:44:17');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '0', '退出成功', '2024-04-09 16:56:50');
INSERT INTO `sys_logininfor` VALUES (228, 'yg', '127.0.0.1', '1', '登录用户不存在', '2024-04-09 16:56:59');
INSERT INTO `sys_logininfor` VALUES (229, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-04-09 16:57:33');
INSERT INTO `sys_logininfor` VALUES (230, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-04-09 20:55:54');
INSERT INTO `sys_logininfor` VALUES (231, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-04-09 20:56:03');
INSERT INTO `sys_logininfor` VALUES (232, 'guke', '127.0.0.1', '0', '登录成功', '2024-04-09 21:03:22');
INSERT INTO `sys_logininfor` VALUES (233, 'guke', '127.0.0.1', '0', '退出成功', '2024-04-09 22:44:55');
INSERT INTO `sys_logininfor` VALUES (234, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-04-09 22:45:11');
INSERT INTO `sys_logininfor` VALUES (235, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-04-09 22:46:05');
INSERT INTO `sys_logininfor` VALUES (236, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-04-09 22:48:30');
INSERT INTO `sys_logininfor` VALUES (237, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-04-10 09:52:51');
INSERT INTO `sys_logininfor` VALUES (238, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-04-10 10:03:57');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '0', '登录成功', '2024-04-10 10:04:03');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '0', '退出成功', '2024-04-10 10:05:51');
INSERT INTO `sys_logininfor` VALUES (241, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-04-10 10:06:04');
INSERT INTO `sys_logininfor` VALUES (242, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-04-10 10:06:32');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '0', '登录成功', '2024-04-10 10:06:39');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '0', '退出成功', '2024-04-10 10:08:17');
INSERT INTO `sys_logininfor` VALUES (245, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-04-10 10:08:23');
INSERT INTO `sys_logininfor` VALUES (246, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-04-10 10:08:30');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '0', '登录成功', '2024-04-10 10:08:36');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '0', '退出成功', '2024-04-10 10:11:12');
INSERT INTO `sys_logininfor` VALUES (249, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-04-10 10:11:23');
INSERT INTO `sys_logininfor` VALUES (250, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-04-10 10:12:44');
INSERT INTO `sys_logininfor` VALUES (251, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-04-10 10:13:01');
INSERT INTO `sys_logininfor` VALUES (252, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-04-10 10:18:08');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '0', '登录成功', '2024-04-10 10:18:29');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '0', '登录成功', '2024-04-10 10:58:14');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '0', '登录成功', '2024-04-10 21:26:59');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '0', '退出成功', '2024-04-10 21:30:20');
INSERT INTO `sys_logininfor` VALUES (257, 'guke', '127.0.0.1', '0', '登录成功', '2024-04-10 21:30:26');
INSERT INTO `sys_logininfor` VALUES (258, 'guke', '127.0.0.1', '0', '退出成功', '2024-04-10 21:45:03');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '0', '登录成功', '2024-04-10 21:45:09');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '0', '退出成功', '2024-04-10 21:46:06');
INSERT INTO `sys_logininfor` VALUES (261, 'guke', '127.0.0.1', '0', '登录成功', '2024-04-10 21:46:16');
INSERT INTO `sys_logininfor` VALUES (262, 'guke', '127.0.0.1', '0', '退出成功', '2024-04-10 21:53:48');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '0', '登录成功', '2024-04-10 21:53:55');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '0', '登录成功', '2024-04-12 23:48:40');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-02 12:22:28');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-02 12:22:36');
INSERT INTO `sys_logininfor` VALUES (267, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-05-02 12:22:43');
INSERT INTO `sys_logininfor` VALUES (268, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-05-02 12:23:27');
INSERT INTO `sys_logininfor` VALUES (269, 'guke', '127.0.0.1', '0', '登录成功', '2024-05-02 12:23:33');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-03 19:08:57');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-03 19:09:01');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-03 19:12:27');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-03 20:13:24');
INSERT INTO `sys_logininfor` VALUES (274, 'guke', '127.0.0.1', '0', '登录成功', '2024-05-14 20:07:41');
INSERT INTO `sys_logininfor` VALUES (275, 'guke', '127.0.0.1', '0', '退出成功', '2024-05-14 20:11:09');
INSERT INTO `sys_logininfor` VALUES (276, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-05-14 20:11:17');
INSERT INTO `sys_logininfor` VALUES (277, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-05-14 20:13:27');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-14 20:13:33');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-14 20:37:08');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-16 09:52:21');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-16 13:16:10');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-16 13:19:57');
INSERT INTO `sys_logininfor` VALUES (283, 'guke6', '127.0.0.1', '0', '登录成功', '2024-05-16 13:33:05');
INSERT INTO `sys_logininfor` VALUES (284, 'guke6', '127.0.0.1', '0', '退出成功', '2024-05-16 13:36:15');
INSERT INTO `sys_logininfor` VALUES (285, '员工', '127.0.0.1', '1', '登录用户不存在', '2024-05-16 13:36:21');
INSERT INTO `sys_logininfor` VALUES (286, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-05-16 13:36:28');
INSERT INTO `sys_logininfor` VALUES (287, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-05-16 13:38:01');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-16 13:38:09');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-16 13:43:31');
INSERT INTO `sys_logininfor` VALUES (290, 'guke', '127.0.0.1', '0', '登录成功', '2024-05-16 13:43:42');
INSERT INTO `sys_logininfor` VALUES (291, 'cc1', '127.0.0.1', '0', '注册成功', '2024-05-23 16:30:29');
INSERT INTO `sys_logininfor` VALUES (292, 'cc1', '127.0.0.1', '0', '登录成功', '2024-05-23 16:30:36');
INSERT INTO `sys_logininfor` VALUES (293, 'cc1', '127.0.0.1', '0', '退出成功', '2024-05-23 16:30:46');
INSERT INTO `sys_logininfor` VALUES (294, 'as1', '127.0.0.1', '0', '注册成功', '2024-05-23 16:32:19');
INSERT INTO `sys_logininfor` VALUES (295, 'as1', '127.0.0.1', '0', '登录成功', '2024-05-23 16:32:27');
INSERT INTO `sys_logininfor` VALUES (296, 'as1', '127.0.0.1', '0', '退出成功', '2024-05-23 16:33:39');
INSERT INTO `sys_logininfor` VALUES (297, 'qw1', '127.0.0.1', '0', '注册成功', '2024-05-23 16:34:40');
INSERT INTO `sys_logininfor` VALUES (298, 'qw1', '127.0.0.1', '0', '登录成功', '2024-05-23 16:34:47');
INSERT INTO `sys_logininfor` VALUES (299, 'qw1', '127.0.0.1', '0', '退出成功', '2024-05-23 16:37:35');
INSERT INTO `sys_logininfor` VALUES (300, 'yuangong', '127.0.0.1', '0', '登录成功', '2024-05-23 16:37:46');
INSERT INTO `sys_logininfor` VALUES (301, 'yuangong', '127.0.0.1', '0', '退出成功', '2024-05-23 16:39:09');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-23 16:39:17');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2084 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '人员管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-02-24 21:23:52', 'admin', '2024-03-26 13:26:02', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2024-02-24 21:23:52', 'admin', '2024-03-01 16:15:46', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2024-02-24 21:23:52', 'admin', '2024-03-27 08:06:45', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-02-24 21:23:52', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-02-24 21:23:52', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-02-24 21:23:52', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-02-24 21:23:52', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-02-24 21:23:52', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2024-02-24 21:23:52', 'admin', '2024-04-10 10:31:46', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2024-02-24 21:23:52', 'admin', '2024-03-01 16:16:16', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 0, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-02-24 21:23:52', 'admin', '2024-02-25 10:48:22', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '1', '0', '', 'log', 'admin', '2024-02-24 21:23:52', 'admin', '2024-03-01 16:16:11', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-02-24 21:23:52', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-02-24 21:23:52', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2024-02-24 21:23:52', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2024-02-24 21:23:52', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-02-24 21:23:52', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '1', '0', 'tool:build:list', 'build', 'admin', '2024-02-24 21:23:52', 'admin', '2024-03-01 16:16:44', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-02-24 21:23:52', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '1', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-02-24 21:23:52', 'admin', '2024-03-01 16:16:41', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2024-02-24 21:23:52', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2024-02-24 21:23:52', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '餐饮管理', 0, 5, 'goods', NULL, NULL, 1, 0, 'M', '0', '0', '', 'checkbox', 'admin', '2024-02-25 08:34:57', 'admin', '2024-02-25 13:35:34', '');
INSERT INTO `sys_menu` VALUES (2025, '商品管理', 2024, 1, 'gl', 'system/gl/index', NULL, 1, 0, 'C', '0', '0', 'system:gl:list', '#', 'admin', '2024-02-25 08:57:50', 'admin', '2024-02-25 09:26:23', '商品管理菜单');
INSERT INTO `sys_menu` VALUES (2026, '商品管理查询', 2025, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:gl:query', '#', 'admin', '2024-02-25 08:57:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '商品管理新增', 2025, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:gl:add', '#', 'admin', '2024-02-25 08:57:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '商品管理修改', 2025, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:gl:edit', '#', 'admin', '2024-02-25 08:57:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '商品管理删除', 2025, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:gl:remove', '#', 'admin', '2024-02-25 08:57:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '商品管理导出', 2025, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:gl:export', '#', 'admin', '2024-02-25 08:57:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '查询公告', 0, 8, 'noticenr', 'system/notice/nr.vue', NULL, 1, 0, 'C', '1', '0', '', 'email', 'admin', '2024-02-25 11:07:57', 'admin', '2024-03-01 11:42:08', '');
INSERT INTO `sys_menu` VALUES (2032, '商品状态', 2024, 2, 'goodssatus', 'system/gl/goodsstatus.vue', NULL, 1, 0, 'C', '0', '0', 'system:gl:list', 'education', 'admin', '2024-02-25 12:26:10', 'admin', '2024-02-25 12:26:27', '');
INSERT INTO `sys_menu` VALUES (2033, '房间管理', 0, 6, 'room', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'build', 'admin', '2024-02-25 16:16:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '房间', 2033, 1, 'roominfo', 'system/roominfo/index', NULL, 1, 0, 'C', '0', '0', 'system:roominfo:list', '#', 'admin', '2024-02-25 16:18:45', '', NULL, '房间菜单');
INSERT INTO `sys_menu` VALUES (2035, '房间查询', 2034, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:roominfo:query', '#', 'admin', '2024-02-25 16:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '房间新增', 2034, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:roominfo:add', '#', 'admin', '2024-02-25 16:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '房间修改', 2034, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:roominfo:edit', '#', 'admin', '2024-02-25 16:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '房间删除', 2034, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:roominfo:remove', '#', 'admin', '2024-02-25 16:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '房间导出', 2034, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:roominfo:export', '#', 'admin', '2024-02-25 16:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '房间管理', 2033, 2, 'roomstatus', 'system/roominfo/roomstatus', NULL, 1, 0, 'C', '0', '0', 'system:roominfo:list', 'date', 'admin', '2024-02-25 16:43:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '顾客选购', 0, 8, 'guke', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'build', 'admin', '2024-02-26 12:12:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '食物选购', 2042, 1, 'shiwu', 'system/guke/shiwu', NULL, 1, 0, 'C', '0', '0', 'system:gl:list', 'client', 'admin', '2024-02-26 13:04:47', 'admin', '2024-02-26 13:05:10', '');
INSERT INTO `sys_menu` VALUES (2044, '房间选购', 2042, 2, 'fangjian', 'system/guke/fangjian.vue', NULL, 1, 0, 'C', '0', '0', 'system:info:list', 'cascader', 'admin', '2024-02-26 13:05:56', 'admin', '2024-03-05 11:09:42', '');
INSERT INTO `sys_menu` VALUES (2045, '食物详情', 2042, 8, 'shiwuinfo', 'system/guke/shiwuinfo.vue', NULL, 1, 0, 'C', '1', '0', '', '#', 'admin', '2024-02-26 13:21:48', 'admin', '2024-03-01 11:41:55', '');
INSERT INTO `sys_menu` VALUES (2046, '房间详情', 2042, 3, 'fangjianinfo', 'system/guke/fangjianinfo', NULL, 1, 0, 'C', '1', '0', '', '#', 'admin', '2024-02-26 13:23:00', 'admin', '2024-03-01 11:41:52', '');
INSERT INTO `sys_menu` VALUES (2053, '购物车', 2042, 1, 'car', 'system/car/index', NULL, 1, 0, 'C', '0', '0', 'system:car:list', '#', 'admin', '2024-02-28 12:32:13', '', NULL, '购物车菜单');
INSERT INTO `sys_menu` VALUES (2054, '购物车查询', 2053, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:car:query', '#', 'admin', '2024-02-28 12:32:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '购物车新增', 2053, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:car:add', '#', 'admin', '2024-02-28 12:32:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '购物车修改', 2053, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:car:edit', '#', 'admin', '2024-02-28 12:32:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '购物车删除', 2053, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:car:remove', '#', 'admin', '2024-02-28 12:32:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '购物车导出', 2053, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:car:export', '#', 'admin', '2024-02-28 12:32:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '交易订单', 2042, 1, 'order', 'system/order/index', NULL, 1, 0, 'C', '0', '0', 'system:order:list', '#', 'admin', '2024-02-29 14:32:36', '', NULL, '交易订单菜单');
INSERT INTO `sys_menu` VALUES (2060, '交易订单查询', 2059, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:query', '#', 'admin', '2024-02-29 14:32:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '交易订单新增', 2059, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:add', '#', 'admin', '2024-02-29 14:32:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '交易订单修改', 2059, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:edit', '#', 'admin', '2024-02-29 14:32:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '交易订单删除', 2059, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:remove', '#', 'admin', '2024-02-29 14:32:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '交易订单导出', 2059, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:order:export', '#', 'admin', '2024-02-29 14:32:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '订单处理', 0, 7, 'dingdan', 'system/order/index2.vue', NULL, 1, 0, 'C', '0', '0', 'system:order:list', 'color', 'admin', '2024-02-29 15:00:48', 'admin', '2024-02-29 15:02:37', '');
INSERT INTO `sys_menu` VALUES (2066, '我的房间', 0, 8, 'myroom', 'system/guke/myroom.vue', NULL, 1, 0, 'C', '0', '0', 'system:info:list', 'dashboard', 'admin', '2024-03-01 11:38:16', 'admin', '2024-03-05 11:09:31', '');
INSERT INTO `sys_menu` VALUES (2067, '商品评价', 2042, 1, 'eva', 'system/eva/index', NULL, 1, 0, 'C', '1', '0', 'system:eva:list', '#', 'admin', '2024-03-01 14:05:17', 'admin', '2024-03-18 15:48:35', '商品评价菜单');
INSERT INTO `sys_menu` VALUES (2068, '商品评价查询', 2067, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:eva:query', '#', 'admin', '2024-03-01 14:05:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '商品评价新增', 2067, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:eva:add', '#', 'admin', '2024-03-01 14:05:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '商品评价修改', 2067, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:eva:edit', '#', 'admin', '2024-03-01 14:05:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '商品评价删除', 2067, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:eva:remove', '#', 'admin', '2024-03-01 14:05:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '商品评价导出', 2067, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:eva:export', '#', 'admin', '2024-03-01 14:05:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '菜品评价', 0, 8, 'pingjia', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'clipboard', 'admin', '2024-03-01 14:12:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '菜品评价', 2073, 1, 'eva', 'system/eva/index', NULL, 1, 0, 'C', '0', '0', 'system:eva:list', '#', 'admin', '2024-03-01 14:13:17', '', NULL, '菜品评价菜单');
INSERT INTO `sys_menu` VALUES (2075, '菜品评价查询', 2074, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:eva:query', '#', 'admin', '2024-03-01 14:13:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '菜品评价新增', 2074, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:eva:add', '#', 'admin', '2024-03-01 14:13:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '菜品评价修改', 2074, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:eva:edit', '#', 'admin', '2024-03-01 14:13:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '菜品评价删除', 2074, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:eva:remove', '#', 'admin', '2024-03-01 14:13:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '菜品评价导出', 2074, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:eva:export', '#', 'admin', '2024-03-01 14:13:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '营销数据', 0, 10, 'dash', 'index_v1.vue', NULL, 1, 0, 'C', '0', '0', '', 'bug', 'admin', '2024-03-08 11:25:15', 'admin', '2024-03-23 10:28:47', '');
INSERT INTO `sys_menu` VALUES (2082, '订单导出', 2065, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:order:export', '#', 'admin', '2024-04-10 10:10:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '订单处理', 2065, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:order:edit', '#', 'admin', '2024-04-10 10:11:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '新顾客有优惠活动', '1', 0x3C703EE696B0E9A1BEE5AEA2E69C89E4BC98E683A0E5BFABE69DA5E98089E8B4ADE590A73C2F703E, '0', 'admin', '2024-02-24 21:23:52', 'admin', '2024-03-18 15:58:48', '管理员');
INSERT INTO `sys_notice` VALUES (2, '惠誉酒店服务正式上线', '2', 0x3C703EE98592E5BA97E69C8DE58AA1E4B88AE7BABFE595A63C2F703E3C703E3C62723E3C2F703E, '0', 'admin', '2024-02-24 21:23:52', 'admin', '2024-02-25 10:51:22', '管理员');
INSERT INTO `sys_notice` VALUES (10, '搜索', '1', 0x3C703E32323C2F703E, '0', 'admin', '2024-03-01 16:36:06', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 617 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"employee\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 21:33:55', 48);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"employee\",\"className\":\"Employee\",\"columns\":[{\"capJavaField\":\"ID\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"ID\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:33:54\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"ID\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"姓名\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"姓名\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:33:54\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"姓名\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"liuhao\",\"functionName\":\"员工\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{\\\"parentMenuId\\\":3}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"parentMenuId\":3},\"parentMenuId\":\"3\",\"sub\":false,\"tableComment\":\"员工\",\"tableId\":1,\"tableName\":\"employee\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 21:34:40', 28);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"employee\"}', NULL, 0, NULL, '2024-02-24 21:34:42', 172);
INSERT INTO `sys_oper_log` VALUES (103, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:23:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-02-24 21:23:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666667\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 21:35:19', 45);
INSERT INTO `sys_oper_log` VALUES (104, '员工', 1, 'com.ruoyi.system.controller.EmployeeController.add()', 'POST', 1, 'admin', NULL, '/employee', '127.0.0.1', '', '{\"ID\":1,\"params\":{},\"姓名\":\"是\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 21:37:36', 12);
INSERT INTO `sys_oper_log` VALUES (105, '员工', 5, 'com.ruoyi.system.controller.EmployeeController.export()', 'POST', 1, 'admin', NULL, '/employee/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-02-24 21:37:48', 821);
INSERT INTO `sys_oper_log` VALUES (106, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:23:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-02-24 21:23:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666668\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 21:41:03', 44);
INSERT INTO `sys_oper_log` VALUES (107, '员工', 1, 'com.ruoyi.system.controller.EmployeeController.add()', 'POST', 1, 'admin', NULL, '/employee', '127.0.0.1', '', '{\"ID\":2,\"params\":{},\"姓名\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 21:44:49', 5);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"emp\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 21:49:56', 12);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"emp\"}', NULL, 0, NULL, '2024-02-24 21:49:57', 27);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"emp\",\"className\":\"Emp\",\"columns\":[{\"capJavaField\":\"EmpName\",\"columnId\":3,\"columnName\":\"emp_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:49:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"empName\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Ages\",\"columnId\":4,\"columnName\":\"ages\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:49:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"ages\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"人员\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{\\\"parentMenuId\\\":3}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"parentMenuId\":3},\"parentMenuId\":\"3\",\"sub\":false,\"tableComment\":\"人员\",\"tableId\":2,\"tableName\":\"emp\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 21:51:16', 7);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"emp\"}', NULL, 0, NULL, '2024-02-24 21:51:18', 22);
INSERT INTO `sys_oper_log` VALUES (112, '人员', 1, 'com.ruoyi.system.controller.EmpController.add()', 'POST', 1, 'admin', NULL, '/emp', '127.0.0.1', '', '{\"ages\":\"1\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'emp_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\biye\\biye3\\RuoYi-Cloud-master\\RuoYi-Cloud-master\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\EmpMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.EmpMapper.insertEmp-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into emp          ( ages )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'emp_name\' doesn\'t have a default value\n; Field \'emp_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'emp_name\' doesn\'t have a default value', '2024-02-24 21:54:08', 51);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"myceshi\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 21:56:12', 13);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"myceshi\",\"className\":\"Myceshi\",\"columns\":[{\"capJavaField\":\"Myname\",\"columnComment\":\"xming\",\"columnId\":5,\"columnName\":\"myname\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:56:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"myname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Myage\",\"columnComment\":\"nl\",\"columnId\":6,\"columnName\":\"myage\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:56:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"myage\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"aa\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{\\\"parentMenuId\\\":3}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"parentMenuId\":3},\"parentMenuId\":\"3\",\"sub\":false,\"tableComment\":\"aa\",\"tableId\":3,\"tableName\":\"myceshi\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 21:56:26', 9);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"myceshi\"}', NULL, 0, NULL, '2024-02-24 21:56:29', 39);
INSERT INTO `sys_oper_log` VALUES (116, 'aa', 2, 'com.ruoyi.system.controller.MyceshiController.edit()', 'PUT', 1, 'admin', NULL, '/myceshi', '127.0.0.1', '', '{\"myage\":22,\"myname\":\"请求\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-24 21:58:09', 11);
INSERT INTO `sys_oper_log` VALUES (117, 'aa', 2, 'com.ruoyi.system.controller.MyceshiController.edit()', 'PUT', 1, 'admin', NULL, '/myceshi', '127.0.0.1', '', '{\"myage\":1,\"myname\":\"1\",\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-02-24 21:58:18', 2);
INSERT INTO `sys_oper_log` VALUES (118, 'aa', 5, 'com.ruoyi.system.controller.MyceshiController.export()', 'POST', 1, 'admin', NULL, '/myceshi/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-02-24 21:58:34', 601);
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"AA\",\"params\":{},\"phonenumber\":\"15800008888\",\"postIds\":[1],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"AA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 22:06:05', 105);
INSERT INTO `sys_oper_log` VALUES (120, '用户管理', 3, 'com.ruoyi.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/user/100', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 22:06:10', 13);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/1,2,3', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 22:08:52', 42);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"sys_ceshi\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 22:09:01', 23);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"ceshi\",\"className\":\"SysCeshi\",\"columns\":[{\"capJavaField\":\"UseId\",\"columnComment\":\"主键\",\"columnId\":7,\"columnName\":\"use_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-24 22:09:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"useId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UseName\",\"columnComment\":\"名\",\"columnId\":8,\"columnName\":\"use_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-24 22:09:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"useName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"测试\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{\\\"parentMenuId\\\":3}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"parentMenuId\":3},\"parentMenuId\":\"3\",\"sub\":false,\"tableComment\":\"测试\",\"tableId\":4,\"tableName\":\"sys_ceshi\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 22:09:21', 27);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_ceshi\"}', NULL, 0, NULL, '2024-02-24 22:09:26', 41);
INSERT INTO `sys_oper_log` VALUES (125, '测试', 1, 'com.ruoyi.system.controller.SysCeshiController.add()', 'POST', 1, 'admin', NULL, '/ceshi', '127.0.0.1', '', '{\"params\":{},\"useId\":1,\"useName\":\"77\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 22:11:22', 12);
INSERT INTO `sys_oper_log` VALUES (126, '测试', 2, 'com.ruoyi.system.controller.SysCeshiController.edit()', 'PUT', 1, 'admin', NULL, '/ceshi', '127.0.0.1', '', '{\"params\":{},\"useId\":1,\"useName\":\"7788\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 22:11:26', 4);
INSERT INTO `sys_oper_log` VALUES (127, '测试', 2, 'com.ruoyi.system.controller.SysCeshiController.edit()', 'PUT', 1, 'admin', NULL, '/ceshi', '127.0.0.1', '', '{\"params\":{},\"useId\":1,\"useName\":\"778899\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 22:11:34', 4);
INSERT INTO `sys_oper_log` VALUES (128, '测试', 1, 'com.ruoyi.system.controller.SysCeshiController.add()', 'POST', 1, 'admin', NULL, '/ceshi', '127.0.0.1', '', '{\"params\":{},\"useId\":2,\"useName\":\"888\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 22:11:39', 4);
INSERT INTO `sys_oper_log` VALUES (129, '测试', 3, 'com.ruoyi.system.controller.SysCeshiController.remove()', 'DELETE', 1, 'admin', NULL, '/ceshi/2', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 22:11:41', 6);
INSERT INTO `sys_oper_log` VALUES (130, '测试', 3, 'com.ruoyi.system.controller.SysCeshiController.remove()', 'DELETE', 1, 'admin', NULL, '/ceshi/1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-24 22:11:43', 4);
INSERT INTO `sys_oper_log` VALUES (131, '测试', 1, 'com.ruoyi.system.controller.SysCeshiController.add()', 'POST', 1, 'admin', NULL, '/ceshi', '127.0.0.1', '', '{\"params\":{},\"useId\":3,\"useName\":\"44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:32:03', 10);
INSERT INTO `sys_oper_log` VALUES (132, '测试', 1, 'com.ruoyi.system.controller.SysCeshiController.add()', 'POST', 1, 'admin', NULL, '/ceshi', '127.0.0.1', '', '{\"params\":{},\"useId\":4,\"useName\":\"55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:32:07', 3);
INSERT INTO `sys_oper_log` VALUES (133, '测试', 2, 'com.ruoyi.system.controller.SysCeshiController.edit()', 'PUT', 1, 'admin', NULL, '/ceshi', '127.0.0.1', '', '{\"params\":{},\"useId\":3,\"useName\":\"4488\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:32:11', 8);
INSERT INTO `sys_oper_log` VALUES (134, '测试', 3, 'com.ruoyi.system.controller.SysCeshiController.remove()', 'DELETE', 1, 'admin', NULL, '/ceshi/3', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:32:14', 3);
INSERT INTO `sys_oper_log` VALUES (135, '测试', 3, 'com.ruoyi.system.controller.SysCeshiController.remove()', 'DELETE', 1, 'admin', NULL, '/ceshi/4', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:32:17', 3);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2000', '127.0.0.1', '', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-02-25 08:32:39', 2);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2005', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:32:53', 5);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2004', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:32:55', 3);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2003', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:32:57', 3);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2002', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:32:59', 4);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2001', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:01', 4);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2000', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:04', 6);
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2007', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:07', 4);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2009', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:10', 4);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2008', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:12', 4);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2010', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:15', 4);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2011', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:17', 5);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2006', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:21', 4);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2019', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:25', 4);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2020', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:28', 6);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2021', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:30', 4);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2022', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:32', 6);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2023', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:34', 3);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2018', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:33:37', 4);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"goods\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:34:57', 10);
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"sys_goods_gl\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:46:30', 45);
INSERT INTO `sys_oper_log` VALUES (157, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"商品状态\",\"dictType\":\"goods_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:48:39', 8);
INSERT INTO `sys_oper_log` VALUES (158, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未上架\",\"dictSort\":0,\"dictType\":\"goods_status\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:49:44', 6);
INSERT INTO `sys_oper_log` VALUES (159, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已上架\",\"dictSort\":1,\"dictType\":\"goods_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:49:57', 5);
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已下架\",\"dictSort\":2,\"dictType\":\"goods_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:50:09', 5);
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"gl\",\"className\":\"SysGoodsGl\",\"columns\":[{\"capJavaField\":\"GoodsId\",\"columnComment\":\"商品id\",\"columnId\":9,\"columnName\":\"Goods_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 08:46:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"goodsId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GoodsName\",\"columnComment\":\"商品名\",\"columnId\":10,\"columnName\":\"Goods_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 08:46:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"goodsName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GoodsPrice\",\"columnComment\":\"商品价格\",\"columnId\":11,\"columnName\":\"Goods_price\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 08:46:30\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"goodsPrice\",\"javaType\":\"Double\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GoodsStatus\",\"columnComment\":\"商品状态\",\"columnId\":12,\"columnName\":\"Goods_status\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 08:46:30\",\"dictType\":\"goods_status\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"goodsStatus\",\"javaType\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 08:56:18', 26);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_goods_gl\"}', NULL, 0, NULL, '2024-02-25 08:56:21', 53);
INSERT INTO `sys_oper_log` VALUES (163, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsLikes\":1,\"goodsName\":\"商品1号\",\"goodsPj\":\"无\",\"goodsPrice\":50.0,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 09:00:08', 13);
INSERT INTO `sys_oper_log` VALUES (164, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2024/02/25/img_17_20240225090303A001.png\",\"code\":200}', 0, NULL, '2024-02-25 09:03:03', 89);
INSERT INTO `sys_oper_log` VALUES (165, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/简历照片_20240225092147A003.jpg\",\"goodsLikes\":1,\"goodsName\":\"商品1号\",\"goodsPj\":\"无\",\"goodsPrice\":50.0,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 09:21:47', 4);
INSERT INTO `sys_oper_log` VALUES (166, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":2,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092414A005.jpg\",\"goodsLikes\":1,\"goodsName\":\"1\",\"goodsPj\":\"1\",\"goodsPrice\":1.0,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 09:24:15', 4);
INSERT INTO `sys_oper_log` VALUES (167, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092514A007.jpg\",\"goodsLikes\":1,\"goodsName\":\"商品1号\",\"goodsPj\":\"无\",\"goodsPrice\":50.0,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 09:25:15', 3);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/gl/index\",\"createTime\":\"2024-02-25 08:57:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"商品管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2024,\"path\":\"gl\",\"perms\":\"system:gl:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 09:26:23', 10);
INSERT INTO `sys_oper_log` VALUES (169, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":3,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225095749A008.jpg\",\"goodsLikes\":3,\"goodsName\":\"3\",\"goodsPj\":\"3\",\"goodsPrice\":3.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 09:57:50', 3);
INSERT INTO `sys_oper_log` VALUES (170, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:23:52\",\"delFlag\":\"0\",\"deptId\":100,\"deptName\":\"惠誉酒店\",\"email\":\"huiyv@qq.com\",\"leader\":\"老板\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:38:03', 13);
INSERT INTO `sys_oper_log` VALUES (171, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/102', '127.0.0.1', '', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2024-02-25 10:38:13', 2);
INSERT INTO `sys_oper_log` VALUES (172, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/108', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:38:16', 5);
INSERT INTO `sys_oper_log` VALUES (173, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/109', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:38:17', 6);
INSERT INTO `sys_oper_log` VALUES (174, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/102', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:38:20', 5);
INSERT INTO `sys_oper_log` VALUES (175, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"老板\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:38:57', 20);
INSERT INTO `sys_oper_log` VALUES (176, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"老板\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:38:58', 6);
INSERT INTO `sys_oper_log` VALUES (177, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"email\":\"huiyv@163.com\",\"nickName\":\"老板\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:39:14', 5);
INSERT INTO `sys_oper_log` VALUES (178, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:23:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"yg@qq.com\",\"loginDate\":\"2024-02-24 21:23:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"员工\",\"params\":{},\"phonenumber\":\"15666666668\",\"postIds\":[],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:40:02', 16);
INSERT INTO `sys_oper_log` VALUES (179, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/107', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:40:09', 4);
INSERT INTO `sys_oper_log` VALUES (180, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/106', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:40:11', 6);
INSERT INTO `sys_oper_log` VALUES (181, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/104', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:40:16', 4);
INSERT INTO `sys_oper_log` VALUES (182, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:23:52\",\"delFlag\":\"0\",\"deptId\":101,\"deptName\":\"天津店\",\"email\":\"huiyv@qq.com\",\"leader\":\"老板\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:40:52', 9);
INSERT INTO `sys_oper_log` VALUES (183, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:23:52\",\"delFlag\":\"0\",\"deptId\":103,\"deptName\":\"总管部门\",\"email\":\"huiyv@qq.com\",\"leader\":\"老板\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:41:15', 7);
INSERT INTO `sys_oper_log` VALUES (184, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:23:52\",\"delFlag\":\"0\",\"deptId\":105,\"deptName\":\"营销部门\",\"email\":\"yg@qq.com\",\"leader\":\"员工\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:41:36', 6);
INSERT INTO `sys_oper_log` VALUES (185, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,1055,1058,1056,1057,1059,1060,116,4,2024,2025,2026,2027,2028,2029,2030],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:42:29', 13);
INSERT INTO `sys_oper_log` VALUES (186, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,2012,2013,2014,2015,2016,2017,115,1055,1058,1056,1057,1059,1060,116,4,2024,2025,2026,2027,2028,2029,2030],\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:43:02', 11);
INSERT INTO `sys_oper_log` VALUES (187, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"guke@qq.com\",\"nickName\":\"顾客\",\"params\":{},\"phonenumber\":\"15788886666\",\"postIds\":[],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"guke\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:44:26', 81);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:48:22', 8);
INSERT INTO `sys_oper_log` VALUES (189, '通知公告', 2, 'com.ruoyi.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:23:52\",\"noticeContent\":\"<p>新顾客有优惠快来选购吧</p>\",\"noticeId\":1,\"noticeTitle\":\"新顾客有优惠活动哦\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:50:29', 5);
INSERT INTO `sys_oper_log` VALUES (190, '通知公告', 2, 'com.ruoyi.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:23:52\",\"noticeContent\":\"<p>酒店服务上线啦</p><p><br></p>\",\"noticeId\":2,\"noticeTitle\":\"惠誉酒店服务正式上线\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:51:22', 4);
INSERT INTO `sys_oper_log` VALUES (191, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-25 10:43:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:54:15', 4);
INSERT INTO `sys_oper_log` VALUES (192, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-25 10:43:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,2012,2013,2014,2015,2016,2017,115,1055,1058,1056,1057,1059,1060,116,4,2024,2025,2026,2027,2028,2029,2030,1035],\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 10:54:24', 10);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/notice/nr.vue\",\"createBy\":\"admin\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"noticenr\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 11:07:57', 5);
INSERT INTO `sys_oper_log` VALUES (194, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"email\":\"huiyv1@163.com\",\"nickName\":\"老板\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 11:27:29', 5);
INSERT INTO `sys_oper_log` VALUES (195, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":3,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225095749A008.jpg\",\"goodsLikes\":3,\"goodsName\":\"3\",\"goodsPj\":\"3\",\"goodsPrice\":3.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 11:49:32', 12);
INSERT INTO `sys_oper_log` VALUES (196, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsPrice\":null,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\biye\\biye3\\RuoYi-Cloud-master\\RuoYi-Cloud-master\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodsGlMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodsGlMapper.insertSysGoodsGl-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_goods_gl\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2024-02-25 11:54:25', 75);
INSERT INTO `sys_oper_log` VALUES (197, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":4,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225121514A014.jpg\",\"goodsName\":\"5\",\"goodsPrice\":5.2,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 12:15:15', 3);
INSERT INTO `sys_oper_log` VALUES (198, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":5,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225121913A015.jpg\",\"goodsName\":\"5\",\"goodsPrice\":5.5,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 12:19:13', 3);
INSERT INTO `sys_oper_log` VALUES (199, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":6,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225122026A016.jpg\",\"goodsName\":\"6\",\"goodsPrice\":6.6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 12:20:28', 2);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/gl/goodsstatus.vue\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品状态\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2024,\"path\":\"goodssatus\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 12:26:10', 4);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/gl/goodsstatus.vue\",\"createTime\":\"2024-02-25 12:26:10\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"商品状态\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2024,\"path\":\"goodssatus\",\"perms\":\"system:gl:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 12:26:27', 4);
INSERT INTO `sys_oper_log` VALUES (202, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":6,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225122026A016.jpg\",\"goodsName\":\"6\",\"goodsPrice\":6.6,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 13:12:33', 4);
INSERT INTO `sys_oper_log` VALUES (203, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":6,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225122026A016.jpg\",\"goodsName\":\"6\",\"goodsPrice\":6.6,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 13:21:29', 1);
INSERT INTO `sys_oper_log` VALUES (204, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":5,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225121913A015.jpg\",\"goodsName\":\"5\",\"goodsPrice\":5.5,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 13:23:26', 1);
INSERT INTO `sys_oper_log` VALUES (205, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":5,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225121913A015.jpg\",\"goodsName\":\"5\",\"goodsPrice\":5.5,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 13:23:43', 0);
INSERT INTO `sys_oper_log` VALUES (206, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":4,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225121514A014.jpg\",\"goodsName\":\"5\",\"goodsPrice\":5.2,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 13:24:32', 2);
INSERT INTO `sys_oper_log` VALUES (207, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":6,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225122026A016.jpg\",\"goodsName\":\"6\",\"goodsPrice\":6.6,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 13:24:36', 3);
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2024-02-25 08:34:57\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"餐饮管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"goods\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 13:35:34', 4);
INSERT INTO `sys_oper_log` VALUES (209, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":4,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225121514A014.jpg\",\"goodsName\":\"餐饮4套餐\",\"goodsPrice\":5.2,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 15:09:51', 6);
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2017', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-02-25 15:12:04', 5);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2017', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-02-25 15:12:15', 1);
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2012', '127.0.0.1', '', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-02-25 15:12:24', 1);
INSERT INTO `sys_oper_log` VALUES (213, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,1055,1056,1058,1057,1059,1060,116,4,2024,2025,2026,2027,2028,2029,2030,2032,107,1035,1036,1037,1038],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 15:13:02', 12);
INSERT INTO `sys_oper_log` VALUES (214, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-25 10:43:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1035],\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 15:13:32', 6);
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2013', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 15:14:02', 5);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2014', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 15:14:04', 3);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2015', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 15:14:06', 5);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2016', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 15:14:11', 4);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2017', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 15:14:14', 3);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2012', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 15:14:16', 4);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房间管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"room\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:16:27', 3);
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"sys_room_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:16:39', 28);
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"roominfo\",\"className\":\"SysRoomInfo\",\"columns\":[{\"capJavaField\":\"RoomId\",\"columnComment\":\"主键\",\"columnId\":16,\"columnName\":\"room_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RoomName\",\"columnComment\":\"房间名称\",\"columnId\":17,\"columnName\":\"room_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RoomInfo\",\"columnComment\":\"房间信息\",\"columnId\":18,\"columnName\":\"room_info\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomInfo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RoomPrices\",\"columnComment\":\"房间价格\",\"columnId\":19,\"columnName\":\"room_prices\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomPrices\",\"javaType\":\"BigDecimal\",\"list', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:17:49', 18);
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/4', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:17:57', 5);
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_room_info\"}', NULL, 0, NULL, '2024-02-25 16:18:19', 26);
INSERT INTO `sys_oper_log` VALUES (226, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":1,\"roomInfo\":\"s\",\"roomName\":\"搜索\",\"roomPrices\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:27:19', 12);
INSERT INTO `sys_oper_log` VALUES (227, '房间', 3, 'com.ruoyi.system.controller.SysRoomInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/roominfo/1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:27:28', 12);
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"roominfo\",\"className\":\"SysRoomInfo\",\"columns\":[{\"capJavaField\":\"RoomId\",\"columnComment\":\"主键\",\"columnId\":16,\"columnName\":\"room_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-25 16:17:48\",\"usableColumn\":false},{\"capJavaField\":\"RoomName\",\"columnComment\":\"房间名称\",\"columnId\":17,\"columnName\":\"room_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-25 16:17:48\",\"usableColumn\":false},{\"capJavaField\":\"RoomInfo\",\"columnComment\":\"房间信息\",\"columnId\":18,\"columnName\":\"room_info\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomInfo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-25 16:17:48\",\"usableColumn\":false},{\"capJavaField\":\"RoomPrices\",\"columnComment\":\"房间价格\",\"columnId\":19,\"columnName\":\"room_prices\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:27:56', 32);
INSERT INTO `sys_oper_log` VALUES (229, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":2,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225162901A017.jpg\",\"roomInfo\":\"6人\",\"roomName\":\"房间1号\",\"roomPrices\":55.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:29:24', 6);
INSERT INTO `sys_oper_log` VALUES (230, '房间', 3, 'com.ruoyi.system.controller.SysRoomInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/roominfo/2', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:29:40', 4);
INSERT INTO `sys_oper_log` VALUES (231, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"房间状态\",\"dictType\":\"sys_room_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:30:33', 9);
INSERT INTO `sys_oper_log` VALUES (232, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未上架\",\"dictSort\":0,\"dictType\":\"sys_room_status\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:31:43', 5);
INSERT INTO `sys_oper_log` VALUES (233, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已上架\",\"dictSort\":1,\"dictType\":\"sys_room_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:31:58', 7);
INSERT INTO `sys_oper_log` VALUES (234, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已下架\",\"dictSort\":2,\"dictType\":\"sys_room_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:32:08', 7);
INSERT INTO `sys_oper_log` VALUES (235, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已预约\",\"dictSort\":4,\"dictType\":\"sys_room_status\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:32:27', 8);
INSERT INTO `sys_oper_log` VALUES (236, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:32:27\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"已预约\",\"dictSort\":4,\"dictType\":\"sys_room_status\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:32:34', 9);
INSERT INTO `sys_oper_log` VALUES (237, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"空闲\",\"dictSort\":5,\"dictType\":\"sys_room_status\",\"dictValue\":\"4\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:33:31', 7);
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"roominfo\",\"className\":\"SysRoomInfo\",\"columns\":[{\"capJavaField\":\"RoomId\",\"columnComment\":\"主键\",\"columnId\":16,\"columnName\":\"room_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-25 16:27:56\",\"usableColumn\":false},{\"capJavaField\":\"RoomName\",\"columnComment\":\"房间名称\",\"columnId\":17,\"columnName\":\"room_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-25 16:27:56\",\"usableColumn\":false},{\"capJavaField\":\"RoomInfo\",\"columnComment\":\"房间信息\",\"columnId\":18,\"columnName\":\"room_info\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomInfo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-25 16:27:56\",\"usableColumn\":false},{\"capJavaField\":\"RoomPrices\",\"columnComment\":\"房间价格\",\"columnId\":19,\"columnName\":\"room_prices\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:34:22', 14);
INSERT INTO `sys_oper_log` VALUES (239, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\"6人房\",\"roomName\":\"房间1号\",\"roomPrices\":55.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:38:56', 3);
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/roominfo/roomstatus\",\"createBy\":\"admin\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房间管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2033,\"path\":\"roomstatus\",\"perms\":\"system:roominfo:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:43:35', 14);
INSERT INTO `sys_oper_log` VALUES (241, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":4,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225165053A019.jpg\",\"roomInfo\":\"无\",\"roomName\":\"房间2号\",\"roomPrices\":99.9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 16:50:54', 3);
INSERT INTO `sys_oper_log` VALUES (242, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\"6人房\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 17:01:13', 3);
INSERT INTO `sys_oper_log` VALUES (243, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":5,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225162901A017_20240225170141A020.jpg\",\"roomInfo\":\"无\",\"roomName\":\"房间3号\",\"roomPrices\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 17:01:42', 5);
INSERT INTO `sys_oper_log` VALUES (244, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":5,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225162901A017_20240225170141A020.jpg\",\"roomInfo\":\"无\",\"roomName\":\"房间3号\",\"roomPrices\":100,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 17:01:48', 3);
INSERT INTO `sys_oper_log` VALUES (245, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":5,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225162901A017_20240225170141A020.jpg\",\"roomInfo\":\"无\",\"roomName\":\"房间3号\",\"roomPrices\":100,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 17:01:49', 3);
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品选购\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 17:08:49', 4);
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2041', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-25 17:13:01', 13);
INSERT INTO `sys_oper_log` VALUES (248, '用户管理', 5, 'com.ruoyi.system.controller.SysUserController.export()', 'POST', 1, 'admin', NULL, '/user/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-02-26 10:43:00', 1051);
INSERT INTO `sys_oper_log` VALUES (249, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 10:44:26\",\"delFlag\":\"0\",\"email\":\"guke@qq.com\",\"loginIp\":\"\",\"nickName\":\"顾客\",\"params\":{},\"phonenumber\":\"15788886666\",\"postIds\":[],\"roleIds\":[100,2],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"guke\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 10:44:47', 64);
INSERT INTO `sys_oper_log` VALUES (250, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 10:44:26\",\"delFlag\":\"0\",\"email\":\"guke@qq.com\",\"loginIp\":\"\",\"nickName\":\"顾客\",\"params\":{},\"phonenumber\":\"15788886666\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"guke\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 10:45:26', 10);
INSERT INTO `sys_oper_log` VALUES (251, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"房间信息标签\",\"dictType\":\"sys_room_info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 11:15:37', 5);
INSERT INTO `sys_oper_log` VALUES (252, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"6人房\",\"dictSort\":0,\"dictType\":\"sys_room_info\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 11:43:21', 6);
INSERT INTO `sys_oper_log` VALUES (253, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"5人房\",\"dictSort\":0,\"dictType\":\"sys_room_info\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 11:43:51', 4);
INSERT INTO `sys_oper_log` VALUES (254, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"大桌\",\"dictSort\":0,\"dictType\":\"sys_room_info\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 11:44:24', 4);
INSERT INTO `sys_oper_log` VALUES (255, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"小桌\",\"dictSort\":0,\"dictType\":\"sys_room_info\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 11:44:34', 3);
INSERT INTO `sys_oper_log` VALUES (256, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"roominfo\",\"className\":\"SysRoomInfo\",\"columns\":[{\"capJavaField\":\"RoomId\",\"columnComment\":\"主键\",\"columnId\":16,\"columnName\":\"room_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-25 16:34:22\",\"usableColumn\":false},{\"capJavaField\":\"RoomName\",\"columnComment\":\"房间名称\",\"columnId\":17,\"columnName\":\"room_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-25 16:34:22\",\"usableColumn\":false},{\"capJavaField\":\"RoomInfo\",\"columnComment\":\"房间信息\",\"columnId\":18,\"columnName\":\"room_info\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"sys_room_info\",\"edit\":true,\"htmlType\":\"checkbox\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomInfo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-25 16:34:22\",\"usableColumn\":false},{\"capJavaField\":\"RoomPrices\",\"columnComment\":\"房间价格\",\"columnId\":19,\"columnName\":\"room_prices\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 11:45:41', 12);
INSERT INTO `sys_oper_log` VALUES (257, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":6,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/26/XR_20240225092337A004_20240226115353A021.jpg\",\"roomInfo\":\"0,1,2,3\",\"roomName\":\"888\",\"roomPrices\":888}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 11:53:57', 3);
INSERT INTO `sys_oper_log` VALUES (258, '房间', 3, 'com.ruoyi.system.controller.SysRoomInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/roominfo/6', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 11:54:30', 4);
INSERT INTO `sys_oper_log` VALUES (259, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\",0,2\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 11:54:37', 3);
INSERT INTO `sys_oper_log` VALUES (260, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":4,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225165053A019.jpg\",\"roomInfo\":\",1,3\",\"roomName\":\"房间2号\",\"roomPrices\":99.9,\"roomStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 11:58:34', 2);
INSERT INTO `sys_oper_log` VALUES (261, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":5,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225162901A017_20240225170141A020.jpg\",\"roomInfo\":\",0,3\",\"roomName\":\"房间3号\",\"roomPrices\":100,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 11:58:39', 4);
INSERT INTO `sys_oper_log` VALUES (262, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-26 11:43:21\",\"default\":false,\"dictCode\":108,\"dictLabel\":\"6人房\",\"dictSort\":0,\"dictType\":\"sys_room_info\",\"dictValue\":\"6人房\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 12:04:32', 7);
INSERT INTO `sys_oper_log` VALUES (263, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-26 11:43:50\",\"default\":false,\"dictCode\":109,\"dictLabel\":\"5人房\",\"dictSort\":0,\"dictType\":\"sys_room_info\",\"dictValue\":\"5人房\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 12:04:37', 4);
INSERT INTO `sys_oper_log` VALUES (264, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-26 11:44:24\",\"default\":false,\"dictCode\":110,\"dictLabel\":\"大桌\",\"dictSort\":0,\"dictType\":\"sys_room_info\",\"dictValue\":\"大桌\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 12:04:40', 4);
INSERT INTO `sys_oper_log` VALUES (265, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-26 11:44:34\",\"default\":false,\"dictCode\":111,\"dictLabel\":\"小桌\",\"dictSort\":0,\"dictType\":\"sys_room_info\",\"dictValue\":\"小桌\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 12:04:43', 4);
INSERT INTO `sys_oper_log` VALUES (266, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\"0,2\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 12:04:55', 2);
INSERT INTO `sys_oper_log` VALUES (267, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\",0,2\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 12:05:15', 2);
INSERT INTO `sys_oper_log` VALUES (268, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"roominfo\",\"className\":\"SysRoomInfo\",\"columns\":[{\"capJavaField\":\"RoomId\",\"columnComment\":\"主键\",\"columnId\":16,\"columnName\":\"room_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-26 11:45:41\",\"usableColumn\":false},{\"capJavaField\":\"RoomName\",\"columnComment\":\"房间名称\",\"columnId\":17,\"columnName\":\"room_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-26 11:45:41\",\"usableColumn\":false},{\"capJavaField\":\"RoomInfo\",\"columnComment\":\"房间信息\",\"columnId\":18,\"columnName\":\"room_info\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"sys_room_info\",\"edit\":true,\"htmlType\":\"checkbox\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomInfo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2024-02-26 11:45:41\",\"usableColumn\":false},{\"capJavaField\":\"RoomPrices\",\"columnComment\":\"房间价格\",\"columnId\":19,\"columnName\":\"room_prices\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-25 16:16:39\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 12:06:11', 8);
INSERT INTO `sys_oper_log` VALUES (269, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\",6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 12:06:55', 3);
INSERT INTO `sys_oper_log` VALUES (270, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":4,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225165053A019.jpg\",\"roomInfo\":\",5人房,小桌\",\"roomName\":\"房间2号\",\"roomPrices\":99.9,\"roomStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 12:11:16', 3);
INSERT INTO `sys_oper_log` VALUES (271, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":5,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225162901A017_20240225170141A020.jpg\",\"roomInfo\":\",6人房,小桌\",\"roomName\":\"房间3号\",\"roomPrices\":100,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 12:11:19', 5);
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"顾客选购\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"guke\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 12:12:40', 4);
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/shiwu\",\"createBy\":\"admin\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"食物选购\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"shiwu\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 13:04:47', 6);
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/shiwu\",\"createTime\":\"2024-02-26 13:04:47\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"食物选购\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"shiwu\",\"perms\":\"system:gl:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 13:05:10', 6);
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/fangjian.vue\",\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房间选购\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2042,\"path\":\"fangjian\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 13:05:56', 4);
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/fangjian.vue\",\"createTime\":\"2024-02-26 13:05:56\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2044,\"menuName\":\"房间选购\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2042,\"path\":\"fangjian\",\"perms\":\"system:roominfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 13:06:06', 4);
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/shiwuinfo.vue\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"食物详情\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":2042,\"path\":\"shiwuinfo\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 13:21:48', 4);
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/fangjianinfo\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房间详情\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2042,\"path\":\"fangjianinfo\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 13:23:00', 3);
INSERT INTO `sys_oper_log` VALUES (279, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":2,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092414A005.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮2套餐\",\"goodsPj\":\"1\",\"goodsPrice\":1.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 13:30:41', 39);
INSERT INTO `sys_oper_log` VALUES (280, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092514A007.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"无\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 13:30:43', 4);
INSERT INTO `sys_oper_log` VALUES (281, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsPrice\":null,\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where Goods_id = null\' at line 3\r\n### The error may exist in file [C:\\Users\\Administrator\\Desktop\\biye\\biye3\\RuoYi-Cloud-master\\RuoYi-Cloud-master\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodsGlMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodsGlMapper.updateSysGoodsGl-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_goods_gl                    where Goods_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where Goods_id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where Goods_id = null\' at line 3', '2024-02-26 16:22:35', 256);
INSERT INTO `sys_oper_log` VALUES (282, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":7,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/26/简历照片_20240225092147A003_20240226172151A022.jpg\",\"roomInfo\":\"6人房,小桌\",\"roomName\":\"房间4号\",\"roomPrices\":66}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 17:21:51', 11);
INSERT INTO `sys_oper_log` VALUES (283, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":7,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/26/简历照片_20240225092147A003_20240226172151A022.jpg\",\"roomInfo\":\"小桌,5人房\",\"roomName\":\"房间4号\",\"roomPrices\":66,\"roomStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 17:22:05', 4);
INSERT INTO `sys_oper_log` VALUES (284, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":5,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225162901A017_20240225170141A020.jpg\",\"roomInfo\":\",大桌,6人房\",\"roomName\":\"房间3号\",\"roomPrices\":100,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 17:22:10', 4);
INSERT INTO `sys_oper_log` VALUES (285, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":8,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/26/简历照片_20240225092444A006_20240226172310A023.jpg\",\"roomInfo\":\"5人房,大桌\",\"roomName\":\"房间5号\",\"roomPrices\":555}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 17:23:11', 3);
INSERT INTO `sys_oper_log` VALUES (286, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":4,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225165053A019.jpg\",\"roomInfo\":\"5人房,小桌\",\"roomName\":\"房间2号\",\"roomPrices\":99.9,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 17:23:17', 2);
INSERT INTO `sys_oper_log` VALUES (287, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/roominfo', '127.0.0.1', '', '{\"params\":{},\"roomId\":7,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/26/简历照片_20240225092147A003_20240226172151A022.jpg\",\"roomInfo\":\"小桌,5人房\",\"roomName\":\"房间4号\",\"roomPrices\":66,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 17:23:26', 4);
INSERT INTO `sys_oper_log` VALUES (288, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_room_info\"}', NULL, 0, NULL, '2024-02-26 20:42:06', 233);
INSERT INTO `sys_oper_log` VALUES (289, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_goods_gl\"}', NULL, 0, NULL, '2024-02-26 20:42:08', 38);
INSERT INTO `sys_oper_log` VALUES (290, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"sys_order\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 21:08:52', 50);
INSERT INTO `sys_oper_log` VALUES (291, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"订单信息\",\"dictType\":\"sys_order_statu\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 21:09:45', 13);
INSERT INTO `sys_oper_log` VALUES (292, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未支付\",\"dictSort\":0,\"dictType\":\"sys_order_statu\",\"dictValue\":\"0\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 21:10:16', 9);
INSERT INTO `sys_oper_log` VALUES (293, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已支付\",\"dictSort\":0,\"dictType\":\"sys_order_statu\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 21:10:28', 6);
INSERT INTO `sys_oper_log` VALUES (294, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"order\",\"className\":\"SysOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"订单id\",\"columnId\":22,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:08:52\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"订单名称\",\"columnId\":23,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单id\",\"columnId\":24,\"columnName\":\"order_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AlipayNo\",\"columnComment\":\"支付宝订单号\",\"columnId\":25,\"columnName\":\"alipay_no\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:08:52\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"alipayNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 21:12:37', 36);
INSERT INTO `sys_oper_log` VALUES (295, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_order\"}', NULL, 0, NULL, '2024-02-26 21:12:41', 31);
INSERT INTO `sys_oper_log` VALUES (296, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/7', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 21:20:30', 11);
INSERT INTO `sys_oper_log` VALUES (297, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"sys_order\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 21:20:33', 21);
INSERT INTO `sys_oper_log` VALUES (298, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"order\",\"className\":\"SysOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:20:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"购买人\",\"columnId\":32,\"columnName\":\"user_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:20:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"订单名称\",\"columnId\":33,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:20:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单id\",\"columnId\":34,\"columnName\":\"order_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:20:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 21:21:38', 28);
INSERT INTO `sys_oper_log` VALUES (299, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_order\"}', NULL, 0, NULL, '2024-02-26 21:21:40', 28);
INSERT INTO `sys_oper_log` VALUES (300, '字典类型', 9, 'com.ruoyi.system.controller.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/dict/type/refreshCache', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-28 11:20:26', 22);
INSERT INTO `sys_oper_log` VALUES (301, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"支付订单状态\",\"dictType\":\"sys_order2_state\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-28 11:20:59', 8);
INSERT INTO `sys_oper_log` VALUES (302, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已支付\",\"dictSort\":1,\"dictType\":\"sys_order2_state\",\"dictValue\":\"TRADE_SUCCESS\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-28 11:21:26', 5);
INSERT INTO `sys_oper_log` VALUES (303, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已退款\",\"dictSort\":1,\"dictType\":\"sys_order2_state\",\"dictValue\":\"1\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-28 11:21:57', 5);
INSERT INTO `sys_oper_log` VALUES (304, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未支付\",\"dictSort\":2,\"dictType\":\"sys_order2_state\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-28 11:22:09', 4);
INSERT INTO `sys_oper_log` VALUES (305, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"order\",\"className\":\"SysOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:20:33\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-02-26 21:21:38\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"购买人\",\"columnId\":32,\"columnName\":\"user_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:20:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-02-26 21:21:38\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"订单名称\",\"columnId\":33,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:20:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2024-02-26 21:21:38\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单id\",\"columnId\":34,\"columnName\":\"order_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-26 21:20:33\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-28 11:22:55', 49);
INSERT INTO `sys_oper_log` VALUES (306, '支付宝订单', 3, 'com.ruoyi.system.controller.SysOrderController.remove()', 'DELETE', 1, 'admin', NULL, '/order/1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-28 11:58:53', 16);
INSERT INTO `sys_oper_log` VALUES (307, '支付宝订单', 5, 'com.ruoyi.system.controller.SysOrderController.export()', 'POST', 1, 'admin', NULL, '/order/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-02-28 12:16:49', 704);
INSERT INTO `sys_oper_log` VALUES (308, '支付宝订单', 3, 'com.ruoyi.system.controller.SysOrderController.remove()', 'DELETE', 1, 'admin', NULL, '/order/3', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-28 12:17:01', 9);
INSERT INTO `sys_oper_log` VALUES (309, '支付宝订单', 3, 'com.ruoyi.system.controller.SysOrderController.remove()', 'DELETE', 1, 'admin', NULL, '/order/2', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-28 12:17:03', 2);
INSERT INTO `sys_oper_log` VALUES (310, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"sys_car\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-28 12:29:25', 24);
INSERT INTO `sys_oper_log` VALUES (311, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"car\",\"className\":\"SysCar\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"购物车Id\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-28 12:29:25\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarName\",\"columnComment\":\"购物车商品名\",\"columnId\":42,\"columnName\":\"car_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-28 12:29:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"carName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarQuantity\",\"columnComment\":\"购物车商品数量\",\"columnId\":43,\"columnName\":\"car_quantity\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-28 12:29:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"carQuantity\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarPrices\",\"columnComment\":\"购物车商品价格\",\"columnId\":44,\"columnName\":\"car_prices\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-28 12:29:25\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"carPrices\",\"javaType\":\"BigDecimal\",\"list\":true,\"p', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-28 12:31:36', 11);
INSERT INTO `sys_oper_log` VALUES (312, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_car\"}', NULL, 0, NULL, '2024-02-28 12:31:39', 42);
INSERT INTO `sys_oper_log` VALUES (313, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"1\",\"carUsername\":\"admin\",\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 13:18:25', 12);
INSERT INTO `sys_oper_log` VALUES (314, '支付宝订单', 3, 'com.ruoyi.system.controller.SysOrderController.remove()', 'DELETE', 1, 'admin', NULL, '/order/7', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 13:58:19', 5);
INSERT INTO `sys_oper_log` VALUES (315, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/8', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:27:31', 35);
INSERT INTO `sys_oper_log` VALUES (316, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"sys_order\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:27:51', 39);
INSERT INTO `sys_oper_log` VALUES (317, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2052', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:30:47', 5);
INSERT INTO `sys_oper_log` VALUES (318, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2051', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:30:48', 5);
INSERT INTO `sys_oper_log` VALUES (319, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2050', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:30:51', 8);
INSERT INTO `sys_oper_log` VALUES (320, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2049', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:30:53', 9);
INSERT INTO `sys_oper_log` VALUES (321, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2048', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:30:54', 5);
INSERT INTO `sys_oper_log` VALUES (322, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2047', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:30:56', 5);
INSERT INTO `sys_oper_log` VALUES (323, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"order\",\"className\":\"SysOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":46,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"购买人\",\"columnId\":47,\"columnName\":\"user_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"订单名称\",\"columnId\":48,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单id\",\"columnId\":49,\"columnName\":\"order_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"orderId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"r', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:31:53', 35);
INSERT INTO `sys_oper_log` VALUES (324, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_order\"}', NULL, 0, NULL, '2024-02-29 14:31:55', 61);
INSERT INTO `sys_oper_log` VALUES (325, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"order\",\"className\":\"SysOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":46,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-02-29 14:31:52\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"购买人\",\"columnId\":47,\"columnName\":\"user_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-02-29 14:31:52\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"订单名称\",\"columnId\":48,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-02-29 14:31:52\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单id\",\"columnId\":49,\"columnName\":\"order_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:36:04', 21);
INSERT INTO `sys_oper_log` VALUES (326, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已配送\",\"dictSort\":3,\"dictType\":\"sys_order2_state\",\"dictValue\":\"3\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:44:35', 12);
INSERT INTO `sys_oper_log` VALUES (327, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已取消\",\"dictSort\":0,\"dictType\":\"sys_order2_state\",\"dictValue\":\"4\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:44:49', 6);
INSERT INTO `sys_oper_log` VALUES (328, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'admin', NULL, '/car/1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:51:35', 6);
INSERT INTO `sys_oper_log` VALUES (329, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"2\",\"carUsername\":\"admin\",\"id\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:51:53', 8);
INSERT INTO `sys_oper_log` VALUES (330, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮2套餐\",\"carPrices\":1,\"carQuantity\":\"1\",\"carUsername\":\"admin\",\"id\":3,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:52:36', 4);
INSERT INTO `sys_oper_log` VALUES (331, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮3套餐\",\"carPrices\":3,\"carQuantity\":\"1\",\"carUsername\":\"admin\",\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:52:38', 4);
INSERT INTO `sys_oper_log` VALUES (332, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'admin', NULL, '/car/2,3,4', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 14:57:02', 4);
INSERT INTO `sys_oper_log` VALUES (333, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/car/index2.vue\",\"createBy\":\"admin\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单处理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"dingdan\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 15:00:48', 16);
INSERT INTO `sys_oper_log` VALUES (334, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/car/index2.vue\",\"createTime\":\"2024-02-29 15:00:48\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2065,\"menuName\":\"订单处理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"dingdan\",\"perms\":\"system:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 15:01:17', 5);
INSERT INTO `sys_oper_log` VALUES (335, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/order/index2.vue\",\"createTime\":\"2024-02-29 15:00:48\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2065,\"menuName\":\"订单处理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"dingdan\",\"perms\":\"system:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 15:02:02', 7);
INSERT INTO `sys_oper_log` VALUES (336, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/order/index2.vue\",\"createTime\":\"2024-02-29 15:00:48\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2065,\"menuName\":\"订单处理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"dingdan\",\"perms\":\"system:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 15:02:37', 4);
INSERT INTO `sys_oper_log` VALUES (337, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"order\",\"className\":\"SysOrder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":46,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-02-29 14:36:04\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"购买人\",\"columnId\":47,\"columnName\":\"user_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-02-29 14:36:04\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"订单名称\",\"columnId\":48,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-02-29 14:36:04\",\"usableColumn\":false},{\"capJavaField\":\"OrderId\",\"columnComment\":\"订单id\",\"columnId\":49,\"columnName\":\"order_id\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 14:27:51\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 15:08:24', 15);
INSERT INTO `sys_oper_log` VALUES (338, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-13\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 15:13:58', 10);
INSERT INTO `sys_oper_log` VALUES (339, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-13\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 15:18:05', 1);
INSERT INTO `sys_oper_log` VALUES (340, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 15:19:04', 2);
INSERT INTO `sys_oper_log` VALUES (341, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502365406\",\"createTime\":\"2024-02-28 12:10:18\",\"getDate\":\"2024-03-01\",\"id\":5,\"name\":\"admin食物商品\",\"orderId\":\"1709093378\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":110,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 15:19:19', 3);
INSERT INTO `sys_oper_log` VALUES (342, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-13\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 15:19:26', 3);
INSERT INTO `sys_oper_log` VALUES (343, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-29\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:16:14', 8);
INSERT INTO `sys_oper_log` VALUES (344, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-29\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:20:05', 4);
INSERT INTO `sys_oper_log` VALUES (345, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502365406\",\"createTime\":\"2024-02-28 12:10:18\",\"getDate\":\"2024-02-29\",\"id\":5,\"name\":\"admin食物商品\",\"orderId\":\"1709093378\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":110,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:20:45', 4);
INSERT INTO `sys_oper_log` VALUES (346, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022922001456070502368924\",\"createTime\":\"2024-02-29 13:51:30\",\"getDate\":\"2024-02-29\",\"id\":6,\"name\":\"admin食物商品\",\"orderId\":\"1709185816\",\"params\":{},\"payTime\":\"2024-02-29\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:24:34', 4);
INSERT INTO `sys_oper_log` VALUES (347, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-22\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:27:33', 4);
INSERT INTO `sys_oper_log` VALUES (348, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022922001456070502375245\",\"createTime\":\"2024-02-29 13:58:12\",\"getDate\":\"2024-02-14\",\"id\":8,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709186276\",\"params\":{},\"payTime\":\"2024-02-29\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:27:39', 3);
INSERT INTO `sys_oper_log` VALUES (349, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-22\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:29:39', 1);
INSERT INTO `sys_oper_log` VALUES (350, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-28\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:29:45', 3);
INSERT INTO `sys_oper_log` VALUES (351, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502365406\",\"createTime\":\"2024-02-28 12:10:18\",\"getDate\":\"2024-03-01\",\"id\":5,\"name\":\"admin食物商品\",\"orderId\":\"1709093378\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":110,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:29:51', 3);
INSERT INTO `sys_oper_log` VALUES (352, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-03-02\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:29:58', 3);
INSERT INTO `sys_oper_log` VALUES (353, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-28\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:30:04', 6);
INSERT INTO `sys_oper_log` VALUES (354, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-01\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:30:45', 4);
INSERT INTO `sys_oper_log` VALUES (355, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-01\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:31:41', 1);
INSERT INTO `sys_oper_log` VALUES (356, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-02\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:31:48', 3);
INSERT INTO `sys_oper_log` VALUES (357, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-08\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:32:50', 3);
INSERT INTO `sys_oper_log` VALUES (358, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-28\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:38:48', 4);
INSERT INTO `sys_oper_log` VALUES (359, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-28\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:43:23', 1);
INSERT INTO `sys_oper_log` VALUES (360, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-27\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:44:00', 3);
INSERT INTO `sys_oper_log` VALUES (361, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-19\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:45:24', 3);
INSERT INTO `sys_oper_log` VALUES (362, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-02-19\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:46:34', 1);
INSERT INTO `sys_oper_log` VALUES (363, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-03-01\",\"id\":4,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:47:32', 3);
INSERT INTO `sys_oper_log` VALUES (364, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-03-01\",\"goodsId\":0,\"id\":4,\"location\":\"xxxxx\",\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:54:57', 5);
INSERT INTO `sys_oper_log` VALUES (365, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-03-01\",\"goodsId\":0,\"id\":4,\"location\":\"xxxxx\",\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:56:22', 1);
INSERT INTO `sys_oper_log` VALUES (366, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-03-01\",\"goodsId\":1,\"id\":4,\"location\":\"xxxxx\",\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 16:57:48', 3);
INSERT INTO `sys_oper_log` VALUES (367, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-03-01\",\"goodsId\":1,\"id\":4,\"location\":\"xxxxx\",\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 17:00:44', 3);
INSERT INTO `sys_oper_log` VALUES (368, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-03-01\",\"goodsId\":1,\"id\":4,\"location\":\"xxxxx\",\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"3\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 17:05:15', 3);
INSERT INTO `sys_oper_log` VALUES (369, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/6', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 17:18:00', 5);
INSERT INTO `sys_oper_log` VALUES (370, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"sys_room_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 17:18:04', 19);
INSERT INTO `sys_oper_log` VALUES (371, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"info\",\"className\":\"SysRoomInfo\",\"columns\":[{\"capJavaField\":\"RoomId\",\"columnComment\":\"主键\",\"columnId\":58,\"columnName\":\"room_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 17:18:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"roomId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RoomName\",\"columnComment\":\"房间名称\",\"columnId\":59,\"columnName\":\"room_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 17:18:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RoomInfo\",\"columnComment\":\"房间信息\",\"columnId\":60,\"columnName\":\"room_info\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 17:18:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomInfo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RoomPrices\",\"columnComment\":\"房间价格\",\"columnId\":61,\"columnName\":\"room_prices\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-29 17:18:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"roomPrices\",\"javaType\":\"BigDecimal\",\"list\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 17:19:35', 11);
INSERT INTO `sys_oper_log` VALUES (372, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_room_info\"}', NULL, 0, NULL, '2024-02-29 17:24:57', 38);
INSERT INTO `sys_oper_log` VALUES (373, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-02-28\",\"roomDate2\":\"2024-02-29\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 17:37:27', 15);
INSERT INTO `sys_oper_log` VALUES (374, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-02-28\",\"roomDate2\":\"2024-03-01\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 09:24:02', 11);
INSERT INTO `sys_oper_log` VALUES (375, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-02-28\",\"roomDate2\":\"2024-03-01\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 09:28:12', 2);
INSERT INTO `sys_oper_log` VALUES (376, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-31\",\"roomDate2\":\"2024-04-01\",\"roomId\":4,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225165053A019.jpg\",\"roomInfo\":\"5人房,小桌\",\"roomName\":\"房间2号\",\"roomPrices\":99.9,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 09:32:47', 4);
INSERT INTO `sys_oper_log` VALUES (377, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-01 10:07:11\",\"roomDate2\":\"2024-03-02 00:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 10:07:15', 12);
INSERT INTO `sys_oper_log` VALUES (378, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"1\",\"carUsername\":\"admin\",\"id\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 10:10:20', 9);
INSERT INTO `sys_oper_log` VALUES (379, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/11', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 10:14:54', 33);
INSERT INTO `sys_oper_log` VALUES (380, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"sys_room_info\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 10:14:56', 33);
INSERT INTO `sys_oper_log` VALUES (381, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-01 11:34:24\",\"roomDate2\":\"2024-03-02 02:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"3\",\"roomUsename\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 11:34:31', 16);
INSERT INTO `sys_oper_log` VALUES (382, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/myroom.vue\",\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的房间\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"myroom\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 11:38:16', 14);
INSERT INTO `sys_oper_log` VALUES (383, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/myroom.vue\",\"createTime\":\"2024-03-01 11:38:16\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2066,\"menuName\":\"我的房间\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"myroom\",\"perms\":\"system:roominfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 11:38:37', 5);
INSERT INTO `sys_oper_log` VALUES (384, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/fangjianinfo\",\"createTime\":\"2024-02-26 13:23:00\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2046,\"menuName\":\"房间详情\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2042,\"path\":\"fangjianinfo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 11:41:52', 6);
INSERT INTO `sys_oper_log` VALUES (385, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/shiwuinfo.vue\",\"createTime\":\"2024-02-26 13:21:48\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2045,\"menuName\":\"食物详情\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":2042,\"path\":\"shiwuinfo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 11:41:55', 6);
INSERT INTO `sys_oper_log` VALUES (386, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/notice/nr.vue\",\"createTime\":\"2024-02-25 11:07:57\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"查询公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"noticenr\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 11:42:08', 4);
INSERT INTO `sys_oper_log` VALUES (387, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 11:42:23', 5);
INSERT INTO `sys_oper_log` VALUES (388, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-01 11:34:24\",\"roomDate2\":\"2024-03-02 02:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/02/25/XR_20240225092337A004_20240225163855A018.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"4\",\"roomUsename\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 13:51:21', 8);
INSERT INTO `sys_oper_log` VALUES (389, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"sys_eva\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 14:01:24', 24);
INSERT INTO `sys_oper_log` VALUES (390, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"eva\",\"className\":\"SysEva\",\"columns\":[{\"capJavaField\":\"EvaId\",\"columnComment\":\"评价ID\",\"columnId\":75,\"columnName\":\"eva_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:01:24\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"evaId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EvaUsername\",\"columnComment\":\"评价者\",\"columnId\":76,\"columnName\":\"eva_username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:01:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"evaUsername\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EvaGoodsname\",\"columnComment\":\"被评价商品\",\"columnId\":77,\"columnName\":\"eva_goodsname\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:01:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"evaGoodsname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EvaContents\",\"columnComment\":\"评价内容\",\"columnId\":78,\"columnName\":\"eva_contents\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:01:24\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaFiel', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 14:04:18', 30);
INSERT INTO `sys_oper_log` VALUES (391, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_eva\"}', NULL, 0, NULL, '2024-03-01 14:04:21', 67);
INSERT INTO `sys_oper_log` VALUES (392, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"菜品评价\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"pingjia\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 14:12:04', 17);
INSERT INTO `sys_oper_log` VALUES (393, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"eva\",\"className\":\"SysEva\",\"columns\":[{\"capJavaField\":\"EvaId\",\"columnComment\":\"评价ID\",\"columnId\":81,\"columnName\":\"eva_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:07:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"evaId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EvaUsername\",\"columnComment\":\"评价者\",\"columnId\":82,\"columnName\":\"eva_username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:07:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"evaUsername\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EvaGoodsname\",\"columnComment\":\"被评价商品\",\"columnId\":83,\"columnName\":\"eva_goodsname\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:07:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"evaGoodsname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EvaContents\",\"columnComment\":\"评价内容\",\"columnId\":84,\"columnName\":\"eva_contents\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:07:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaFie', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 14:12:47', 9);
INSERT INTO `sys_oper_log` VALUES (394, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"sys_eva\"}', NULL, 0, NULL, '2024-03-01 14:12:49', 29);
INSERT INTO `sys_oper_log` VALUES (395, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"eva\",\"className\":\"SysEva\",\"columns\":[{\"capJavaField\":\"EvaId\",\"columnComment\":\"评价ID\",\"columnId\":81,\"columnName\":\"eva_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:07:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"evaId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2024-03-01 14:12:47\",\"usableColumn\":false},{\"capJavaField\":\"EvaUsername\",\"columnComment\":\"评价者\",\"columnId\":82,\"columnName\":\"eva_username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:07:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"evaUsername\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2024-03-01 14:12:47\",\"usableColumn\":false},{\"capJavaField\":\"EvaGoodsname\",\"columnComment\":\"被评价商品\",\"columnId\":83,\"columnName\":\"eva_goodsname\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:07:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"evaGoodsname\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2024-03-01 14:12:47\",\"usableColumn\":false},{\"capJavaField\":\"EvaContents\",\"columnComment\":\"评价内容\",\"columnId\":84,\"columnName\":\"eva_contents\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-03-01 14:07:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEd', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 14:46:29', 12);
INSERT INTO `sys_oper_log` VALUES (396, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'admin', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"挺好吃的！\",\"evaCreate\":\"2024-03-01\",\"evaGoodsname\":\"餐饮1套餐\",\"evaId\":1,\"evaUserimg\":\"http://127.0.0.1:9300/statics/2024/03/01/食用指南_20240301150406A001.txt\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 15:04:12', 15);
INSERT INTO `sys_oper_log` VALUES (397, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'admin', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"我觉得还可以！\",\"evaCreate\":\"2024-03-01\",\"evaGoodsname\":\"餐饮1套餐\",\"evaId\":2,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 15:24:43', 3);
INSERT INTO `sys_oper_log` VALUES (398, '菜品评价', 3, 'com.ruoyi.system.controller.SysEvaController.remove()', 'DELETE', 1, 'admin', NULL, '/eva/1,2', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 15:25:49', 6);
INSERT INTO `sys_oper_log` VALUES (399, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'admin', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"好吃的！\",\"evaCreate\":\"2024-03-01\",\"evaGoodsname\":\"餐饮1套餐\",\"evaId\":3,\"evaUsername\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 15:27:06', 4);
INSERT INTO `sys_oper_log` VALUES (400, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'admin', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"我觉得可以第二次吃了\",\"evaCreate\":\"2024-03-01\",\"evaGoodsname\":\"餐饮1套餐\",\"evaId\":4,\"evaUsername\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 15:27:23', 3);
INSERT INTO `sys_oper_log` VALUES (401, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'admin', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"不好吃\",\"evaCreate\":\"2024-03-01\",\"evaGoodsname\":\"餐饮2套餐\",\"evaId\":5,\"evaUsername\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 15:38:39', 3);
INSERT INTO `sys_oper_log` VALUES (402, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-01 11:34:24\",\"roomDate2\":\"2024-03-02 02:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160228A002.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\",\"roomUsename\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:02:29', 9);
INSERT INTO `sys_oper_log` VALUES (403, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":4,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/QJ8241778073_20240301160235A003.jpg\",\"roomInfo\":\"5人房,小桌\",\"roomName\":\"房间2号\",\"roomPrices\":99.9,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:02:36', 3);
INSERT INTO `sys_oper_log` VALUES (404, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":5,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160240A004.jpg\",\"roomInfo\":\"大桌,6人房\",\"roomName\":\"房间3号\",\"roomPrices\":100,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:02:40', 4);
INSERT INTO `sys_oper_log` VALUES (405, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":7,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/QJ8241778073_20240301160244A005.jpg\",\"roomInfo\":\"小桌,5人房\",\"roomName\":\"房间4号\",\"roomPrices\":66,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:02:45', 3);
INSERT INTO `sys_oper_log` VALUES (406, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":8,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160249A006.jpg\",\"roomInfo\":\"5人房,大桌\",\"roomName\":\"房间5号\",\"roomPrices\":555,\"roomStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:02:49', 3);
INSERT INTO `sys_oper_log` VALUES (407, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160333A008.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:03:33', 10);
INSERT INTO `sys_oper_log` VALUES (408, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":2,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/QJ8241778073_20240301160338A009.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮2套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":1.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:03:39', 3);
INSERT INTO `sys_oper_log` VALUES (409, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":3,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160342A010.jpg\",\"goodsLikes\":3,\"goodsName\":\"餐饮3套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":3.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:03:43', 3);
INSERT INTO `sys_oper_log` VALUES (410, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":4,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/QJ8241778073_20240301160346A011.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮4套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":5.2,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:03:46', 3);
INSERT INTO `sys_oper_log` VALUES (411, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":5,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160350A012.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮5套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":5.5,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:03:50', 3);
INSERT INTO `sys_oper_log` VALUES (412, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":6,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/QJ8241778073_20240301160354A013.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮6套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":6.6,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:03:54', 5);
INSERT INTO `sys_oper_log` VALUES (413, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-01 11:34:24\",\"roomDate2\":\"2024-03-02 02:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/17a5ffde010520228fda610a88fb86c7_20240301160401A014.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\",\"roomUsename\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:04:02', 3);
INSERT INTO `sys_oper_log` VALUES (414, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":4,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301160405A015.jpg\",\"roomInfo\":\"5人房,小桌\",\"roomName\":\"房间2号\",\"roomPrices\":99.9,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:04:06', 2);
INSERT INTO `sys_oper_log` VALUES (415, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":5,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/17a5ffde010520228fda610a88fb86c7_20240301160410A016.jpg\",\"roomInfo\":\"大桌,6人房\",\"roomName\":\"房间3号\",\"roomPrices\":100,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:04:11', 4);
INSERT INTO `sys_oper_log` VALUES (416, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":7,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301160415A017.jpg\",\"roomInfo\":\"小桌,5人房\",\"roomName\":\"房间4号\",\"roomPrices\":66,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:04:15', 3);
INSERT INTO `sys_oper_log` VALUES (417, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":8,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/17a5ffde010520228fda610a88fb86c7_20240301160420A018.jpg\",\"roomInfo\":\"5人房,大桌\",\"roomName\":\"房间5号\",\"roomPrices\":555,\"roomStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:04:21', 3);
INSERT INTO `sys_oper_log` VALUES (418, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:15:46', 10);
INSERT INTO `sys_oper_log` VALUES (419, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":1,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:16:11', 4);
INSERT INTO `sys_oper_log` VALUES (420, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:16:16', 4);
INSERT INTO `sys_oper_log` VALUES (421, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"tool/build/index\",\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":114,\"menuName\":\"表单构建\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"build\",\"perms\":\"tool:build:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:16:32', 5);
INSERT INTO `sys_oper_log` VALUES (422, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":116,\"menuName\":\"系统接口\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":3,\"path\":\"http://localhost:8080/swagger-ui/index.html\",\"perms\":\"tool:swagger:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:16:35', 3);
INSERT INTO `sys_oper_log` VALUES (423, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"\",\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":116,\"menuName\":\"系统接口\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":3,\"path\":\"http://localhost:8080/swagger-ui/index.html\",\"perms\":\"tool:swagger:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:16:41', 4);
INSERT INTO `sys_oper_log` VALUES (424, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"tool/build/index\",\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":114,\"menuName\":\"表单构建\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"build\",\"perms\":\"tool:build:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:16:44', 4);
INSERT INTO `sys_oper_log` VALUES (425, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-25 10:43:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1035,2042,2043,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2067,2068,2069,2070,2071,2072,2044,2046,2045,2066,2073,2074,2075,2076,2077,2078,2079],\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:21:42', 21);
INSERT INTO `sys_oper_log` VALUES (426, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2024,2025,2026,2027,2028,2029,2030,2032,2033,2034,2035,2036,2037,2038,2039,2040,2065,107,1035,1036,1037,1038,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:22:11', 8);
INSERT INTO `sys_oper_log` VALUES (427, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-25 10:43:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1035,2031,2042,2043,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2067,2068,2069,2070,2071,2072,2044,2046,2045,2066,2073,2074,2075,2076,2077,2078,2079],\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:22:14', 9);
INSERT INTO `sys_oper_log` VALUES (428, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'guke', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301162247A019.jpg\",\"code\":200}', 0, NULL, '2024-03-01 16:22:47', 42);
INSERT INTO `sys_oper_log` VALUES (429, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'guke', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"email\":\"guke@qq.com\",\"nickName\":\"顾客\",\"params\":{},\"phonenumber\":\"15788886666\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:22:48', 5);
INSERT INTO `sys_oper_log` VALUES (430, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'yuangong', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2024/03/01/book_20240301162415A020.jpg\",\"code\":200}', 0, NULL, '2024-03-01 16:24:15', 12);
INSERT INTO `sys_oper_log` VALUES (431, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'yuangong', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"email\":\"yg@qq.com\",\"nickName\":\"员工\",\"params\":{},\"phonenumber\":\"15666666668\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:24:16', 5);
INSERT INTO `sys_oper_log` VALUES (432, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":7,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/QJ8241778073_20240301162608A021.jpg\",\"goodsName\":\"餐饮7套餐\",\"goodsPrice\":77.0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:26:09', 6);
INSERT INTO `sys_oper_log` VALUES (433, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":7,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/QJ8241778073_20240301162608A021.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮7套餐\",\"goodsPrice\":77.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:26:18', 26);
INSERT INTO `sys_oper_log` VALUES (434, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":9,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301162642A022.jpg\",\"roomInfo\":\"大桌,6人房\",\"roomName\":\"房间6号\",\"roomPrices\":99.9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:26:42', 6);
INSERT INTO `sys_oper_log` VALUES (435, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":9,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301162642A022.jpg\",\"roomInfo\":\"大桌,6人房\",\"roomName\":\"房间6号\",\"roomPrices\":99.9,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:26:53', 3);
INSERT INTO `sys_oper_log` VALUES (436, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":9,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301162642A022.jpg\",\"roomInfo\":\"大桌,6人房\",\"roomName\":\"房间6号\",\"roomPrices\":99.9,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:26:55', 4);
INSERT INTO `sys_oper_log` VALUES (437, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"1\",\"carUsername\":\"admin\",\"id\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:27:07', 7);
INSERT INTO `sys_oper_log` VALUES (438, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":8,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301163512A023.jpg\",\"goodsName\":\"餐饮8套餐\",\"goodsPrice\":5000.0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:35:12', 4);
INSERT INTO `sys_oper_log` VALUES (439, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":8,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301163512A023.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮8套餐\",\"goodsPrice\":50.0,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:35:17', 3);
INSERT INTO `sys_oper_log` VALUES (440, '商品管理', 3, 'com.ruoyi.system.controller.SysGoodsGlController.remove()', 'DELETE', 1, 'admin', NULL, '/gl/7', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:35:22', 8);
INSERT INTO `sys_oper_log` VALUES (441, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":8,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301163512A023.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮8套餐\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:35:26', 10);
INSERT INTO `sys_oper_log` VALUES (442, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":8,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301163512A023.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮8套餐\",\"goodsPrice\":50.0,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:35:28', 4);
INSERT INTO `sys_oper_log` VALUES (443, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":10,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301163549A024.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间5\",\"roomPrices\":99}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:35:50', 3);
INSERT INTO `sys_oper_log` VALUES (444, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":10,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301163549A024.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间5\",\"roomPrices\":99,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:35:54', 5);
INSERT INTO `sys_oper_log` VALUES (445, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":10,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301163549A024.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间5\",\"roomPrices\":99,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:35:55', 6);
INSERT INTO `sys_oper_log` VALUES (446, '通知公告', 1, 'com.ruoyi.system.controller.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>22</p>\",\"noticeTitle\":\"搜索\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:36:06', 11);
INSERT INTO `sys_oper_log` VALUES (447, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"1\",\"carUsername\":\"admin\",\"id\":7,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:36:24', 3);
INSERT INTO `sys_oper_log` VALUES (448, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"4\",\"carUsername\":\"admin\",\"id\":8,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:36:26', 3);
INSERT INTO `sys_oper_log` VALUES (449, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'admin', NULL, '/car/5,6,7,8', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:37:13', 7);
INSERT INTO `sys_oper_log` VALUES (450, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502365406\",\"createTime\":\"2024-02-28 12:10:18\",\"getDate\":\"2024-03-02\",\"goodsId\":1,\"id\":5,\"location\":\"XXXX\",\"name\":\"admin食物商品\",\"orderId\":\"1709093378\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"TRADE_SUCCESS\",\"total\":110,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:37:50', 5);
INSERT INTO `sys_oper_log` VALUES (451, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'admin', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"可以的\",\"evaCreate\":\"2024-03-01\",\"evaGoodsname\":\"餐饮1套餐\",\"evaId\":6,\"evaUsername\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:37:59', 4);
INSERT INTO `sys_oper_log` VALUES (452, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-01 00:00:00\",\"roomDate2\":\"2024-03-02 02:00:00\",\"roomId\":4,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301160405A015.jpg\",\"roomInfo\":\"5人房,小桌\",\"roomName\":\"房间2号\",\"roomPrices\":99.9,\"roomStatus\":\"3\",\"roomUsename\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:38:19', 3);
INSERT INTO `sys_oper_log` VALUES (453, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022922001456070502368924\",\"createTime\":\"2024-02-29 13:51:30\",\"getDate\":\"2024-02-29\",\"goodsId\":0,\"id\":6,\"name\":\"admin食物商品\",\"orderId\":\"1709185816\",\"params\":{},\"payTime\":\"2024-02-29\",\"state\":\"3\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:39:07', 5);
INSERT INTO `sys_oper_log` VALUES (454, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502365406\",\"createTime\":\"2024-02-28 12:10:18\",\"getDate\":\"2024-03-02\",\"goodsId\":1,\"id\":5,\"location\":\"XXXX\",\"name\":\"admin食物商品\",\"orderId\":\"1709093378\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"3\",\"total\":110,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:39:13', 4);
INSERT INTO `sys_oper_log` VALUES (455, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-01 00:00:00\",\"roomDate2\":\"2024-03-02 02:00:00\",\"roomId\":4,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301160405A015.jpg\",\"roomInfo\":\"5人房,小桌\",\"roomName\":\"房间2号\",\"roomPrices\":99.9,\"roomStatus\":\"1\",\"roomUsename\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 16:39:20', 5);
INSERT INTO `sys_oper_log` VALUES (456, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":5,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/04/760466_0_9-_20240304172459A001.jpg\",\"roomInfo\":\"大桌,6人房\",\"roomName\":\"房间3号\",\"roomPrices\":100,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-04 17:25:00', 13);
INSERT INTO `sys_oper_log` VALUES (457, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":7,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/04/fangj1_20240304172537A002.jpg\",\"roomInfo\":\"小桌,5人房\",\"roomName\":\"房间4号\",\"roomPrices\":66,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-04 17:25:39', 3);
INSERT INTO `sys_oper_log` VALUES (458, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":10,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/04/760466_0_9-_20240304172548A003.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间5\",\"roomPrices\":99,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-04 17:25:49', 3);
INSERT INTO `sys_oper_log` VALUES (459, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":3,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/04/shiwu1_20240304172837A004.jpg\",\"goodsLikes\":3,\"goodsName\":\"餐饮3套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":3.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-04 17:28:38', 10);
INSERT INTO `sys_oper_log` VALUES (460, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":4,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/04/shiwu2_20240304172842A005.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮4套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":5.2,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-04 17:28:43', 4);
INSERT INTO `sys_oper_log` VALUES (461, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":5,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/04/QJ8241778073_20240304172848A006.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮5套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":5.5,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-04 17:28:48', 3);
INSERT INTO `sys_oper_log` VALUES (462, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":6,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/04/201307241514163757_20240304172854A007.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮6套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":6.6,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-04 17:28:55', 3);
INSERT INTO `sys_oper_log` VALUES (463, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":8,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/04/shiwu1_20240304172858A008.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮8套餐\",\"goodsPrice\":50.0,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-04 17:28:59', 4);
INSERT INTO `sys_oper_log` VALUES (464, '用户管理', 4, 'com.ruoyi.system.controller.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/user/authRole', '127.0.0.1', '', '{\"roleIds\":\"100\",\"userId\":\"102\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 10:43:40', 15);
INSERT INTO `sys_oper_log` VALUES (465, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/myroom.vue\",\"createTime\":\"2024-03-01 11:38:16\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2066,\"menuName\":\"我的房间\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"myroom\",\"perms\":\"system:info:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 11:09:31', 16);
INSERT INTO `sys_oper_log` VALUES (466, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/guke/fangjian.vue\",\"createTime\":\"2024-02-26 13:05:56\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2044,\"menuName\":\"房间选购\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2042,\"path\":\"fangjian\",\"perms\":\"system:info:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 11:09:42', 5);
INSERT INTO `sys_oper_log` VALUES (467, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮3套餐\",\"carPrices\":3,\"carQuantity\":\"3\",\"carUsername\":\"admin\",\"id\":9,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 11:12:54', 7);
INSERT INTO `sys_oper_log` VALUES (468, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮2套餐\",\"carPrices\":1,\"carQuantity\":\"2\",\"carUsername\":\"admin\",\"id\":10,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 11:12:55', 3);
INSERT INTO `sys_oper_log` VALUES (469, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"2\",\"carUsername\":\"admin\",\"id\":11,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 11:12:55', 3);
INSERT INTO `sys_oper_log` VALUES (470, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160333A008.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 11:29:25', 14);
INSERT INTO `sys_oper_log` VALUES (471, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160333A008.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 11:31:22', 3);
INSERT INTO `sys_oper_log` VALUES (472, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160333A008.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 11:33:51', 1);
INSERT INTO `sys_oper_log` VALUES (473, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160333A008.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 11:33:55', 1);
INSERT INTO `sys_oper_log` VALUES (474, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160333A008.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 11:35:08', 2);
INSERT INTO `sys_oper_log` VALUES (475, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160333A008.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-05 11:37:12', 1);
INSERT INTO `sys_oper_log` VALUES (476, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"index_v1.vue\",\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"dashboard\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"dash\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-08 11:25:15', 18);
INSERT INTO `sys_oper_log` VALUES (477, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"sys_dept\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 15:50:25', 75);
INSERT INTO `sys_oper_log` VALUES (478, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/15', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-17 15:50:37', 7);
INSERT INTO `sys_oper_log` VALUES (479, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'guke4', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"email\":\"456@qq.com\",\"nickName\":\"guke4\",\"params\":{},\"phonenumber\":\"15800005555\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:27:05', 41);
INSERT INTO `sys_oper_log` VALUES (480, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'guke4', NULL, '/user/profile/updatePwd', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:27:21', 257);
INSERT INTO `sys_oper_log` VALUES (481, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'guke4', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"2\",\"carUsername\":\"guke4\",\"id\":12,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:27:40', 11);
INSERT INTO `sys_oper_log` VALUES (482, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-25 10:43:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1035,2031,2042,2043,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2067,2068,2069,2070,2071,2072,2044,2046,2045,2066,2073,2074,2075,2076,2077,2078,2079],\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:31:02', 25);
INSERT INTO `sys_oper_log` VALUES (483, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-25 10:43:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:32:10', 6);
INSERT INTO `sys_oper_log` VALUES (484, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'guke2', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"10\",\"carUsername\":\"guke2\",\"id\":13,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:33:17', 4);
INSERT INTO `sys_oper_log` VALUES (485, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'guke2', NULL, '/car/9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:33:36', 3);
INSERT INTO `sys_oper_log` VALUES (486, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'guke2', NULL, '/car/10', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:33:40', 5);
INSERT INTO `sys_oper_log` VALUES (487, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'guke2', NULL, '/car/11,12', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:33:45', 3);
INSERT INTO `sys_oper_log` VALUES (488, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'guke2', NULL, '/car/13', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:33:50', 2);
INSERT INTO `sys_oper_log` VALUES (489, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'guke2', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"1\",\"carUsername\":\"guke2\",\"id\":14,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:40:53', 11);
INSERT INTO `sys_oper_log` VALUES (490, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'guke2', NULL, '/car/14', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:40:59', 4);
INSERT INTO `sys_oper_log` VALUES (491, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'guke2', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024031822001456070502560684\",\"createTime\":\"2024-03-18 15:41:16\",\"getDate\":\"2024-03-19\",\"goodsId\":1,\"id\":14,\"location\":\"堂食\",\"name\":\"guke2餐饮1套餐\",\"orderId\":\"1710747659\",\"params\":{},\"payTime\":\"2024-03-18\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"guke2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:41:49', 7);
INSERT INTO `sys_oper_log` VALUES (492, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'guke5', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"10\",\"carUsername\":\"guke5\",\"id\":15,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:43:18', 4);
INSERT INTO `sys_oper_log` VALUES (493, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'guke5', NULL, '/car/15', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:43:50', 4);
INSERT INTO `sys_oper_log` VALUES (494, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'guke5', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"不好吃\",\"evaCreate\":\"2024-03-18\",\"evaGoodsname\":\"餐饮1套餐\",\"evaId\":7,\"evaUsername\":\"guke5\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:44:17', 8);
INSERT INTO `sys_oper_log` VALUES (495, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/eva/index\",\"createTime\":\"2024-03-01 14:05:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2067,\"menuName\":\"商品评价\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"eva\",\"perms\":\"system:eva:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:48:35', 10);
INSERT INTO `sys_oper_log` VALUES (496, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-25 10:43:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:50:12', 17);
INSERT INTO `sys_oper_log` VALUES (497, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-25 10:43:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[107,1035,2031,2042,2043,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2067,2068,2069,2070,2071,2072,2044,2046,2045,2066,2073,2074,2075,2076,2077,2078,2079],\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:50:22', 12);
INSERT INTO `sys_oper_log` VALUES (498, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'guke6', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2024/03/18/shiwu2_20240318155340A001.jpg\",\"code\":200}', 0, NULL, '2024-03-18 15:53:40', 245);
INSERT INTO `sys_oper_log` VALUES (499, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'guke6', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"email\":\"12355@qq.com\",\"nickName\":\"guke6\",\"params\":{},\"phonenumber\":\"15800006666\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:53:53', 9);
INSERT INTO `sys_oper_log` VALUES (500, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'guke6', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"1\",\"carUsername\":\"guke6\",\"id\":16,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:54:12', 7);
INSERT INTO `sys_oper_log` VALUES (501, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'guke6', NULL, '/car/16', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:54:54', 5);
INSERT INTO `sys_oper_log` VALUES (502, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'guke6', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-18 15:55:21\",\"roomDate2\":\"2024-03-20 00:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/17a5ffde010520228fda610a88fb86c7_20240301160401A014.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"3\",\"roomUsename\":\"guke6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:55:26', 12);
INSERT INTO `sys_oper_log` VALUES (503, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'guke6', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"欧克欧克\",\"evaCreate\":\"2024-03-18\",\"evaGoodsname\":\"餐饮1套餐\",\"evaId\":8,\"evaUsername\":\"guke6\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:55:54', 11);
INSERT INTO `sys_oper_log` VALUES (504, '用户管理', 5, 'com.ruoyi.system.controller.SysUserController.export()', 'POST', 1, 'admin', NULL, '/user/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-03-18 15:56:25', 1170);
INSERT INTO `sys_oper_log` VALUES (505, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":9,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/18/shiwu1_20240318155704A002.jpg\",\"goodsName\":\"餐饮10\",\"goodsPrice\":2.0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:57:04', 10);
INSERT INTO `sys_oper_log` VALUES (506, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":5,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/04/QJ8241778073_20240304172848A006.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮5套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":5.5,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:57:20', 4);
INSERT INTO `sys_oper_log` VALUES (507, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":3,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/04/shiwu1_20240304172837A004.jpg\",\"goodsLikes\":3,\"goodsName\":\"餐饮3套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":3.0,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:57:26', 4);
INSERT INTO `sys_oper_log` VALUES (508, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'admin', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":3,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/04/shiwu1_20240304172837A004.jpg\",\"goodsLikes\":3,\"goodsName\":\"餐饮3套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":3.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:57:32', 4);
INSERT INTO `sys_oper_log` VALUES (509, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-18 15:55:21\",\"roomDate2\":\"2024-03-20 00:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/18/14584563_20240318155747A003.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"3\",\"roomUsename\":\"guke6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:57:48', 6);
INSERT INTO `sys_oper_log` VALUES (510, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-18 15:55:21\",\"roomDate2\":\"2024-03-20 00:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/18/14584563_20240318155747A003.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\",\"roomUsename\":\"guke6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:57:57', 5);
INSERT INTO `sys_oper_log` VALUES (511, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024031822001456070502556372\",\"createTime\":\"2024-03-18 15:34:31\",\"goodsId\":0,\"id\":13,\"name\":\"guke2餐饮1套餐\",\"orderId\":\"1710747230\",\"params\":{},\"payTime\":\"2024-03-18\",\"state\":\"TRADE_SUCCESS\",\"total\":500,\"userName\":\"guke\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:58:08', 6);
INSERT INTO `sys_oper_log` VALUES (512, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022922001456070502368924\",\"createTime\":\"2024-02-29 13:51:30\",\"getDate\":\"2024-02-29\",\"goodsId\":0,\"id\":6,\"name\":\"admin食物商品\",\"orderId\":\"1709185816\",\"params\":{},\"payTime\":\"2024-02-29\",\"state\":\"3\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:58:13', 3);
INSERT INTO `sys_oper_log` VALUES (513, '通知公告', 2, 'com.ruoyi.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-24 21:23:52\",\"noticeContent\":\"<p>新顾客有优惠快来选购吧</p>\",\"noticeId\":1,\"noticeTitle\":\"新顾客有优惠活动\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2024-02-25 10:50:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 15:58:48', 6);
INSERT INTO `sys_oper_log` VALUES (514, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-18 16:09:07', 7);
INSERT INTO `sys_oper_log` VALUES (515, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"index_v1.vue\",\"createTime\":\"2024-03-08 11:25:15\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2080,\"menuName\":\"营销数据\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"dash\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-23 10:28:48', 18);
INSERT INTO `sys_oper_log` VALUES (516, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"人员管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 13:26:02', 16);
INSERT INTO `sys_oper_log` VALUES (517, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301160333A008.jpg\",\"goodsLikes\":15,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:56:21', 17);
INSERT INTO `sys_oper_log` VALUES (518, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'yuangong', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-18 15:55:21\",\"roomDate2\":\"2024-03-20 00:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/18/14584563_20240318155747A003.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\",\"roomUsename\":\"guke6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:56:36', 11);
INSERT INTO `sys_oper_log` VALUES (519, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":2,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/QJ8241778073_20240301160338A009.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮2套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":1.0,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:56:41', 4);
INSERT INTO `sys_oper_log` VALUES (520, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":2,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/03/01/QJ8241778073_20240301160338A009.jpg\",\"goodsLikes\":1,\"goodsName\":\"餐饮2套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":1.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:56:43', 4);
INSERT INTO `sys_oper_log` VALUES (521, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2024,2025,2026,2027,2028,2029,2030,2032,2033,2034,2035,2036,2037,2038,2039,2040,2065,107,1035,1036,1037,1038,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:57:53', 46);
INSERT INTO `sys_oper_log` VALUES (522, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,103,105],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:57:58', 7);
INSERT INTO `sys_oper_log` VALUES (523, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-25 10:43:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"guke\",\"roleName\":\"顾客\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:58:02', 11);
INSERT INTO `sys_oper_log` VALUES (524, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022822001456070502363065\",\"createTime\":\"2024-02-28 12:09:09\",\"getDate\":\"2024-03-01\",\"goodsId\":1,\"id\":4,\"location\":\"xxxxx\",\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709093303\",\"params\":{},\"payTime\":\"2024-02-28\",\"state\":\"3\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:59:43', 6);
INSERT INTO `sys_oper_log` VALUES (525, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:01:01', 5);
INSERT INTO `sys_oper_log` VALUES (526, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2024,2025,2026,2027,2028,2029,2030,2032,2033,2034,2035,2036,2037,2038,2039,2040,2065,107,1035,1036,1037,1038,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:01:11', 9);
INSERT INTO `sys_oper_log` VALUES (527, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单处理\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2065,\"perms\":\"system:order:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:04:24', 5);
INSERT INTO `sys_oper_log` VALUES (528, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2024,2025,2026,2027,2028,2029,2030,2032,2033,2034,2035,2036,2037,2038,2039,2040,2065,2081,107,1035,1036,1037,1038,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:05:27', 10);
INSERT INTO `sys_oper_log` VALUES (529, '用户管理', 6, 'com.ruoyi.system.controller.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/user/importData', '127.0.0.1', '', '{\"updateSupport\":\"0\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 ceshi1 导入成功\",\"code\":200}', 0, NULL, '2024-03-26 21:25:53', 279);
INSERT INTO `sys_oper_log` VALUES (530, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-27 08:06:45', 21);
INSERT INTO `sys_oper_log` VALUES (531, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'guke', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"3\",\"carUsername\":\"guke\",\"id\":17,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-27 08:33:16', 13);
INSERT INTO `sys_oper_log` VALUES (532, '用户管理', 6, 'com.ruoyi.system.controller.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/user/importData', '127.0.0.1', '', '{\"updateSupport\":\"0\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 ceshi2 导入成功\",\"code\":200}', 0, NULL, '2024-03-27 08:34:04', 748);
INSERT INTO `sys_oper_log` VALUES (533, '用户管理', 5, 'com.ruoyi.system.controller.SysUserController.export()', 'POST', 1, 'admin', NULL, '/user/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-03-27 08:34:09', 570);
INSERT INTO `sys_oper_log` VALUES (534, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'guke', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-18 15:55:21\",\"roomDate2\":\"2024-03-20 00:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/18/14584563_20240318155747A003.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"3\",\"roomUsename\":\"guke\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-09 22:39:18', 15);
INSERT INTO `sys_oper_log` VALUES (535, '商品管理', 5, 'com.ruoyi.system.controller.SysGoodsGlController.export()', 'POST', 1, 'yuangong', NULL, '/gl/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-04-09 22:51:40', 749);
INSERT INTO `sys_oper_log` VALUES (536, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2024-03-26 15:04:24\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2081,\"menuName\":\"订单处理\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2065,\"path\":\"\",\"perms\":\"system:order:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 10:05:26', 15);
INSERT INTO `sys_oper_log` VALUES (537, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 10:05:46', 16);
INSERT INTO `sys_oper_log` VALUES (538, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2024,2025,2026,2027,2028,2029,2030,2032,2033,2034,2035,2036,2037,2038,2039,2040,2065,2081,107,1035,1036,1037,1038,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 10:06:57', 11);
INSERT INTO `sys_oper_log` VALUES (539, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2024-03-26 15:04:24\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2081,\"menuName\":\"订单处理\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2065,\"path\":\"\",\"perms\":\"system:order:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 10:08:01', 5);
INSERT INTO `sys_oper_log` VALUES (540, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单导出\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2065,\"perms\":\"system:order:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 10:10:06', 6);
INSERT INTO `sys_oper_log` VALUES (541, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2081', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-04-10 10:10:11', 6);
INSERT INTO `sys_oper_log` VALUES (542, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2024,2025,2026,2027,2028,2029,2030,2032,2033,2034,2035,2036,2037,2038,2039,2040,107,1035,1036,1037,1038,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 10:10:27', 9);
INSERT INTO `sys_oper_log` VALUES (543, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2081', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 10:10:33', 4);
INSERT INTO `sys_oper_log` VALUES (544, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单处理\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2065,\"perms\":\"system:order:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 10:11:01', 4);
INSERT INTO `sys_oper_log` VALUES (545, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-02-24 21:23:52\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2024,2025,2026,2027,2028,2029,2030,2032,2033,2034,2035,2036,2037,2038,2039,2040,2065,2083,2082,107,1035,1036,1037,1038,2031],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"员工角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 10:11:10', 8);
INSERT INTO `sys_oper_log` VALUES (546, '交易订单', 5, 'com.ruoyi.system.controller.SysOrderController.export()', 'POST', 1, 'yuangong', NULL, '/order/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-04-10 10:11:27', 564);
INSERT INTO `sys_oper_log` VALUES (547, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2024-02-24 21:23:52\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-04-10 10:31:46', 14);
INSERT INTO `sys_oper_log` VALUES (548, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/04/13/s3_20240413002849A001.jpg\",\"goodsLikes\":18,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-02 12:22:50', 10);
INSERT INTO `sys_oper_log` VALUES (549, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/04/13/s3_20240413002849A001.jpg\",\"goodsLikes\":18,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-02 12:22:56', 4);
INSERT INTO `sys_oper_log` VALUES (550, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/04/13/s3_20240413002849A001.jpg\",\"goodsLikes\":18,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-02 12:22:58', 4);
INSERT INTO `sys_oper_log` VALUES (551, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'yuangong', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-18 15:55:21\",\"roomDate2\":\"2024-03-20 00:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/18/14584563_20240318155747A003.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"3\",\"roomUsename\":\"guke\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-02 12:23:02', 9);
INSERT INTO `sys_oper_log` VALUES (552, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'yuangong', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-01 00:00:00\",\"roomDate2\":\"2024-03-02 02:00:00\",\"roomId\":4,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301160405A015.jpg\",\"roomInfo\":\"5人房,小桌\",\"roomName\":\"房间2号\",\"roomPrices\":99.9,\"roomStatus\":\"2\",\"roomUsename\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-02 12:23:07', 4);
INSERT INTO `sys_oper_log` VALUES (553, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'yuangong', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-03-01 00:00:00\",\"roomDate2\":\"2024-03-02 02:00:00\",\"roomId\":4,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301160405A015.jpg\",\"roomInfo\":\"5人房,小桌\",\"roomName\":\"房间2号\",\"roomPrices\":99.9,\"roomStatus\":\"1\",\"roomUsename\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-02 12:23:09', 4);
INSERT INTO `sys_oper_log` VALUES (554, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'yuangong', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024022922001456070502375245\",\"createTime\":\"2024-02-29 13:58:12\",\"getDate\":\"2024-02-14\",\"goodsId\":0,\"id\":8,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709186276\",\"params\":{},\"payTime\":\"2024-02-29\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-02 12:23:13', 6);
INSERT INTO `sys_oper_log` VALUES (555, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'guke', NULL, '/car/17', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-02 12:23:49', 9);
INSERT INTO `sys_oper_log` VALUES (556, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'guke', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"123\",\"evaCreate\":\"2024-05-02\",\"evaGoodsname\":\"餐饮1套餐\",\"evaId\":9,\"evaUsername\":\"guke\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-02 12:24:24', 9);
INSERT INTO `sys_oper_log` VALUES (557, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2024/05/03/book_20240503191331A001.jpg\",\"code\":200}', 0, NULL, '2024-05-03 19:13:31', 181);
INSERT INTO `sys_oper_log` VALUES (558, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024030122001456070502381551\",\"createTime\":\"2024-03-01 11:35:18\",\"goodsId\":0,\"id\":9,\"name\":\"admin房间1号\",\"orderId\":\"1709264071\",\"params\":{},\"payTime\":\"2024-03-13\",\"state\":\"TRADE_SUCCESS\",\"total\":55.5,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 19:27:20', 13);
INSERT INTO `sys_oper_log` VALUES (559, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'guke', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮2套餐\",\"carPrices\":1,\"carQuantity\":\"1\",\"carUsername\":\"guke\",\"id\":18,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:08:57', 11);
INSERT INTO `sys_oper_log` VALUES (560, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'guke', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-05-15 00:00:00\",\"roomDate2\":\"2024-05-16 00:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/18/14584563_20240318155747A003.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"3\",\"roomUsename\":\"guke\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:09:42', 9);
INSERT INTO `sys_oper_log` VALUES (561, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'guke', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"美味可口\",\"evaCreate\":\"2024-05-14\",\"evaGoodsname\":\"餐饮1套餐\",\"evaId\":10,\"evaUsername\":\"guke\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:10:27', 7);
INSERT INTO `sys_oper_log` VALUES (562, '菜品评价', 3, 'com.ruoyi.system.controller.SysEvaController.remove()', 'DELETE', 1, 'guke', NULL, '/eva/9', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:10:29', 4);
INSERT INTO `sys_oper_log` VALUES (563, '菜品评价', 3, 'com.ruoyi.system.controller.SysEvaController.remove()', 'DELETE', 1, 'guke', NULL, '/eva/8', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:10:31', 3);
INSERT INTO `sys_oper_log` VALUES (564, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":10,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/05/14/s3_20240514201204A001.jpg\",\"goodsName\":\"餐饮9套餐\",\"goodsPrice\":150.0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:12:05', 9);
INSERT INTO `sys_oper_log` VALUES (565, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":10,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/05/14/s3_20240514201204A001.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮9套餐\",\"goodsPrice\":150.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:12:13', 3);
INSERT INTO `sys_oper_log` VALUES (566, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":10,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/05/14/s3_20240514201204A001.jpg\",\"goodsLikes\":0,\"goodsName\":\"餐饮9套餐\",\"goodsPrice\":150.0,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:12:14', 3);
INSERT INTO `sys_oper_log` VALUES (567, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'yuangong', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":11,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/05/14/f3_20240514201244A002.jpg\",\"roomInfo\":\"大桌,6人房\",\"roomName\":\"房间10号\",\"roomPrices\":200}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:12:45', 3);
INSERT INTO `sys_oper_log` VALUES (568, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'yuangong', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":11,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/05/14/f3_20240514201244A002.jpg\",\"roomInfo\":\"大桌,6人房\",\"roomName\":\"房间10号\",\"roomPrices\":200,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:12:50', 3);
INSERT INTO `sys_oper_log` VALUES (569, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'yuangong', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":11,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/05/14/f3_20240514201244A002.jpg\",\"roomInfo\":\"大桌,6人房\",\"roomName\":\"房间10号\",\"roomPrices\":200,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:12:52', 3);
INSERT INTO `sys_oper_log` VALUES (570, '交易订单', 5, 'com.ruoyi.system.controller.SysOrderController.export()', 'POST', 1, 'yuangong', NULL, '/order/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-05-14 20:13:08', 675);
INSERT INTO `sys_oper_log` VALUES (571, '用户管理', 6, 'com.ruoyi.system.controller.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/user/importData', '127.0.0.1', '', '{\"updateSupport\":\"0\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 ceshi2 导入成功\",\"code\":200}', 0, NULL, '2024-05-14 20:14:04', 651);
INSERT INTO `sys_oper_log` VALUES (572, '用户管理', 3, 'com.ruoyi.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/user/110', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:14:09', 20);
INSERT INTO `sys_oper_log` VALUES (573, '通知公告', 1, 'com.ruoyi.system.controller.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>无</p>\",\"noticeTitle\":\"测试\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:15:06', 7);
INSERT INTO `sys_oper_log` VALUES (574, '通知公告', 3, 'com.ruoyi.system.controller.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/notice/11', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-14 20:15:12', 7);
INSERT INTO `sys_oper_log` VALUES (575, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"email\":\"huiyv11@163.com\",\"nickName\":\"老板\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 09:52:33', 29);
INSERT INTO `sys_oper_log` VALUES (576, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"email\":\"huiyv1@163.com\",\"nickName\":\"老板\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 09:52:37', 8);
INSERT INTO `sys_oper_log` VALUES (577, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'admin', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"10\",\"carUsername\":\"admin\",\"id\":19,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 09:54:35', 20);
INSERT INTO `sys_oper_log` VALUES (578, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'admin', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024030122001456070502381551\",\"createTime\":\"2024-03-01 11:35:18\",\"getDate\":\"2024-05-17\",\"goodsId\":1,\"id\":9,\"location\":\"堂食\",\"name\":\"admin房间1号\",\"orderId\":\"1709264071\",\"params\":{},\"payTime\":\"2024-03-13\",\"state\":\"TRADE_SUCCESS\",\"total\":55.5,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 09:55:12', 8);
INSERT INTO `sys_oper_log` VALUES (579, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'guke6', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2024/05/16/avatar_20240516133332A001.png\",\"code\":200}', 0, NULL, '2024-05-16 13:33:32', 336);
INSERT INTO `sys_oper_log` VALUES (580, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'guke6', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮1套餐\",\"carPrices\":50,\"carQuantity\":\"2\",\"carUsername\":\"guke6\",\"id\":20,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 13:34:38', 14);
INSERT INTO `sys_oper_log` VALUES (581, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'guke6', NULL, '/car/18', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 13:34:53', 6);
INSERT INTO `sys_oper_log` VALUES (582, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'guke6', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024031822001456070502563428\",\"createTime\":\"2024-03-18 15:54:41\",\"getDate\":\"2024-05-17\",\"goodsId\":1,\"id\":17,\"location\":\"堂食\",\"name\":\"guke6餐饮1套餐\",\"orderId\":\"1710748458\",\"params\":{},\"payTime\":\"2024-03-21\",\"state\":\"TRADE_SUCCESS\",\"total\":50,\"userName\":\"guke6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 13:35:38', 13);
INSERT INTO `sys_oper_log` VALUES (583, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'guke6', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"好吃\",\"evaCreate\":\"2024-05-16\",\"evaGoodsname\":\"餐饮1套餐\",\"evaId\":11,\"evaUsername\":\"guke6\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 13:36:12', 11);
INSERT INTO `sys_oper_log` VALUES (584, '商品管理', 3, 'com.ruoyi.system.controller.SysGoodsGlController.remove()', 'DELETE', 1, 'yuangong', NULL, '/gl/2', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 13:36:47', 7);
INSERT INTO `sys_oper_log` VALUES (585, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/04/13/s3_20240413002849A001.jpg\",\"goodsLikes\":20,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 13:36:51', 10);
INSERT INTO `sys_oper_log` VALUES (586, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'yuangong', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-05-15 00:00:00\",\"roomDate2\":\"2024-05-16 00:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/18/14584563_20240318155747A003.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"1\",\"roomUsename\":\"guke\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 13:37:30', 10);
INSERT INTO `sys_oper_log` VALUES (587, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'yuangong', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024030122001456070502393193\",\"createTime\":\"2024-03-01 16:36:52\",\"goodsId\":0,\"id\":10,\"name\":\"admin餐饮1套餐\",\"orderId\":\"1709282188\",\"params\":{},\"payTime\":\"2024-03-14\",\"state\":\"TRADE_SUCCESS\",\"total\":200,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 13:37:51', 5);
INSERT INTO `sys_oper_log` VALUES (588, '用户管理', 6, 'com.ruoyi.system.controller.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/user/importData', '127.0.0.1', '', '{\"updateSupport\":\"0\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 ceshi2 导入成功\",\"code\":200}', 0, NULL, '2024-05-16 13:38:24', 980);
INSERT INTO `sys_oper_log` VALUES (589, '用户管理', 3, 'com.ruoyi.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/user/111', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 13:38:33', 52);
INSERT INTO `sys_oper_log` VALUES (590, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":5,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/04/760466_0_9-_20240304172459A001.jpg\",\"roomInfo\":\"大桌,6人房\",\"roomName\":\"房间3号\",\"roomPrices\":100,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 13:42:08', 5);
INSERT INTO `sys_oper_log` VALUES (591, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":5,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/04/760466_0_9-_20240304172459A001.jpg\",\"roomInfo\":\"大桌,6人房\",\"roomName\":\"房间3号\",\"roomPrices\":100,\"roomStatus\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 13:42:14', 4);
INSERT INTO `sys_oper_log` VALUES (592, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'as1', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2024/05/23/1-1Z426133503_20240523163250A001.jpg\",\"code\":200}', 0, NULL, '2024-05-23 16:32:50', 319);
INSERT INTO `sys_oper_log` VALUES (593, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'as1', NULL, '/user/profile/updatePwd', '127.0.0.1', '', '{}', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2024-05-23 16:33:03', 84);
INSERT INTO `sys_oper_log` VALUES (594, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'as1', NULL, '/user/profile/updatePwd', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:33:09', 229);
INSERT INTO `sys_oper_log` VALUES (595, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'qw1', NULL, '/user/profile/updatePwd', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:35:06', 225);
INSERT INTO `sys_oper_log` VALUES (596, '购物车', 1, 'com.ruoyi.system.controller.SysCarController.add()', 'POST', 1, 'qw1', NULL, '/car', '127.0.0.1', '', '{\"carName\":\"餐饮3套餐\",\"carPrices\":3,\"carQuantity\":\"1\",\"carUsername\":\"qw1\",\"id\":21,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:35:27', 11);
INSERT INTO `sys_oper_log` VALUES (597, '购物车', 3, 'com.ruoyi.system.controller.SysCarController.remove()', 'DELETE', 1, 'qw1', NULL, '/car/19,20,21', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:36:08', 4);
INSERT INTO `sys_oper_log` VALUES (598, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'qw1', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024052322001456070503267188\",\"createTime\":\"2024-05-23 16:35:59\",\"getDate\":\"2024-05-24\",\"goodsId\":1,\"id\":26,\"location\":\"堂食\",\"name\":\"qw1食物商品\",\"orderId\":\"1716453340\",\"params\":{},\"payTime\":\"2024-05-23\",\"state\":\"TRADE_SUCCESS\",\"total\":3,\"userName\":\"qw1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:36:38', 6);
INSERT INTO `sys_oper_log` VALUES (599, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'qw1', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomDate1\":\"2024-05-23 16:36:50\",\"roomDate2\":\"2024-05-24 00:00:00\",\"roomId\":3,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/03/18/14584563_20240318155747A003.jpg\",\"roomInfo\":\"6人房,大桌\",\"roomName\":\"房间1号\",\"roomPrices\":55.5,\"roomStatus\":\"3\",\"roomUsename\":\"qw1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:36:54', 9);
INSERT INTO `sys_oper_log` VALUES (600, '菜品评价', 1, 'com.ruoyi.system.controller.SysEvaController.add()', 'POST', 1, 'qw1', NULL, '/eva', '127.0.0.1', '', '{\"evaContents\":\"好吃\",\"evaCreate\":\"2024-05-23\",\"evaGoodsname\":\"餐饮3套餐\",\"evaId\":12,\"evaUsername\":\"qw1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:37:26', 8);
INSERT INTO `sys_oper_log` VALUES (601, '商品管理', 1, 'com.ruoyi.system.controller.SysGoodsGlController.add()', 'POST', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":11,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/05/23/201307241514163757_20240523163801A002.jpg\",\"goodsName\":\"商品99\",\"goodsPrice\":222.0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:38:01', 8);
INSERT INTO `sys_oper_log` VALUES (602, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":11,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/05/23/201307241514163757_20240523163801A002.jpg\",\"goodsLikes\":0,\"goodsName\":\"商品99\",\"goodsPrice\":2.0,\"goodsStatus\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:38:08', 3);
INSERT INTO `sys_oper_log` VALUES (603, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":11,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/05/23/201307241514163757_20240523163801A002.jpg\",\"goodsLikes\":0,\"goodsName\":\"商品99\",\"goodsPrice\":2.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:38:13', 4);
INSERT INTO `sys_oper_log` VALUES (604, '商品管理', 2, 'com.ruoyi.system.controller.SysGoodsGlController.edit()', 'PUT', 1, 'yuangong', NULL, '/gl', '127.0.0.1', '', '{\"goodsId\":1,\"goodsImg\":\"http://127.0.0.1:9300/statics/2024/04/13/s3_20240413002849A001.jpg\",\"goodsLikes\":20,\"goodsName\":\"餐饮1套餐\",\"goodsPj\":\"此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。\",\"goodsPrice\":50.0,\"goodsStatus\":\"1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:38:15', 3);
INSERT INTO `sys_oper_log` VALUES (605, '房间', 1, 'com.ruoyi.system.controller.SysRoomInfoController.add()', 'POST', 1, 'yuangong', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":12,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/05/23/14584563_20240523163830A003.jpg\",\"roomInfo\":\"5人房,小桌\",\"roomName\":\"房间88\",\"roomPrices\":99}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:38:31', 4);
INSERT INTO `sys_oper_log` VALUES (606, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'yuangong', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":12,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/05/23/14584563_20240523163830A003.jpg\",\"roomInfo\":\"5人房,小桌\",\"roomName\":\"房间88\",\"roomPrices\":9999,\"roomStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:38:37', 4);
INSERT INTO `sys_oper_log` VALUES (607, '房间', 2, 'com.ruoyi.system.controller.SysRoomInfoController.edit()', 'PUT', 1, 'yuangong', NULL, '/info', '127.0.0.1', '', '{\"params\":{},\"roomId\":12,\"roomImg\":\"http://127.0.0.1:9300/statics/2024/05/23/14584563_20240523163830A003.jpg\",\"roomInfo\":\"5人房,小桌\",\"roomName\":\"房间88\",\"roomPrices\":9999,\"roomStatus\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:38:41', 4);
INSERT INTO `sys_oper_log` VALUES (608, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'yuangong', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024031822001456070502555038\",\"createTime\":\"2024-03-18 15:44:04\",\"goodsId\":0,\"id\":16,\"name\":\"guke5餐饮1套餐\",\"orderId\":\"1710747830\",\"params\":{},\"payTime\":\"2024-03-20\",\"state\":\"3\",\"total\":500,\"userName\":\"guke5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:38:53', 3);
INSERT INTO `sys_oper_log` VALUES (609, '交易订单', 2, 'com.ruoyi.system.controller.SysOrderController.edit()', 'PUT', 1, 'yuangong', NULL, '/order', '127.0.0.1', '', '{\"alipayNo\":\"2024052322001456070503267188\",\"createTime\":\"2024-05-23 16:35:59\",\"getDate\":\"2024-05-24\",\"goodsId\":1,\"id\":26,\"location\":\"堂食\",\"name\":\"qw1食物商品\",\"orderId\":\"1716453340\",\"params\":{},\"payTime\":\"2024-05-23\",\"state\":\"3\",\"total\":3,\"userName\":\"qw1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:38:59', 4);
INSERT INTO `sys_oper_log` VALUES (610, '用户管理', 5, 'com.ruoyi.system.controller.SysUserController.export()', 'POST', 1, 'admin', NULL, '/user/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"2\"}', NULL, 0, NULL, '2024-05-23 16:39:30', 811);
INSERT INTO `sys_oper_log` VALUES (611, '用户管理', 6, 'com.ruoyi.system.controller.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/user/importData', '127.0.0.1', '', '{\"updateSupport\":\"0\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 ceshi2 导入成功\",\"code\":200}', 0, NULL, '2024-05-23 16:39:41', 254);
INSERT INTO `sys_oper_log` VALUES (612, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-05-23 16:39:41\",\"delFlag\":\"0\",\"email\":\"4558995@qq.com\",\"loginIp\":\"\",\"nickName\":\"ceshi2\",\"params\":{},\"phonenumber\":\"15866654444\",\"postIds\":[3],\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":115,\"userName\":\"ceshi2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:39:49', 17);
INSERT INTO `sys_oper_log` VALUES (613, '用户管理', 3, 'com.ruoyi.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/user/115', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:39:52', 14);
INSERT INTO `sys_oper_log` VALUES (614, '通知公告', 1, 'com.ruoyi.system.controller.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>下周放假</p>\",\"noticeTitle\":\"放假通知\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:40:22', 7);
INSERT INTO `sys_oper_log` VALUES (615, '通知公告', 2, 'com.ruoyi.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-23 16:40:22\",\"noticeContent\":\"<p>下周不放假</p>\",\"noticeId\":12,\"noticeTitle\":\"放假通知\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:40:34', 3);
INSERT INTO `sys_oper_log` VALUES (616, '通知公告', 3, 'com.ruoyi.system.controller.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/notice/12', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-23 16:40:37', 7);

/*

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (9, 5, 'Goods_id', '商品id', 'int', 'Long', 'goodsId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (10, 5, 'Goods_name', '商品名', 'varchar(50)', 'String', 'goodsName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (11, 5, 'Goods_price', '商品价格', 'double(10,2)', 'Double', 'goodsPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (12, 5, 'Goods_status', '商品状态', 'varchar(50)', 'String', 'goodsStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'goods_status', 4, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (13, 5, 'Goods_pj', '商品评价', 'varchar(255)', 'String', 'goodsPj', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (14, 5, 'Goods_likes', '商品喜欢度', 'int', 'Long', 'goodsLikes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (15, 5, 'Goods_img', '商品图片', 'varchar(255)', 'String', 'goodsImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 7, 'admin', '2024-02-25 08:46:30', '', '2024-02-25 08:56:18');
INSERT INTO `gen_table_column` VALUES (41, 9, 'id', '购物车Id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-02-28 12:29:25', '', '2024-02-28 12:31:36');
INSERT INTO `gen_table_column` VALUES (42, 9, 'car_name', '购物车商品名', 'varchar(255)', 'String', 'carName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-02-28 12:29:25', '', '2024-02-28 12:31:36');
INSERT INTO `gen_table_column` VALUES (43, 9, 'car_quantity', '购物车商品数量', 'varchar(255)', 'String', 'carQuantity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-02-28 12:29:25', '', '2024-02-28 12:31:36');
INSERT INTO `gen_table_column` VALUES (44, 9, 'car_prices', '购物车商品价格', 'double(10,2)', 'BigDecimal', 'carPrices', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-02-28 12:29:25', '', '2024-02-28 12:31:36');
INSERT INTO `gen_table_column` VALUES (45, 9, 'car_username', '购物车主姓名', 'varchar(255)', 'String', 'carUsername', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-02-28 12:29:25', '', '2024-02-28 12:31:36');
INSERT INTO `gen_table_column` VALUES (46, 10, 'id', NULL, 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (47, 10, 'user_name', '购买人', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (48, 10, 'name', '订单名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (49, 10, 'order_id', '订单id', 'varchar(255)', 'String', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (50, 10, 'alipay_no', '支付宝订单号', 'varchar(255)', 'String', 'alipayNo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (51, 10, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (52, 10, 'pay_time', '更新时间', 'datetime', 'Date', 'payTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (53, 10, 'goods_id', '商品id', 'int', 'Long', 'goodsId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (54, 10, 'total', '总价格', 'double(10,2)', 'BigDecimal', 'total', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (55, 10, 'state', '状态', 'varchar(255)', 'String', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_order2_state', 10, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (56, 10, 'location', '配送地址', 'varchar(255)', 'String', 'location', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (57, 10, 'get_date', '配送日期', 'datetime', 'Date', 'getDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2024-02-29 14:27:51', '', '2024-02-29 15:08:24');
INSERT INTO `gen_table_column` VALUES (66, 12, 'room_id', '主键', 'int', 'Long', 'roomId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, 12, 'room_name', '房间名称', 'varchar(255)', 'String', 'roomName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, 12, 'room_info', '房间信息', 'varchar(255)', 'String', 'roomInfo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, 12, 'room_prices', '房间价格', 'double(10,2)', 'BigDecimal', 'roomPrices', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, 12, 'room_status', '房间状态', 'varchar(255)', 'String', 'roomStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, 12, 'room_img', '房间图片', 'varchar(255)', 'String', 'roomImg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, 12, 'room_date1', '房间开始时间', 'datetime', 'Date', 'roomDate1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, 12, 'room_date2', '房间到期时间', 'datetime', 'Date', 'roomDate2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, 12, 'room_usename', '房间订购者', 'varchar(255)', 'String', 'roomUsename', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 9, 'admin', '2024-03-01 10:14:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, 14, 'eva_id', '评价ID', 'int', 'Long', 'evaId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-01 14:07:49', '', '2024-03-01 14:46:29');
INSERT INTO `gen_table_column` VALUES (82, 14, 'eva_username', '评价者', 'varchar(255)', 'String', 'evaUsername', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-03-01 14:07:49', '', '2024-03-01 14:46:29');
INSERT INTO `gen_table_column` VALUES (83, 14, 'eva_goodsname', '被评价商品', 'varchar(255)', 'String', 'evaGoodsname', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-03-01 14:07:49', '', '2024-03-01 14:46:29');
INSERT INTO `gen_table_column` VALUES (84, 14, 'eva_contents', '评价内容', 'text', 'String', 'evaContents', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2024-03-01 14:07:49', '', '2024-03-01 14:46:29');
INSERT INTO `gen_table_column` VALUES (85, 14, 'eva_userimg', '评价头像', 'varchar(255)', 'String', 'evaUserimg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'fileUpload', '', 5, 'admin', '2024-03-01 14:07:49', '', '2024-03-01 14:46:29');
INSERT INTO `gen_table_column` VALUES (86, 14, 'eva_create', '评价日期', 'date', 'Date', 'evaCreate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-03-01 14:07:50', '', '2024-03-01 14:46:29');

-- ----------------------------
-- Table structure for sys_car
-- ----------------------------
DROP TABLE IF EXISTS `sys_car`;
CREATE TABLE `sys_car`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '购物车Id',
  `car_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '购物车商品名',
  `car_quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '购物车商品数量',
  `car_prices` double(10, 2) NULL DEFAULT NULL COMMENT '购物车商品价格',
  `car_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '购物车主姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_car
-- ----------------------------

-- ----------------------------
-- Table structure for sys_car_copy1
-- ----------------------------
DROP TABLE IF EXISTS `sys_car_copy1`;
CREATE TABLE `sys_car_copy1`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '购物车Id',
  `car_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '购物车商品名',
  `car_quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '购物车商品数量',
  `car_prices` double(10, 2) NULL DEFAULT NULL COMMENT '购物车商品价格',
  `car_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '购物车主姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_car_copy1
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-02-24 21:23:52', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-02-24 21:23:52', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-02-24 21:23:52', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-02-24 21:23:52', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-02-24 21:23:52', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '惠誉酒店', 0, '老板', '15888888888', 'huiyv@qq.com', '0', '0', 'admin', '2024-02-24 21:23:52', 'admin', '2024-02-25 10:38:02');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '天津店', 1, '老板', '15888888888', 'huiyv@qq.com', '0', '0', 'admin', '2024-02-24 21:23:52', 'admin', '2024-02-25 10:40:52');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '总管部门', 1, '老板', '15888888888', 'huiyv@qq.com', '0', '0', 'admin', '2024-02-24 21:23:52', 'admin', '2024-02-25 10:41:15');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '营销部门', 3, '员工', '15888888888', 'yg@qq.com', '0', '0', 'admin', '2024-02-24 21:23:52', 'admin', '2024-02-25 10:41:36');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-02-24 21:23:52', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '未上架', '0', 'goods_status', NULL, 'warning', 'N', '0', 'admin', '2024-02-25 08:49:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '已上架', '1', 'goods_status', NULL, 'success', 'N', '0', 'admin', '2024-02-25 08:49:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 2, '已下架', '2', 'goods_status', NULL, 'danger', 'N', '0', 'admin', '2024-02-25 08:50:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '未上架', '0', 'sys_room_status', NULL, 'warning', 'N', '0', 'admin', '2024-02-25 16:31:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '已上架', '1', 'sys_room_status', NULL, 'success', 'N', '0', 'admin', '2024-02-25 16:31:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 2, '已下架', '2', 'sys_room_status', NULL, 'danger', 'N', '0', 'admin', '2024-02-25 16:32:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 4, '已预约', '3', 'sys_room_status', NULL, 'primary', 'N', '0', 'admin', '2024-02-25 16:32:27', 'admin', '2024-02-25 16:32:34', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 5, '空闲', '4', 'sys_room_status', NULL, 'info', 'N', '0', 'admin', '2024-02-25 16:33:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '6人房', '6人房', 'sys_room_info', NULL, 'default', 'N', '0', 'admin', '2024-02-26 11:43:21', 'admin', '2024-02-26 12:04:32', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '5人房', '5人房', 'sys_room_info', NULL, 'default', 'N', '0', 'admin', '2024-02-26 11:43:50', 'admin', '2024-02-26 12:04:37', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '大桌', '大桌', 'sys_room_info', NULL, 'default', 'N', '0', 'admin', '2024-02-26 11:44:24', 'admin', '2024-02-26 12:04:40', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '小桌', '小桌', 'sys_room_info', NULL, 'default', 'N', '0', 'admin', '2024-02-26 11:44:34', 'admin', '2024-02-26 12:04:43', NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, '未支付', '0', 'sys_order_statu', NULL, 'danger', 'N', '0', 'admin', '2024-02-26 21:10:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, '已支付', '1', 'sys_order_statu', NULL, 'success', 'N', '0', 'admin', '2024-02-26 21:10:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 1, '已支付', 'TRADE_SUCCESS', 'sys_order2_state', NULL, 'success', 'N', '0', 'admin', '2024-02-28 11:21:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 1, '已退款', '1', 'sys_order2_state', NULL, 'danger', 'N', '0', 'admin', '2024-02-28 11:21:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 2, '未支付', '2', 'sys_order2_state', NULL, 'primary', 'N', '0', 'admin', '2024-02-28 11:22:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 3, '已配送', '3', 'sys_order2_state', NULL, 'success', 'N', '0', 'admin', '2024-02-29 14:44:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 0, '已取消', '4', 'sys_order2_state', NULL, 'warning', 'N', '0', 'admin', '2024-02-29 14:44:49', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '商品状态', 'goods_status', '0', 'admin', '2024-02-25 08:48:39', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '房间状态', 'sys_room_status', '0', 'admin', '2024-02-25 16:30:33', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '房间信息标签', 'sys_room_info', '0', 'admin', '2024-02-26 11:15:37', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '订单信息', 'sys_order_statu', '0', 'admin', '2024-02-26 21:09:45', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '支付订单状态', 'sys_order2_state', '0', 'admin', '2024-02-28 11:20:59', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_eva
-- ----------------------------
DROP TABLE IF EXISTS `sys_eva`;
CREATE TABLE `sys_eva`  (
  `eva_id` int NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `eva_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评价者',
  `eva_goodsname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '被评价商品',
  `eva_contents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评价内容',
  `eva_userimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评价头像',
  `eva_create` date NULL DEFAULT NULL COMMENT '评价日期',
  PRIMARY KEY (`eva_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_eva
-- ----------------------------
INSERT INTO `sys_eva` VALUES (3, 'admin', '餐饮1套餐', '好吃的！', NULL, '2024-03-01');
INSERT INTO `sys_eva` VALUES (4, 'admin', '餐饮1套餐', '我觉得可以第二次吃了', NULL, '2024-03-01');
INSERT INTO `sys_eva` VALUES (5, 'admin', '餐饮2套餐', '不好吃', NULL, '2024-03-01');
INSERT INTO `sys_eva` VALUES (6, 'admin', '餐饮1套餐', '可以的', NULL, '2024-03-01');
INSERT INTO `sys_eva` VALUES (7, 'guke5', '餐饮1套餐', '不好吃', NULL, '2024-03-18');
INSERT INTO `sys_eva` VALUES (10, 'guke', '餐饮1套餐', '美味可口', NULL, '2024-05-14');
INSERT INTO `sys_eva` VALUES (11, 'guke6', '餐饮1套餐', '好吃', NULL, '2024-05-16');
INSERT INTO `sys_eva` VALUES (12, 'qw1', '餐饮3套餐', '好吃', NULL, '2024-05-23');

-- ----------------------------
-- Table structure for sys_goods_gl
-- ----------------------------
DROP TABLE IF EXISTS `sys_goods_gl`;
CREATE TABLE `sys_goods_gl`  (
  `Goods_id` int NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `Goods_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名',
  `Goods_price` double(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `Goods_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '商品状态',
  `Goods_pj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品评价',
  `Goods_likes` int NULL DEFAULT 0 COMMENT '商品喜欢度',
  `Goods_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`Goods_id`, `Goods_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_goods_gl
-- ----------------------------
INSERT INTO `sys_goods_gl` VALUES (1, '餐饮1套餐', 50.00, '1', '此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。', 20, 'http://127.0.0.1:9300/statics/2024/04/13/s3_20240413002849A001.jpg');
INSERT INTO `sys_goods_gl` VALUES (3, '餐饮3套餐', 3.00, '1', '此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。', 6, 'http://127.0.0.1:9300/statics/2024/03/04/shiwu1_20240304172837A004.jpg');
INSERT INTO `sys_goods_gl` VALUES (4, '餐饮4套餐', 5.20, '2', '此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。', 0, 'http://127.0.0.1:9300/statics/2024/03/04/shiwu2_20240304172842A005.jpg');
INSERT INTO `sys_goods_gl` VALUES (5, '餐饮5套餐', 5.50, '1', '此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。', 0, 'http://127.0.0.1:9300/statics/2024/03/04/QJ8241778073_20240304172848A006.jpg');
INSERT INTO `sys_goods_gl` VALUES (6, '餐饮6套餐', 6.60, '2', '此套餐包为含肉套餐，包括鸡肉，鸭肉，牛肉等，如有对肉类不适者请谨慎购买。', 0, 'http://127.0.0.1:9300/statics/2024/03/04/201307241514163757_20240304172854A007.jpg');
INSERT INTO `sys_goods_gl` VALUES (8, '餐饮8套餐', 50.00, '2', NULL, 0, 'http://127.0.0.1:9300/statics/2024/03/04/shiwu1_20240304172858A008.jpg');
INSERT INTO `sys_goods_gl` VALUES (9, '餐饮10', 2.00, '0', NULL, 0, 'http://127.0.0.1:9300/statics/2024/03/18/shiwu1_20240318155704A002.jpg');
INSERT INTO `sys_goods_gl` VALUES (10, '餐饮9套餐', 150.00, '2', NULL, 0, 'http://127.0.0.1:9300/statics/2024/05/14/s3_20240514201204A001.jpg');
INSERT INTO `sys_goods_gl` VALUES (11, '商品99', 2.00, '1', NULL, 0, 'http://127.0.0.1:9300/statics/2024/05/23/201307241514163757_20240523163801A002.jpg');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-02-24 21:23:52', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`access_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 303 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

*/

-- ----------------------------
-- Table structure for sys_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '购买人',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单名称',
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单id',
  `alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付宝订单号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `pay_time` datetime NOT NULL COMMENT '更新时间',
  `goods_id` int NULL DEFAULT 0 COMMENT '商品id',
  `total` double(10, 2) NULL DEFAULT NULL COMMENT '总价格',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配送地址',
  `get_date` datetime NULL DEFAULT NULL COMMENT '配送日期',
  `eva_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评价状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付宝订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_order
-- ----------------------------
INSERT INTO `sys_order` VALUES (4, 'admin', 'admin餐饮1套餐', '1709093303', '2024022822001456070502363065', '2024-02-28 12:09:09', '2024-02-28 00:00:00', 1, 50.00, '3', 'xxxxx', '2024-03-01 00:00:00', NULL);
INSERT INTO `sys_order` VALUES (8, 'admin', 'admin餐饮1套餐', '1709186276', '2024022922001456070502375245', '2024-02-29 13:58:12', '2024-02-29 00:00:00', 0, 50.00, 'TRADE_SUCCESS', NULL, '2024-02-14 00:00:00', NULL);
INSERT INTO `sys_order` VALUES (9, 'admin', 'admin房间1号', '1709264071', '2024030122001456070502381551', '2024-03-01 11:35:18', '2024-03-13 00:00:00', 1, 55.50, 'TRADE_SUCCESS', '堂食', '2024-05-17 00:00:00', NULL);
INSERT INTO `sys_order` VALUES (10, 'admin', 'admin餐饮1套餐', '1709282188', '2024030122001456070502393193', '2024-03-01 16:36:52', '2024-03-14 00:00:00', 0, 200.00, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (11, 'admin', 'admin食物商品', '1709282233', '2024030122001456070502383221', '2024-03-01 16:37:30', '2024-03-15 16:37:28', 0, 350.00, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (12, 'admin', 'admin房间2号', '1709282299', '2024030122001456070502385989', '2024-03-01 16:38:34', '2024-03-16 16:38:32', 0, 99.90, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (13, 'guke', 'guke2餐饮1套餐', '1710747230', '2024031822001456070502556372', '2024-03-18 15:34:31', '2024-03-17 00:00:00', 0, 500.00, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (14, 'guke2', 'guke2餐饮1套餐', '1710747659', '2024031822001456070502560684', '2024-03-18 15:41:16', '2024-03-18 00:00:00', 1, 50.00, 'TRADE_SUCCESS', '堂食', '2024-03-19 00:00:00', NULL);
INSERT INTO `sys_order` VALUES (15, 'guke5', 'guke5餐饮1套餐', '1710747804', '2024031822001456070502553237', '2024-03-18 15:43:40', '2024-03-19 15:43:37', 0, 50.00, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (16, 'guke5', 'guke5餐饮1套餐', '1710747830', '2024031822001456070502555038', '2024-03-18 15:44:04', '2024-03-20 00:00:00', 0, 500.00, '3', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (17, 'guke6', 'guke6餐饮1套餐', '1710748458', '2024031822001456070502563428', '2024-03-18 15:54:41', '2024-03-21 00:00:00', 1, 50.00, 'TRADE_SUCCESS', '堂食', '2024-05-17 00:00:00', NULL);
INSERT INTO `sys_order` VALUES (18, 'guke6', 'guke6餐饮1套餐', '1710748494', '2024031822001456070502553238', '2024-03-18 15:55:09', '2024-03-22 15:55:06', 0, 50.00, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (21, 'guke', 'guke餐饮1套餐', '1712672472', '2024040922001456070502792447', '2024-04-09 22:23:10', '2024-04-09 22:23:07', 0, 100.00, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (22, 'guke', 'guke食物商品', '1715688486', '2024051422001456070503173126', '2024-05-14 20:08:30', '2024-05-14 20:08:26', 0, 50.00, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (23, 'guke', 'guke房间1号', '1715688582', '2024051422001456070503166310', '2024-05-14 20:10:00', '2024-05-14 20:09:57', 0, 55.50, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (24, 'admin', 'admin食物商品', '1715824658', '2024051622001456070503183787', '2024-05-16 09:58:25', '2024-05-16 09:58:22', 0, 50.00, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (25, 'admin', 'admin餐饮2套餐', '1715836725', '2024051622001456070503184930', '2024-05-16 13:19:03', '2024-05-16 13:19:00', 0, 1.00, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (26, 'qw1', 'qw1食物商品', '1716453340', '2024052322001456070503267188', '2024-05-23 16:35:59', '2024-05-23 00:00:00', 1, 3.00, '3', '堂食', '2024-05-24 00:00:00', NULL);
INSERT INTO `sys_order` VALUES (27, 'qw1', 'qw1食物商品', '1716453368', '2024052322001456070503267189', '2024-05-23 16:36:24', '2024-05-23 16:36:22', 0, 603.00, 'TRADE_SUCCESS', NULL, NULL, NULL);
INSERT INTO `sys_order` VALUES (28, 'qw1', 'qw1房间1号', '1716453414', '2024052322001456070503277817', '2024-05-23 16:37:12', '2024-05-23 16:37:10', 0, 55.50, 'TRADE_SUCCESS', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-02-24 21:23:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-02-24 21:23:52', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-02-24 21:23:52', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '员工角色', 'common', 2, '1', 1, 1, '0', '0', 'admin', '2024-02-24 21:23:52', 'admin', '2024-04-10 10:11:10', '普通角色');
INSERT INTO `sys_role` VALUES (100, '顾客', 'guke', 2, '1', 1, 1, '0', '0', 'admin', '2024-02-25 10:43:02', 'admin', '2024-03-26 14:58:02', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2065);
INSERT INTO `sys_role_menu` VALUES (2, 2082);
INSERT INTO `sys_role_menu` VALUES (2, 2083);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2045);
INSERT INTO `sys_role_menu` VALUES (100, 2046);
INSERT INTO `sys_role_menu` VALUES (100, 2053);
INSERT INTO `sys_role_menu` VALUES (100, 2054);
INSERT INTO `sys_role_menu` VALUES (100, 2055);
INSERT INTO `sys_role_menu` VALUES (100, 2056);
INSERT INTO `sys_role_menu` VALUES (100, 2057);
INSERT INTO `sys_role_menu` VALUES (100, 2058);
INSERT INTO `sys_role_menu` VALUES (100, 2059);
INSERT INTO `sys_role_menu` VALUES (100, 2060);
INSERT INTO `sys_role_menu` VALUES (100, 2061);
INSERT INTO `sys_role_menu` VALUES (100, 2062);
INSERT INTO `sys_role_menu` VALUES (100, 2063);
INSERT INTO `sys_role_menu` VALUES (100, 2064);
INSERT INTO `sys_role_menu` VALUES (100, 2066);
INSERT INTO `sys_role_menu` VALUES (100, 2067);
INSERT INTO `sys_role_menu` VALUES (100, 2068);
INSERT INTO `sys_role_menu` VALUES (100, 2069);
INSERT INTO `sys_role_menu` VALUES (100, 2070);
INSERT INTO `sys_role_menu` VALUES (100, 2071);
INSERT INTO `sys_role_menu` VALUES (100, 2072);
INSERT INTO `sys_role_menu` VALUES (100, 2073);
INSERT INTO `sys_role_menu` VALUES (100, 2074);
INSERT INTO `sys_role_menu` VALUES (100, 2075);
INSERT INTO `sys_role_menu` VALUES (100, 2076);
INSERT INTO `sys_role_menu` VALUES (100, 2077);
INSERT INTO `sys_role_menu` VALUES (100, 2078);
INSERT INTO `sys_role_menu` VALUES (100, 2079);

-- ----------------------------
-- Table structure for sys_room_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_room_info`;
CREATE TABLE `sys_room_info`  (
  `room_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `room_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间名称',
  `room_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间信息',
  `room_prices` double(10, 2) NULL DEFAULT NULL COMMENT '房间价格',
  `room_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '房间状态',
  `room_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间图片',
  `room_date1` datetime NULL DEFAULT NULL COMMENT '房间开始时间',
  `room_date2` datetime NULL DEFAULT NULL COMMENT '房间到期时间',
  `room_usename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房间订购者',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '房间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_room_info
-- ----------------------------
INSERT INTO `sys_room_info` VALUES (3, '房间1号', '7人房,大桌', 55.50, '3', 'http://127.0.0.1:9300/statics/2024/03/18/14584563_20240318155747A003.jpg', '2024-05-23 16:36:50', '2024-05-24 00:00:00', 'qw1');
INSERT INTO `sys_room_info` VALUES (4, '房间2号', '4人房,小桌', 99.90, '1', 'http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301160405A015.jpg', '2024-03-01 00:00:00', '2024-03-02 02:00:00', 'admin');
INSERT INTO `sys_room_info` VALUES (5, '房间3号', '大桌,7人房', 100.00, '2', 'http://127.0.0.1:9300/statics/2024/03/04/760466_0_9-_20240304172459A001.jpg', NULL, NULL, NULL);
INSERT INTO `sys_room_info` VALUES (7, '房间4号', '小桌,4人房', 66.00, '1', 'http://127.0.0.1:9300/statics/2024/03/04/fangj1_20240304172537A002.jpg', NULL, NULL, NULL);
INSERT INTO `sys_room_info` VALUES (8, '房间5号', '10人房,大桌', 555.00, '0', 'http://127.0.0.1:9300/statics/2024/03/01/17a5ffde010520228fda610a88fb86c7_20240301160420A018.jpg', NULL, NULL, NULL);
INSERT INTO `sys_room_info` VALUES (9, '房间6号', '大桌,10人房', 99.90, '2', 'http://127.0.0.1:9300/statics/2024/03/01/14584563_20240301162642A022.jpg', NULL, NULL, NULL);
INSERT INTO `sys_room_info` VALUES (10, '房间5', '12人房,大桌', 99.00, '2', 'http://127.0.0.1:9300/statics/2024/03/04/760466_0_9-_20240304172548A003.jpg', NULL, NULL, NULL);
INSERT INTO `sys_room_info` VALUES (11, '房间10号', '大桌,12人房', 200.00, '2', 'http://127.0.0.1:9300/statics/2024/05/14/f3_20240514201244A002.jpg', NULL, NULL, NULL);
INSERT INTO `sys_room_info` VALUES (12, '房间88', '5人房,小桌', 9999.00, '1', 'http://127.0.0.1:9300/statics/2024/05/23/14584563_20240523163830A003.jpg', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '老板', '00', 'huiyv1@163.com', '15888888888', '0', 'http://127.0.0.1:9300/statics/2024/05/03/book_20240503191331A001.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-02-24 21:23:52', 'admin', '2024-02-24 21:23:52', '', '2024-05-16 09:52:37', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'yuangong', '员工', '00', 'yg@qq.com', '15666666668', '1', 'http://127.0.0.1:9300/statics/2024/03/01/book_20240301162415A020.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-02-24 21:23:52', 'admin', '2024-02-24 21:23:52', 'admin', '2024-03-01 16:24:16', '员工');
INSERT INTO `sys_user` VALUES (100, 100, 'AA', 'AA', '00', '', '15800008888', '0', '', '$2a$10$MqItkjvyAXzacPMxYUuV0ONXJN81MOHmZ0bX3.NMWSxjPrT74kMdS', '0', '2', '', NULL, 'admin', '2024-02-24 22:06:05', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, NULL, 'guke', '顾客', '00', 'guke@qq.com', '15788886666', '0', 'http://127.0.0.1:9300/statics/2024/03/01/201307241514163757_20240301162247A019.jpg', '$2a$10$EZ.gt.tyL8EcfSlyhXVtYOkyj1DI9.i9eBsJCN8Fl37HsUsq1gUeC', '0', '0', '', NULL, 'admin', '2024-02-25 10:44:26', 'admin', '2024-03-01 16:22:48', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, 'guke2', 'guke2', '00', '', '', '0', '', '$2a$10$rUkoqHcFI4QH98/2UlklwOiQcNgCXqFyaBcruOurlPni52rBO2Cmy', '0', '0', '', NULL, '', '2024-03-05 10:42:30', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, NULL, 'guke3', 'guke3', '00', '', '', '0', '', '$2a$10$gRVMt67hk4uaNQ5n2Xvun.mEMDwY7q5zfTDHOVCreuaSoyon9M41K', '0', '0', '', NULL, '', '2024-03-05 11:02:28', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (104, NULL, 'guke4', 'guke4', '00', '456@qq.com', '15800005555', '1', '', '$2a$10$EhrADhdHfEE48qAB/aAqMeW3X/epO0FRFds7/zhKJB5mbgTUd.Oje', '0', '0', '', NULL, '', '2024-03-18 15:26:24', '', '2024-03-18 15:27:05', NULL);
INSERT INTO `sys_user` VALUES (105, NULL, 'guke5', 'guke5', '00', '', '', '0', '', '$2a$10$.6zqw9zIoVZKQzWd8GKn3emsayUXAZwiw7jnK6stHIoIX/bM7Szz2', '0', '0', '', NULL, '', '2024-03-18 15:42:57', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (106, NULL, 'guke6', 'guke6', '00', '12355@qq.com', '15800006666', '1', 'http://127.0.0.1:9300/statics/2024/05/16/avatar_20240516133332A001.png', '$2a$10$u9NL7JGzqa3IV2/46g5uLevqwN2gub2QrIrhfJQAUwvVSZAtWMata', '0', '0', '', NULL, '', '2024-03-18 15:53:17', '', '2024-03-18 15:53:53', NULL);
INSERT INTO `sys_user` VALUES (111, NULL, 'ceshi2', 'ceshi2', '00', '4558995@qq.com', '15866654444', '0', '', '$2a$10$sSLC635io3TBVOcpMOJcv.H4qDvTkp.GueYq9qRIbNGvKf8p5T30u', '0', '2', '', NULL, 'admin', '2024-05-16 13:38:24', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (112, NULL, 'cc1', 'cc1', '00', '', '', '0', '', '$2a$10$GcZDVMZDkRpTQG.5EkbFmeMRwpjbeQH0CcT8VospPcQgUMgmrbHiq', '0', '0', '', NULL, '', '2024-05-23 16:30:29', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (113, NULL, 'as1', 'as1', '00', '', '', '0', 'http://127.0.0.1:9300/statics/2024/05/23/1-1Z426133503_20240523163250A001.jpg', '$2a$10$p.ng8iqo982ix6mHDsXGb.pyOnY06VoMZlWptmhUSZ.rqXYxmNxD.', '0', '0', '', NULL, '', '2024-05-23 16:32:19', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (114, NULL, 'qw1', 'qw1', '00', '', '', '0', '', '$2a$10$VfJzNAWCUeP.NOlZYArsJesmlV/zRTOdcZi3NDHSaQ7Bte64ZjLpe', '0', '0', '', NULL, '', '2024-05-23 16:34:40', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (115, NULL, 'ceshi2', 'ceshi2', '00', '4558995@qq.com', '15866654444', '0', '', '$2a$10$zR6/hq932of33WyodqhjzuGMLln5l4EdgWtr2ynaPxJ6ttsIhGvpi', '0', '2', '', NULL, 'admin', '2024-05-23 16:39:41', 'admin', '2024-05-23 16:39:49', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (102, 100);
INSERT INTO `sys_user_role` VALUES (103, 100);
INSERT INTO `sys_user_role` VALUES (104, 100);
INSERT INTO `sys_user_role` VALUES (105, 100);
INSERT INTO `sys_user_role` VALUES (106, 100);
INSERT INTO `sys_user_role` VALUES (112, 100);
INSERT INTO `sys_user_role` VALUES (113, 100);
INSERT INTO `sys_user_role` VALUES (114, 100);

SET FOREIGN_KEY_CHECKS = 1;
