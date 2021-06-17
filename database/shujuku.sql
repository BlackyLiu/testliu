/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jspm04910wljjscxt

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-01-04 10:45:36
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '帐号',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', '2021-01-04 10:02:19');

-- ----------------------------
-- Table structure for `gouwuche`
-- ----------------------------
DROP TABLE IF EXISTS `gouwuche`;
CREATE TABLE `gouwuche` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jijinxinxiid` int(10) unsigned NOT NULL COMMENT '基金信息id',
  `jijinbianhao` varchar(50) NOT NULL COMMENT '基金编号',
  `jijinmingcheng` varchar(255) NOT NULL COMMENT '基金名称',
  `jijindaima` varchar(50) NOT NULL COMMENT '基金代码',
  `jijinleixing` int(10) unsigned NOT NULL COMMENT '基金类型',
  `fengxianleixing` varchar(255) NOT NULL COMMENT '风险类型',
  `jijinjiage` decimal(18,2) NOT NULL COMMENT '基金价格',
  `mairuzhishu` int(11) NOT NULL COMMENT '买入支数',
  `xiaoji` decimal(18,2) NOT NULL COMMENT '小计',
  `goumairen` varchar(50) NOT NULL COMMENT '购买人',
  `iszf` varchar(10) NOT NULL DEFAULT '否' COMMENT '是否支付',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `gouwuche_jijinxinxiid_index` (`jijinxinxiid`),
  KEY `gouwuche_jijinleixing_index` (`jijinleixing`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of gouwuche
-- ----------------------------
INSERT INTO `gouwuche` VALUES ('1', '6', '32432', '上投摩根动力精选', '006250', '3', '低风险', '26.00', '50', '1300.00', '001', '是', '2021-01-04 10:44:14');

-- ----------------------------
-- Table structure for `jijinfenlei`
-- ----------------------------
DROP TABLE IF EXISTS `jijinfenlei`;
CREATE TABLE `jijinfenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(255) NOT NULL COMMENT '分类名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='基金分类';

-- ----------------------------
-- Records of jijinfenlei
-- ----------------------------
INSERT INTO `jijinfenlei` VALUES ('1', '偏股型', '2021-01-04 10:13:37');
INSERT INTO `jijinfenlei` VALUES ('2', '股票型', '2021-01-04 10:13:41');
INSERT INTO `jijinfenlei` VALUES ('3', '混合型', '2021-01-04 10:13:46');
INSERT INTO `jijinfenlei` VALUES ('4', '债卷行', '2021-01-04 10:13:54');
INSERT INTO `jijinfenlei` VALUES ('5', '指数型', '2021-01-04 10:14:00');
INSERT INTO `jijinfenlei` VALUES ('6', 'FOF', '2021-01-04 10:14:10');
INSERT INTO `jijinfenlei` VALUES ('7', '货币型', '2021-01-04 10:14:15');
INSERT INTO `jijinfenlei` VALUES ('8', '理财型', '2021-01-04 10:14:19');
INSERT INTO `jijinfenlei` VALUES ('9', '保本型', '2021-01-04 10:14:24');

