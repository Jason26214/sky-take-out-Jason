-- MySQL dump 10.13  Distrib 8.4.2, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sky_take_out
-- ------------------------------------------------------
-- Server version	8.4.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_book` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '收货人',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认 0 否 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='地址簿';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
INSERT INTO `address_book` VALUES (2,4,'王五','0','13887654321','31','上海市','3101','市辖区','310115','浦东新区','xx路xx小区5号楼3单元402','1',1),(3,4,'张三','1','15612345678','44','广东省','4401','广州市','440106','天河区','xx路xx花园6号楼2单元101','3',0);
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
  `status` int DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品及套餐分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (11,1,'酒水饮料',10,1,'2022-06-09 22:09:18','2022-06-09 22:09:18',1,1),(12,1,'传统主食',9,1,'2022-06-09 22:09:32','2022-06-09 22:18:53',1,1),(13,2,'人气套餐',12,1,'2022-06-09 22:11:38','2022-06-10 11:04:40',1,1),(15,2,'商务套餐',13,1,'2022-06-09 22:14:10','2022-06-10 11:04:48',1,1),(16,1,'蜀味烤鱼',4,1,'2022-06-09 22:15:37','2024-08-27 05:29:32',1,1),(17,1,'蜀味牛蛙',5,1,'2022-06-09 22:16:14','2022-08-31 14:39:44',1,1),(18,1,'特色蒸菜',6,1,'2022-06-09 22:17:42','2022-06-09 22:17:42',1,1),(19,1,'新鲜时蔬',7,1,'2022-06-09 22:18:12','2022-06-09 22:18:28',1,1),(20,1,'水煮鱼',8,1,'2022-06-09 22:22:29','2022-06-09 22:23:45',1,1),(21,1,'汤类',11,1,'2022-06-10 10:51:47','2022-06-10 10:51:47',1,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '描述信息',
  `status` int DEFAULT '1' COMMENT '0 停售 1 起售',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dish_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (46,'王老吉',11,6.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/1355323a-c046-4a4d-b953-3fab93bfe696.png','',1,'2022-06-09 22:40:47','2022-06-09 22:40:47',1,1),(47,'北冰洋',11,4.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/2f9f17f7-d826-485e-b336-f2299ae68b5b.png','还是小时候的味道',1,'2022-06-10 09:18:49','2022-06-10 09:18:49',1,1),(48,'雪花啤酒',11,4.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/6ece6ded-d848-499f-930e-7faabf146950.png','',1,'2022-06-10 09:22:54','2022-06-10 09:22:54',1,1),(49,'米饭',12,2.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/da89f777-005e-4018-8a11-cdd371f45c38.png','精选五常大米',1,'2022-06-10 09:30:17','2022-06-10 09:30:17',1,1),(50,'馒头',12,1.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/e8177e41-8170-4d69-92d2-d8556ecca5b1.png','优质面粉',1,'2022-06-10 09:34:28','2022-06-10 09:34:28',1,1),(51,'老坛酸菜鱼',20,56.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/7b534f0c-4f5d-4e43-8734-0d0d0aed7dd4.png','原料：汤，草鱼，酸菜',1,'2022-06-10 09:40:51','2024-09-11 21:37:35',1,1),(52,'经典酸菜鮰鱼',20,66.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/875d4f6f-92ef-4e48-a2c4-d466b9f593b6.png','原料：酸菜，江团，鮰鱼',1,'2022-06-10 09:46:02','2024-09-11 21:36:45',1,1),(53,'蜀味水煮草鱼',20,38.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/b7b97f4d-533f-4234-b0ab-f511ba7bec4b.png','原料：草鱼，汤',1,'2022-06-10 09:48:37','2024-09-11 21:37:51',1,1),(54,'清炒小油菜',19,18.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/7fd78571-e44a-446e-8078-3ec38a675c90.png','原料：小油菜',1,'2022-06-10 09:51:46','2024-09-11 21:36:16',1,1),(55,'蒜蓉娃娃菜',19,18.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/08d59a49-7c48-4e78-89dc-66c0ab4660a6.png','原料：蒜，娃娃菜',1,'2022-06-10 09:53:37','2024-09-11 21:36:06',1,1),(56,'清炒西兰花',19,18.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/ade5cfd8-8eff-4d5d-a59d-e416da23b5ba.png','原料：西兰花',1,'2022-06-10 09:55:44','2024-09-11 21:35:54',1,1),(57,'炝炒圆白菜',19,18.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/4263426b-eb92-4d66-8849-77252a2e3323.png','原料：圆白菜',1,'2022-06-10 09:58:35','2024-09-11 21:35:44',1,1),(58,'清蒸鲈鱼',18,98.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/08a059c8-0e90-4594-a4dd-cccef6bd690b.png','原料：鲈鱼',1,'2022-06-10 10:12:28','2024-09-11 21:35:27',1,1),(59,'东坡肘子',18,138.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/7ede4582-60e9-4e2d-98db-68d223de415c.png','原料：猪肘棒',1,'2022-06-10 10:24:03','2024-09-11 21:35:15',1,1),(60,'梅菜扣肉',18,58.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/c6262de2-096e-475b-9079-0aea27397ce2.png','原料：猪肉，梅菜',1,'2022-06-10 10:26:03','2024-09-11 21:35:03',1,1),(61,'剁椒鱼头',18,66.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/7dd31303-fe5e-48de-b8a0-758838e79840.png','原料：鲢鱼，剁椒',1,'2022-06-10 10:28:54','2024-09-11 21:34:53',1,1),(62,'金汤酸菜牛蛙',17,88.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/e3e9b4af-b485-4f2b-8902-0d1d9f90d1b0.png','原料：鲜活牛蛙，酸菜',1,'2022-06-10 10:33:05','2024-09-11 21:23:24',1,1),(63,'香锅牛蛙',17,88.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/5ba621ce-aaa3-467f-8700-a28ef6742172.png','配料：鲜活牛蛙，莲藕，青笋',1,'2022-06-10 10:35:40','2024-09-11 21:22:55',1,1),(64,'馋嘴牛蛙',17,88.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/2bbb95ac-2be2-466c-adaf-3bf9ff138cc4.png','配料：鲜活牛蛙，丝瓜，黄豆芽',1,'2022-06-10 10:37:52','2024-09-11 21:22:36',1,1),(65,'草鱼2斤',16,68.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/a0742f5e-2043-4f8f-8017-0bcecef1f5dd.png','原料：草鱼，黄豆芽，莲藕',1,'2022-06-10 10:41:08','2024-09-11 21:22:03',1,1),(66,'江团鱼2斤',16,119.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/78d74a1c-4dea-403d-82c6-98451f98f0f9.png','配料：江团鱼，黄豆芽，莲藕',1,'2022-06-10 10:42:42','2022-06-10 10:42:42',1,1),(67,'鮰鱼2斤',16,72.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/cde0683f-0fc1-42ad-8cf0-40e681d51abb.png','原料：鮰鱼，黄豆芽，莲藕',1,'2022-06-10 10:43:56','2022-06-10 10:43:56',1,1),(68,'鸡蛋汤',21,4.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/6129758c-062b-47b0-a016-d6fa600f2d14.png','配料：鸡蛋，紫菜',1,'2022-06-10 10:54:25','2022-06-10 10:54:25',1,1),(69,'平菇豆腐汤',21,6.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/ca54bc1c-a2d6-4d8a-a52d-9e5bca0e6a21.png','配料：豆腐，平菇',1,'2022-06-10 10:55:02','2024-09-02 00:23:52',1,1),(81,'测试菜品',19,5.00,'https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/5b1140aa-3c71-4c78-9ba7-8672de9412d0.png','测试菜品123',1,'2024-09-02 00:22:40','2024-09-11 22:44:28',1,1);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;

--
-- Table structure for table `dish_flavor`
--

DROP TABLE IF EXISTS `dish_flavor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_flavor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味名称',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味数据list',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='菜品口味关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_flavor`
--

