/*
Navicat MySQL Data Transfer

Source Server         : 胡胜凯
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : lrms

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2020-04-12 10:18:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `announcement`
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `Publish_id` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(500) DEFAULT NULL COMMENT '主题',
  `Content` varchar(500) DEFAULT NULL COMMENT '公告内容',
  `Create_time` datetime DEFAULT NULL COMMENT '创建公告时的时间',
  PRIMARY KEY (`Publish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('5', '测试一下系统', '第一次测试实验室预约管理系统', '2019-11-17 22:41:40');
INSERT INTO `announcement` VALUES ('6', '教室大扫除，各班级注意', '1.各个班级对教室进行清扫\r\n2.门窗、桌椅板凳打扫干净', '2020-02-21 20:52:10');
INSERT INTO `announcement` VALUES ('7', '信息工程学院教室安排', '教室安排教室安排教室安排教室安排教室安排教室安排教室安排教室安排教室安排教室安排教室安排教室安排教室安排教室安排教室安排教室安排教室安排', '2020-02-21 20:54:08');
INSERT INTO `announcement` VALUES ('8', '出租', '122', '2020-02-21 20:57:06');
INSERT INTO `announcement` VALUES ('9', '别墅', '111', '2020-02-21 20:57:58');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `Class_id` int(11) NOT NULL AUTO_INCREMENT,
  `Class_name` varchar(50) DEFAULT NULL COMMENT '班级名称',
  `Class_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '计算机科学1601', null);
INSERT INTO `class` VALUES ('2', '软件工程1601', null);
INSERT INTO `class` VALUES ('3', '软件开发1601', null);
INSERT INTO `class` VALUES ('4', '商务英语1601', null);
INSERT INTO `class` VALUES ('5', '会计学1601', null);
INSERT INTO `class` VALUES ('6', '会计学1602', null);

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `Course_id` int(10) NOT NULL AUTO_INCREMENT,
  `CourseNumber` varchar(10) DEFAULT NULL COMMENT '课程号',
  `CourseName` varchar(50) DEFAULT NULL COMMENT '课程名',
  `CourseDescription` varchar(500) DEFAULT NULL,
  `Js_id` int(10) DEFAULT NULL COMMENT '外键  此处指教师id',
  `Person_number` int(10) DEFAULT NULL,
  PRIMARY KEY (`Course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'C001', 'java编程2', 'java编程', '35', '20');
INSERT INTO `course` VALUES ('2', 'C002', '实用信息技术', '123', '35', '50');
INSERT INTO `course` VALUES ('3', 'C001', 'java编程', '123', null, '1');
INSERT INTO `course` VALUES ('6', '343', '数据结构', '信管专业课程。', '35', '36');
INSERT INTO `course` VALUES ('7', '34', '计算机网络', '选修课，主要讲授了IP地址，网关。。。。需要做实验。。。', '35', '30');
INSERT INTO `course` VALUES ('9', 'sjk111', '数据库事务', '数据库事务', '35', '20');
INSERT INTO `course` VALUES ('10', 'j18801', 'JavaWeb实验', 'javaWeb实验课，每周二早上前两节，周四上午后两节', '2', '45');
INSERT INTO `course` VALUES ('11', 's1001', '数据结构', '数据结构教学，上课班级16计科', '36', '49');
INSERT INTO `course` VALUES ('12', 'w1006', '算法基础', '算法程序设计，上课班级，16计科', '36', '55');

-- ----------------------------
-- Table structure for `course_user`
-- ----------------------------
DROP TABLE IF EXISTS `course_user`;
CREATE TABLE `course_user` (
  `Id` int(10) NOT NULL AUTO_INCREMENT COMMENT '班级学生表对应的id',
  `Course_id` int(10) DEFAULT NULL,
  `Course_name` varchar(50) DEFAULT NULL,
  `User_id` int(10) DEFAULT NULL,
  `User_name` varchar(50) DEFAULT NULL,
  `Sumscore` int(10) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_user
-- ----------------------------
INSERT INTO `course_user` VALUES ('1', '1', 'java编程', '3', '陈红', '0');
INSERT INTO `course_user` VALUES ('2', '1', 'java编程', '5', '孙慧', '0');
INSERT INTO `course_user` VALUES ('3', '2', '实用信息技术', '3', '陈红', '0');
INSERT INTO `course_user` VALUES ('4', '3', 'java编程', '3', '陈红', '0');

-- ----------------------------
-- Table structure for `laboratory`
-- ----------------------------
DROP TABLE IF EXISTS `laboratory`;
CREATE TABLE `laboratory` (
  `Lab_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个实验室',
  `Building_name` varchar(50) DEFAULT NULL COMMENT '教学楼名字',
  `Room_number` int(50) DEFAULT NULL COMMENT '房间号',
  `Person_number` int(10) DEFAULT NULL COMMENT '可容纳人数',
  `Is_free` int(10) DEFAULT NULL COMMENT '0-空闲，1-已被预约（暂时不需要）',
  `Description` varchar(500) DEFAULT NULL COMMENT '实验室信息描述',
  PRIMARY KEY (`Lab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of laboratory
-- ----------------------------
INSERT INTO `laboratory` VALUES ('1', '国际学院教学楼', '101', '50', '0', '国际学院实验室，现有计算机50台，全部正常运行。');
INSERT INTO `laboratory` VALUES ('17', '国际学院教学楼', '102', '50', '0', '国院102，共50个位置。');
INSERT INTO `laboratory` VALUES ('18', '国际学院教学楼', '103', '30', '0', '国际学院，103小教室');
INSERT INTO `laboratory` VALUES ('19', '信息工程学院教学楼', '217', '70', '0', '信院217，共70个位置，可供大课堂使用。');
INSERT INTO `laboratory` VALUES ('20', '商学院教学楼', '219', '70', '0', '商院219阶梯教室，多媒体完好，可容纳70人');
INSERT INTO `laboratory` VALUES ('21', '信息工程学院教学楼', '101', '300', '0', '信息工程学院，西阶一教室，多媒体阶梯大教室');
INSERT INTO `laboratory` VALUES ('23', '医学院教学楼', '1101', '200', '0', '医学院教学楼，西阶一教室，可容纳200人');

-- ----------------------------
-- Table structure for `reservation`
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `Reserve_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '实验室预约表的主键',
  `Lab_id` int(10) DEFAULT NULL COMMENT '实验室id',
  `User_id` int(10) DEFAULT NULL COMMENT '预约人id',
  `Reserve_type` int(10) DEFAULT NULL COMMENT '预约类型 1—个人预约;2—为指定课堂预约',
  `Course_id` int(10) DEFAULT NULL COMMENT '0代表没有选择课堂',
  `CourseName` varchar(50) DEFAULT NULL,
  `Reserve_date` date DEFAULT NULL COMMENT '预约日期',
  `Time_interval` int(10) DEFAULT NULL COMMENT '预约时间段\r\n1--8:00~10:00\r\n2—10:00~12:00\r\n3—14:00~16:00\r\n4—16:00~18:00\r\n5—19:00~21:00',
  `Weekday` int(10) DEFAULT NULL COMMENT '表示星期几，取值为1,2,3,4,5,6,7\r\n1--周一、2—周二\r\n3--周三、4—周四\r\n5--周五、6—周六\r\n7--周日',
  `Person_number` int(10) DEFAULT NULL COMMENT '预约人数，1-学生预约，n-教师预约或者教师指定;预约人数应该小于实验室当前可容纳人数',
  `Description` varchar(500) DEFAULT NULL COMMENT '预约描述',
  `Create_time` datetime DEFAULT NULL COMMENT '创建预约表单的时间',
  `Modify_time` datetime DEFAULT NULL COMMENT '修改预约表单信息后的时间',
  PRIMARY KEY (`Reserve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES ('31', '19', '3', '1', '0', null, '2019-11-16', '1', '0', '1', null, '2017-03-16 10:07:14', null);
INSERT INTO `reservation` VALUES ('32', '19', '3', '1', '0', null, '2019-11-17', '1', '0', '1', null, '2017-03-16 10:08:37', null);
INSERT INTO `reservation` VALUES ('33', '19', '3', '1', '0', null, '2019-11-16', '2', '0', '1', null, '2017-03-16 10:09:07', null);
INSERT INTO `reservation` VALUES ('34', '19', '35', '2', '0', null, '2019-11-16', '3', '0', '1', '数据库课程使用实验课。', '2017-03-16 10:40:16', null);
INSERT INTO `reservation` VALUES ('35', '1', '35', '2', '0', null, '2019-11-16', '1', '0', '20', '实验课', '2017-03-16 10:40:45', null);
INSERT INTO `reservation` VALUES ('36', '1', '35', '2', '0', null, '2019-11-16', '2', '0', '49', null, '2017-03-16 10:41:06', null);
INSERT INTO `reservation` VALUES ('40', '1', '35', '1', '0', null, '2019-11-22', '1', '0', '1', null, '2017-03-20 19:46:41', null);
INSERT INTO `reservation` VALUES ('41', '1', '35', '1', '0', null, '2017-03-26', '1', '0', '4', null, '2017-03-23 19:54:54', null);
INSERT INTO `reservation` VALUES ('74', '1', '35', '1', '0', null, '2017-03-26', '1', '0', '1', null, '2017-03-24 16:48:21', null);
INSERT INTO `reservation` VALUES ('75', '1', '35', '2', '1', 'java编程', '2017-04-22', '1', '6', '2', '2017-4-21  2017-4-24  六 2人', '2017-03-24 00:00:00', null);
INSERT INTO `reservation` VALUES ('78', '20', '35', '2', '1', 'java编程', '2017-03-27', '1', '1', '2', null, '2017-03-24 17:10:03', null);
INSERT INTO `reservation` VALUES ('80', '20', '35', '2', '1', 'java编程', '2017-04-10', '1', '1', '2', null, '2017-03-24 17:10:03', null);
INSERT INTO `reservation` VALUES ('81', '20', '35', '2', '1', 'java编程', '2017-04-17', '1', '1', '2', null, '2017-03-24 17:10:03', null);
INSERT INTO `reservation` VALUES ('82', '1', '35', '1', '0', null, '2017-04-18', '1', '0', '5', '4-18  5人', '2017-04-17 20:42:10', null);
INSERT INTO `reservation` VALUES ('83', '1', '35', '2', '1', 'java编程2', '2017-04-17', '1', '1', '20', '20人， 4/17', '2017-04-17 20:49:01', null);
INSERT INTO `reservation` VALUES ('85', '18', '35', '2', '1', 'java编程2', '2017-04-19', '2', '3', '20', '课堂预约，每周三  20人', '2017-04-24 11:08:30', null);
INSERT INTO `reservation` VALUES ('86', '18', '35', '2', '1', 'java编程2', '2017-04-26', '2', '3', '20', '课堂预约，每周三  20人', '2017-04-24 11:08:30', null);
INSERT INTO `reservation` VALUES ('87', '1', '35', '1', '0', null, '2017-04-25', '4', '0', '1', '234335t553gtt', '2017-04-24 14:44:44', null);
INSERT INTO `reservation` VALUES ('88', '19', '35', '1', '0', null, '2017-04-26', '3', '0', '5', '5', '2017-04-24 15:13:35', null);
INSERT INTO `reservation` VALUES ('89', '19', '35', '2', '7', '计算机网络', '2017-04-18', '1', '2', '30', '自行车', '2017-04-24 15:14:43', null);
INSERT INTO `reservation` VALUES ('91', '1', '35', '1', '0', null, '2017-04-27', '5', '0', '10', null, '2017-04-24 15:20:25', null);
INSERT INTO `reservation` VALUES ('92', '1', '35', '2', '1', 'java编程2', '2017-04-28', '3', '5', '20', 'java编程', '2017-04-26 20:17:23', null);
INSERT INTO `reservation` VALUES ('94', '18', '35', '1', '0', null, '2017-04-27', '1', '0', '1', null, '2017-04-26 20:20:48', null);
INSERT INTO `reservation` VALUES ('104', '1', '2', '2', '10', 'JavaWeb实验', '2019-11-19', '1', '2', '45', 'javaWeb实验课', '2019-11-17 23:09:03', null);
INSERT INTO `reservation` VALUES ('105', '1', '2', '2', '10', 'JavaWeb实验', '2019-11-26', '1', '2', '45', 'javaWeb实验课', '2019-11-17 23:09:03', null);
INSERT INTO `reservation` VALUES ('106', '1', '2', '2', '10', 'JavaWeb实验', '2019-12-03', '1', '2', '45', 'javaWeb实验课', '2019-11-17 23:09:03', null);
INSERT INTO `reservation` VALUES ('107', '1', '2', '2', '10', 'JavaWeb实验', '2019-12-10', '1', '2', '45', 'javaWeb实验课', '2019-11-17 23:09:03', null);
INSERT INTO `reservation` VALUES ('108', '1', '2', '2', '10', 'JavaWeb实验', '2019-12-17', '1', '2', '45', 'javaWeb实验课', '2019-11-17 23:09:03', null);
INSERT INTO `reservation` VALUES ('109', '1', '2', '2', '10', 'JavaWeb实验', '2019-12-24', '1', '2', '45', 'javaWeb实验课', '2019-11-17 23:09:03', null);
INSERT INTO `reservation` VALUES ('110', '1', '2', '2', '10', 'JavaWeb实验', '2019-12-31', '1', '2', '45', 'javaWeb实验课', '2019-11-17 23:09:03', null);
INSERT INTO `reservation` VALUES ('111', '1', '2', '2', '10', 'JavaWeb实验', '2020-01-07', '1', '2', '45', 'javaWeb实验课', '2019-11-17 23:09:03', null);
INSERT INTO `reservation` VALUES ('112', '1', '2', '2', '10', 'JavaWeb实验', '2020-01-14', '1', '2', '45', 'javaWeb实验课', '2019-11-17 23:09:03', null);
INSERT INTO `reservation` VALUES ('113', '1', '3', '1', '0', null, '2019-11-19', '5', '0', '6', '课程设计小组讨论', '2019-11-17 23:24:54', null);
INSERT INTO `reservation` VALUES ('114', '1', '36', '2', '11', '数据结构', '2019-11-20', '3', '3', '49', '数据结构教学', '2019-11-18 12:15:40', null);
INSERT INTO `reservation` VALUES ('115', '1', '36', '2', '11', '数据结构', '2019-11-27', '3', '3', '49', '数据结构教学', '2019-11-18 12:15:40', null);
INSERT INTO `reservation` VALUES ('116', '1', '36', '2', '11', '数据结构', '2019-12-04', '3', '3', '49', '数据结构教学', '2019-11-18 12:15:40', null);
INSERT INTO `reservation` VALUES ('117', '1', '36', '2', '11', '数据结构', '2019-12-11', '3', '3', '49', '数据结构教学', '2019-11-18 12:15:40', null);
INSERT INTO `reservation` VALUES ('118', '1', '36', '2', '11', '数据结构', '2019-12-18', '3', '3', '49', '数据结构教学', '2019-11-18 12:15:40', null);
INSERT INTO `reservation` VALUES ('119', '1', '36', '2', '11', '数据结构', '2019-12-25', '3', '3', '49', '数据结构教学', '2019-11-18 12:15:40', null);
INSERT INTO `reservation` VALUES ('120', '1', '36', '2', '11', '数据结构', '2020-01-01', '3', '3', '49', '数据结构教学', '2019-11-18 12:15:40', null);
INSERT INTO `reservation` VALUES ('121', '1', '36', '2', '11', '数据结构', '2020-01-08', '3', '3', '49', '数据结构教学', '2019-11-18 12:15:40', null);
INSERT INTO `reservation` VALUES ('122', '1', '36', '2', '11', '数据结构', '2020-01-15', '3', '3', '49', '数据结构教学', '2019-11-18 12:15:40', null);
INSERT INTO `reservation` VALUES ('123', '19', '36', '2', '12', '算法基础', '2019-11-13', '2', '3', '55', '算法程序设计课', '2019-11-19 17:54:52', null);
INSERT INTO `reservation` VALUES ('124', '19', '36', '2', '12', '算法基础', '2019-11-20', '2', '3', '55', '算法程序设计课', '2019-11-19 17:54:52', null);
INSERT INTO `reservation` VALUES ('125', '19', '36', '2', '12', '算法基础', '2019-11-27', '2', '3', '55', '算法程序设计课', '2019-11-19 17:54:52', null);
INSERT INTO `reservation` VALUES ('126', '19', '36', '2', '12', '算法基础', '2019-12-04', '2', '3', '55', '算法程序设计课', '2019-11-19 17:54:52', null);
INSERT INTO `reservation` VALUES ('127', '19', '36', '2', '12', '算法基础', '2019-12-11', '2', '3', '55', '算法程序设计课', '2019-11-19 17:54:52', null);
INSERT INTO `reservation` VALUES ('128', '19', '36', '2', '12', '算法基础', '2019-12-18', '2', '3', '55', '算法程序设计课', '2019-11-19 17:54:52', null);
INSERT INTO `reservation` VALUES ('129', '19', '36', '2', '12', '算法基础', '2019-12-25', '2', '3', '55', '算法程序设计课', '2019-11-19 17:54:52', null);
INSERT INTO `reservation` VALUES ('130', '19', '36', '2', '12', '算法基础', '2020-01-01', '2', '3', '55', '算法程序设计课', '2019-11-19 17:54:53', null);
INSERT INTO `reservation` VALUES ('131', '19', '36', '2', '12', '算法基础', '2020-01-08', '2', '3', '55', '算法程序设计课', '2019-11-19 17:54:53', null);
INSERT INTO `reservation` VALUES ('132', '19', '36', '2', '12', '算法基础', '2020-01-15', '2', '3', '55', '算法程序设计课', '2019-11-19 17:54:53', null);
INSERT INTO `reservation` VALUES ('133', '19', '36', '2', '12', '算法基础', '2020-01-22', '2', '3', '55', '算法程序设计课', '2019-11-19 17:54:53', null);
INSERT INTO `reservation` VALUES ('134', '21', '36', '2', '11', '数据结构', '2020-02-03', '1', '1', '49', '数据结构', '2020-01-30 20:13:14', null);
INSERT INTO `reservation` VALUES ('135', '21', '36', '2', '11', '数据结构', '2020-02-10', '1', '1', '49', '数据结构', '2020-01-30 20:13:14', null);
INSERT INTO `reservation` VALUES ('136', '21', '36', '2', '11', '数据结构', '2020-02-17', '1', '1', '49', '数据结构', '2020-01-30 20:13:14', null);
INSERT INTO `reservation` VALUES ('137', '21', '36', '2', '11', '数据结构', '2020-02-24', '1', '1', '49', '数据结构', '2020-01-30 20:13:14', null);
INSERT INTO `reservation` VALUES ('138', '21', '36', '2', '12', '算法基础', '2020-01-28', '2', '2', '55', null, '2020-01-30 20:16:12', null);
INSERT INTO `reservation` VALUES ('139', '21', '36', '2', '12', '算法基础', '2020-02-04', '2', '2', '55', null, '2020-01-30 20:16:12', null);
INSERT INTO `reservation` VALUES ('140', '21', '36', '2', '12', '算法基础', '2020-02-11', '2', '2', '55', null, '2020-01-30 20:16:12', null);
INSERT INTO `reservation` VALUES ('141', '21', '36', '2', '12', '算法基础', '2020-02-18', '2', '2', '55', null, '2020-01-30 20:16:12', null);
INSERT INTO `reservation` VALUES ('142', '21', '36', '2', '12', '算法基础', '2020-02-25', '2', '2', '55', null, '2020-01-30 20:16:12', null);
INSERT INTO `reservation` VALUES ('148', '21', '2', '2', '10', null, '2020-02-03', '2', '1', '0', 'javaweb实验课', '2020-01-30 20:32:41', null);
INSERT INTO `reservation` VALUES ('149', '21', '2', '2', '10', null, '2020-02-10', '2', '1', '0', 'javaweb实验课', '2020-01-30 20:32:41', null);
INSERT INTO `reservation` VALUES ('150', '21', '2', '2', '10', null, '2020-02-17', '2', '1', '0', 'javaweb实验课', '2020-01-30 20:32:41', null);
INSERT INTO `reservation` VALUES ('151', '21', '2', '2', '10', null, '2020-02-24', '2', '1', '0', 'javaweb实验课', '2020-01-30 20:32:41', null);
INSERT INTO `reservation` VALUES ('152', '19', '36', '1', '0', null, '2020-03-05', '1', '0', '1', '123123123123123', '2020-03-04 12:03:26', null);
INSERT INTO `reservation` VALUES ('153', '1', '36', '1', null, null, '2020-03-14', '2', '6', '50', '测试', '2020-03-12 11:42:51', null);
INSERT INTO `reservation` VALUES ('154', '1', '36', '1', '0', null, '2020-03-15', '1', '0', '9', '好好学习天天向上', '2020-03-12 16:24:04', null);

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `Schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `Lab_id` int(10) DEFAULT NULL COMMENT '实验室id',
  `Schedule_date` date DEFAULT NULL COMMENT '排期表中的某个日期',
  `T1` int(10) DEFAULT '0' COMMENT '时间段1的人数即8:00~10:00该实验室被预约的人数',
  `T2` int(10) DEFAULT '0' COMMENT '时间段2的人数即10:00~12:00该实验室被预约的人数',
  `T3` int(10) DEFAULT '0' COMMENT '时间段3的人数即14:00~16:00该实验室被预约的人数',
  `T4` int(10) DEFAULT '0' COMMENT '时间段4的人数即16:00~18:00该实验室被预约的人数',
  `T5` int(10) DEFAULT '0' COMMENT '时间段5的人数即\r\n19:00~21:00该实验室被预约的人数',
  PRIMARY KEY (`Schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('10', '19', '2017-03-16', '1', '1', '1', '0', '0');
INSERT INTO `schedule` VALUES ('11', '19', '2017-03-17', '1', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('13', '1', '2017-03-16', '50', '49', '0', '0', '0');
INSERT INTO `schedule` VALUES ('14', '19', '2017-03-23', '1', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('16', '1', '2017-03-18', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('17', '1', '2017-03-22', '7', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('18', '1', '2017-03-23', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('19', '1', '2017-03-26', '5', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('20', '1', '2017-03-27', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('50', '1', '2017-04-22', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('51', '20', '2017-04-22', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('52', '20', '2017-03-27', '70', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('53', '20', '2017-04-03', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('54', '20', '2017-04-10', '70', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('55', '20', '2017-04-17', '70', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('56', '20', '2017-03-25', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('57', '1', '2017-04-18', '5', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('58', '1', '2017-04-17', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('59', '18', '2017-04-27', '1', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('60', '18', '2017-04-19', '0', '30', '0', '0', '0');
INSERT INTO `schedule` VALUES ('61', '18', '2017-04-26', '0', '30', '0', '0', '0');
INSERT INTO `schedule` VALUES ('62', '1', '2017-04-25', '0', '0', '0', '1', '0');
INSERT INTO `schedule` VALUES ('63', '19', '2017-04-26', '0', '0', '5', '0', '0');
INSERT INTO `schedule` VALUES ('64', '19', '2017-04-18', '70', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('65', '19', '2017-04-25', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('66', '1', '2017-04-27', '0', '0', '0', '0', '10');
INSERT INTO `schedule` VALUES ('67', '1', '2017-04-28', '0', '0', '50', '0', '0');
INSERT INTO `schedule` VALUES ('68', '1', '2017-04-29', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('69', '17', '2019-11-12', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('70', '17', '2019-11-19', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('71', '17', '2019-11-26', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('72', '17', '2019-12-03', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('73', '17', '2019-12-10', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('74', '1', '2019-11-19', '50', '0', '0', '0', '6');
INSERT INTO `schedule` VALUES ('75', '1', '2019-11-26', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('76', '1', '2019-12-03', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('77', '1', '2019-12-10', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('78', '1', '2019-12-17', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('79', '1', '2019-12-24', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('80', '1', '2019-12-31', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('81', '1', '2020-01-07', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('82', '1', '2020-01-14', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('83', '1', '2019-11-20', '0', '0', '50', '0', '0');
INSERT INTO `schedule` VALUES ('84', '1', '2019-11-27', '0', '0', '50', '0', '0');
INSERT INTO `schedule` VALUES ('85', '1', '2019-12-04', '0', '0', '50', '0', '0');
INSERT INTO `schedule` VALUES ('86', '1', '2019-12-11', '0', '0', '50', '0', '0');
INSERT INTO `schedule` VALUES ('87', '1', '2019-12-18', '0', '0', '50', '0', '0');
INSERT INTO `schedule` VALUES ('88', '1', '2019-12-25', '0', '0', '50', '0', '0');
INSERT INTO `schedule` VALUES ('89', '1', '2020-01-01', '0', '0', '50', '0', '0');
INSERT INTO `schedule` VALUES ('90', '1', '2020-01-08', '0', '0', '50', '0', '0');
INSERT INTO `schedule` VALUES ('91', '1', '2020-01-15', '0', '0', '50', '0', '0');
INSERT INTO `schedule` VALUES ('92', '19', '2019-11-13', '0', '70', '0', '0', '0');
INSERT INTO `schedule` VALUES ('93', '19', '2019-11-20', '0', '70', '0', '0', '0');
INSERT INTO `schedule` VALUES ('94', '19', '2019-11-27', '0', '70', '0', '0', '0');
INSERT INTO `schedule` VALUES ('95', '19', '2019-12-04', '0', '70', '0', '0', '0');
INSERT INTO `schedule` VALUES ('96', '19', '2019-12-11', '0', '70', '0', '0', '0');
INSERT INTO `schedule` VALUES ('97', '19', '2019-12-18', '0', '70', '0', '0', '0');
INSERT INTO `schedule` VALUES ('98', '19', '2019-12-25', '0', '70', '0', '0', '0');
INSERT INTO `schedule` VALUES ('99', '19', '2020-01-01', '0', '70', '0', '0', '0');
INSERT INTO `schedule` VALUES ('100', '19', '2020-01-08', '0', '70', '0', '0', '0');
INSERT INTO `schedule` VALUES ('101', '19', '2020-01-15', '0', '70', '0', '0', '0');
INSERT INTO `schedule` VALUES ('102', '19', '2020-01-22', '0', '70', '0', '0', '0');
INSERT INTO `schedule` VALUES ('103', '21', '2020-02-03', '300', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('104', '21', '2020-02-10', '300', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('105', '21', '2020-02-17', '300', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('106', '21', '2020-02-24', '300', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('107', '21', '2020-01-28', '0', '300', '0', '0', '0');
INSERT INTO `schedule` VALUES ('108', '21', '2020-02-04', '0', '300', '0', '0', '0');
INSERT INTO `schedule` VALUES ('109', '21', '2020-02-11', '0', '300', '0', '0', '0');
INSERT INTO `schedule` VALUES ('110', '21', '2020-02-18', '0', '300', '0', '0', '0');
INSERT INTO `schedule` VALUES ('111', '21', '2020-02-25', '0', '300', '0', '0', '0');
INSERT INTO `schedule` VALUES ('112', '21', '2020-01-31', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('113', '19', '2020-03-05', '1', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('114', '1', '2020-03-15', '9', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `term`
-- ----------------------------
DROP TABLE IF EXISTS `term`;
CREATE TABLE `term` (
  `Term_id` int(11) NOT NULL AUTO_INCREMENT,
  `Term_name` varchar(50) DEFAULT NULL,
  `From_date` varchar(50) DEFAULT NULL,
  `End_date` varchar(50) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Term_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of term
-- ----------------------------
INSERT INTO `term` VALUES ('2', '2017下学期', '2017-03-01', '2017-06-23', '2017下学期');
INSERT INTO `term` VALUES ('3', '2018上学期', '2017-09-01', '2018-01-10', '2018上学期');
INSERT INTO `term` VALUES ('5', '2018下学期', '2018-03-01', '2018-06-23', '2018下学期');
INSERT INTO `term` VALUES ('6', '2019上学期', '2018-09-01', '2019-01-10', '2019上学期');
INSERT INTO `term` VALUES ('7', '2019下学期', '2019-03-01', '2019-06-23', '2019下学期');
INSERT INTO `term` VALUES ('8', '2020上学期', '2019-09-01', '2020-01-10', '2020上学期');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `User_id` int(10) NOT NULL AUTO_INCREMENT,
  `User_type` int(10) NOT NULL COMMENT '用户类型0-管理员，1-教师，2-学生',
  `Login_name` varchar(10) DEFAULT NULL COMMENT '学生学号、教师职工号或者管理员工号作为登录时的用户名\r\n初始密码：\r\n管理员- gly123\r\n教师- js123456\r\n学生- xs123456',
  `Password` varchar(10) DEFAULT NULL COMMENT '密码，长度6~8位，字母+数字，不能取汉字或者特殊字符',
  `User_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `Sex` int(10) DEFAULT NULL COMMENT '性别,1-男，2-女',
  `Age` int(10) DEFAULT NULL,
  `Institute` varchar(50) DEFAULT NULL,
  `Major` varchar(50) DEFAULT NULL,
  `Is_firstlogin` int(2) DEFAULT NULL COMMENT '是否是第一次登陆0-是  1-不是',
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '0', 'admin', '123123', '风清扬', '1', '55', '信息工程学院', '无', '1');
INSERT INTO `user` VALUES ('2', '1', 'Z0000001', '123123', '李教师', '1', '34', '工程学院', '通信工程', '1');
INSERT INTO `user` VALUES ('3', '2', '1309030212', '123123', '陈红', '2', '22', '工程学院', '网络工程', '1');
INSERT INTO `user` VALUES ('5', '2', '1309030223', '123123', '孙慧', '1', '22', '信息与安全工程学院', '软件开发', '0');
INSERT INTO `user` VALUES ('6', '2', '1309030224', '123123', '徐福记', '2', '22', '信息与安全工程学院', '计算机科学与技术', '0');
INSERT INTO `user` VALUES ('7', '2', '1309030123', '123123', '马利奥', '1', '22', '信息与安全工程学院', '计算机科学与技术', '0');
INSERT INTO `user` VALUES ('34', '0', '1309030111', '123123', '关飞飞', '2', '21', '会计学院', '会计学', '0');
INSERT INTO `user` VALUES ('36', '1', 'hsk1001', '123456', '胡胜凯老师', '1', '25', '信息工程学院', '计科教研室', '1');
