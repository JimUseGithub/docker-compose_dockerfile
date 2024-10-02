/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : oj_system

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2024-10-02 19:17:12
*/

# 创建数据库
CREATE DATABASE IF NOT EXISTS `oj_system` DEFAULT CHARACTER SET utf8mb4 ;
use oj_system;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
                           `problem_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目id',
                           `title` varchar(255) NOT NULL COMMENT '题目标题',
                           `level` varchar(255) NOT NULL COMMENT '题目难度',
                           `description` text NOT NULL COMMENT '题目描述',
                           `template_code` text NOT NULL COMMENT '代码模板',
                           `test_case` text NOT NULL COMMENT '测试用例',
                           `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
                           `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
                           PRIMARY KEY (`problem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES ('1', '各位相加', '简单', '给定一个非负整数 num，反复将各个位上的数字相加，直到结果为一位数。返回这个结果。\r\n\r\n\r\n\r\n示例 1:\r\n\r\n输入: num = 38\r\n输出: 2\r\n解释: 各位相加的过程为：\r\n38 --> 3 + 8 --> 11\r\n11 --> 1 + 1 --> 2\r\n由于 2 是一位数，所以返回 2。\r\n\r\n示例 2:\r\n\r\n输入: num = 0\r\n输出: 0', 'class Solution {\r\n    public int addDigits(int num) {\r\n\r\n    }\r\n}', 'public static void main(String[] args) {\r\nSolution solution = new Solution();\r\n    // testcase1\r\n    if (solution.addDigits(38) == 2) {\r\n    	System.out.println(\"Test OK\");\r\n    } else {\r\n        System.out.println(\"Test failed\");\r\n    }\r\n    // testcase2\r\n    if (solution.addDigits(111) == 3) {\r\n    	System.out.println(\"Test OK\");\r\n    } else {\r\n        System.out.println(\"Test failed\");\r\n    }\r\n}', '2024-10-02 01:42:20', '2024-10-02 01:42:20');
INSERT INTO `problem` VALUES ('2', '两数之和', '简单', '给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。\r\n\r\n你可以假设每种输入只会对应一个答案，并且你不能使用两次相同的元素。\r\n\r\n你可以按任意顺序返回答案。\r\n\r\n \r\n\r\n示例 1：\r\n\r\n输入：nums = [2,7,11,15], target = 9\r\n输出：[0,1]\r\n解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。\r\n示例 2：\r\n\r\n输入：nums = [3,2,4], target = 6\r\n输出：[1,2]\r\n示例 3：\r\n\r\n输入：nums = [3,3], target = 6\r\n输出：[0,1]', 'class Solution {\r\n    public int[] twoSum(int[] nums, int target) {\r\n\r\n    }\r\n}', '\r\n    public static void main(String[] args) {\r\n        Solution solution = new Solution();\r\n        // case 1\r\n        int[] ints = solution.twoSum(new int[]{2, 7, 11, 15}, 9);\r\n        if ( ints[0] == 0 && ints[1] == 1) {\r\n            System.out.println(\"Test pass\");\r\n        } else {\r\n            System.out.println(\"Test failed\");\r\n        }\r\n        // case 2\r\n        ints = solution.twoSum(new int[]{3, 2, 4}, 6);\r\n        if ( ints[0] == 1 && ints[1] == 2) {\r\n            System.out.println(\"Test pass\");\r\n        } else {\r\n            System.out.println(\"Test failed\");\r\n        }\r\n        // case 3\r\n        ints = solution.twoSum(new int[]{3, 3}, 6);\r\n        if ( ints[0] == 0 && ints[1] == 1) {\r\n            System.out.println(\"Test pass\");\r\n        } else {\r\n            System.out.println(\"Test failed\");\r\n        }\r\n    }', '2024-10-02 01:50:04', '2024-10-02 01:50:04');

