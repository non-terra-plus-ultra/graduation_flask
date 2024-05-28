/*
 Navicat Premium Data Transfer

 Source Server         : mysql_wjw
 Source Server Type    : MySQL
 Source Server Version : 50735 (5.7.35)
 Source Host           : localhost:3306
 Source Schema         : graproject

 Target Server Type    : MySQL
 Target Server Version : 50735 (5.7.35)
 File Encoding         : 65001

 Date: 28/05/2024 15:08:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `ma_pno` int(8) NOT NULL COMMENT '管理员账号',
  `ma_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`ma_pno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (111, '111');

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result`  (
  `result_no` int(11) NOT NULL AUTO_INCREMENT,
  `result_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `result_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `result_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `result_time` datetime NULL DEFAULT NULL,
  `pno` int(8) NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`result_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES (1, 'balloon197.jpg', 'D:/pythonProject/graflask/detect/20202020/result1/balloon197.jpg', 'detect', '2024-04-17 23:03:54', 20202020, 1);
INSERT INTO `result` VALUES (2, 'balloon402.jpg', 'D:/pythonProject/graflask/detect/20202020/result1/balloon402.jpg', 'detect', '2024-04-17 23:03:54', 20202020, 1);
INSERT INTO `result` VALUES (3, 'balloon439.jpg', 'D:/pythonProject/graflask/detect/20202020/result1/balloon439.jpg', 'detect', '2024-04-17 23:03:54', 20202020, 1);
INSERT INTO `result` VALUES (4, 'balloon510.jpg', 'D:/pythonProject/graflask/detect/20202020/result1/balloon510.jpg', 'detect', '2024-04-17 23:03:54', 20202020, 1);
INSERT INTO `result` VALUES (5, '1_ice1006.jpg', 'D:/pythonProject/graflask/segment/20202020/result1/1_ice1006.jpg', 'segment', '2024-04-17 23:04:15', 20202020, 1);
INSERT INTO `result` VALUES (6, '1_ice502.jpg', 'D:/pythonProject/graflask/segment/20202020/result1/1_ice502.jpg', 'segment', '2024-04-17 23:04:15', 20202020, 1);
INSERT INTO `result` VALUES (7, '1_ice510.jpg', 'D:/pythonProject/graflask/segment/20202020/result1/1_ice510.jpg', 'segment', '2024-04-17 23:04:15', 20202020, 1);
INSERT INTO `result` VALUES (8, '1_ice512.jpg', 'D:/pythonProject/graflask/segment/20202020/result1/1_ice512.jpg', 'segment', '2024-04-17 23:04:15', 20202020, 1);
INSERT INTO `result` VALUES (9, '1_ice518.jpg', 'D:/pythonProject/graflask/segment/20202020/result1/1_ice518.jpg', 'segment', '2024-04-17 23:04:15', 20202020, 1);
INSERT INTO `result` VALUES (10, '1_ice531.jpg', 'D:/pythonProject/graflask/segment/20202020/result1/1_ice531.jpg', 'segment', '2024-04-17 23:04:15', 20202020, 1);
INSERT INTO `result` VALUES (11, '1_ice593.jpg', 'D:/pythonProject/graflask/segment/20202020/result1/1_ice593.jpg', 'segment', '2024-04-17 23:04:15', 20202020, 1);
INSERT INTO `result` VALUES (12, '1_ice597.jpg', 'D:/pythonProject/graflask/segment/20202020/result1/1_ice597.jpg', 'segment', '2024-04-17 23:04:15', 20202020, 1);
INSERT INTO `result` VALUES (13, '1_ice916.jpg', 'D:/pythonProject/graflask/segment/20202020/result1/1_ice916.jpg', 'segment', '2024-04-17 23:04:15', 20202020, 1);
INSERT INTO `result` VALUES (14, '1_ice920.jpg', 'D:/pythonProject/graflask/segment/20202020/result1/1_ice920.jpg', 'segment', '2024-04-17 23:04:15', 20202020, 1);
INSERT INTO `result` VALUES (15, '1_ice990.jpg', 'D:/pythonProject/graflask/segment/20202020/result1/1_ice990.jpg', 'segment', '2024-04-17 23:04:15', 20202020, 1);
INSERT INTO `result` VALUES (16, '1_ice1006.jpg', 'D:/pythonProject/graflask/segment/20202020/result2/1_ice1006.jpg', 'segment', '2024-04-17 23:05:12', 20202020, 2);
INSERT INTO `result` VALUES (17, '1_ice502.jpg', 'D:/pythonProject/graflask/segment/20202020/result2/1_ice502.jpg', 'segment', '2024-04-17 23:05:12', 20202020, 2);
INSERT INTO `result` VALUES (18, '1_ice510.jpg', 'D:/pythonProject/graflask/segment/20202020/result2/1_ice510.jpg', 'segment', '2024-04-17 23:05:12', 20202020, 2);
INSERT INTO `result` VALUES (19, '1_ice512.jpg', 'D:/pythonProject/graflask/segment/20202020/result2/1_ice512.jpg', 'segment', '2024-04-17 23:05:12', 20202020, 2);
INSERT INTO `result` VALUES (20, '1_ice518.jpg', 'D:/pythonProject/graflask/segment/20202020/result2/1_ice518.jpg', 'segment', '2024-04-17 23:05:12', 20202020, 2);
INSERT INTO `result` VALUES (21, '1_ice531.jpg', 'D:/pythonProject/graflask/segment/20202020/result2/1_ice531.jpg', 'segment', '2024-04-17 23:05:12', 20202020, 2);
INSERT INTO `result` VALUES (22, '1_ice593.jpg', 'D:/pythonProject/graflask/segment/20202020/result2/1_ice593.jpg', 'segment', '2024-04-17 23:05:13', 20202020, 2);
INSERT INTO `result` VALUES (23, '1_ice597.jpg', 'D:/pythonProject/graflask/segment/20202020/result2/1_ice597.jpg', 'segment', '2024-04-17 23:05:13', 20202020, 2);
INSERT INTO `result` VALUES (24, '1_ice916.jpg', 'D:/pythonProject/graflask/segment/20202020/result2/1_ice916.jpg', 'segment', '2024-04-17 23:05:13', 20202020, 2);
INSERT INTO `result` VALUES (25, '1_ice920.jpg', 'D:/pythonProject/graflask/segment/20202020/result2/1_ice920.jpg', 'segment', '2024-04-17 23:05:13', 20202020, 2);
INSERT INTO `result` VALUES (26, '1_ice990.jpg', 'D:/pythonProject/graflask/segment/20202020/result2/1_ice990.jpg', 'segment', '2024-04-17 23:05:13', 20202020, 2);
INSERT INTO `result` VALUES (27, 'balloon197.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/balloon197.jpg', 'detect', '2024-04-29 19:30:24', 20202020, 2);
INSERT INTO `result` VALUES (28, 'balloon402.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/balloon402.jpg', 'detect', '2024-04-29 19:30:24', 20202020, 2);
INSERT INTO `result` VALUES (29, 'balloon439.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/balloon439.jpg', 'detect', '2024-04-29 19:30:24', 20202020, 2);
INSERT INTO `result` VALUES (30, 'balloon510.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/balloon510.jpg', 'detect', '2024-04-29 19:30:24', 20202020, 2);
INSERT INTO `result` VALUES (31, 'balloon520.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/balloon520.jpg', 'detect', '2024-04-29 19:30:24', 20202020, 2);
INSERT INTO `result` VALUES (32, 'balloon541.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/balloon541.jpg', 'detect', '2024-04-29 19:30:24', 20202020, 2);
INSERT INTO `result` VALUES (33, 'kite10.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite10.jpg', 'detect', '2024-04-29 19:30:24', 20202020, 2);
INSERT INTO `result` VALUES (34, 'kite102.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite102.jpg', 'detect', '2024-04-29 19:30:24', 20202020, 2);
INSERT INTO `result` VALUES (35, 'kite160.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite160.jpg', 'detect', '2024-04-29 19:30:25', 20202020, 2);
INSERT INTO `result` VALUES (36, 'kite177.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite177.jpg', 'detect', '2024-04-29 19:30:25', 20202020, 2);
INSERT INTO `result` VALUES (37, 'kite18.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite18.jpg', 'detect', '2024-04-29 19:30:25', 20202020, 2);
INSERT INTO `result` VALUES (38, 'kite206.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite206.jpg', 'detect', '2024-04-29 19:30:25', 20202020, 2);
INSERT INTO `result` VALUES (39, 'kite218.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite218.jpg', 'detect', '2024-04-29 19:30:25', 20202020, 2);
INSERT INTO `result` VALUES (40, 'kite235.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite235.jpg', 'detect', '2024-04-29 19:30:25', 20202020, 2);
INSERT INTO `result` VALUES (41, 'kite341.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite341.jpg', 'detect', '2024-04-29 19:30:25', 20202020, 2);
INSERT INTO `result` VALUES (42, 'kite472.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite472.jpg', 'detect', '2024-04-29 19:30:26', 20202020, 2);
INSERT INTO `result` VALUES (43, 'kite5.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite5.jpg', 'detect', '2024-04-29 19:30:26', 20202020, 2);
INSERT INTO `result` VALUES (44, 'kite50.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite50.jpg', 'detect', '2024-04-29 19:30:26', 20202020, 2);
INSERT INTO `result` VALUES (45, 'kite6.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/kite6.jpg', 'detect', '2024-04-29 19:30:26', 20202020, 2);
INSERT INTO `result` VALUES (46, 'nest149.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest149.jpg', 'detect', '2024-04-29 19:30:26', 20202020, 2);
INSERT INTO `result` VALUES (47, 'nest201.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest201.jpg', 'detect', '2024-04-29 19:30:26', 20202020, 2);
INSERT INTO `result` VALUES (48, 'nest306.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest306.jpg', 'detect', '2024-04-29 19:30:26', 20202020, 2);
INSERT INTO `result` VALUES (49, 'nest414.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest414.jpg', 'detect', '2024-04-29 19:30:27', 20202020, 2);
INSERT INTO `result` VALUES (50, 'nest463.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest463.jpg', 'detect', '2024-04-29 19:30:27', 20202020, 2);
INSERT INTO `result` VALUES (51, 'nest534.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest534.jpg', 'detect', '2024-04-29 19:30:27', 20202020, 2);
INSERT INTO `result` VALUES (52, 'nest548.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest548.jpg', 'detect', '2024-04-29 19:30:27', 20202020, 2);
INSERT INTO `result` VALUES (53, 'nest550.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest550.jpg', 'detect', '2024-04-29 19:30:27', 20202020, 2);
INSERT INTO `result` VALUES (54, 'nest592.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest592.jpg', 'detect', '2024-04-29 19:30:27', 20202020, 2);
INSERT INTO `result` VALUES (55, 'nest620.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest620.jpg', 'detect', '2024-04-29 19:30:27', 20202020, 2);
INSERT INTO `result` VALUES (56, 'nest640.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest640.jpg', 'detect', '2024-04-29 19:30:27', 20202020, 2);
INSERT INTO `result` VALUES (57, 'nest664.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest664.jpg', 'detect', '2024-04-29 19:30:27', 20202020, 2);
INSERT INTO `result` VALUES (58, 'nest669.jpg', 'D:/pythonProject/graflask/detect/20202020/result2/nest669.jpg', 'detect', '2024-04-29 19:30:28', 20202020, 2);
INSERT INTO `result` VALUES (59, 'nest306.jpg', 'D:/pythonProject/graflask/detect/20202020/result3/nest306.jpg', 'detect', '2024-04-29 19:30:52', 20202020, 3);
INSERT INTO `result` VALUES (60, 'nest414.jpg', 'D:/pythonProject/graflask/detect/20202020/result3/nest414.jpg', 'detect', '2024-04-29 19:30:52', 20202020, 3);
INSERT INTO `result` VALUES (61, 'nest463.jpg', 'D:/pythonProject/graflask/detect/20202020/result3/nest463.jpg', 'detect', '2024-04-29 19:30:52', 20202020, 3);
INSERT INTO `result` VALUES (62, '1_ice502.jpg', 'D:/pythonProject/graflask/segment/20202020/result3/1_ice502.jpg', 'segment', '2024-04-29 19:31:44', 20202020, 3);
INSERT INTO `result` VALUES (63, '1_ice510.jpg', 'D:/pythonProject/graflask/segment/20202020/result3/1_ice510.jpg', 'segment', '2024-04-29 19:31:44', 20202020, 3);
INSERT INTO `result` VALUES (64, '1_ice916.jpg', 'D:/pythonProject/graflask/segment/20202020/result3/1_ice916.jpg', 'segment', '2024-04-29 19:31:44', 20202020, 3);
INSERT INTO `result` VALUES (65, '1_ice510.jpg', 'D:/pythonProject/graflask/segment/20202020/result4/1_ice510.jpg', 'segment', '2024-04-29 19:36:51', 20202020, 4);
INSERT INTO `result` VALUES (66, '1_ice1006.jpg', 'D:/pythonProject/graflask/segment/20200001/result1/1_ice1006.jpg', 'segment', '2024-04-29 19:37:54', 20200001, 1);
INSERT INTO `result` VALUES (67, '1_ice502.jpg', 'D:/pythonProject/graflask/segment/20200001/result1/1_ice502.jpg', 'segment', '2024-04-29 19:37:54', 20200001, 1);
INSERT INTO `result` VALUES (68, '1_ice510.jpg', 'D:/pythonProject/graflask/segment/20200001/result1/1_ice510.jpg', 'segment', '2024-04-29 19:37:55', 20200001, 1);
INSERT INTO `result` VALUES (69, '1_ice512.jpg', 'D:/pythonProject/graflask/segment/20200001/result1/1_ice512.jpg', 'segment', '2024-04-29 19:37:55', 20200001, 1);
INSERT INTO `result` VALUES (70, '1_ice518.jpg', 'D:/pythonProject/graflask/segment/20200001/result1/1_ice518.jpg', 'segment', '2024-04-29 19:37:55', 20200001, 1);
INSERT INTO `result` VALUES (71, '1_ice531.jpg', 'D:/pythonProject/graflask/segment/20200001/result1/1_ice531.jpg', 'segment', '2024-04-29 19:37:55', 20200001, 1);
INSERT INTO `result` VALUES (72, '1_ice593.jpg', 'D:/pythonProject/graflask/segment/20200001/result1/1_ice593.jpg', 'segment', '2024-04-29 19:37:55', 20200001, 1);
INSERT INTO `result` VALUES (73, '1_ice597.jpg', 'D:/pythonProject/graflask/segment/20200001/result1/1_ice597.jpg', 'segment', '2024-04-29 19:37:55', 20200001, 1);
INSERT INTO `result` VALUES (74, '1_ice916.jpg', 'D:/pythonProject/graflask/segment/20200001/result1/1_ice916.jpg', 'segment', '2024-04-29 19:37:55', 20200001, 1);
INSERT INTO `result` VALUES (75, '1_ice920.jpg', 'D:/pythonProject/graflask/segment/20200001/result1/1_ice920.jpg', 'segment', '2024-04-29 19:37:55', 20200001, 1);
INSERT INTO `result` VALUES (76, '1_ice990.jpg', 'D:/pythonProject/graflask/segment/20200001/result1/1_ice990.jpg', 'segment', '2024-04-29 19:37:55', 20200001, 1);
INSERT INTO `result` VALUES (77, 'balloon197.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/balloon197.jpg', 'detect', '2024-04-29 19:38:12', 20200001, 1);
INSERT INTO `result` VALUES (78, 'balloon402.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/balloon402.jpg', 'detect', '2024-04-29 19:38:12', 20200001, 1);
INSERT INTO `result` VALUES (79, 'balloon439.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/balloon439.jpg', 'detect', '2024-04-29 19:38:12', 20200001, 1);
INSERT INTO `result` VALUES (80, 'balloon510.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/balloon510.jpg', 'detect', '2024-04-29 19:38:12', 20200001, 1);
INSERT INTO `result` VALUES (81, 'balloon520.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/balloon520.jpg', 'detect', '2024-04-29 19:38:12', 20200001, 1);
INSERT INTO `result` VALUES (82, 'balloon541.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/balloon541.jpg', 'detect', '2024-04-29 19:38:12', 20200001, 1);
INSERT INTO `result` VALUES (83, 'kite10.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite10.jpg', 'detect', '2024-04-29 19:38:12', 20200001, 1);
INSERT INTO `result` VALUES (84, 'kite102.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite102.jpg', 'detect', '2024-04-29 19:38:12', 20200001, 1);
INSERT INTO `result` VALUES (85, 'kite160.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite160.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (86, 'kite177.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite177.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (87, 'kite18.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite18.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (88, 'kite206.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite206.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (89, 'kite218.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite218.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (90, 'kite235.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite235.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (91, 'kite341.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite341.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (92, 'kite472.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite472.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (93, 'kite5.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite5.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (94, 'kite50.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite50.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (95, 'kite6.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/kite6.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (96, 'nest149.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest149.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (97, 'nest201.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest201.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (98, 'nest306.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest306.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (99, 'nest414.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest414.jpg', 'detect', '2024-04-29 19:38:13', 20200001, 1);
INSERT INTO `result` VALUES (100, 'nest463.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest463.jpg', 'detect', '2024-04-29 19:38:14', 20200001, 1);
INSERT INTO `result` VALUES (101, 'nest534.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest534.jpg', 'detect', '2024-04-29 19:38:14', 20200001, 1);
INSERT INTO `result` VALUES (102, 'nest548.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest548.jpg', 'detect', '2024-04-29 19:38:14', 20200001, 1);
INSERT INTO `result` VALUES (103, 'nest550.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest550.jpg', 'detect', '2024-04-29 19:38:14', 20200001, 1);
INSERT INTO `result` VALUES (104, 'nest592.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest592.jpg', 'detect', '2024-04-29 19:38:14', 20200001, 1);
INSERT INTO `result` VALUES (105, 'nest620.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest620.jpg', 'detect', '2024-04-29 19:38:14', 20200001, 1);
INSERT INTO `result` VALUES (106, 'nest640.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest640.jpg', 'detect', '2024-04-29 19:38:14', 20200001, 1);
INSERT INTO `result` VALUES (107, 'nest664.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest664.jpg', 'detect', '2024-04-29 19:38:14', 20200001, 1);
INSERT INTO `result` VALUES (108, 'nest669.jpg', 'D:/pythonProject/graflask/detect/20200001/result1/nest669.jpg', 'detect', '2024-04-29 19:38:14', 20200001, 1);
INSERT INTO `result` VALUES (109, 'balloon510.jpg', 'D:/pythonProject/graflask/detect/20200001/result2/balloon510.jpg', 'detect', '2024-04-29 19:39:15', 20200001, 2);
INSERT INTO `result` VALUES (110, 'balloon520.jpg', 'D:/pythonProject/graflask/detect/20200001/result2/balloon520.jpg', 'detect', '2024-04-29 19:39:15', 20200001, 2);
INSERT INTO `result` VALUES (111, 'kite5.jpg', 'D:/pythonProject/graflask/detect/20200001/result3/kite5.jpg', 'detect', '2024-04-29 19:39:29', 20200001, 3);
INSERT INTO `result` VALUES (112, 'kite6.jpg', 'D:/pythonProject/graflask/detect/20200001/result3/kite6.jpg', 'detect', '2024-04-29 19:39:29', 20200001, 3);
INSERT INTO `result` VALUES (113, 'kite160.jpg', 'D:/pythonProject/graflask/detect/20200001/result4/kite160.jpg', 'detect', '2024-04-29 19:39:39', 20200001, 4);
INSERT INTO `result` VALUES (114, 'kite177.jpg', 'D:/pythonProject/graflask/detect/20200001/result4/kite177.jpg', 'detect', '2024-04-29 19:39:40', 20200001, 4);
INSERT INTO `result` VALUES (115, '1_ice510.jpg', 'D:/pythonProject/graflask/segment/20200001/result2/1_ice510.jpg', 'segment', '2024-04-29 19:39:59', 20200001, 2);
INSERT INTO `result` VALUES (116, '1_ice916.jpg', 'D:/pythonProject/graflask/segment/20200001/result2/1_ice916.jpg', 'segment', '2024-04-29 19:39:59', 20200001, 2);
INSERT INTO `result` VALUES (117, '1_ice920.jpg', 'D:/pythonProject/graflask/segment/20200001/result3/1_ice920.jpg', 'segment', '2024-04-29 19:40:10', 20200001, 3);
INSERT INTO `result` VALUES (118, '1_ice990.jpg', 'D:/pythonProject/graflask/segment/20200001/result3/1_ice990.jpg', 'segment', '2024-04-29 19:40:10', 20200001, 3);
INSERT INTO `result` VALUES (119, '1_ice920.jpg', 'D:/pythonProject/graflask/segment/20200001/result4/1_ice920.jpg', 'segment', '2024-04-29 19:40:15', 20200001, 4);
INSERT INTO `result` VALUES (120, '1_ice990.jpg', 'D:/pythonProject/graflask/segment/20200001/result4/1_ice990.jpg', 'segment', '2024-04-29 19:40:15', 20200001, 4);
INSERT INTO `result` VALUES (121, '1_ice920.jpg', 'D:/pythonProject/graflask/segment/20200001/result5/1_ice920.jpg', 'segment', '2024-04-29 19:40:17', 20200001, 5);
INSERT INTO `result` VALUES (122, '1_ice990.jpg', 'D:/pythonProject/graflask/segment/20200001/result5/1_ice990.jpg', 'segment', '2024-04-29 19:40:17', 20200001, 5);
INSERT INTO `result` VALUES (123, 'nest592.jpg', 'D:/pythonProject/graflask/detect/20202384/result1/nest592.jpg', 'detect', '2024-04-29 19:41:19', 20202384, 1);
INSERT INTO `result` VALUES (124, 'nest620.jpg', 'D:/pythonProject/graflask/detect/20202384/result1/nest620.jpg', 'detect', '2024-04-29 19:41:19', 20202384, 1);
INSERT INTO `result` VALUES (125, 'kite10.jpg', 'D:/pythonProject/graflask/detect/20202384/result2/kite10.jpg', 'detect', '2024-04-29 19:41:33', 20202384, 2);
INSERT INTO `result` VALUES (126, 'kite18.jpg', 'D:/pythonProject/graflask/detect/20202384/result2/kite18.jpg', 'detect', '2024-04-29 19:41:33', 20202384, 2);
INSERT INTO `result` VALUES (127, 'kite5.jpg', 'D:/pythonProject/graflask/detect/20202384/result3/kite5.jpg', 'detect', '2024-04-29 19:41:42', 20202384, 3);
INSERT INTO `result` VALUES (128, 'kite6.jpg', 'D:/pythonProject/graflask/detect/20202384/result3/kite6.jpg', 'detect', '2024-04-29 19:41:42', 20202384, 3);
INSERT INTO `result` VALUES (129, 'nest550.jpg', 'D:/pythonProject/graflask/detect/20202384/result4/nest550.jpg', 'detect', '2024-04-29 19:41:52', 20202384, 4);
INSERT INTO `result` VALUES (130, 'nest592.jpg', 'D:/pythonProject/graflask/detect/20202384/result4/nest592.jpg', 'detect', '2024-04-29 19:41:53', 20202384, 4);
INSERT INTO `result` VALUES (131, '1_ice916.jpg', 'D:/pythonProject/graflask/segment/20202384/result1/1_ice916.jpg', 'segment', '2024-04-29 19:42:10', 20202384, 1);
INSERT INTO `result` VALUES (132, '1_ice920.jpg', 'D:/pythonProject/graflask/segment/20202384/result1/1_ice920.jpg', 'segment', '2024-04-29 19:42:10', 20202384, 1);
INSERT INTO `result` VALUES (133, '1_ice593.jpg', 'D:/pythonProject/graflask/segment/20202384/result2/1_ice593.jpg', 'segment', '2024-04-29 19:42:19', 20202384, 2);
INSERT INTO `result` VALUES (134, '1_ice597.jpg', 'D:/pythonProject/graflask/segment/20202384/result2/1_ice597.jpg', 'segment', '2024-04-29 19:42:19', 20202384, 2);
INSERT INTO `result` VALUES (135, '1_ice512.jpg', 'D:/pythonProject/graflask/segment/20202384/result3/1_ice512.jpg', 'segment', '2024-04-29 19:42:45', 20202384, 3);
INSERT INTO `result` VALUES (136, '1_ice597.jpg', 'D:/pythonProject/graflask/segment/20202384/result3/1_ice597.jpg', 'segment', '2024-04-29 19:42:45', 20202384, 3);
INSERT INTO `result` VALUES (137, '1_ice916.jpg', 'D:/pythonProject/graflask/segment/20202384/result3/1_ice916.jpg', 'segment', '2024-04-29 19:42:45', 20202384, 3);
INSERT INTO `result` VALUES (138, 'balloon197.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/balloon197.jpg', 'detect', '2024-05-02 23:22:24', 20202384, 5);
INSERT INTO `result` VALUES (139, 'balloon402.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/balloon402.jpg', 'detect', '2024-05-02 23:22:25', 20202384, 5);
INSERT INTO `result` VALUES (140, 'balloon439.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/balloon439.jpg', 'detect', '2024-05-02 23:22:25', 20202384, 5);
INSERT INTO `result` VALUES (141, 'balloon510.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/balloon510.jpg', 'detect', '2024-05-02 23:22:25', 20202384, 5);
INSERT INTO `result` VALUES (142, 'balloon520.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/balloon520.jpg', 'detect', '2024-05-02 23:22:25', 20202384, 5);
INSERT INTO `result` VALUES (143, 'balloon541.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/balloon541.jpg', 'detect', '2024-05-02 23:22:25', 20202384, 5);
INSERT INTO `result` VALUES (144, 'kite10.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite10.jpg', 'detect', '2024-05-02 23:22:25', 20202384, 5);
INSERT INTO `result` VALUES (145, 'kite102.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite102.jpg', 'detect', '2024-05-02 23:22:25', 20202384, 5);
INSERT INTO `result` VALUES (146, 'kite160.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite160.jpg', 'detect', '2024-05-02 23:22:25', 20202384, 5);
INSERT INTO `result` VALUES (147, 'kite177.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite177.jpg', 'detect', '2024-05-02 23:22:26', 20202384, 5);
INSERT INTO `result` VALUES (148, 'kite18.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite18.jpg', 'detect', '2024-05-02 23:22:26', 20202384, 5);
INSERT INTO `result` VALUES (149, 'kite206.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite206.jpg', 'detect', '2024-05-02 23:22:26', 20202384, 5);
INSERT INTO `result` VALUES (150, 'kite218.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite218.jpg', 'detect', '2024-05-02 23:22:27', 20202384, 5);
INSERT INTO `result` VALUES (151, 'kite235.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite235.jpg', 'detect', '2024-05-02 23:22:27', 20202384, 5);
INSERT INTO `result` VALUES (152, 'kite341.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite341.jpg', 'detect', '2024-05-02 23:22:27', 20202384, 5);
INSERT INTO `result` VALUES (153, 'kite472.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite472.jpg', 'detect', '2024-05-02 23:22:28', 20202384, 5);
INSERT INTO `result` VALUES (154, 'kite5.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite5.jpg', 'detect', '2024-05-02 23:22:28', 20202384, 5);
INSERT INTO `result` VALUES (155, 'kite50.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite50.jpg', 'detect', '2024-05-02 23:22:28', 20202384, 5);
INSERT INTO `result` VALUES (156, 'kite6.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/kite6.jpg', 'detect', '2024-05-02 23:22:29', 20202384, 5);
INSERT INTO `result` VALUES (157, 'nest149.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest149.jpg', 'detect', '2024-05-02 23:22:29', 20202384, 5);
INSERT INTO `result` VALUES (158, 'nest201.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest201.jpg', 'detect', '2024-05-02 23:22:29', 20202384, 5);
INSERT INTO `result` VALUES (159, 'nest306.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest306.jpg', 'detect', '2024-05-02 23:22:30', 20202384, 5);
INSERT INTO `result` VALUES (160, 'nest414.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest414.jpg', 'detect', '2024-05-02 23:22:30', 20202384, 5);
INSERT INTO `result` VALUES (161, 'nest463.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest463.jpg', 'detect', '2024-05-02 23:22:30', 20202384, 5);
INSERT INTO `result` VALUES (162, 'nest534.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest534.jpg', 'detect', '2024-05-02 23:22:31', 20202384, 5);
INSERT INTO `result` VALUES (163, 'nest548.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest548.jpg', 'detect', '2024-05-02 23:22:31', 20202384, 5);
INSERT INTO `result` VALUES (164, 'nest550.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest550.jpg', 'detect', '2024-05-02 23:22:31', 20202384, 5);
INSERT INTO `result` VALUES (165, 'nest592.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest592.jpg', 'detect', '2024-05-02 23:22:31', 20202384, 5);
INSERT INTO `result` VALUES (166, 'nest620.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest620.jpg', 'detect', '2024-05-02 23:22:32', 20202384, 5);
INSERT INTO `result` VALUES (167, 'nest640.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest640.jpg', 'detect', '2024-05-02 23:22:32', 20202384, 5);
INSERT INTO `result` VALUES (168, 'nest664.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest664.jpg', 'detect', '2024-05-02 23:22:32', 20202384, 5);
INSERT INTO `result` VALUES (169, 'nest669.jpg', 'D:/pythonProject/graflask/detect/20202384/result5/nest669.jpg', 'detect', '2024-05-02 23:22:32', 20202384, 5);
INSERT INTO `result` VALUES (170, 'balloon197.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/balloon197.jpg', 'detect', '2024-05-02 23:22:37', 20202384, 6);
INSERT INTO `result` VALUES (171, 'balloon402.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/balloon402.jpg', 'detect', '2024-05-02 23:22:38', 20202384, 6);
INSERT INTO `result` VALUES (172, 'balloon439.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/balloon439.jpg', 'detect', '2024-05-02 23:22:38', 20202384, 6);
INSERT INTO `result` VALUES (173, 'balloon510.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/balloon510.jpg', 'detect', '2024-05-02 23:22:38', 20202384, 6);
INSERT INTO `result` VALUES (174, 'balloon520.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/balloon520.jpg', 'detect', '2024-05-02 23:22:38', 20202384, 6);
INSERT INTO `result` VALUES (175, 'balloon541.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/balloon541.jpg', 'detect', '2024-05-02 23:22:38', 20202384, 6);
INSERT INTO `result` VALUES (176, 'kite10.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite10.jpg', 'detect', '2024-05-02 23:22:38', 20202384, 6);
INSERT INTO `result` VALUES (177, 'kite102.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite102.jpg', 'detect', '2024-05-02 23:22:38', 20202384, 6);
INSERT INTO `result` VALUES (178, 'kite160.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite160.jpg', 'detect', '2024-05-02 23:22:39', 20202384, 6);
INSERT INTO `result` VALUES (179, 'kite177.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite177.jpg', 'detect', '2024-05-02 23:22:39', 20202384, 6);
INSERT INTO `result` VALUES (180, 'kite18.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite18.jpg', 'detect', '2024-05-02 23:22:39', 20202384, 6);
INSERT INTO `result` VALUES (181, 'kite206.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite206.jpg', 'detect', '2024-05-02 23:22:39', 20202384, 6);
INSERT INTO `result` VALUES (182, 'kite218.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite218.jpg', 'detect', '2024-05-02 23:22:39', 20202384, 6);
INSERT INTO `result` VALUES (183, 'kite235.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite235.jpg', 'detect', '2024-05-02 23:22:39', 20202384, 6);
INSERT INTO `result` VALUES (184, 'kite341.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite341.jpg', 'detect', '2024-05-02 23:22:39', 20202384, 6);
INSERT INTO `result` VALUES (185, 'kite472.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite472.jpg', 'detect', '2024-05-02 23:22:40', 20202384, 6);
INSERT INTO `result` VALUES (186, 'kite5.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite5.jpg', 'detect', '2024-05-02 23:22:40', 20202384, 6);
INSERT INTO `result` VALUES (187, 'kite50.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite50.jpg', 'detect', '2024-05-02 23:22:40', 20202384, 6);
INSERT INTO `result` VALUES (188, 'kite6.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/kite6.jpg', 'detect', '2024-05-02 23:22:40', 20202384, 6);
INSERT INTO `result` VALUES (189, 'nest149.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest149.jpg', 'detect', '2024-05-02 23:22:40', 20202384, 6);
INSERT INTO `result` VALUES (190, 'nest201.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest201.jpg', 'detect', '2024-05-02 23:22:40', 20202384, 6);
INSERT INTO `result` VALUES (191, 'nest306.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest306.jpg', 'detect', '2024-05-02 23:22:41', 20202384, 6);
INSERT INTO `result` VALUES (192, 'nest414.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest414.jpg', 'detect', '2024-05-02 23:22:41', 20202384, 6);
INSERT INTO `result` VALUES (193, 'nest463.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest463.jpg', 'detect', '2024-05-02 23:22:41', 20202384, 6);
INSERT INTO `result` VALUES (194, 'nest534.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest534.jpg', 'detect', '2024-05-02 23:22:41', 20202384, 6);
INSERT INTO `result` VALUES (195, 'nest548.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest548.jpg', 'detect', '2024-05-02 23:22:41', 20202384, 6);
INSERT INTO `result` VALUES (196, 'nest550.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest550.jpg', 'detect', '2024-05-02 23:22:41', 20202384, 6);
INSERT INTO `result` VALUES (197, 'nest592.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest592.jpg', 'detect', '2024-05-02 23:22:42', 20202384, 6);
INSERT INTO `result` VALUES (198, 'nest620.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest620.jpg', 'detect', '2024-05-02 23:22:42', 20202384, 6);
INSERT INTO `result` VALUES (199, 'nest640.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest640.jpg', 'detect', '2024-05-02 23:22:42', 20202384, 6);
INSERT INTO `result` VALUES (200, 'nest664.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest664.jpg', 'detect', '2024-05-02 23:22:42', 20202384, 6);
INSERT INTO `result` VALUES (201, 'nest669.jpg', 'D:/pythonProject/graflask/detect/20202384/result6/nest669.jpg', 'detect', '2024-05-02 23:22:42', 20202384, 6);
INSERT INTO `result` VALUES (202, 'balloon197.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/balloon197.jpg', 'detect', '2024-05-02 23:23:04', 20202384, 7);
INSERT INTO `result` VALUES (203, 'balloon402.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/balloon402.jpg', 'detect', '2024-05-02 23:23:04', 20202384, 7);
INSERT INTO `result` VALUES (204, 'balloon439.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/balloon439.jpg', 'detect', '2024-05-02 23:23:04', 20202384, 7);
INSERT INTO `result` VALUES (205, 'balloon510.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/balloon510.jpg', 'detect', '2024-05-02 23:23:04', 20202384, 7);
INSERT INTO `result` VALUES (206, 'balloon520.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/balloon520.jpg', 'detect', '2024-05-02 23:23:04', 20202384, 7);
INSERT INTO `result` VALUES (207, 'balloon541.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/balloon541.jpg', 'detect', '2024-05-02 23:23:04', 20202384, 7);
INSERT INTO `result` VALUES (208, 'kite10.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite10.jpg', 'detect', '2024-05-02 23:23:05', 20202384, 7);
INSERT INTO `result` VALUES (209, 'kite102.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite102.jpg', 'detect', '2024-05-02 23:23:05', 20202384, 7);
INSERT INTO `result` VALUES (210, 'kite160.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite160.jpg', 'detect', '2024-05-02 23:23:05', 20202384, 7);
INSERT INTO `result` VALUES (211, 'kite177.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite177.jpg', 'detect', '2024-05-02 23:23:05', 20202384, 7);
INSERT INTO `result` VALUES (212, 'kite18.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite18.jpg', 'detect', '2024-05-02 23:23:05', 20202384, 7);
INSERT INTO `result` VALUES (213, 'kite206.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite206.jpg', 'detect', '2024-05-02 23:23:05', 20202384, 7);
INSERT INTO `result` VALUES (214, 'kite218.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite218.jpg', 'detect', '2024-05-02 23:23:05', 20202384, 7);
INSERT INTO `result` VALUES (215, 'kite235.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite235.jpg', 'detect', '2024-05-02 23:23:05', 20202384, 7);
INSERT INTO `result` VALUES (216, 'kite341.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite341.jpg', 'detect', '2024-05-02 23:23:05', 20202384, 7);
INSERT INTO `result` VALUES (217, 'kite472.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite472.jpg', 'detect', '2024-05-02 23:23:06', 20202384, 7);
INSERT INTO `result` VALUES (218, 'kite5.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite5.jpg', 'detect', '2024-05-02 23:23:06', 20202384, 7);
INSERT INTO `result` VALUES (219, 'kite50.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite50.jpg', 'detect', '2024-05-02 23:23:06', 20202384, 7);
INSERT INTO `result` VALUES (220, 'kite6.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/kite6.jpg', 'detect', '2024-05-02 23:23:06', 20202384, 7);
INSERT INTO `result` VALUES (221, 'nest149.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest149.jpg', 'detect', '2024-05-02 23:23:06', 20202384, 7);
INSERT INTO `result` VALUES (222, 'nest201.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest201.jpg', 'detect', '2024-05-02 23:23:06', 20202384, 7);
INSERT INTO `result` VALUES (223, 'nest306.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest306.jpg', 'detect', '2024-05-02 23:23:06', 20202384, 7);
INSERT INTO `result` VALUES (224, 'nest414.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest414.jpg', 'detect', '2024-05-02 23:23:07', 20202384, 7);
INSERT INTO `result` VALUES (225, 'nest463.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest463.jpg', 'detect', '2024-05-02 23:23:07', 20202384, 7);
INSERT INTO `result` VALUES (226, 'nest534.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest534.jpg', 'detect', '2024-05-02 23:23:07', 20202384, 7);
INSERT INTO `result` VALUES (227, 'nest548.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest548.jpg', 'detect', '2024-05-02 23:23:07', 20202384, 7);
INSERT INTO `result` VALUES (228, 'nest550.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest550.jpg', 'detect', '2024-05-02 23:23:07', 20202384, 7);
INSERT INTO `result` VALUES (229, 'nest592.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest592.jpg', 'detect', '2024-05-02 23:23:07', 20202384, 7);
INSERT INTO `result` VALUES (230, 'nest620.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest620.jpg', 'detect', '2024-05-02 23:23:07', 20202384, 7);
INSERT INTO `result` VALUES (231, 'nest640.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest640.jpg', 'detect', '2024-05-02 23:23:08', 20202384, 7);
INSERT INTO `result` VALUES (232, 'nest664.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest664.jpg', 'detect', '2024-05-02 23:23:08', 20202384, 7);
INSERT INTO `result` VALUES (233, 'nest669.jpg', 'D:/pythonProject/graflask/detect/20202384/result7/nest669.jpg', 'detect', '2024-05-02 23:23:08', 20202384, 7);
INSERT INTO `result` VALUES (234, '1_ice502.jpg', 'D:/pythonProject/graflask/segment/20202384/result4/1_ice502.jpg', 'segment', '2024-05-02 23:26:28', 20202384, 4);
INSERT INTO `result` VALUES (235, '1_ice510.jpg', 'D:/pythonProject/graflask/segment/20202384/result4/1_ice510.jpg', 'segment', '2024-05-02 23:26:28', 20202384, 4);
INSERT INTO `result` VALUES (236, '1_ice512.jpg', 'D:/pythonProject/graflask/segment/20202384/result4/1_ice512.jpg', 'segment', '2024-05-02 23:26:28', 20202384, 4);
INSERT INTO `result` VALUES (237, 'kite102.jpg', 'D:/pythonProject/graflask/detect/20202384/result8/kite102.jpg', 'detect', '2024-05-20 19:00:25', 20202384, 8);
INSERT INTO `result` VALUES (238, 'kite6.jpg', 'D:/pythonProject/graflask/detect/20202384/result8/kite6.jpg', 'detect', '2024-05-20 19:00:25', 20202384, 8);
INSERT INTO `result` VALUES (239, 'balloon197.jpg', 'D:/pythonProject/graflask/detect/20202384/result9/balloon197.jpg', 'detect', '2024-05-20 19:04:05', 20202384, 9);
INSERT INTO `result` VALUES (240, 'balloon402.jpg', 'D:/pythonProject/graflask/detect/20202384/result9/balloon402.jpg', 'detect', '2024-05-20 19:04:05', 20202384, 9);
INSERT INTO `result` VALUES (241, 'balloon439.jpg', 'D:/pythonProject/graflask/detect/20202384/result9/balloon439.jpg', 'detect', '2024-05-20 19:04:05', 20202384, 9);
INSERT INTO `result` VALUES (242, 'balloon510.jpg', 'D:/pythonProject/graflask/detect/20202384/result9/balloon510.jpg', 'detect', '2024-05-20 19:04:06', 20202384, 9);
INSERT INTO `result` VALUES (243, 'balloon520.jpg', 'D:/pythonProject/graflask/detect/20202384/result9/balloon520.jpg', 'detect', '2024-05-20 19:04:06', 20202384, 9);
INSERT INTO `result` VALUES (244, 'kite5.jpg', 'D:/pythonProject/graflask/detect/20202384/result9/kite5.jpg', 'detect', '2024-05-20 19:04:06', 20202384, 9);
INSERT INTO `result` VALUES (245, 'kite6.jpg', 'D:/pythonProject/graflask/detect/20202384/result9/kite6.jpg', 'detect', '2024-05-20 19:04:06', 20202384, 9);
INSERT INTO `result` VALUES (246, 'balloon197.jpg', 'D:/pythonProject/graflask/detect/20202384/result10/balloon197.jpg', 'detect', '2024-05-20 19:04:18', 20202384, 10);
INSERT INTO `result` VALUES (247, 'balloon402.jpg', 'D:/pythonProject/graflask/detect/20202384/result10/balloon402.jpg', 'detect', '2024-05-20 19:04:18', 20202384, 10);
INSERT INTO `result` VALUES (248, 'balloon439.jpg', 'D:/pythonProject/graflask/detect/20202384/result10/balloon439.jpg', 'detect', '2024-05-20 19:04:18', 20202384, 10);
INSERT INTO `result` VALUES (249, 'balloon510.jpg', 'D:/pythonProject/graflask/detect/20202384/result10/balloon510.jpg', 'detect', '2024-05-20 19:04:18', 20202384, 10);
INSERT INTO `result` VALUES (250, 'balloon520.jpg', 'D:/pythonProject/graflask/detect/20202384/result10/balloon520.jpg', 'detect', '2024-05-20 19:04:18', 20202384, 10);
INSERT INTO `result` VALUES (251, 'kite5.jpg', 'D:/pythonProject/graflask/detect/20202384/result10/kite5.jpg', 'detect', '2024-05-20 19:04:19', 20202384, 10);
INSERT INTO `result` VALUES (252, 'kite6.jpg', 'D:/pythonProject/graflask/detect/20202384/result10/kite6.jpg', 'detect', '2024-05-20 19:04:19', 20202384, 10);
INSERT INTO `result` VALUES (253, '1_ice502.jpg', 'D:/pythonProject/graflask/segment/20202384/result5/1_ice502.jpg', 'segment', '2024-05-20 19:05:01', 20202384, 5);
INSERT INTO `result` VALUES (254, '1_ice510.jpg', 'D:/pythonProject/graflask/segment/20202384/result5/1_ice510.jpg', 'segment', '2024-05-20 19:05:01', 20202384, 5);
INSERT INTO `result` VALUES (255, '1_ice512.jpg', 'D:/pythonProject/graflask/segment/20202384/result5/1_ice512.jpg', 'segment', '2024-05-20 19:05:01', 20202384, 5);
INSERT INTO `result` VALUES (256, 'balloon402.jpg', 'D:/pythonProject/graflask/detect/20202384/result11/balloon402.jpg', 'detect', '2024-05-21 12:50:44', 20202384, 11);
INSERT INTO `result` VALUES (257, 'balloon439.jpg', 'D:/pythonProject/graflask/detect/20202384/result11/balloon439.jpg', 'detect', '2024-05-21 12:50:44', 20202384, 11);

-- ----------------------------
-- Table structure for statistics
-- ----------------------------
DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics`  (
  `sta_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '统计文件号',
  `sta_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件名',
  `sta_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '统计文件路径',
  `sta_time` datetime NOT NULL COMMENT '统计文件创建时间',
  `sta_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '统计文件描述（xx or yy）',
  `pno` int(8) NOT NULL COMMENT '用户账号',
  `number` int(11) NOT NULL COMMENT '第n次预测',
  PRIMARY KEY (`sta_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of statistics
-- ----------------------------
INSERT INTO `statistics` VALUES (4, 'statistics.png', 'D:/pythonProject/graflask/detect/20202020/result1/statistics.png', '2024-04-17 23:03:54', 'detect', 20202020, 1);
INSERT INTO `statistics` VALUES (5, 'statistics.png', 'D:/pythonProject/graflask/segment/20202020/result1/statistics.png', '2024-04-17 23:04:15', 'segment', 20202020, 1);
INSERT INTO `statistics` VALUES (6, 'statistics.png', 'D:/pythonProject/graflask/segment/20202020/result2/statistics.png', '2024-04-17 23:05:13', 'segment', 20202020, 2);
INSERT INTO `statistics` VALUES (7, 'statistics.png', 'D:/pythonProject/graflask/detect/20202020/result2/statistics.png', '2024-04-29 19:30:28', 'detect', 20202020, 2);
INSERT INTO `statistics` VALUES (8, 'statistics.png', 'D:/pythonProject/graflask/detect/20202020/result3/statistics.png', '2024-04-29 19:30:52', 'detect', 20202020, 3);
INSERT INTO `statistics` VALUES (9, 'statistics.png', 'D:/pythonProject/graflask/segment/20202020/result3/statistics.png', '2024-04-29 19:31:44', 'segment', 20202020, 3);
INSERT INTO `statistics` VALUES (10, 'statistics.png', 'D:/pythonProject/graflask/segment/20202020/result4/statistics.png', '2024-04-29 19:36:51', 'segment', 20202020, 4);
INSERT INTO `statistics` VALUES (11, 'statistics.png', 'D:/pythonProject/graflask/segment/20200001/result1/statistics.png', '2024-04-29 19:37:55', 'segment', 20200001, 1);
INSERT INTO `statistics` VALUES (12, 'statistics.png', 'D:/pythonProject/graflask/detect/20200001/result1/statistics.png', '2024-04-29 19:38:14', 'detect', 20200001, 1);
INSERT INTO `statistics` VALUES (13, 'statistics.png', 'D:/pythonProject/graflask/detect/20200001/result2/statistics.png', '2024-04-29 19:39:16', 'detect', 20200001, 2);
INSERT INTO `statistics` VALUES (14, 'statistics.png', 'D:/pythonProject/graflask/detect/20200001/result3/statistics.png', '2024-04-29 19:39:29', 'detect', 20200001, 3);
INSERT INTO `statistics` VALUES (15, 'statistics.png', 'D:/pythonProject/graflask/detect/20200001/result4/statistics.png', '2024-04-29 19:39:40', 'detect', 20200001, 4);
INSERT INTO `statistics` VALUES (16, 'statistics.png', 'D:/pythonProject/graflask/segment/20200001/result2/statistics.png', '2024-04-29 19:39:59', 'segment', 20200001, 2);
INSERT INTO `statistics` VALUES (17, 'statistics.png', 'D:/pythonProject/graflask/segment/20200001/result3/statistics.png', '2024-04-29 19:40:10', 'segment', 20200001, 3);
INSERT INTO `statistics` VALUES (18, 'statistics.png', 'D:/pythonProject/graflask/segment/20200001/result4/statistics.png', '2024-04-29 19:40:15', 'segment', 20200001, 4);
INSERT INTO `statistics` VALUES (19, 'statistics.png', 'D:/pythonProject/graflask/segment/20200001/result5/statistics.png', '2024-04-29 19:40:17', 'segment', 20200001, 5);
INSERT INTO `statistics` VALUES (20, 'statistics.png', 'D:/pythonProject/graflask/detect/20202384/result1/statistics.png', '2024-04-29 19:41:20', 'detect', 20202384, 1);
INSERT INTO `statistics` VALUES (21, 'statistics.png', 'D:/pythonProject/graflask/detect/20202384/result2/statistics.png', '2024-04-29 19:41:33', 'detect', 20202384, 2);
INSERT INTO `statistics` VALUES (22, 'statistics.png', 'D:/pythonProject/graflask/detect/20202384/result3/statistics.png', '2024-04-29 19:41:42', 'detect', 20202384, 3);
INSERT INTO `statistics` VALUES (23, 'statistics.png', 'D:/pythonProject/graflask/detect/20202384/result4/statistics.png', '2024-04-29 19:41:53', 'detect', 20202384, 4);
INSERT INTO `statistics` VALUES (24, 'statistics.png', 'D:/pythonProject/graflask/segment/20202384/result1/statistics.png', '2024-04-29 19:42:10', 'segment', 20202384, 1);
INSERT INTO `statistics` VALUES (25, 'statistics.png', 'D:/pythonProject/graflask/segment/20202384/result2/statistics.png', '2024-04-29 19:42:19', 'segment', 20202384, 2);
INSERT INTO `statistics` VALUES (26, 'statistics.png', 'D:/pythonProject/graflask/segment/20202384/result3/statistics.png', '2024-04-29 19:42:45', 'segment', 20202384, 3);
INSERT INTO `statistics` VALUES (27, 'statistics.png', 'D:/pythonProject/graflask/detect/20202384/result5/statistics.png', '2024-05-02 23:22:32', 'detect', 20202384, 5);
INSERT INTO `statistics` VALUES (28, 'statistics.png', 'D:/pythonProject/graflask/detect/20202384/result6/statistics.png', '2024-05-02 23:22:42', 'detect', 20202384, 6);
INSERT INTO `statistics` VALUES (29, 'statistics.png', 'D:/pythonProject/graflask/detect/20202384/result7/statistics.png', '2024-05-02 23:23:08', 'detect', 20202384, 7);
INSERT INTO `statistics` VALUES (30, 'statistics.png', 'D:/pythonProject/graflask/segment/20202384/result4/statistics.png', '2024-05-02 23:26:28', 'segment', 20202384, 4);
INSERT INTO `statistics` VALUES (31, 'statistics.png', 'D:/pythonProject/graflask/detect/20202384/result8/statistics.png', '2024-05-20 19:00:25', 'detect', 20202384, 8);
INSERT INTO `statistics` VALUES (32, 'statistics.png', 'D:/pythonProject/graflask/detect/20202384/result9/statistics.png', '2024-05-20 19:04:06', 'detect', 20202384, 9);
INSERT INTO `statistics` VALUES (33, 'statistics.png', 'D:/pythonProject/graflask/detect/20202384/result10/statistics.png', '2024-05-20 19:04:19', 'detect', 20202384, 10);
INSERT INTO `statistics` VALUES (34, 'statistics.png', 'D:/pythonProject/graflask/segment/20202384/result5/statistics.png', '2024-05-20 19:05:01', 'segment', 20202384, 5);
INSERT INTO `statistics` VALUES (35, 'statistics.png', 'D:/pythonProject/graflask/detect/20202384/result11/statistics.png', '2024-05-21 12:50:44', 'detect', 20202384, 11);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `pno` int(8) NOT NULL COMMENT '用户号',
  `file_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件号',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件路径',
  `time_up` datetime NULL DEFAULT NULL COMMENT '上传时间',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文件描述（detect，segment）',
  PRIMARY KEY (`pno`, `file_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `pwd` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `pno` int(8) NOT NULL COMMENT '账号',
  PRIMARY KEY (`pno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1234', 10011001);
INSERT INTO `user` VALUES ('10021002', 10021002);
INSERT INTO `user` VALUES ('1234', 20200001);
INSERT INTO `user` VALUES ('20201996', 20201996);
INSERT INTO `user` VALUES ('20202020', 20202020);
INSERT INTO `user` VALUES ('20202384', 20202384);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `loc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `pno` int(8) NOT NULL COMMENT '账户号',
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`pno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (NULL, NULL, '王佳伟', 10011001, NULL);
INSERT INTO `user_info` VALUES (NULL, NULL, '王佳伟', 10021002, NULL);
INSERT INTO `user_info` VALUES ('上海市浦东新区沪城环路1851号', '女', '娃娃', 20200001, '2207417387@qq.com');
INSERT INTO `user_info` VALUES (NULL, NULL, 'zjb', 20201996, NULL);
INSERT INTO `user_info` VALUES ('安徽', '男', '王佳伟', 20202020, '2088566865@qq.com');
INSERT INTO `user_info` VALUES ('安徽省阜阳市颍州区三合镇王大郢村王大郢215号', '女', '张童瑶', 20202384, '2088566865@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
