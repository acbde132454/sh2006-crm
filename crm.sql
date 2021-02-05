/*
Navicat MySQL Data Transfer

Source Server         : sh2006
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2021-02-05 11:42:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_activity
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity`;
CREATE TABLE `tbl_activity` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `startDate` char(10) DEFAULT NULL,
  `endDate` char(10) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_activity
-- ----------------------------
INSERT INTO `tbl_activity` VALUES ('0f1bc6610af442cab9e153f9e7850e25', 'c82990f8101a4e51b0e5036e933625ab', '5555', '2020-11-24', '2020-11-17', '10', '23232', '2020-11-21 10:52:56', '小红', '2020-11-21 10:52:56', '小红');
INSERT INTO `tbl_activity` VALUES ('12daf1c351eb494bb68b51410b18b550', 'c82990f8101a4e51b0e5036e933625ab', '8888', '2020-11-16', '2020-11-15', '23232', '44', '2020-11-21 11:13:28', '小红', '2020-11-21 11:13:28', '小红');
INSERT INTO `tbl_activity` VALUES ('2970a89058ea440aabc542f9578908fe', 'f4bc4eac122b4104a4a4a92f6f320733', 'abc', '2020-11-24', '2020-11-25', '32323', '666', '2020-11-21 10:47:44', '小红', '2020-11-21 10:47:44', '小红');
INSERT INTO `tbl_activity` VALUES ('2ad806a870044facbffc7bf554e17c6d', 'c82990f8101a4e51b0e5036e933625ab', '市场调研', '2020-10-26', '2020-11-02', '2343', 'erer', '2020-11-19 16:21:56', '小红', '2020-11-19 16:21:56', '小红');
INSERT INTO `tbl_activity` VALUES ('3030f262b925420cb3ec8b0202be75b8', 'f4bc4eac122b4104a4a4a92f6f320733', '233333', '2020-10-26', '2020-11-09', '33', '333', '2020-11-21 10:54:51', '小红', '2020-11-21 10:54:51', '小红');
INSERT INTO `tbl_activity` VALUES ('713cec73e63f4d359d6ec36bc7a42f4a', 'c82990f8101a4e51b0e5036e933625ab', '2222', '1899-12-03', '2020-11-09', '23232', '222', '2020-11-21 11:11:33', '小红', '2020-11-21 11:11:33', '小红');
INSERT INTO `tbl_activity` VALUES ('92c3fd6a01304de5a07d0e81ae3e1b0a', 'f4bc4eac122b4104a4a4a92f6f320733', '情感问题', '2018-12-03', '2020-11-17', '700', '想开点', '2020-11-17 15:44:56', '小红', '2020-11-17 15:44:56', '小红');
INSERT INTO `tbl_activity` VALUES ('94140659c6d14318bd1e3169fd10185a', 'c82990f8101a4e51b0e5036e933625ab', '222', '2020-11-01', '2020-11-16', '1', '3232', '2020-11-21 10:54:00', '小红', '2020-11-21 10:54:00', '小红');
INSERT INTO `tbl_activity` VALUES ('9d9c5fd64085475395e6ac120669a064', 'f4bc4eac122b4104a4a4a92f6f320733', '美团调研1', '2020-10-10', '2020-10-20', '4000', '很累', null, '小红', null, '小红');
INSERT INTO `tbl_activity` VALUES ('9d9c5fd64085475395e6ac120669a065', 'f4bc4eac122b4104a4a4a92f6f320733', '美团调研2', '2019-10-10', '2019-11-20', '4000', '很累', null, '小红', null, '小红');
INSERT INTO `tbl_activity` VALUES ('9d9c5fd64085475395e6ag120669a065', 'c82990f8101a4e51b0e5036e933625ab', '美团调研3', '2019-10-10', '2019-11-20', '4000', '很累', null, '张三', null, '张三');
INSERT INTO `tbl_activity` VALUES ('b20bdc46774b4bdab3439af7f64b3d67', 'c82990f8101a4e51b0e5036e933625ab', '打桌球', '2020-11-01', '2020-11-09', '10', '一局10', '2020-11-17 15:01:52', '小红', '2020-11-17 15:01:52', '小红');
INSERT INTO `tbl_activity` VALUES ('e0f6affd62404250973ddca4450a30af', 'c82990f8101a4e51b0e5036e933625ab', '宠物', '2020-11-02', '2020-11-17', '23232', 'ttttt', '2020-11-17 14:54:38', '小红', '2020-11-17 14:54:38', '小红');
INSERT INTO `tbl_activity` VALUES ('e55059003eb241e396f2483ebff81669', 'c82990f8101a4e51b0e5036e933625ab', 'a', '2020-11-16', '2020-11-17', '232', 'wewe', '2020-11-17 15:02:29', '小红', '2020-11-17 15:02:29', '小红');
INSERT INTO `tbl_activity` VALUES ('fdad3bdae7ac4c5d9206e2429892bf4f', 'f4bc4eac122b4104a4a4a92f6f320733', '抓老鼠', '2020-11-02', '2020-11-17', '1', '好多老鼠', '2020-11-17 15:00:30', '小红', '2020-11-17 15:00:30', '小红');

-- ----------------------------
-- Table structure for tbl_activity_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity_remark`;
CREATE TABLE `tbl_activity_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL COMMENT '0表示未修改，1表示已修改',
  `activityId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_activity_remark
-- ----------------------------
INSERT INTO `tbl_activity_remark` VALUES ('9bc6e0e2937f4fc0ac2b3df31912853o', '备注110', '2020-11-09', '小红', '2020-11-20 09:23:31', '小红', '1', 'b20bdc46774b4bdab3439af7f64b3d67');
INSERT INTO `tbl_activity_remark` VALUES ('9bc6e0e2937f4fc0ac2b3df31912854m', '备注4', '2020-11-04', '小红', '2020-11-10', '小红', '1', 'b20bdc46774b4bdab3439af7f64b3d67');
INSERT INTO `tbl_activity_remark` VALUES ('9bc6e0e2937f4fc0ac2b3df31912854r', '备注2', '2020-11-09', '小红', '2020-11-11', '小红', '1', 'b20bdc46774b4bdab3439af7f64b3d67');
INSERT INTO `tbl_activity_remark` VALUES ('9bc6e0e2937f4fc0ac2b3df31912854x', '备注5', '2020-11-04', '小红', '2020-11-10', '小红', '1', 'b20bdc46774b4bdab3439af7f64b3d67');
INSERT INTO `tbl_activity_remark` VALUES ('9bc6e0e2937f4fc0ac2b3df31912854y', '备注3', '2020-11-04', '小红', '2020-11-10', '小红', '1', 'b20bdc46774b4bdab3439af7f64b3d67');
INSERT INTO `tbl_activity_remark` VALUES ('9bc6e0e2937f4fc0ac2b3df31912854z', '备注6', '2020-11-04', '小红', '2020-11-20 09:28:02', '小红', '1', 'b20bdc46774b4bdab3439af7f64b3d67');
INSERT INTO `tbl_activity_remark` VALUES ('c22074e4d0fa4df8be99cbcbfcf15c95', '备注7', '2020-11-20 10:14:23', '小红', null, null, '0', 'b20bdc46774b4bdab3439af7f64b3d67');
INSERT INTO `tbl_activity_remark` VALUES ('f9126b59c007430a844cc9e2d126d6b3', '备注8', '2020-11-20 10:25:54', '小红', null, null, '0', 'b20bdc46774b4bdab3439af7f64b3d67');

-- ----------------------------
-- Table structure for tbl_clue
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue`;
CREATE TABLE `tbl_clue` (
  `id` char(32) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `owner` char(32) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `mphone` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_clue
-- ----------------------------
INSERT INTO `tbl_clue` VALUES ('4cc545ef207c48c292c987d23e1b1f44', '李世杰', '小姐姐', 'f4bc4eac122b4104a4a4a92f6f320733', '永辉菜场公司', '管理菜场', '123456@qq.com', '119', 'http://www.baidu.com', '114', '试图联系', '朋友介绍', '小红', '2020-11-30 14:41:59', null, null, '不靠谱', '再说', '2024-02-08', '动力节点');
INSERT INTO `tbl_clue` VALUES ('4cc545ef207c48c292c987d23e1b1fe4', '周明明', '先生', 'f4bc4eac122b4104a4a4a92f6f320733', '万达面包公司', '卖面包的', '3232@qq.com', '110', 'http://www.bjpowernode.com', '120', '虚假线索', '聊天', '小红', '2020-11-21 14:41:59', null, null, '不靠谱', '再说', '2024-02-08', '动力节点');

-- ----------------------------
-- Table structure for tbl_clue_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_activity_relation`;
CREATE TABLE `tbl_clue_activity_relation` (
  `id` char(32) NOT NULL,
  `clueId` char(32) DEFAULT NULL,
  `activityId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_clue_activity_relation
-- ----------------------------
INSERT INTO `tbl_clue_activity_relation` VALUES ('3ca6dd4f5cf54cee808d99c9774d8f9f', '4cc545ef207c48c292c987d23e1b1f44', '3030f262b925420cb3ec8b0202be75b8');
INSERT INTO `tbl_clue_activity_relation` VALUES ('994cc5cca0464a2d8a4fa8dc28a8252d', '4cc545ef207c48c292c987d23e1b1f44', '9d9c5fd64085475395e6ac120669a065');
INSERT INTO `tbl_clue_activity_relation` VALUES ('e4c1ad6e1ddc494dbc869c5d65643905', '4cc545ef207c48c292c987d23e1b1fe4', 'b20bdc46774b4bdab3439af7f64b3d67');
INSERT INTO `tbl_clue_activity_relation` VALUES ('e4c1ad6e1ddc494dbc869c5d65643907', '4cc545ef207c48c292c987d23e1b1f44', '92c3fd6a01304de5a07d0e81ae3e1b0a');
INSERT INTO `tbl_clue_activity_relation` VALUES ('e4c1ad6e1ddc494dbc869c5d65643908', '4cc545ef207c48c292c987d23e1b1f44', 'fdad3bdae7ac4c5d9206e2429892bf4f');

-- ----------------------------
-- Table structure for tbl_clue_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_remark`;
CREATE TABLE `tbl_clue_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `clueId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_clue_remark
-- ----------------------------
INSERT INTO `tbl_clue_remark` VALUES ('172a34c53af745c6adab1bf145572c7a', '333', '小红', '2020-11-21 17:06:55', null, null, '0', '4cc545ef207c48c292c987d23e1b1fe4');
INSERT INTO `tbl_clue_remark` VALUES ('289f20ad9596419184bd169c2df1990e', '666', '小红', '2020-11-21 17:10:58', null, null, '0', '4cc545ef207c48c292c987d23e1b1fe4');
INSERT INTO `tbl_clue_remark` VALUES ('7c9cdd32ad7c4649aca933ecfe05f1bc', '面包房备注88', '小红', '2020-11-21 16:59:49', null, null, '0', '4cc545ef207c48c292c987d23e1b1fe4');
INSERT INTO `tbl_clue_remark` VALUES ('87e59525bce64d78a46e666c9d386e6e', '5555', '小红', '2020-11-21 17:13:15', null, null, '0', '4cc545ef207c48c292c987d23e1b1fe4');
INSERT INTO `tbl_clue_remark` VALUES ('9addeceee5a046f3b4fcb9cfcc662b7f', '444', '小红', '2020-11-21 17:08:28', null, null, '0', '4cc545ef207c48c292c987d23e1b1fe4');
INSERT INTO `tbl_clue_remark` VALUES ('a4d2ac37d6714351b1729cc82325e737', '333', '小红', '2020-11-21 17:15:32', null, null, '0', '4cc545ef207c48c292c987d23e1b1fe4');
INSERT INTO `tbl_clue_remark` VALUES ('b372b5db172443d4911d1570817bf5c1', '面包房备注12(周明明)44', '小红', null, '小红', '2020-11-21 16:43:47', '1', '4cc545ef207c48c292c987d23e1b1fe4');
INSERT INTO `tbl_clue_remark` VALUES ('b372b5db172443d4911d1570817bf5c2', '面包房备注2(周明明)', '小红', null, null, null, null, '4cc545ef207c48c292c987d23e1b1fe4');
INSERT INTO `tbl_clue_remark` VALUES ('b372b5db172443d4911d1570817bf5c3', '面包房备注14(周明明)', '小红', null, '小红', '2020-11-21 16:11:15', '1', '4cc545ef207c48c292c987d23e1b1fe4');
INSERT INTO `tbl_clue_remark` VALUES ('b372b5db172443d4911d1570817bf5c4', '永辉菜场备注3(李世杰)', '小红', null, null, null, null, '4cc545ef207c48c292c987d23e1b1f44');
INSERT INTO `tbl_clue_remark` VALUES ('ea2159e3e07a4ba29049304836a14960', '面包房备注33', '小红', '2020-11-21 16:50:11', null, null, '0', '4cc545ef207c48c292c987d23e1b1fe4');

-- ----------------------------
-- Table structure for tbl_contacts
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts`;
CREATE TABLE `tbl_contacts` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `customerId` char(32) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mphone` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `birth` char(10) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_contacts_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_activity_relation`;
CREATE TABLE `tbl_contacts_activity_relation` (
  `id` char(32) NOT NULL,
  `contactsId` char(32) DEFAULT NULL,
  `activityId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_contacts_activity_relation
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_contacts_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_remark`;
CREATE TABLE `tbl_contacts_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `contactsId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_contacts_remark
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_customer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_customer_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer_remark`;
CREATE TABLE `tbl_customer_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `customerId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_customer_remark
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_type`;
CREATE TABLE `tbl_dic_type` (
  `code` varchar(255) NOT NULL COMMENT '编码是主键，不能为空，不能含有中文。',
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_dic_type
-- ----------------------------
INSERT INTO `tbl_dic_type` VALUES ('appellation', '称呼', '');
INSERT INTO `tbl_dic_type` VALUES ('clueState', '线索状态', '');
INSERT INTO `tbl_dic_type` VALUES ('returnPriority', '回访优先级', '');
INSERT INTO `tbl_dic_type` VALUES ('returnState', '回访状态', '');
INSERT INTO `tbl_dic_type` VALUES ('source', '线索来源', '');
INSERT INTO `tbl_dic_type` VALUES ('stage', '阶段', '');
INSERT INTO `tbl_dic_type` VALUES ('transactionType', '交易类型', '');

-- ----------------------------
-- Table structure for tbl_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_value`;
CREATE TABLE `tbl_dic_value` (
  `id` char(32) NOT NULL COMMENT '主键，采用UUID',
  `value` varchar(255) DEFAULT NULL COMMENT '不能为空，并且要求同一个字典类型下字典值不能重复，具有唯一性。',
  `text` varchar(255) DEFAULT NULL COMMENT '可以为空',
  `orderNo` varchar(255) DEFAULT NULL COMMENT '可以为空，但不为空的时候，要求必须是正整数',
  `typeCode` varchar(255) DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_dic_value
-- ----------------------------
INSERT INTO `tbl_dic_value` VALUES ('06e3cbdf10a44eca8511dddfc6896c55', '虚假线索', '虚假线索', '4', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('0fe33840c6d84bf78df55d49b169a894', '销售邮件', '销售邮件', '8', 'source');
INSERT INTO `tbl_dic_value` VALUES ('12302fd42bd349c1bb768b19600e6b20', '交易会', '交易会', '11', 'source');
INSERT INTO `tbl_dic_value` VALUES ('1615f0bb3e604552a86cde9a2ad45bea', '最高', '最高', '2', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('176039d2a90e4b1a81c5ab8707268636', '教授', '教授', '5', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('1e0bd307e6ee425599327447f8387285', '将来联系', '将来联系', '2', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2173663b40b949ce928db92607b5fe57', '丢失线索', '丢失线索', '5', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2876690b7e744333b7f1867102f91153', '未启动', '未启动', '1', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('29805c804dd94974b568cfc9017b2e4c', '07成交', '07成交', '7', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('310e6a49bd8a4962b3f95a1d92eb76f4', '试图联系', '试图联系', '1', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('31539e7ed8c848fc913e1c2c93d76fd1', '博士', '博士', '4', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('37ef211719134b009e10b7108194cf46', '01资质审查', '01资质审查', '1', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('391807b5324d4f16bd58c882750ee632', '08丢失的线索', '08丢失的线索', '8', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('3a39605d67da48f2a3ef52e19d243953', '聊天', '聊天', '14', 'source');
INSERT INTO `tbl_dic_value` VALUES ('474ab93e2e114816abf3ffc596b19131', '低', '低', '3', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('48512bfed26145d4a38d3616e2d2cf79', '广告', '广告', '1', 'source');
INSERT INTO `tbl_dic_value` VALUES ('4d03a42898684135809d380597ed3268', '合作伙伴研讨会', '合作伙伴研讨会', '9', 'source');
INSERT INTO `tbl_dic_value` VALUES ('59795c49896947e1ab61b7312bd0597c', '先生', '先生', '1', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('5c6e9e10ca414bd499c07b886f86202a', '高', '高', '1', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('67165c27076e4c8599f42de57850e39c', '夫人', '夫人', '2', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('68a1b1e814d5497a999b8f1298ace62b', '09因竞争丢失关闭', '09因竞争丢失关闭', '9', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('6b86f215e69f4dbd8a2daa22efccf0cf', 'web调研', 'web调研', '13', 'source');
INSERT INTO `tbl_dic_value` VALUES ('72f13af8f5d34134b5b3f42c5d477510', '合作伙伴', '合作伙伴', '6', 'source');
INSERT INTO `tbl_dic_value` VALUES ('7c07db3146794c60bf975749952176df', '未联系', '未联系', '6', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('86c56aca9eef49058145ec20d5466c17', '内部研讨会', '内部研讨会', '10', 'source');
INSERT INTO `tbl_dic_value` VALUES ('9095bda1f9c34f098d5b92fb870eba17', '进行中', '进行中', '3', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('954b410341e7433faa468d3c4f7cf0d2', '已有业务', '已有业务', '1', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('966170ead6fa481284b7d21f90364984', '已联系', '已联系', '3', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('96b03f65dec748caa3f0b6284b19ef2f', '推迟', '推迟', '2', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('97d1128f70294f0aac49e996ced28c8a', '新业务', '新业务', '2', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('9ca96290352c40688de6596596565c12', '完成', '完成', '4', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('9e6d6e15232549af853e22e703f3e015', '需要条件', '需要条件', '7', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('9ff57750fac04f15b10ce1bbb5bb8bab', '02需求分析', '02需求分析', '2', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('a70dc4b4523040c696f4421462be8b2f', '等待某人', '等待某人', '5', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('a83e75ced129421dbf11fab1f05cf8b4', '推销电话', '推销电话', '2', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ab8472aab5de4ae9b388b2f1409441c1', '常规', '常规', '5', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('ab8c2a3dc05f4e3dbc7a0405f721b040', '05提案/报价', '05提案/报价', '5', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('b924d911426f4bc5ae3876038bc7e0ad', 'web下载', 'web下载', '12', 'source');
INSERT INTO `tbl_dic_value` VALUES ('c13ad8f9e2f74d5aa84697bb243be3bb', '03价值建议', '03价值建议', '3', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('c83c0be184bc40708fd7b361b6f36345', '最低', '最低', '4', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('db867ea866bc44678ac20c8a4a8bfefb', '员工介绍', '员工介绍', '3', 'source');
INSERT INTO `tbl_dic_value` VALUES ('e44be1d99158476e8e44778ed36f4355', '04确定决策者', '04确定决策者', '4', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('e5f383d2622b4fc0959f4fe131dafc80', '女士', '女士', '3', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('e81577d9458f4e4192a44650a3a3692b', '06谈判/复审', '06谈判/复审', '6', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('fb65d7fdb9c6483db02713e6bc05dd19', '在线商场', '在线商场', '5', 'source');
INSERT INTO `tbl_dic_value` VALUES ('fd677cc3b5d047d994e16f6ece4d3d45', '公开媒介', '公开媒介', '7', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ff802a03ccea4ded8731427055681d48', '外部介绍', '外部介绍', '4', 'source');

-- ----------------------------
-- Table structure for tbl_tran
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran`;
CREATE TABLE `tbl_tran` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `expectedDate` char(10) DEFAULT NULL,
  `customerId` char(32) DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `activityId` char(32) DEFAULT NULL,
  `contactsId` char(32) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_tran
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_tran_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_history`;
CREATE TABLE `tbl_tran_history` (
  `id` char(32) NOT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `expectedDate` char(10) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `tranId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_tran_history
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_tran_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_remark`;
CREATE TABLE `tbl_tran_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `tranId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_tran_remark
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` char(32) NOT NULL COMMENT 'uuid\r\n            ',
  `loginAct` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `loginPwd` varchar(255) DEFAULT NULL COMMENT '密码不能采用明文存储，采用密文，MD5加密之后的数据',
  `email` varchar(255) DEFAULT NULL,
  `expireTime` char(19) DEFAULT NULL COMMENT '失效时间为空的时候表示永不失效，失效时间为2018-10-10 10:10:10，则表示在该时间之前该账户可用。',
  `lockState` char(1) DEFAULT NULL COMMENT '锁定状态为空时表示启用，为0时表示锁定，为1时表示启用。',
  `deptno` char(4) DEFAULT NULL,
  `allowIps` varchar(255) DEFAULT NULL COMMENT '允许访问的IP为空时表示IP地址永不受限，允许访问的IP可以是一个，也可以是多个，当多个IP地址的时候，采用半角逗号分隔。允许IP是192.168.100.2，表示该用户只能在IP地址为192.168.100.2的机器上使用。',
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('c82990f8101a4e51b0e5036e933625ab', 'admin', '张三', '01030f094a47fab85fab8743fab894a0e4afab800ffabc3', null, '2050-02-10', '1', null, '192.168.100.65,192.168.100.25,127.0.0.1,0:0:0:0:0:0:0:1', null, '管理员', null, null, null);
INSERT INTO `tbl_user` VALUES ('f4bc4eac122b4104a4a4a92f6f320733', 'xiaohong', '小红', '1167eac4687a0d8aae4d01efe9274cda', null, '2050-02-10', '1', null, null, null, null, null, null, null);
