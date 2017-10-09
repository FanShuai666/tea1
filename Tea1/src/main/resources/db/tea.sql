SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `famous_tea`
-- ----------------------------


CREATE TABLE `famous_tea` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(10) NOT NULL COMMENT '品种',
  `poll` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票数',
  `image_url` varchar(30) NOT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of famous_tea
-- ----------------------------
INSERT INTO `famous_tea` VALUES ('1', '安化黑茶', '6', 'ahhc.gif');
INSERT INTO `famous_tea` VALUES ('2', '安吉白茶', '5', 'ajbc.gif');
INSERT INTO `famous_tea` VALUES ('3', '安溪铁观音', '9', 'axtgy.gif');
INSERT INTO `famous_tea` VALUES ('4', '黄山毛峰', '3', 'hsmf.gif');
INSERT INTO `famous_tea` VALUES ('5', '君山银针', '0', 'jsyz.gif');
INSERT INTO `famous_tea` VALUES ('6', '六安瓜片', '4', 'lagp.gif');
INSERT INTO `famous_tea` VALUES ('7', '庐山云雾茶', '4', 'lsywc.gif');
INSERT INTO `famous_tea` VALUES ('8', '茉莉花茶', '2', 'mlhc.gif');
INSERT INTO `famous_tea` VALUES ('9', '湄潭翠芽', '2', 'mtcy.gif');
INSERT INTO `famous_tea` VALUES ('10', '普洱茶', '8', 'pec.gif');
INSERT INTO `famous_tea` VALUES ('11', '武夷山大红袍', '4', 'wysdhp.gif');
INSERT INTO `famous_tea` VALUES ('12', '信阳毛尖', '7', 'xymj.gif');