-- ----------------------------
-- Table structure for `jijinxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `jijinxinxi`;
CREATE TABLE `jijinxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jijinbianhao` varchar(50) NOT NULL COMMENT '基金编号',
  `jijinmingcheng` varchar(255) NOT NULL COMMENT '基金名称',
  `jijindaima` varchar(50) NOT NULL COMMENT '基金代码',
  `jijinleixing` int(10) unsigned NOT NULL COMMENT '基金类型',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `fengxianleixing` varchar(255) NOT NULL COMMENT '风险类型',
  `zichanguimo` varchar(50) NOT NULL COMMENT '资产规模',
  `chengliriqi` varchar(25) NOT NULL COMMENT '成立日期',
  `jijinjiage` decimal(18,2) NOT NULL COMMENT '基金价格',
  `jingzhigusuan` varchar(50) NOT NULL COMMENT '净值估算',
  `rizhangfudu` varchar(50) NOT NULL COMMENT '日涨幅度',
  `nianzhangfudu` varchar(50) NOT NULL COMMENT '年长幅度',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `jijinxinxi_jijinleixing_index` (`jijinleixing`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='基金信息';

-- ----------------------------
-- Records of jijinxinxi
-- ----------------------------
INSERT INTO `jijinxinxi` VALUES ('1', '454353', '农银工业4.0混合', '001606', '4', 'upload/1609726564934.png', '低风险', '2.8亿', '2016-01-21', '18.00', '5.6亿', '+20.54', '+12.68', 'admin', '<p><img src=\"upload/20210104/83571609726628453.png\" _src=\"upload/20210104/83571609726628453.png\"/></p>', '2021-01-04 10:17:13');
INSERT INTO `jijinxinxi` VALUES ('2', '54234', '工银中小盘混合', '481010', '1', 'upload/1609726688420.png', '低风险', '3.8亿', '2017-01-16', '15.00', '7.8亿', '-15.25', '-10.3', 'admin', '<p><img src=\"upload/20210104/7301609726733605.png\" _src=\"upload/20210104/7301609726733605.png\"/></p>', '2021-01-04 10:18:54');
INSERT INTO `jijinxinxi` VALUES ('3', '234234', '前海开源医疗健康A', '005453', '6', 'upload/1609726772824.png', '中高风险', '8.9亿', '2016-01-03', '28.00', '35.3亿', '+15.5', '+11.3', 'admin', '<p><img src=\"upload/20210104/96811609726814807.png\" _src=\"upload/20210104/96811609726814807.png\"/></p>', '2021-01-04 10:20:15');
INSERT INTO `jijinxinxi` VALUES ('4', '6547456', '诺德价值优势混合', '570001', '9', 'upload/1609726859601.png', '高风险', '8.2亿', '2017-01-16', '17.00', '50.8亿', '+14', '+1.8', 'admin', '<p><img src=\"upload/20210104/40941609726898915.png\" _src=\"upload/20210104/40941609726898915.png\"/></p>', '2021-01-04 10:21:40');
INSERT INTO `jijinxinxi` VALUES ('5', '78567', '新华鑫动力灵活配置', '002084', '5', 'upload/1609726944201.png', '中低风险', '2.8亿', '2017-01-02', '28.00', '11亿', '+17', '+11.8', 'admin', '<p><img src=\"upload/20210104/15721609726973422.png\" _src=\"upload/20210104/15721609726973422.png\"/></p>', '2021-01-04 10:22:54');
INSERT INTO `jijinxinxi` VALUES ('6', '32432', '上投摩根动力精选', '006250', '3', 'upload/1609727020088.png', '低风险', '19.9亿', '2017-01-09', '26.00', '36.2亿', '+18.6', '+18.3', 'admin', '<p><img src=\"upload/20210104/84161609727058787.png\" _src=\"upload/20210104/84161609727058787.png\"/></p>', '2021-01-04 10:24:19');
INSERT INTO `jijinxinxi` VALUES ('7', '654745', '信诚至远A', '002084', '1', 'upload/1609727944037.png', '高风险', '8.1亿', '2017-01-03', '36.00', '38亿', '+18.99', '+22.5', 'admin', '<p><img src=\"upload/20210104/4871609727985755.png\" _src=\"upload/20210104/4871609727985755.png\"/></p>', '2021-01-04 10:39:46');

-- ----------------------------
-- Table structure for `shoucangjilu`
-- ----------------------------
DROP TABLE IF EXISTS `shoucangjilu`;
CREATE TABLE `shoucangjilu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '收藏用户',
  `xwid` int(10) unsigned NOT NULL COMMENT '对应模块id',
  `biao` varchar(255) NOT NULL COMMENT '收藏得模块',
  `biaoti` varchar(255) NOT NULL COMMENT '显示的标题',
  `url` varchar(512) NOT NULL COMMENT '收藏URL',
  `ziduan` varchar(255) NOT NULL COMMENT '对应模块字段',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收藏记录';

-- ----------------------------
-- Records of shoucangjilu
-- ----------------------------
INSERT INTO `shoucangjilu` VALUES ('1', '001', '6', 'jijinxinxi', '上投摩根动力精选', 'http://localhost:8080/jspm04910wljjscxt/jijinxinxidetail.jsp?id=6', 'jijinmingcheng', '2021-01-04 10:44:15');

-- ----------------------------
-- Table structure for `yonghu`
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) NOT NULL COMMENT '用户名',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) NOT NULL COMMENT '性别',
  `shouji` varchar(50) NOT NULL COMMENT '手机',
  `youxiang` varchar(50) NOT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(50) NOT NULL COMMENT '身份证',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('1', '001', '001', '小明', '女', '13666666666', '123456@qq.com', '656465464585654654', 'upload/1609728237749.png', '2021-01-04 10:44:00');
