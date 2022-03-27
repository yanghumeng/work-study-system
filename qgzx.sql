/*
 Navicat Premium Data Transfer

 Source Server         : MySQL5.7(localhost)
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : qgzx

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 09/06/2021 22:43:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `StudentID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无',
  `Password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PhoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无',
  `Email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无',
  `Location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无',
  `LastLogin` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `WorkPosition` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreditDegree` int(100) NULL DEFAULT 100,
  INDEX `StudentID`(`StudentID`) USING BTREE,
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('201712000000', '000000', '无', '无', '无', '2020-01-19 13:51:56', '无', 100);
INSERT INTO `account` VALUES ('201712000001', '031031', '13547031036', '1830720940@qq.com', '成都工程职业技术', '2019-12-28 16:33:20', '五教后面', 100);
INSERT INTO `account` VALUES ('201712000003', '000000', '无', '无', '无', '2019-12-20 08:57:17', '无言湖区域', 100);
INSERT INTO `account` VALUES ('201712000004', '000001', '无', '无', '无', '2019-12-20 08:48:29', '无', 100);
INSERT INTO `account` VALUES ('201712000005', '000002', '无', '无', '无', '2019-12-20 08:48:29', '无', 100);
INSERT INTO `account` VALUES ('201712000006', '000003', '无', '无', '无', '2019-12-20 08:48:29', '无', 100);
INSERT INTO `account` VALUES ('201712000007', '000004', '无', '无', '无', '2019-12-20 08:48:29', '无', 100);
INSERT INTO `account` VALUES ('201712022941', '000004', '无', '无', '无', '2019-12-27 11:23:10', '无言湖区域', 100);
INSERT INTO `account` VALUES ('201712022953', '000000', '13547031031', '18307209@qq.com', '四川学院', '2020-02-13 15:28:33', '无', 100);

-- ----------------------------
-- Table structure for applychannel
-- ----------------------------
DROP TABLE IF EXISTS `applychannel`;
CREATE TABLE `applychannel`  (
  `IsOpenApply` tinyint(1) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of applychannel
-- ----------------------------
INSERT INTO `applychannel` VALUES (1);

-- ----------------------------
-- Table structure for applymessage
-- ----------------------------
DROP TABLE IF EXISTS `applymessage`;
CREATE TABLE `applymessage`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StudentName` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PhoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ClassNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `FamilyNum` int(11) NULL DEFAULT NULL,
  `PersonerPhoto` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `FamilyAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `Sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `Nation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ApplyLocation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `Deploy` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `TuitionPayable` int(11) NULL DEFAULT NULL,
  `TuitionPaid` int(11) NULL DEFAULT NULL,
  `TuitionShortage` int(11) NULL DEFAULT NULL,
  `ApplicationReason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ApplyTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ApplyStatus` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '待审核',
  `UserVisible` tinyint(4) NULL DEFAULT 1,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `StudentID`(`StudentID`) USING BTREE,
  CONSTRAINT `applymessage_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of applymessage
-- ----------------------------
INSERT INTO `applymessage` VALUES (2, '201712000003', '李四', '13547031038', '2017级软件技术1班', 6, '581b30ed-1316-4919-affd-ff17de325e7b.png', '四川省宜宾市翠屏区', '男', '汉族', '无言湖区域', '是', 4100, 4100, 0, '出生农村，家庭贫困', '2019-12-20 08:59:12', '已通过', 1);
INSERT INTO `applymessage` VALUES (4, '201712022941', '45', '45', '45', 45, '210fb032-e796-4bed-bc86-722fca78589a.png', '45', '男', '汉族', '', '是', 45, 45, 45, '45', '2019-12-27 11:49:10', '待审核', 1);

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Depict` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FeedDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `IsReply` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `StudentID`(`StudentID`) USING BTREE,
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, '201712000000', '工作还不错', '2019-12-11 08:17:16', 1);
INSERT INTO `feedback` VALUES (2, '201712000001', '测试', '2019-12-11 08:17:16', 1);

-- ----------------------------
-- Table structure for managers
-- ----------------------------
DROP TABLE IF EXISTS `managers`;
CREATE TABLE `managers`  (
  `ManagerID` int(11) NOT NULL AUTO_INCREMENT,
  `ManagerName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Account` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PhoneNum` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LoginTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无',
  `Type` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ManagerID`, `Account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1005 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of managers
-- ----------------------------
INSERT INTO `managers` VALUES (1000, '杨某某', '13537031031', '123456', '18307209@qq.com', '13547031031', '2020-01-23 14:43:57', '无', '超级管理员');
INSERT INTO `managers` VALUES (1003, '胡某', '13557031037', '123456', '1@qq.com', '13547031031', '2020-01-23 14:43:57', '无', '普通管理员');
INSERT INTO `managers` VALUES (1004, 'admin', 'admin', 'admin', '18@qq.com', '13547031031', '2021-04-30 08:38:26', '无', '超级管理员');

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Receiver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Sender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `SendingDate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AlreadyRead` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (1, '201712000001', '管理员', '测试', '2019-12-11 10:54:00', 1);
INSERT INTO `messages` VALUES (2, '201712000001', '管理员', '你的发布通过了审核', '2019-12-11 15:15:59', 1);
INSERT INTO `messages` VALUES (3, '201712000001', '管理员', '你申请没有通过审核，请不要泄气，下次还有机会哦', '2019-12-12 14:35:38', 1);
INSERT INTO `messages` VALUES (4, '201712000001', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-12 14:37:45', 1);
INSERT INTO `messages` VALUES (5, '201712000001', '管理员', '你申请没有通过审核，请不要泄气，下次还有机会哦', '2019-12-12 14:38:44', 1);
INSERT INTO `messages` VALUES (6, '201712000000', '管理员', '你申请没有通过审核，请不要泄气，下次还有机会哦', '2019-12-12 14:43:35', 1);
INSERT INTO `messages` VALUES (7, '201712000000', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-12 14:44:08', 1);
INSERT INTO `messages` VALUES (8, '201712000001', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-12 14:48:39', 1);
INSERT INTO `messages` VALUES (9, '201712000001', '管理员', '你申请没有通过审核，请不要泄气，下次还有机会哦', '2019-12-12 14:48:43', 1);
INSERT INTO `messages` VALUES (10, '201712000001', '管理员', '测试', '2019-12-12 14:48:43', 1);
INSERT INTO `messages` VALUES (11, '201712000001', '管理员', '你申请没有通过审核，请不要泄气，下次还有机会哦', '2019-12-12 14:54:46', 1);
INSERT INTO `messages` VALUES (12, '201712000000', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-12 15:09:13', 1);
INSERT INTO `messages` VALUES (13, '201712000001', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-12 15:10:33', 1);
INSERT INTO `messages` VALUES (14, '201712000001', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-12 15:10:56', 1);
INSERT INTO `messages` VALUES (15, '201712000001', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-12 15:11:10', 1);
INSERT INTO `messages` VALUES (16, '201712000001', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-12 15:11:45', 1);
INSERT INTO `messages` VALUES (17, '201712000000', '管理员', '谢谢支持，我们会继续努力！', '2019-12-14 20:45:41', 1);
INSERT INTO `messages` VALUES (18, '201712000001', '管理员', '你申请没有通过审核，请不要泄气，下次还有机会哦', '2019-12-15 15:46:01', 1);
INSERT INTO `messages` VALUES (19, '201712000001', '管理员', '恭喜，你发布的岗位已经通过审核了☺', '2019-12-17 13:24:49', 1);
INSERT INTO `messages` VALUES (20, '201712000001', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-18 08:24:15', 0);
INSERT INTO `messages` VALUES (21, '201712000001', '管理员', '测试', '2019-12-18 09:34:42', 0);
INSERT INTO `messages` VALUES (22, '201712000001', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-18 11:29:27', 0);
INSERT INTO `messages` VALUES (23, '201712000000', '管理员', '恭喜，你发布的岗位已经通过审核了☺', '2019-12-24 10:28:28', 0);
INSERT INTO `messages` VALUES (24, '201712000003', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-25 22:42:57', 0);
INSERT INTO `messages` VALUES (25, '201712000000', '管理员', '恭喜，你发布的岗位已经通过审核了☺', '2019-12-26 10:40:11', 0);
INSERT INTO `messages` VALUES (26, '201712022953', '管理员', '恭喜，你发布的岗位已经通过审核了☺', '2019-12-27 08:38:22', 1);
INSERT INTO `messages` VALUES (27, '201712022941', '管理员', '恭喜，你申请已经通过审核，请等待部门通知安排工作☺', '2019-12-27 11:41:08', 1);
INSERT INTO `messages` VALUES (28, '201712022941', '管理员', '你申请没有通过审核，请不要泄气，下次还有机会哦', '2019-12-27 11:45:02', 1);
INSERT INTO `messages` VALUES (29, '201712022941', '管理员', '恭喜，你发布的岗位已经通过审核了☺', '2020-01-23 14:47:26', 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Publisher` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PublishDate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '<p>css</p>', '13547031037', '2020-01-16 18:07:44');
INSERT INTO `notice` VALUES (2, '<p>css</p>', '13547031037', '2020-01-16 18:09:58');
INSERT INTO `notice` VALUES (3, '<p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><span style=\"font-size: 24px;\"><strong>测试</strong></span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">学工处综合事务办公室因工作需要，现面向全体在校本科生招聘暑期学工处总台值班助理若干名，要求应聘者具有高度责任心和组织纪律性，工作认真踏实，服从办公室安排。一经录用，综合事务办公室将根据《中国地质大学勤工助学实施办法》和学生的实际工作表现发放相应的酬金。有勤工助学工作经验者优先。</p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">值班日期</p><p><img src=\"/Ueditor/net/../UploadFile/image/20200116/6371479691240676424707468.jpg\" style=\"\" title=\"img2.jpg\"/></p><p><img src=\"/Ueditor/net/../UploadFile/image/20200116/6371479691240676424707468.jpg\" style=\"\" title=\"img3.jpg\"/></p><p><img src=\"/Ueditor/net/../UploadFile/image/20200116/6371479691261252525178517.jpg\" style=\"\" title=\"img4.jpg\"/></p><p><img src=\"/Ueditor/net/../UploadFile/image/20200116/6371479691262650093705934.jpg\" style=\"\" title=\"img5.jpg\"/></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7月12日——8月28日</p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">至少有6天连续值班时间。</p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">每天值班时间</p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7：00—8：30，</p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">11：30——14：00，</p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">17：00——次日7：00。</p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">报名方式</p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在学工处网站下载并填写《勤工助学申请表》，填写完毕后，发送到2228969883@qq.com。届时办公室将根据报名情况择优录用。<span style=\"border: 0px; margin: 0px; padding: 0px;\">预备党员和党员优先。</span></p><p style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">7月4日中午12点</p><p><br/></p>', '13547031037', '2020-01-16 18:44:07');

-- ----------------------------
-- Table structure for outschoolwork
-- ----------------------------
DROP TABLE IF EXISTS `outschoolwork`;
CREATE TABLE `outschoolwork`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Publisher` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `WorkName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `WorkTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '暂定',
  `WorkAddress` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NeedNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `WageStandard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `WorkContent` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无',
  `Requirement` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无',
  `ContactWay` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PublishStatus` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '待审核',
  `PublishTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Postimg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Reason` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `Toenable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Publisher`(`Publisher`) USING BTREE,
  CONSTRAINT `outschoolwork_ibfk_1` FOREIGN KEY (`Publisher`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of outschoolwork
-- ----------------------------
INSERT INTO `outschoolwork` VALUES (14, '201712022953', '测试1', '周一到周五', '测试', '男12人', '15元/小时', '测试', '男生170cm', '13547031031', '已通过', '2019-12-27 08:37:45', '', '', 1);
INSERT INTO `outschoolwork` VALUES (15, '201712022941', '测试', '出', '测试', '测试', '测试', '测试', '测试', '测试', '待审核', '2019-12-27 11:25:46', '201912271125466083.jpg,201912271125466113.png', NULL, 0);
INSERT INTO `outschoolwork` VALUES (16, '201712022941', '测试', '四川省', '测试', '测试', '测试', '测试', '测试', '测试', '已通过', '2019-12-27 11:27:16', '', '', 1);
INSERT INTO `outschoolwork` VALUES (17, '201712022941', 'vs', '测试', '测试', '测试', '测试', '测试', '测试', '测试', '待审核', '2019-12-27 11:27:39', '201912271127396604.jpg,201912271127396634.png', NULL, 0);
INSERT INTO `outschoolwork` VALUES (18, '201712022941', '测试', '测试', '测试', '测试', '测试', '测试', '测试', '测试', '待审核', '2019-12-27 11:28:01', '', NULL, 0);
INSERT INTO `outschoolwork` VALUES (19, '201712022941', '456', '45', '46', '456', '456', '465', '4654', '45645', '待审核', '2019-12-27 11:53:54', '201912271153547708.png', NULL, 0);

-- ----------------------------
-- Table structure for postdetail
-- ----------------------------
DROP TABLE IF EXISTS `postdetail`;
CREATE TABLE `postdetail`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PostName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无',
  `PostLocation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '暂定',
  `PostContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `NeedNumber` int(11) NULL DEFAULT 50,
  `WorkTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '暂定',
  `Requirement` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无',
  `Wages` int(11) NULL DEFAULT 15,
  `Toenable` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of postdetail
-- ----------------------------
INSERT INTO `postdetail` VALUES (1, '五教后面', '四川学院', '主要是打扫白色垃圾和枯叶', 50, '只有安排(但是必须每天有人去)', '必须吃的苦，被录取后要听从负责人安排，不得偷懒', 15, 1);
INSERT INTO `postdetail` VALUES (4, '无言湖区域', '四川无言湖', '打扫白色垃圾', 15, '组长安排', '勤快，不偷懒', 18, 1);
INSERT INTO `postdetail` VALUES (9, '区域2', '位置', '无', 15, '无', '无', 15, 1);
INSERT INTO `postdetail` VALUES (14, '区域2', '位置', '无', 15, '无', '无', 15, 0);
INSERT INTO `postdetail` VALUES (15, '区域2', '位置', '无', 15, '无', '无', 15, 0);
INSERT INTO `postdetail` VALUES (17, '区域2', '位置', '无', 15, '无', '无', 15, 0);
INSERT INTO `postdetail` VALUES (18, '测试', '测试', '测试', 15, '测试', '测试', 12, 0);

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `StudentID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StudentName` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StudentPhoto` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IDcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Nation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NativePlace` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PoliticalStatus` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DateOfBirth` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DatesofAttendance` datetime(0) NOT NULL,
  `DatesofGraduation` datetime(0) NOT NULL,
  `Department` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Grade` smallint(6) NOT NULL,
  `Major` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ClassNum` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IsSchool` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`StudentID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('201712000000', '张三', NULL, '男', '511322199808208280', '汉', '四川省', '共青团员', '19980820', '2017-09-01 00:00:00', '2020-06-30 00:00:00', '电气信息工程系', 2017, '软件技术', '1', '是');
INSERT INTO `students` VALUES ('201712000001', '李四', NULL, '男', '511322199808208280', '汉', '四川省', '共青团员', '19980820', '2017-09-01 00:00:00', '2020-06-30 00:00:00', '电气信息工程系', 2017, '计算机网络', '2', '是');
INSERT INTO `students` VALUES ('201712000002', '张三', NULL, '男', '511322199808208280', '汉', '四川省', '共青团员', '19980820', '2017-09-01 00:00:00', '2020-06-30 00:00:00', '电气信息工程系', 2017, '软件技术', '1', '是');
INSERT INTO `students` VALUES ('201712000003', '李四', NULL, '男', '511322199808208280', '汉', '四川省', '共青团员', '19980820', '2017-09-01 00:00:00', '2020-06-30 00:00:00', '电气信息工程系', 2017, '计算机网络', '2', '是');
INSERT INTO `students` VALUES ('201712000004', '李四', NULL, '男', '511322199808208280', '汉', '四川省', '共青团员', '19980820', '2017-09-01 00:00:00', '2020-06-30 00:00:00', '电气信息工程系', 2017, '计算机网络', '2', '是');
INSERT INTO `students` VALUES ('201712000005', '李四', NULL, '男', '511322199808208280', '汉', '四川省', '共青团员', '19980820', '2017-09-01 00:00:00', '2020-06-30 00:00:00', '电气信息工程系', 2017, '计算机网络', '2', '是');
INSERT INTO `students` VALUES ('201712000006', '李四', NULL, '男', '511322199808208280', '汉', '四川省', '共青团员', '19980820', '2017-09-01 00:00:00', '2020-06-30 00:00:00', '电气信息工程系', 2017, '计算机网络', '2', '是');
INSERT INTO `students` VALUES ('201712000007', '李四', NULL, '男', '511322199808208280', '汉', '四川省', '共青团员', '19980820', '2017-09-01 00:00:00', '2020-06-30 00:00:00', '电气信息工程系', 2017, '计算机网络', '2', '是');
INSERT INTO `students` VALUES ('201712022941', '王兵', NULL, '男', '511322199808208280', '汉', '四川省', '共青团员', '19980820', '2017-09-01 00:00:00', '2020-06-30 00:00:00', '电气信息工程系', 2017, '计算机网络', '2', '是');
INSERT INTO `students` VALUES ('201712022953', '李四', NULL, '男', '511322199808208280', '汉', '四川省', '共青团员', '19980820', '2017-09-01 00:00:00', '2020-06-30 00:00:00', '电气信息工程系', 2017, '计算机网络', '2', '是');

-- ----------------------------
-- Procedure structure for Addmanager
-- ----------------------------
DROP PROCEDURE IF EXISTS `Addmanager`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Addmanager`(in managername varchar(10),in account varchar(11),in password VARCHAR(20),in email varchar(20),in phone varchar(11),in logintime timestamp,in remark varchar(100),in type varchar(20))
BEGIN
	
	insert into managers(managers.ManagerName,managers.Account,managers.`Password`,managers.Email,managers.PhoneNum,managers.LoginTime,managers.Remark,managers.Type) values(managername,account,password,email,phone,logintime,remark,type);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AddPostDetail
-- ----------------------------
DROP PROCEDURE IF EXISTS `AddPostDetail`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPostDetail`(in PostName varchar(20),in PostLocation varchar(50),in PostContent text,in NeedNumber int,in WorkTime varchar(20),in Requirement varchar(50),in Wages int,in Toenable TINYINT)
BEGIN
	
	insert into postdetail(postdetail.PostName,postdetail.PostLocation,postdetail.PostContent,postdetail.NeedNumber,postdetail.WorkTime,postdetail.Requirement,postdetail.Wages,postdetail.Toenable) values(PostName,PostLocation,PostContent,NeedNumber,WorkTime,Requirement,Wages,Toenable);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AddStudentPost
-- ----------------------------
DROP PROCEDURE IF EXISTS `AddStudentPost`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddStudentPost`(in studentid varchar(20),in postname varchar(10))
BEGIN
	update account set account.WorkPosition=postname where account.StudentID=studentid;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ApplicationMessage
-- ----------------------------
DROP PROCEDURE IF EXISTS `ApplicationMessage`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ApplicationMessage`(in StudentID  VARCHAR(20),in StudentName varchar(12),in Phonenum varchar(20),in Classnum varchar(50),in Familynum int,in PersonerPhoto varchar(50),in FamilyAddress varchar(100),in Sex char(1),in Nation varchar(50),in ApplyLocation varchar(10),in Deploy char(1),in TuitionPayable int,in TuitionPaid int,in TuitionShortage int,in ApplicationReason text,in ApplyTime TIMESTAMP,in ApplyStatus varchar(4),in UserVisible TINYINT)
BEGIN
	insert into applymessage(applymessage.StudentID,applymessage.StudentName,applymessage.PhoneNum,applymessage.ClassNum,applymessage.FamilyNum,applymessage.PersonerPhoto,applymessage.FamilyAddress,applymessage.Sex,applymessage.Nation,applymessage.ApplyLocation,applymessage.Deploy,applymessage.TuitionPayable,applymessage.TuitionPaid,applymessage.TuitionShortage,applymessage.ApplicationReason,applymessage.ApplyTime,applymessage.ApplyStatus,applymessage.UserVisible) VALUES(StudentID,StudentName,Phonenum,Classnum,Familynum,PersonerPhoto,FamilyAddress,Sex,Nation,ApplyLocation,Deploy,TuitionPayable,TuitionPaid,TuitionShortage,ApplicationReason,ApplyTime,ApplyStatus,UserVisible);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ChangeAccountMessage
-- ----------------------------
DROP PROCEDURE IF EXISTS `ChangeAccountMessage`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeAccountMessage`(in StudentID  VARCHAR(20),in Phonenum varchar(20),in Email varchar(20),in Location varchar(50))
BEGIN
	UPDATE account set account.PhoneNum=Phonenum,account.Email=Email,account.Location=Location WHERE account.StudentID=StudentID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ChangeManagerLastLoginTime
-- ----------------------------
DROP PROCEDURE IF EXISTS `ChangeManagerLastLoginTime`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeManagerLastLoginTime`(in Account VARCHAR(11),in ManagerLastTime datetime)
BEGIN
	UPDATE managers set managers.LoginTime=ManagerLastTime where managers.Account=Account;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ChangeManagerPassword
-- ----------------------------
DROP PROCEDURE IF EXISTS `ChangeManagerPassword`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeManagerPassword`(in Account char(11),in newPassword varchar(20))
BEGIN
	UPDATE managers set managers.`Password`=newPassword where managers.Account=Account;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ChangeStudentPassword
-- ----------------------------
DROP PROCEDURE IF EXISTS `ChangeStudentPassword`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeStudentPassword`(in StudentID varchar(20),in NewPassword varchar(16),in Email varchar(20))
BEGIN
	UPDATE account set account.Password=NewPassword,account.Email=Email where account.StudentID=StudentID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ChangeUserLastLoginTime
-- ----------------------------
DROP PROCEDURE IF EXISTS `ChangeUserLastLoginTime`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangeUserLastLoginTime`(in StudentID VARCHAR(20),in UserLastTime datetime)
BEGIN
	UPDATE account set account.LastLogin=UserLastTime where account.StudentID=StudentID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for DelApplymessage
-- ----------------------------
DROP PROCEDURE IF EXISTS `DelApplymessage`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DelApplymessage`(in ID int)
BEGIN
	delete from applymessage  where applymessage.ID=ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Delmanager
-- ----------------------------
DROP PROCEDURE IF EXISTS `Delmanager`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delmanager`(in managerid int)
BEGIN
	delete from managers where managers.ManagerID=managerid;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for DelOutSchoolPost
-- ----------------------------
DROP PROCEDURE IF EXISTS `DelOutSchoolPost`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DelOutSchoolPost`(in ID int)
BEGIN
	delete  from outschoolwork where outschoolwork.ID=ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for DelPostDetail
-- ----------------------------
DROP PROCEDURE IF EXISTS `DelPostDetail`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DelPostDetail`(in ID int)
BEGIN
	DELETE from postdetail where postdetail.ID=ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EditAlreadyRead
-- ----------------------------
DROP PROCEDURE IF EXISTS `EditAlreadyRead`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditAlreadyRead`(in StudentID varchar(20),in AlreadRead TINYINT)
BEGIN
	update messages set messages.AlreadyRead=AlreadRead where messages.Receiver=StudentID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EditApplymessageStatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `EditApplymessageStatus`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditApplymessageStatus`(in ID int)
BEGIN
	update applymessage set applymessage.UserVisible=FALSE where applymessage.ID=ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EditApplyStatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `EditApplyStatus`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditApplyStatus`(in ID int,in ApplyStatus varchar(4))
BEGIN
	update applymessage set applymessage.ApplyStatus=ApplyStatus where applymessage.ID=ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EditFeedbackIsreply
-- ----------------------------
DROP PROCEDURE IF EXISTS `EditFeedbackIsreply`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditFeedbackIsreply`(in ID int)
BEGIN
	update feedback set feedback.IsReply=true where feedback.ID=ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EditManagerByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `EditManagerByID`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditManagerByID`(in managername varchar(10),in account varchar(11),in email varchar(20),in phone varchar(11),in remark varchar(100),in type varchar(20),in ID int )
BEGIN
	UPDATE managers set managers.Email=email,managers.ManagerName=managername,managers.Account=account,managers.PhoneNum=phone,managers.Remark=remark,managers.Type=type where managers.ManagerID=ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EditOutSchoolPostStatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `EditOutSchoolPostStatus`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditOutSchoolPostStatus`(in PostID int,in Toenable TINYINT)
BEGIN
	UPDATE outschoolwork set outschoolwork.Toenable=Toenable where outschoolwork.ID=PostID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EditPassstatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `EditPassstatus`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditPassstatus`(in b TINYINT)
BEGIN
	UPDATE applychannel set applychannel.IsOpenApply=b;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EditPostDetail
-- ----------------------------
DROP PROCEDURE IF EXISTS `EditPostDetail`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditPostDetail`(in PostID int,in PostName varchar(20),in PostLocation varchar(50),in PostContent text,in NeedNumber int,in WorkTime varchar(20),in Requirement varchar(50),in Wages int,in Toenable TINYINT)
BEGIN
	
	UPDATE postdetail set postdetail.PostName=PostName,postdetail.PostLocation=PostLocation,postdetail.PostContent=PostContent,postdetail.NeedNumber=NeedNumber,postdetail.WorkTime=WorkTime,postdetail.Requirement=Requirement,postdetail.Wages=Wages,postdetail.Toenable=Toenable where postdetail.ID=PostID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EditPostDetailStatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `EditPostDetailStatus`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditPostDetailStatus`(in PostID int,in Toenable TINYINT)
BEGIN
	UPDATE postdetail set postdetail.Toenable=Toenable where postdetail.ID=PostID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EditPublishStatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `EditPublishStatus`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditPublishStatus`(in ID int,in Reason varchar(50),in PublishStatus varchar(5),in Toenable TINYINT)
BEGIN
	update outschoolwork set outschoolwork.PublishStatus=PublishStatus,outschoolwork.Reason=Reason,outschoolwork.Toenable=Toenable where outschoolwork.ID=ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetAccountMessage
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetAccountMessage`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAccountMessage`(in StudentID  VARCHAR(20))
BEGIN
	SELECT * from account WHERE account.StudentID=StudentID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetAllApplyMessage
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetAllApplyMessage`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllApplyMessage`(in ApplyStatus varchar(4),in ApplyStatus2 varchar(4),in ApplyStatus3 varchar(4))
BEGIN
	select * from applymessage where applymessage.ApplyStatus=ApplyStatus or applymessage.ApplyStatus=ApplyStatus2 or applymessage.ApplyStatus=ApplyStatus3;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetAllApplyMessageCount
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetAllApplyMessageCount`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllApplyMessageCount`()
BEGIN
	select count(*) from applymessage;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetAllManager
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetAllManager`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllManager`()
BEGIN
	SELECT * FROM managers;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetAllManagerCount
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetAllManagerCount`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllManagerCount`()
BEGIN
	SELECT count(*) FROM managers;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetAllOutSchoolPost
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetAllOutSchoolPost`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllOutSchoolPost`(in Toenable TINYINT,in Toenable2 TINYINT)
BEGIN
	select outschoolwork.ID,outschoolwork.Publisher,outschoolwork.WorkName,outschoolwork.WorkContent,outschoolwork.NeedNumber,outschoolwork.PublishTime,outschoolwork.Toenable from outschoolwork where (outschoolwork.Toenable= Toenable or outschoolwork.Toenable= Toenable2) and outschoolwork.PublishStatus='已通过';
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetAllPostDetail
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetAllPostDetail`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPostDetail`(in Toenable TINYINT,in Toenable2 TINYINT)
BEGIN
	SELECT * from postdetail where postdetail.Toenable=Toenable or postdetail.Toenable=Toenable2;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetAllPublishPost
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetAllPublishPost`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPublishPost`(in PublishStatus varchar(4),in PublishStatus2 varchar(4),in PublishStatus3 varchar(4))
BEGIN
	select outschoolwork.ID,outschoolwork.Publisher,outschoolwork.WorkName,outschoolwork.WorkContent,outschoolwork.NeedNumber,outschoolwork.PublishTime,outschoolwork.PublishStatus from outschoolwork where outschoolwork.PublishStatus= PublishStatus or outschoolwork.PublishStatus= PublishStatus2 or outschoolwork.PublishStatus= PublishStatus3 ;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetApplyMessageByApplystatus
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetApplyMessageByApplystatus`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetApplyMessageByApplystatus`(in studentID  VARCHAR(20),in ApplyStatus varchar(4))
BEGIN
	SELECT applymessage.ID,applymessage.StudentID,applymessage.StudentName,applymessage.PhoneNum,applymessage.ClassNum,applymessage.Sex,applymessage.ApplyLocation,applymessage.ApplyTime,applymessage.ApplyStatus FROM applymessage WHERE applymessage.StudentID=studentID and applymessage.ApplyStatus=ApplyStatus and applymessage.UserVisible=TRUE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetApplyMessageByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetApplyMessageByID`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetApplyMessageByID`(in id int)
BEGIN
	SELECT * from applymessage WHERE applymessage.ID=id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetApplyMessageByStudentID
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetApplyMessageByStudentID`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetApplyMessageByStudentID`(in StudentID  VARCHAR(20))
BEGIN
	SELECT applymessage.ID,applymessage.StudentID,applymessage.StudentName,applymessage.PhoneNum,applymessage.ClassNum,applymessage.Sex,applymessage.ApplyLocation,applymessage.ApplyTime,applymessage.ApplyStatus from applymessage WHERE applymessage.StudentID=StudentID and applymessage.UserVisible=TRUE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetApplyMessageByTime
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetApplyMessageByTime`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetApplyMessageByTime`(in starttime varchar(40),in arrivetime  varchar(40), in StudentID  VARCHAR(20))
BEGIN
	select count(*) from applymessage where applymessage.StudentID=StudentID and TIMESTAMP(applymessage.ApplyTime) BETWEEN starttime and arrivetime;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetFeedBack
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetFeedBack`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFeedBack`(in IsReply TINYINT,in IsReply2 TINYINT)
BEGIN
	select * from  feedback where feedback.IsReply=IsReply or feedback.IsReply=IsReply2 ;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetFeedBackCount
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetFeedBackCount`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFeedBackCount`()
BEGIN
	select count(*) from  feedback;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetManager
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetManager`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetManager`(in Account VARCHAR (11))
BEGIN
	SELECT * FROM managers where managers.Account=Account;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetManagerByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetManagerByID`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetManagerByID`(in ID int)
BEGIN
	SELECT * FROM managers where managers.ManagerID=ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetMessages
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetMessages`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMessages`(in StudentID varchar(20))
BEGIN
	select * from messages where messages.Receiver=StudentID order by id desc limit 10;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetMessagesCount
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetMessagesCount`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMessagesCount`(in StudentID varchar(20))
BEGIN
	select count(*) from messages where messages.Receiver=StudentID and messages.AlreadyRead=0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetNewNotice
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetNewNotice`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNewNotice`()
BEGIN
	SELECT * FROM notice order by id desc LIMIT 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetOpenApply
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetOpenApply`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOpenApply`()
BEGIN
	SELECT * from applychannel;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetOutSchoolPost
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetOutSchoolPost`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOutSchoolPost`()
BEGIN
	select outschoolwork.ID,outschoolwork.Publisher,outschoolwork.WorkName,outschoolwork.WorkContent,outschoolwork.Postimg from outschoolwork where outschoolwork.PublishStatus='已通过' and outschoolwork.Toenable=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetOutSchoolPostByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetOutSchoolPostByID`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOutSchoolPostByID`(in ID int)
BEGIN
	select * from outschoolwork where outschoolwork.ID=ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetOutSchoolPostByStudentID
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetOutSchoolPostByStudentID`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOutSchoolPostByStudentID`(in studentid varchar(20))
BEGIN
	select outschoolwork.ID,outschoolwork.PublishStatus,outschoolwork.PublishTime,outschoolwork.WorkContent,outschoolwork.WorkName,outschoolwork.WorkAddress,outschoolwork.WorkTime from outschoolwork where outschoolwork.Publisher=studentid;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetOutSchoolPostCount
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetOutSchoolPostCount`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOutSchoolPostCount`()
BEGIN
	select count(*) from outschoolwork;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetPostDetail
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetPostDetail`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPostDetail`()
BEGIN
	SELECT * from postdetail where postdetail.Toenable=true;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetPostDetailByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetPostDetailByID`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPostDetailByID`(in ID int)
BEGIN
	SELECT * from postdetail where postdetail.ID=ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetPostDetailCount
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetPostDetailCount`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPostDetailCount`()
BEGIN
	SELECT count(*) from postdetail ;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetPostDetailName
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetPostDetailName`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPostDetailName`()
BEGIN
	SELECT postdetail.PostName from postdetail where postdetail.Toenable=TRUE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetStudentMessage
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetStudentMessage`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentMessage`(in StudentID  VARCHAR(20))
BEGIN
	SELECT * FROM students where students.StudentID=StudentID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for InsertFeedback
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertFeedback`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertFeedback`(in StudentID  VARCHAR(20),in Depict VARCHAR(100),in FeedDate timestamp)
BEGIN
	INSERT into feedback(feedback.StudentID,feedback.Depict,feedback.FeedDate,feedback.IsReply) VALUES(StudentID,Depict,FeedDate,0);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for IssueNewNotice
-- ----------------------------
DROP PROCEDURE IF EXISTS `IssueNewNotice`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IssueNewNotice`(in publisher VARCHAR(11),in content text,in publishdate TIMESTAMP)
BEGIN
	insert into notice(notice.Publisher,notice.Content,notice.PublishDate) VALUES (publisher,content,publishdate);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManagerIsExist
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManagerIsExist`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagerIsExist`(in account  VARCHAR(20))
BEGIN
	SELECT count(*) from managers where managers.Account=account;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManagerLogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManagerLogin`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagerLogin`(in Account varchar(11),in mPassword  VARCHAR(16))
BEGIN
	SELECT count(*) from managers where managers.Account=Account and managers.`Password`=mPassword;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for PublishPost
-- ----------------------------
DROP PROCEDURE IF EXISTS `PublishPost`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PublishPost`(in publisher varchar(20),in workname varchar(10),in worktime varchar(20),in workaddress varchar(30),in neednumber varchar(20),in wagestandard varchar(20),in workcontent varchar(60),in requirement varchar(20),in contactway varchar(20),in publishtime TIMESTAMP,in postimg varchar(100), in reason varchar(50))
BEGIN
	insert into outschoolwork(outschoolwork.Publisher,outschoolwork.WorkName,outschoolwork.WorkTime,outschoolwork.WorkAddress,outschoolwork.NeedNumber,outschoolwork.WageStandard,outschoolwork.WorkContent,outschoolwork.Requirement,outschoolwork.ContactWay,outschoolwork.PublishTime,outschoolwork.Postimg,outschoolwork.Reason) VALUES(publisher,workname,worktime,workaddress,neednumber,wagestandard,workcontent,requirement,contactway,publishtime,postimg,reason);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SendMessage
-- ----------------------------
DROP PROCEDURE IF EXISTS `SendMessage`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SendMessage`(in Sender varchar(20),in Receiver varchar(20),in Content text,in SendingDate TIMESTAMP,in AlreadyRead TINYINT)
BEGIN
	insert into messages(messages.Sender,messages.Receiver,messages.Content,messages.SendingDate,messages.AlreadyRead) values(Sender,Receiver,Content,SendingDate,AlreadyRead);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for StudentIsExist
-- ----------------------------
DROP PROCEDURE IF EXISTS `StudentIsExist`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentIsExist`(in StudentID  VARCHAR(20))
BEGIN
	SELECT count(*) from students where students.StudentID=StudentID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for StudentLogin
-- ----------------------------
DROP PROCEDURE IF EXISTS `StudentLogin`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentLogin`(in StudentID  VARCHAR(20),in sPassword  VARCHAR(16))
BEGIN
	SELECT count(*) from account where account.StudentID=StudentID and account.`Password`=sPassword;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