-- ----------------------------
-- Table structure for `tea`
-- ----------------------------
DROP TABLE IF EXISTS `tea`;
CREATE TABLE `tea` (
  `shape` float(3,2) unsigned NOT NULL COMMENT '形状',
  `colour` float(3,2) unsigned NOT NULL COMMENT '色泽',
  `neatness` float(3,2) unsigned NOT NULL COMMENT '净度',
  `matching` float(3,2) unsigned NOT NULL COMMENT '汤色',
  `fragrance` float(3,2) unsigned NOT NULL COMMENT '香气',
  `taste` float(3,2) unsigned NOT NULL COMMENT '滋味',
  `leaf` float(3,2) unsigned NOT NULL COMMENT '叶底',
  `grade` tinyint(3) unsigned NOT NULL COMMENT '品级 0特一级 1特二级 2特三级 3一级  4二级 5三级 6四级',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tea
-- ----------------------------
INSERT INTO `tea` VALUES ('0.40', '0.80', '0.50', '0.70', '0.60', '0.70', '0.80', '3', '2017-10-02 10:53:50', '2');
INSERT INTO `tea` VALUES ('0.50', '0.60', '0.70', '0.80', '0.40', '0.80', '0.40', '3', '2017-10-02 11:19:09', '3');
INSERT INTO `tea` VALUES ('0.50', '0.60', '0.70', '0.60', '0.40', '0.80', '0.40', '3', '2017-10-02 11:19:37', '4');
INSERT INTO `tea` VALUES ('0.90', '0.60', '0.70', '0.60', '0.70', '0.80', '0.70', '3', '2017-10-02 11:20:11', '5');
INSERT INTO `tea` VALUES ('0.90', '0.80', '0.70', '0.80', '0.70', '0.80', '0.70', '2', '2017-10-02 11:20:19', '6');
INSERT INTO `tea` VALUES ('0.90', '0.90', '0.80', '0.80', '0.80', '0.80', '0.80', '1', '2017-10-02 11:20:56', '7');
INSERT INTO `tea` VALUES ('0.90', '0.90', '0.80', '0.90', '0.90', '0.90', '0.90', '1', '2017-10-02 11:21:08', '8');
INSERT INTO `tea` VALUES ('0.30', '0.70', '0.50', '0.20', '0.30', '0.50', '0.10', '6', '2017-10-02 12:28:00', '9');
INSERT INTO `tea` VALUES ('0.30', '0.40', '0.60', '0.50', '0.70', '0.50', '0.50', '4', '2017-10-02 13:06:50', '10');
INSERT INTO `tea` VALUES ('1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '0', '2017-10-02 13:07:19', '11');
INSERT INTO `tea` VALUES ('0.50', '0.80', '0.70', '0.60', '0.80', '0.60', '0.60', '3', '2017-10-02 13:07:42', '12');
INSERT INTO `tea` VALUES ('0.50', '0.80', '0.50', '0.60', '0.60', '0.50', '0.60', '4', '2017-10-02 13:07:54', '13');
INSERT INTO `tea` VALUES ('0.50', '0.60', '0.50', '0.60', '0.60', '0.50', '0.60', '4', '2017-10-02 13:07:58', '14');
INSERT INTO `tea` VALUES ('0.50', '0.50', '0.50', '0.50', '0.50', '0.50', '0.50', '4', '2017-10-02 13:08:07', '15');
INSERT INTO `tea` VALUES ('0.40', '0.40', '0.40', '0.40', '0.40', '0.40', '0.40', '5', '2017-10-02 13:08:23', '16');
INSERT INTO `tea` VALUES ('0.10', '0.10', '0.10', '0.10', '0.10', '0.20', '0.10', '6', '2017-10-02 13:23:32', '17');
INSERT INTO `tea` VALUES ('0.90', '1.00', '0.50', '0.60', '0.80', '0.50', '0.60', '2', '2017-10-03 07:46:19', '18');
INSERT INTO `tea` VALUES ('0.90', '0.80', '0.50', '0.60', '0.80', '0.50', '0.60', '2', '2017-10-03 07:46:26', '19');
INSERT INTO `tea` VALUES ('0.90', '0.80', '0.50', '0.80', '0.80', '0.50', '0.60', '2', '2017-10-03 07:46:35', '20');
INSERT INTO `tea` VALUES ('0.90', '0.80', '0.50', '0.80', '0.80', '1.00', '0.60', '1', '2017-10-03 07:46:41', '21');
INSERT INTO `tea` VALUES ('0.90', '0.80', '0.50', '0.80', '0.80', '1.00', '0.80', '1', '2017-10-03 07:46:45', '22');
INSERT INTO `tea` VALUES ('0.90', '0.80', '0.60', '0.80', '0.80', '1.00', '0.80', '1', '2017-10-03 07:46:50', '23');
INSERT INTO `tea` VALUES ('0.90', '0.80', '0.80', '0.80', '0.80', '1.00', '0.80', '1', '2017-10-03 07:46:54', '24');
INSERT INTO `tea` VALUES ('0.90', '0.80', '0.90', '0.90', '0.80', '1.00', '0.80', '1', '2017-10-03 07:47:01', '25');
INSERT INTO `tea` VALUES ('1.00', '0.90', '0.90', '0.90', '0.90', '1.00', '0.90', '0', '2017-10-03 07:47:10', '26');
INSERT INTO `tea` VALUES ('1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '0', '2017-10-03 07:47:47', '27');
INSERT INTO `tea` VALUES ('1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '0.90', '0', '2017-10-03 07:47:50', '28');
INSERT INTO `tea` VALUES ('1.00', '1.00', '1.00', '0.90', '1.00', '1.00', '0.90', '0', '2017-10-03 07:47:57', '29');
INSERT INTO `tea` VALUES ('1.00', '0.90', '1.00', '0.90', '1.00', '1.00', '0.90', '0', '2017-10-03 07:48:01', '30');
INSERT INTO `tea` VALUES ('0.90', '0.90', '1.00', '0.90', '1.00', '1.00', '0.90', '0', '2017-10-03 07:48:04', '31');
INSERT INTO `tea` VALUES ('0.90', '0.90', '1.00', '0.90', '0.90', '1.00', '0.90', '0', '2017-10-03 07:48:07', '32');
INSERT INTO `tea` VALUES ('0.90', '0.90', '0.40', '0.00', '0.00', '1.00', '0.90', '0', '2017-10-03 07:48:15', '33');
INSERT INTO `tea` VALUES ('0.90', '0.90', '0.40', '0.00', '0.00', '0.20', '0.30', '2', '2017-10-03 07:48:21', '34');
INSERT INTO `tea` VALUES ('0.70', '0.60', '0.40', '0.00', '0.00', '0.20', '0.30', '4', '2017-10-03 07:48:27', '35');
INSERT INTO `tea` VALUES ('0.60', '0.60', '0.40', '0.00', '0.00', '0.20', '0.30', '4', '2017-10-03 07:48:33', '36');
INSERT INTO `tea` VALUES ('0.60', '0.40', '0.40', '0.00', '0.00', '0.20', '0.30', '6', '2017-10-03 07:48:39', '37');
INSERT INTO `tea` VALUES ('0.50', '0.40', '0.40', '0.00', '0.00', '0.20', '0.30', '6', '2017-10-03 07:48:44', '38');
INSERT INTO `tea` VALUES ('0.40', '0.40', '0.40', '0.00', '0.00', '0.20', '0.30', '6', '2017-10-03 07:48:47', '39');
INSERT INTO `tea` VALUES ('0.30', '0.40', '0.30', '0.30', '0.40', '0.30', '0.40', '5', '2017-10-03 07:50:00', '40');
INSERT INTO `tea` VALUES ('0.30', '0.40', '0.30', '0.30', '0.40', '0.40', '0.40', '5', '2017-10-03 07:50:04', '41');
INSERT INTO `tea` VALUES ('0.30', '0.40', '0.30', '0.40', '0.40', '0.40', '0.40', '5', '2017-10-03 07:50:07', '42');
INSERT INTO `tea` VALUES ('0.30', '0.40', '0.40', '0.40', '0.40', '0.40', '0.40', '5', '2017-10-03 07:50:10', '43');
INSERT INTO `tea` VALUES ('0.40', '0.40', '0.40', '0.40', '0.40', '0.40', '0.40', '5', '2017-10-03 07:50:13', '44');