/*!40000 ALTER TABLE `dish_flavor` DISABLE KEYS */;
INSERT INTO `dish_flavor` VALUES (40,10,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(41,7,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(42,7,'温度','[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]'),(45,6,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(46,6,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(47,5,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(48,5,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(49,2,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(50,4,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(51,3,'甜味','[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]'),(52,3,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(108,67,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(109,66,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(116,65,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(117,60,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(118,57,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(119,56,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(120,54,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\"]'),(121,52,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(122,52,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(123,51,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(124,51,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(125,53,'忌口','[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]'),(126,53,'辣度','[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]'),(127,81,'忌口','[\"不要葱\",\"不要蒜\"]');
/*!40000 ALTER TABLE `dish_flavor` ENABLE KEYS */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='员工信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'管理员','admin','e10adc3949ba59abbe56e057f20f883e','13812312312','1','110101199001010047',1,'2022-02-15 15:51:20','2022-02-17 09:16:20',10,1),(2,'张三','zhangsan','e10adc3949ba59abbe56e057f20f883e','13812344321','1','111222333444555666',1,'2024-08-25 15:09:27','2024-08-25 15:09:27',10,10),(3,'李四','lisii','e10adc3949ba59abbe56e057f20f883e','13212341234','1','111222333444555666',1,'2024-08-25 15:16:39','2024-08-30 04:37:40',10,1),(6,'杰妮芙','jeniffer','e10adc3949ba59abbe56e057f20f883e','13843212345','0','111777888555444111',1,'2024-08-25 17:27:06','2024-08-27 03:55:53',1,1),(7,'叶思彤','yst6789','e10adc3949ba59abbe56e057f20f883e','13567890123','0','370202199602145678',1,'2024-08-30 04:42:47','2024-08-30 04:42:47',1,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '名字',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (5,'鮰鱼2斤','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/cde0683f-0fc1-42ad-8cf0-40e681d51abb.png',7,67,NULL,'微辣',1,72.00),(6,'香锅牛蛙','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/5ba621ce-aaa3-467f-8700-a28ef6742172.png',7,63,NULL,NULL,1,88.00),(7,'米饭','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/da89f777-005e-4018-8a11-cdd371f45c38.png',7,49,NULL,NULL,2,2.00),(8,'人气套餐321','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/fe099226-6d3f-4cd2-be2d-2e04877b3f23.png',7,NULL,40,NULL,1,13.00),(9,'测试套餐123','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/e50f29f8-ad9c-49b9-8e39-f823880952f0.png',7,NULL,38,NULL,1,44.00),(10,'米饭','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/da89f777-005e-4018-8a11-cdd371f45c38.png',8,49,NULL,NULL,1,2.00),(11,'草鱼2斤','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/a0742f5e-2043-4f8f-8017-0bcecef1f5dd.png',9,65,NULL,'中辣',1,68.00),(12,'鮰鱼2斤','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/cde0683f-0fc1-42ad-8cf0-40e681d51abb.png',10,67,NULL,'中辣',1,72.00),(13,'米饭','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/da89f777-005e-4018-8a11-cdd371f45c38.png',10,49,NULL,NULL,2,2.00),(14,'北冰洋','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/2f9f17f7-d826-485e-b336-f2299ae68b5b.png',10,47,NULL,NULL,2,4.00),(15,'平菇豆腐汤','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/ca54bc1c-a2d6-4d8a-a52d-9e5bca0e6a21.png',10,69,NULL,NULL,3,6.00),(16,'蜀味水煮草鱼','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/b7b97f4d-533f-4234-b0ab-f511ba7bec4b.png',11,53,NULL,'不要蒜,中辣',1,38.00),(17,'馋嘴牛蛙','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/2bbb95ac-2be2-466c-adaf-3bf9ff138cc4.png',12,64,NULL,NULL,1,88.00),(18,'草鱼2斤','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/a0742f5e-2043-4f8f-8017-0bcecef1f5dd.png',13,65,NULL,'不辣',1,68.00),(19,'北冰洋','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/2f9f17f7-d826-485e-b336-f2299ae68b5b.png',14,47,NULL,NULL,1,4.00),(20,'北冰洋','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/2f9f17f7-d826-485e-b336-f2299ae68b5b.png',15,47,NULL,NULL,1,4.00),(21,'炝炒圆白菜','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/4263426b-eb92-4d66-8849-77252a2e3323.png',16,57,NULL,'不要葱',1,18.00),(22,'测试菜品','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/5b1140aa-3c71-4c78-9ba7-8672de9412d0.png',17,81,NULL,'不要葱',1,5.00),(23,'江团鱼2斤','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/78d74a1c-4dea-403d-82c6-98451f98f0f9.png',18,66,NULL,'重辣',1,119.00),(24,'人气套餐321','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/fe099226-6d3f-4cd2-be2d-2e04877b3f23.png',19,NULL,40,NULL,1,13.00),(25,'雪花啤酒','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/6ece6ded-d848-499f-930e-7faabf146950.png',20,48,NULL,NULL,10,4.00),(26,'蜀味水煮草鱼','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/b7b97f4d-533f-4234-b0ab-f511ba7bec4b.png',21,53,NULL,'不要蒜,中辣',1,38.00),(27,'平菇豆腐汤','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/ca54bc1c-a2d6-4d8a-a52d-9e5bca0e6a21.png',21,69,NULL,NULL,2,6.00);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT '1' COMMENT '订单状态 1待付款 2待接单 3已接单 4派送中 5已完成 6已取消 7退款',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime DEFAULT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT '1' COMMENT '支付方式 1微信,2支付宝',
  `pay_status` tinyint NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付 2退款',
  `amount` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '备注',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '地址',
  `user_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '用户名称',
  `consignee` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '收货人',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单取消原因',
  `rejection_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '订单拒绝原因',
  `cancel_time` datetime DEFAULT NULL COMMENT '订单取消时间',
  `estimated_delivery_time` datetime DEFAULT NULL COMMENT '预计送达时间',
  `delivery_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配送状态  1立即送出  0选择具体时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '送达时间',
  `pack_amount` int DEFAULT NULL COMMENT '打包费',
  `tableware_number` int DEFAULT NULL COMMENT '餐具数量',
  `tableware_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '餐具数量状态  1按餐量提供  0选择具体数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (7,'1726329340158',6,4,2,'2024-09-14 23:55:40',NULL,1,0,233.00,'房门口打电话','13887654321','xx路xx小区5号楼3单元402',NULL,'王五','订单超时，自动取消',NULL,'2024-09-18 22:27:01','2024-09-14 00:55:00',0,NULL,6,0,0),(8,'1726407547239',5,4,2,'2024-09-15 21:39:07','2024-09-15 21:39:12',1,1,9.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,NULL,NULL,'2024-09-15 22:39:00',0,'2024-09-17 15:43:02',1,0,0),(9,'1726430883758',6,4,2,'2024-09-16 04:08:04','2024-09-16 04:08:07',1,2,75.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五','用户取消',NULL,'2024-09-16 20:06:18','2024-09-16 05:08:00',0,NULL,1,0,0),(10,'1726485773321',6,4,2,'2024-09-16 19:22:53','2024-09-16 19:22:57',1,1,116.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,'菜品已销售完，暂时无法接单','2024-09-17 15:32:08','2024-09-16 20:22:00',0,NULL,8,0,0),(11,'1726848525160',5,4,2,'2024-09-21 00:08:45','2024-09-21 00:08:47',1,1,45.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,NULL,NULL,'2024-09-21 01:08:00',0,'2024-09-21 00:15:58',1,0,0),(12,'1726848884646',5,4,2,'2024-09-21 00:14:45','2024-09-21 00:14:47',1,1,95.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,NULL,NULL,'2024-09-21 01:14:00',0,'2024-09-21 00:15:58',1,0,0),(13,'1726848927562',5,4,2,'2024-09-21 00:15:28','2024-09-21 00:15:29',1,1,75.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,NULL,NULL,'2024-09-21 01:15:00',0,'2024-09-21 00:15:57',1,0,0),(14,'1726849145359',6,4,2,'2024-09-21 00:19:05','2024-09-21 00:19:07',1,1,11.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,'餐厅已打烊，暂时无法接单','2024-09-21 00:27:30','2024-09-21 01:18:00',0,NULL,1,0,0),(15,'1726849219025',6,4,2,'2024-09-21 00:20:19','2024-09-21 00:20:21',1,1,11.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,'餐厅已打烊，暂时无法接单','2024-09-21 00:27:27','2024-09-21 01:20:00',0,NULL,1,0,0),(16,'1726849253879',6,4,2,'2024-09-21 00:20:54','2024-09-21 00:20:55',1,1,25.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,'餐厅已打烊，暂时无法接单','2024-09-21 00:27:24','2024-09-21 01:20:00',0,NULL,1,0,0),(17,'1726849592570',6,4,2,'2024-09-21 00:26:33','2024-09-21 00:26:34',1,1,12.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,'餐厅已打烊，暂时无法接单','2024-09-21 00:27:21','2024-09-21 01:26:00',0,NULL,1,0,0),(18,'1726849616116',6,4,2,'2024-09-21 00:26:56','2024-09-21 00:26:58',1,1,126.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,'餐厅已打烊，暂时无法接单','2024-09-21 00:27:18','2024-09-21 01:26:00',0,NULL,1,0,0),(19,'1726849657637',5,4,2,'2024-09-21 00:27:38','2024-09-21 00:27:39',1,1,20.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,NULL,NULL,'2024-09-21 01:27:00',0,'2024-09-21 00:27:50',1,0,0),(20,'1726851703802',5,4,2,'2024-09-21 01:01:44','2024-09-21 01:01:46',1,1,56.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,NULL,NULL,'2024-09-21 02:01:00',0,'2024-09-22 19:00:40',10,0,0),(21,'1727002741773',5,4,2,'2024-09-22 18:59:02','2024-09-22 18:59:05',1,1,59.00,'','13887654321','xx路xx小区5号楼3单元402',NULL,'王五',NULL,NULL,NULL,'2024-09-22 19:58:00',0,'2024-09-22 19:00:32',3,0,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

--
-- Table structure for table `setmeal`
--

DROP TABLE IF EXISTS `setmeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setmeal` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10,2) NOT NULL COMMENT '套餐价格',
  `status` int DEFAULT '1' COMMENT '售卖状态 0:停售 1:起售',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_setmeal_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setmeal`
--

/*!40000 ALTER TABLE `setmeal` DISABLE KEYS */;
INSERT INTO `setmeal` VALUES (38,15,'测试套餐123',44.00,1,'测试套餐123','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/e50f29f8-ad9c-49b9-8e39-f823880952f0.png','2024-09-03 22:57:36','2024-09-13 00:28:46',1,1),(40,13,'人气套餐321',13.00,1,'人气套餐321','https://jason-sky-take-out-jason.oss-cn-beijing.aliyuncs.com/fe099226-6d3f-4cd2-be2d-2e04877b3f23.png','2024-09-11 21:31:48','2024-09-13 00:27:59',1,1);
/*!40000 ALTER TABLE `setmeal` ENABLE KEYS */;

--
-- Table structure for table `setmeal_dish`
--

DROP TABLE IF EXISTS `setmeal_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setmeal_dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品单价（冗余字段）',
  `copies` int DEFAULT NULL COMMENT '菜品份数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='套餐菜品关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setmeal_dish`
--

/*!40000 ALTER TABLE `setmeal_dish` DISABLE KEYS */;
INSERT INTO `setmeal_dish` VALUES (93,40,62,'金汤酸菜牛蛙',88.00,1),(94,40,49,'米饭',2.00,1),(95,40,48,'雪花啤酒',4.00,1),(96,38,68,'鸡蛋汤',4.00,1),(97,38,47,'北冰洋',4.00,1),(98,38,49,'米饭',2.00,4),(99,38,51,'老坛酸菜鱼',56.00,1),(100,38,55,'蒜蓉娃娃菜',18.00,1),(101,38,60,'梅菜扣肉',58.00,1),(102,38,63,'香锅牛蛙',88.00,1),(103,38,66,'江团鱼2斤',119.00,1);
/*!40000 ALTER TABLE `setmeal_dish` ENABLE KEYS */;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'oQ5CI7ZlDr-3v9S2HaScZlt_dQjk',NULL,NULL,NULL,NULL,NULL,'2024-09-10 20:50:30');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

--
-- Dumping routines for database 'sky_take_out'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-25 21:23:40
