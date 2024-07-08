CREATE DATABASE  IF NOT EXISTS `music` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `music`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: music
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pic` varchar(225) DEFAULT NULL,
  `title` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'/img/bannerPic/accordion-1.jpg','Banner 1'),(2,'/img/bannerPic/accordion-2.jpg','Banner 2'),(3,'/img/bannerPic/accordion-3.jpg','Banner 3'),(4,'/img/bannerPic/accordion-4.jpg','Banner 4'),(5,'/img/bannerPic/accordion-5.jpg','Banner 5'),(6,'/img/bannerPic/accordion-6.jpg','Banner 6');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '收藏类型（0歌曲1歌单）',
  `song_id` int DEFAULT NULL,
  `song_list_id` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT 'time when collected',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COMMENT='收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (25,25,0,8,0,'2023-05-24 17:31:29'),(27,7,0,17,0,'2023-05-29 13:16:45');
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `song_id` int DEFAULT NULL,
  `song_list_id` int DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `up` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (15,7,0,17,0,'紀新宇傻逼','2023-05-29 13:17:12',1),(16,7,0,10,0,'纪新宇垃圾','2023-05-29 13:22:48',0),(17,7,0,0,7,'2414324','2023-06-05 09:05:31',1),(18,34,0,19,0,'21442315','2023-06-05 09:46:47',2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL COMMENT 'sex: 1 is male and 0 is female',
  `phone_num` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
INSERT INTO `consumer` VALUES (7,'yh','123',1,'1234567890','yh@gmai.com','2001-12-31 08:00:00','Introduction 3','xia men','/img/avatorImages/1684641076634FrenchBall.jpg','2023-05-20 22:14:14','2023-05-21 11:51:16'),(25,'user_01','123',0,'','','2023-05-24 08:00:00','','','/avatorImages/1684920700309d2.png','2023-05-24 17:31:05','2023-05-24 17:31:40'),(27,'user_03','123',1,'','','2023-05-29 08:00:00','','','/img/defaultAvatar.svg','2023-05-29 10:44:33',NULL),(28,'user_04','123',1,'','','2023-05-29 08:00:00','','','/img/defaultAvatar.svg','2023-05-29 10:45:37',NULL),(32,'User_100','222',1,'','','2023-05-31 08:00:00','','','/img/defaultAvatar.svg','2023-05-31 20:46:09',NULL),(33,'user_12','222',0,'','','2023-05-31 08:00:00','','','/img/defaultAvatar.svg','2023-05-31 20:56:46',NULL),(34,'user_111','111',1,'','','2023-06-05 08:00:00','','','/img/defaultAvatar.svg','2023-06-05 09:40:11',NULL),(35,'111','111',1,'','','2023-08-04 08:00:00','tyes5555555555','','/img/defaultAvatar.svg','2023-08-04 21:51:28','2023-08-04 21:52:03');
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_song`
--

DROP TABLE IF EXISTS `list_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_song` (
  `id` int NOT NULL AUTO_INCREMENT,
  `song_id` int DEFAULT NULL,
  `song_list_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COMMENT='歌单包含的歌曲';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_song`
--

LOCK TABLES `list_song` WRITE;
/*!40000 ALTER TABLE `list_song` DISABLE KEYS */;
INSERT INTO `list_song` VALUES (12,21,6),(13,8,7),(14,9,7),(15,10,7),(16,17,8),(17,18,8),(18,19,8),(19,11,9),(20,12,9),(21,13,9),(22,14,10),(23,15,10);
/*!40000 ALTER TABLE `list_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `song_list_id` int DEFAULT NULL,
  `consumer_id` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `song_list_id_index` (`consumer_id`,`song_list_id`) /*!80000 INVISIBLE */
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES (5,8,7,10),(6,8,34,7);
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singer`
--

DROP TABLE IF EXISTS `singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `singer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COMMENT='歌手';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singer`
--

LOCK TABLES `singer` WRITE;
/*!40000 ALTER TABLE `singer` DISABLE KEYS */;
INSERT INTO `singer` VALUES (13,'손디아',0,'/img/singerPic/1684854738746IU.png','1995-08-10 00:00:00','韩国','韩国著名女歌手，以其独特的音乐风格和出色的演唱实力而广受欢迎。'),(14,'罗大佑',1,'/img/singerPic/1684854741043罗大佑.png','1954-06-30 00:00:00','中国','中国著名男歌手、音乐人，被誉为华语乐坛的代表人物之一。'),(15,'μ\'s',0,'/img/singerPic/1684854743504缪斯.png','2009-08-30 00:00:00','日本','日本声优组合，以演唱动画《Love Live!》系列的歌曲而知名。'),(16,'TheFatRat',1,'/img/singerPic/1684854745851theFatRate.png','1990-01-01 00:00:00','德国','德国电子音乐制作人和DJ，以其动感的电子音乐作品而闻名。'),(17,'Stamatis',1,'/img/singerPic/1684854749689Stamatis.png','1980-01-01 00:00:00','希腊','希腊流行歌手，以其深情的歌声和独特的音乐风格而受到欢迎。'),(18,'Linkin Park',1,'/img/singerPic/1684854753728linkin park.png','2000-01-01 00:00:00','美国','美国摇滚乐队，以其混合了多种音乐风格的独特音乐而享有全球知名度。'),(19,'The Treorchy Male Voice Choir',1,'/img/singerPic/1684854765032The Treorchy Male Voice Choir.png','1970-01-01 00:00:00','威尔士','威尔士男声合唱团，以其优美的男声合唱音乐表演而著名。'),(20,'A路人',1,'/img/singerPic/1684854725637A路人.png','1995-01-01 00:00:00','中国','中国知名女歌手，以其甜美的嗓音和多才多艺的音乐才华而备受关注。'),(21,'132333',NULL,'/img/singerPic/1685929865623d2.png','2023-06-05 08:00:00','','');
/*!40000 ALTER TABLE `singer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `id` int NOT NULL AUTO_INCREMENT,
  `singer_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `lyric` text,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COMMENT='歌曲';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (7,13,'손디아-大人','我的大叔',NULL,NULL,'/img/songPic/1684854958360我的大叔.png','고단한 하루 끝에 떨구는 눈물\r\n\r\n在精疲力尽的结束一天后 泪水滚落\r\n\r\n난 어디를 향해 가는 걸까\r\n\r\n我到底在走向哪里\r\n\r\n아플 만큼 아팠다 생각했는데\r\n\r\n原以为已经痛到极致\r\n\r\n아직도 한참 남은 건가 봐\r\n\r\n可其实还没到最痛处\r\n\r\n이 넓은 세상에 혼자인 것처럼\r\n\r\n天地之大 仿若只我一人\r\n\r\n아무도 내 맘을 보려 하지 않고\r\n\r\n人会看到我的心\r\n\r\n아무도\r\n\r\n没有人\r\n\r\n눈을 감아 보면\r\n\r\n如果闭上双眼\r\n\r\n내게 보이는 내 모습\r\n\r\n我的模样就在眼前\r\n\r\n지치지 말고\r\n\r\n不要厌烦\r\n\r\n잠시 멈추라고\r\n\r\n稍作休憩\r\n\r\n갤 것 같지 않던\r\n\r\n曾经我深陷在黑暗中\r\n\r\n짙은 나의 어둠은\r\n\r\n就像不会放晴一样\r\n\r\n나를 버리면\r\n\r\n若是将我抛弃\r\n\r\n모두 갤 거라고\r\n\r\n仿佛一切都会变得晴朗了\r\n\r\n웃는 사람들 틈에 이방인처럼\r\n\r\n在满脸笑容的人群中我就像异类\r\n\r\n혼자만 모든 걸 잃은 표정\r\n\r\n只有我是一副垂头丧气的模样\r\n\r\n정신없이 한참을 뛰었던 걸까\r\n\r\n无忧无虑的奔跑这件事\r\n\r\n이제는 너무 멀어진 꿈들\r\n\r\n现在已经变成了太遥远的梦想\r\n\r\n이 오랜 슬픔이 그치기는 할까\r\n\r\n这漫长的悲伤会结束吗\r\n\r\n언제가 한 번쯤 따스한 햇살이 내릴까\r\n\r\n会有一天 为我照射温暖的阳光吗\r\n\r\n나는 내가 되고\r\n\r\n然后变成梦想中的自己\r\n\r\n별은 영원히 빛나고\r\n\r\n星星永远在闪烁\r\n\r\n잠들지 않는\r\n\r\n明明还没入睡\r\n\r\n꿈을 꾸고 있어\r\n\r\n却做着这样的白日梦\r\n\r\n바보 같은 나는\r\n\r\n像傻瓜一样的我\r\n\r\n내가 될 수 없단 걸\r\n\r\n是无法成为梦想中的自己\r\n\r\n눈을 뜨고야\r\n\r\n睁开眼睛后\r\n\r\n그걸 알게 됐죠\r\n\r\n才彻悟了这个事实\r\n\r\n나는 내가 되고\r\n\r\n变成梦想中的自己\r\n\r\n별은 영원히 빛나고\r\n\r\n星星永远在闪烁\r\n\r\n잠들지 않는\r\n\r\n明明还没入睡\r\n\r\n꿈을 꾸고 있어\r\n\r\n却做着这样的白日梦\r\n\r\n바보 같은 나는\r\n\r\n像傻瓜一样的我\r\n\r\n내가 될 수 없단 걸\r\n\r\n是无法成为梦想中的自己\r\n\r\n눈을 뜨고야\r\n\r\n睁开眼睛后\r\n\r\n그걸 알게 됐죠\r\n\r\n才彻悟了这个事实\r\n\r\n어떤 날 어떤 시간 어떤 곳에서\r\n\r\n何年何月 何时何地\r\n\r\n나의 작은 세상은 웃어줄까','/song/1684854868403大人-손디아-40905288.flac'),(8,14,'罗大佑-皇后大道东(Live)','皇后大道东',NULL,NULL,'/img/songPic/1684855235046皇后大道東.png','皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n有個貴族朋友在硬幣背後\r\n青春不變名字叫做皇后\r\n每次買賣隨我到處去奔走\r\n面上沒有表情卻匯聚成就\r\n知己一聲拜拜遠去這都市\r\n要靠偉大同志搞搞新意思\r\n照買照賣樓花處處有單位\r\n但是旺角可能要換換名字\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n這個正義朋友面善又友善\r\n因此批準馬匹一週跑兩天\r\n百姓也自然要鬥快過終點\r\n若做大國公民祇須身有錢\r\n知己一聲拜拜遠去這都市\r\n要靠偉大同志搞搞新意思\r\n冷暖氣候同樣影響這都市\r\n但是換季可能靠特異人士\r\n空即是色 色即是空\r\n空即是色即是色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n這個漂亮朋友道別亦漂亮\r\n夜夜電視螢幕繼續舊形象\r\n到了那日同慶個個要鼓掌\r\n硬幣上那尊容變烈士銅像\r\n知己一聲拜拜遠去這都市\r\n要靠偉大同志搞搞新意思\r\n會有鐵路城巴也會有的士\r\n但是路線可能要問問何事\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮','/song/1684855080283皇后大道东 - 蒋志光,罗大佑.mp3'),(9,14,'罗大佑-皇后大道东_纵贯线','皇后大道东',NULL,NULL,'/img/songPic/1684855239909皇后大道东.png','皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n有個貴族朋友在硬幣背後\r\n青春不變名字叫做皇后\r\n每次買賣隨我到處去奔走\r\n面上沒有表情卻匯聚成就\r\n知己一聲拜拜遠去這都市\r\n要靠偉大同志搞搞新意思\r\n照買照賣樓花處處有單位\r\n但是旺角可能要換換名字\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n這個正義朋友面善又友善\r\n因此批準馬匹一週跑兩天\r\n百姓也自然要鬥快過終點\r\n若做大國公民祇須身有錢\r\n知己一聲拜拜遠去這都市\r\n要靠偉大同志搞搞新意思\r\n冷暖氣候同樣影響這都市\r\n但是換季可能靠特異人士\r\n空即是色 色即是空\r\n空即是色即是色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n這個漂亮朋友道別亦漂亮\r\n夜夜電視螢幕繼續舊形象\r\n到了那日同慶個個要鼓掌\r\n硬幣上那尊容變烈士銅像\r\n知己一聲拜拜遠去這都市\r\n要靠偉大同志搞搞新意思\r\n會有鐵路城巴也會有的士\r\n但是路線可能要問問何事\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮','/song/1684855097072皇后大道东 (Live) - live - 纵贯线.mp3'),(10,14,'罗大佑-皇后大道东','皇后大道东',NULL,NULL,'/img/songPic/1684855243270皇后大道東.png','皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n有個貴族朋友在硬幣背後\r\n青春不變名字叫做皇后\r\n每次買賣隨我到處去奔走\r\n面上沒有表情卻匯聚成就\r\n知己一聲拜拜遠去這都市\r\n要靠偉大同志搞搞新意思\r\n照買照賣樓花處處有單位\r\n但是旺角可能要換換名字\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n這個正義朋友面善又友善\r\n因此批準馬匹一週跑兩天\r\n百姓也自然要鬥快過終點\r\n若做大國公民祇須身有錢\r\n知己一聲拜拜遠去這都市\r\n要靠偉大同志搞搞新意思\r\n冷暖氣候同樣影響這都市\r\n但是換季可能靠特異人士\r\n空即是色 色即是空\r\n空即是色即是色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n空即是色 色即是空\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n這個漂亮朋友道別亦漂亮\r\n夜夜電視螢幕繼續舊形象\r\n到了那日同慶個個要鼓掌\r\n硬幣上那尊容變烈士銅像\r\n知己一聲拜拜遠去這都市\r\n要靠偉大同志搞搞新意思\r\n會有鐵路城巴也會有的士\r\n但是路線可能要問問何事\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮\r\n皇后大道中人民如潮湧\r\n皇后大道西又皇后大道東\r\n皇后大道東轉皇后大道中\r\n皇后大道東上為何無皇宮','/song/1684855124798皇后大道东 (Live) - live - 纵贯线.mp3'),(11,15,'μ\'s-爱してるばんざーい','もぎゅっと“love”で接近中!',NULL,NULL,'/img/songPic/1684855432587love live.png','愛してるばんざーい!\r\n\r\n为爱恋的心情欢呼!\r\n\r\nここでよかった　私たちの今がここにある\r\n\r\n十分庆幸能在这里 我们的现在才正要展开\r\n\r\n愛してるばんざーい!\r\n\r\n为爱恋的心情欢呼!\r\n\r\n始まったばかり　明日もよろしくね　まだゴールじゃない\r\n\r\n现在才刚启程 明天也请多多指教 此处还不是终点\r\n\r\n \r\n\r\n笑ってよ　悲しいなら吹きとばそうよ\r\n\r\n笑一个吧 把愁云惨雾全部吹飞\r\n\r\n笑えたら変わる景色　晴れ間がのぞく\r\n\r\n让微笑使景色雨过天晴\r\n\r\n不安でもしあわせへと繋がる道が\r\n\r\n尽管忐忑不安 在迈往幸福的道路上\r\n\r\n見えてきたよな青空\r\n\r\n能够看见晴朗的蓝天\r\n\r\n \r\n\r\n時々雨が降るけど水がなくちゃたいへん\r\n\r\n尽管晴时多云偶阵雨 但若缺乏水分就糟糕了\r\n\r\n乾いちゃだめだよ　みんなの夢の木よ育て\r\n\r\n不能让它就此干枯 让我们同心协力灌溉梦想之树吧\r\n\r\n \r\n\r\nさあ!\r\n\r\n来吧!\r\n\r\n大好きだばんざーい!\r\n\r\n为最喜欢的心情欢呼!\r\n\r\nまけないゆうき　私たちは今を楽しもう\r\n\r\n凭借不服输的勇气 一同享受当下吧\r\n\r\n大好きだばんざーい!\r\n\r\n为最喜欢的心情欢呼!\r\n\r\n頑張れるから　昨日に手をふって　ほら前向いて\r\n\r\n这样才能努力下去 向昨日挥手道别继续 迈步向前吧\r\n\r\n \r\n\r\n進んでよ　苦しくても隣にいてよ\r\n\r\n前进吧 即使感到辛苦 我也会陪伴你\r\n\r\n進んだら燃える太陽　東を照らす\r\n\r\n只要前进 旭日便会为你东升\r\n\r\n迷ってた答えがない先への道は\r\n\r\n在通往前方的道路 徬徨无措 求无正解\r\n\r\n誰も知らない言えない\r\n\r\n任谁也无法知晓\r\n\r\n \r\n\r\n突然嵐のなかへ落ちる銀のひかり\r\n\r\n骤然之间风暴之中闪下轰雷掣电\r\n\r\n怯えちゃだめだよ　みんなの夢の木は強い\r\n\r\n可不能畏惧退缩 我们的梦想之树不会就此崩坏\r\n\r\n \r\n\r\nさあ!\r\n\r\n来吧!\r\n\r\n愛してるばんざーい!\r\n\r\n为爱恋的心情欢呼!\r\n\r\nここでよかった　私たちの今がここにある\r\n\r\n十分庆幸能在这里 我们的现在才正要展开\r\n\r\n愛してるばんざーい!\r\n\r\n为爱恋的心情欢呼!\r\n\r\n始まったばかり　明日もよろしくね　まだゴールじゃない\r\n\r\n现在才刚启程 明天也请多多指教 此处还不是终点\r\n\r\n \r\n\r\n時々雨が降るんだ　風で幹が揺れる\r\n\r\n不时的滂沱大雨 强风憾动着枝干\r\n\r\n一緒にいくんだ　みんなの夢の木よ育て\r\n\r\n启程吧 同心协力栽培梦想之树\r\n\r\n \r\n\r\nさあ!\r\n\r\n来吧!\r\n\r\n大好きだばんざーい!\r\n\r\n为最喜欢的心情欢呼!\r\n\r\nまけないゆうき　私たちは今を楽しもう\r\n\r\n凭借不服输的勇气一同享受当下吧\r\n\r\n大好きだばんざーい!\r\n\r\n为最喜欢的心情欢呼!\r\n\r\n頑張れるから　昨日に手をふって　ほら前向いて\r\n\r\n这样才能努力下去 向昨日挥手道别 迈步向前吧','/song/1684855406680爱してるばんざーい.aac'),(12,15,'μ\'s-南ことり(CV.内田彩) 小泉花阳(CV.久保ユリカ) - 告白日和、です!','夏色えがおで',NULL,NULL,'/img/songPic/1684855493771love live.png','Summer wing\r\n\r\n夏天的翅膀\r\n\r\n飛んで Summer wing\r\n\r\n放飞吧 夏天的翅膀\r\n\r\nなぜか見えた明日のときめき…どうしようかな?\r\n\r\n期待明天时的怦怦心跳…怎么办才好\r\n\r\nつかまえて もっとShinin\' もっとDreamin\'\r\n\r\n把握机遇 更多憧憬更加闪耀\r\n\r\n楽しくしちゃうよ\r\n\r\n享受夏天的喧闹\r\n\r\n羽が生えて私のこころは雲の上\r\n\r\n我的心就像生出了翅膀 飞上云霄\r\n\r\nさそわれて遠い空 遠い海\r\n\r\n顺应呼唤 向海天一线的彼方\r\n\r\nスピードだして F.L.Y!!\r\n\r\n自由地飞翔\r\n\r\nうんとうんと陽射し浴びながら\r\n\r\n尽情沐浴着灿烂的阳光\r\n\r\n輝く思い出かさねよう\r\n\r\n一路铭刻下闪耀的回忆\r\n\r\nこのたった一度の季節を探していたんだ\r\n\r\n独一无二的季节 我已经寻觅了好久\r\n\r\n真夏のせいだよ 1,2,Jump!\r\n\r\n都怪盛夏太怡人 1,2,Jump!\r\n\r\n光のシャワーはじける\r\n\r\n让全身浸透了阳光\r\n\r\n気持ちがいいね、いいよね?\r\n\r\n这感觉不错吧，你觉得呢？\r\n\r\nうなずいてVacation\r\n\r\n与我分享这个假期\r\n\r\n夏色えがおで 1,2,Jump!\r\n\r\n带着夏色的笑容 1,2,Jump!\r\n\r\nぴかぴかフェイスあげたい\r\n\r\n给你一个动人的我\r\n\r\n一緒がいいね、いいよね?\r\n\r\n和我一起开心吗 你觉得呢?\r\n\r\nうなずいてよ\r\n\r\n赶快点头吧\r\n\r\n暑いけど 熱いから\r\n\r\n阳光再热 不如心热\r\n\r\n嬉しくて 楽しいね\r\n\r\n开心相伴 一同分享\r\n\r\nSummer day\r\n\r\n这段夏日时光\r\n\r\nすれ違って互いにときめく…どうしたんだろう?\r\n\r\n擦肩而过时的怦怦心跳...这是怎么了\r\n\r\nおいかける そうだShinin\' そうだDreamin\'\r\n\r\n快追上去 尽情憧憬肆意闪耀\r\n\r\nふしぎな予感で\r\n\r\n听凭预感的奇妙\r\n\r\n通りすぎた風から感じる懐かしさ\r\n\r\n突然吹过的风儿传来了 怀念的味道\r\n\r\nみあげれば遠い空 遠い海\r\n\r\n抬头望去 向海天一线的彼方\r\n\r\n夢中になってT.R.Y!!\r\n\r\n全心投入去挑战\r\n\r\nやっとやっとここで会えたから\r\n\r\n难得能在这个地方相遇\r\n\r\n私と思い出つくろうよ\r\n\r\n共同来营造一份回忆吧\r\n\r\n熱い胸のなかで奇跡を探していたんだ\r\n\r\n热情洋溢的胸中 一直在期盼着奇迹\r\n\r\n星よりたしかな1,2,Love!\r\n\r\n比繁星还要真切 1,2,Love!\r\n\r\n光が夜を照らせば\r\n\r\n当光芒照亮了夜晚\r\n\r\n未来があるよ、あるよね?\r\n\r\n就能看清未来 你觉得呢?\r\n\r\n最高のLocation\r\n\r\n从这个最美的地方\r\n\r\n星までだれかの1,2,Love!\r\n\r\n星空绽放的焰火1,2,Love!\r\n\r\nどきどきハートうちあげ\r\n\r\n那是我们激动的心跳\r\n\r\n希望があるよ、あるよね?\r\n\r\n那是希望的火光 你觉得呢？\r\n\r\n願いを言って\r\n\r\n许下心愿吧\r\n\r\n「夏色えがおで1,2,Jump!」\r\n\r\n“夏色笑容1，2，Jump！”\r\n\r\nラブライブ!\r\n\r\nSchool idol project\r\n\r\n星よりたしかな1,2,Love!\r\n\r\n比繁星还要真切 1,2,Love!\r\n\r\n光が夜を照らせば\r\n\r\n当光芒照亮了夜晚\r\n\r\n未来があるよ、あるよね?\r\n\r\n就能看清未来 你觉得呢?\r\n\r\nうなずいてVacation\r\n\r\n与我分享这个假期\r\n\r\n(Summer wing)\r\n\r\n（夏日的翅膀）\r\n\r\n真夏のせいだよ1,2,Jump!\r\n\r\n都怪盛夏太怡人 1,2,Jump!\r\n\r\n光のシャワーはじける\r\n\r\n让全身浸透了阳光\r\n\r\n気持ちがいいね、いいよね\r\n\r\n这感觉不错吧，你觉得呢？\r\n\r\nうなずいてVacation\r\n\r\n与我分享这个假期\r\n\r\n夏色えがおで1,2,Jump!\r\n\r\n带着夏色的笑容 1,2,Jump!\r\n\r\nぴかぴかフェイスあげたい\r\n\r\n给你一个动人的我\r\n\r\n一緒がいいね、いいよね?\r\n\r\n和我一起开心吗 你觉得呢?\r\n\r\nうなずいてよ\r\n\r\n赶快点头吧\r\n\r\n暑いけど 熱いから\r\n\r\n阳光再热 不如心热\r\n\r\n嬉しくて 楽しいね\r\n\r\n开心相伴 一同分享\r\n\r\nSummer day\r\n\r\n这段夏日时光','/song/1684855489985南ことり(CV.内田彩) 小泉花阳(CV.久保ユリカ) - 告白日和、です!.mp3'),(13,15,'μ\'s-僕らのLIVE 君とのLIFE','僕らは今のなかで',NULL,NULL,'/img/songPic/1684855566672love live 2.png','真っ直ぐな想いがみんなを結ぶ\r\n\r\n率直的想念将你我相连\r\n\r\n本気でも不器用 ぶつかり合うこころ\r\n\r\n即使认真也依然那么笨拙 如此碰撞着的内心\r\n\r\nそれでも見たいよ大きな夢は\r\n\r\n即便如此 我也好想看看那远大的梦想\r\n\r\nここにあるよ 始まったばかり\r\n\r\n就在这里 正要开始\r\n\r\n \r\n\r\n(わかってる)\r\n\r\n（我明白）\r\n\r\n楽しいだけじゃない 試されるだろう\r\n\r\n不仅仅是享受快乐 亦要接受历练\r\n\r\n(わかってる)\r\n\r\n（我明白）\r\n\r\nだってその苦しさもミライ\r\n\r\n因为这份苦楚 也会化为未来\r\n\r\n(行くんだよ)\r\n\r\n（向前进）\r\n\r\n集まったら強い自分になってくよ\r\n\r\n与你一起的我会更加坚强 更有自己的本色\r\n\r\n(きっとね)変わり続けて(We\'ll be star!)\r\n\r\n（一定啊）会这样改变下去\r\n\r\n \r\n\r\nそれぞれが好きなことで頑張れるなら\r\n\r\n如果每个人都能为自己的所爱付诸努力\r\n\r\n新しい(場所が)ゴールだね\r\n\r\n那崭新的（地方）定是终点\r\n\r\nそれぞれの好きなことを信じていれば\r\n\r\n如果每个人都能对自己的所爱坚信不疑\r\n\r\nときめきを(抱いて)進めるだろう\r\n\r\n定能将悸动（怀抱）向前迈进\r\n\r\n \r\n\r\n(恐がる癖は捨てちゃえ)とびきりの笑顔で\r\n\r\n（丢掉我怯弱的个性）用那最美的微笑\r\n\r\n(跳んで跳んで高く)僕らは今のなかで\r\n\r\n（跳吧跳吧跳得更高）我们就活在当下\r\n\r\n \r\n\r\n考えるだけよりみんなで走ろう\r\n\r\n与其踌躇不前不如与你携手奔跑\r\n\r\n明日は未完成 予想できないちから\r\n\r\n明天还是未知数 蕴含着无法预计的力量\r\n\r\nそれなら起こるよ奇跡は必然\r\n\r\n这样必然能够 招来奇迹降临\r\n\r\nこれからだよ 何もかも全部が\r\n\r\n才要开始呢 无论是什么\r\n\r\n \r\n\r\n(わかってる)\r\n\r\n（我明白）\r\n\r\n悲しい時にこそ 上を向いてみよう\r\n\r\n越是难过的时候 就越该抬头向上\r\n\r\n(わかってる)\r\n\r\n（我明白）\r\n\r\nもっと素晴らしくなれセカイ\r\n\r\n希望世界能够变得 更加美好\r\n\r\n(欲しいんだよ)\r\n\r\n（我希望）\r\n\r\n輝きを胸に宿したいから\r\n\r\n愿那份璀璨能寄宿在我心里\r\n\r\n(ぐっとね)競い合おうよ(We can fly!)\r\n\r\n（一口气儿）一同竞争吧\r\n\r\n \r\n\r\n振り返る暇なんてないね そんな気分さ\r\n\r\n才没有回首的空闲呢 我现在的心情\r\n\r\n広がるよ(君と)どこまでも\r\n\r\n好像要延展开来（与你）直到天际\r\n\r\n振り返る暇なんてないと感じているよ\r\n\r\n正因为感到无暇回首\r\n\r\n刺激への(期待)盛り上がってく\r\n\r\n那对于刺激的（期待心）才不断膨胀\r\n\r\n \r\n\r\n(弱気な僕にさよなら)消さないで笑顔で\r\n\r\n（向怯弱的我说再见）用那抹不去的笑容\r\n\r\n(跳んで跳んで高く)僕らと今のなかを\r\n\r\n（跳吧跳吧跳得更高）让我们与当下一起\r\n\r\n \r\n\r\n夢が大きくなるほど(試されるだろう)\r\n\r\n梦想越是远大（越要经受考验）\r\n\r\n胸の熱さで乗り切れ(僕の温度は)\r\n\r\n用我炙热的内心去克服（我的温度）\r\n\r\n熱いから(熱すぎて)とまらない\r\n\r\n可是滚烫的（炙手可热）降不下来了\r\n\r\n無謀な賭け? 勝ちにいこう!\r\n\r\n说这是无谋的赌局？那就要赢给你看！\r\n\r\n \r\n\r\nそれぞれが好きなことで頑張れるなら\r\n\r\n如果每个人都能为自己的所爱付诸努力\r\n\r\n新しい(場所が)ゴールだね\r\n\r\n那崭新的（地方）定是终点\r\n\r\nそれぞれの好きなことを信じていれば\r\n\r\n如果每个人都能对自己的所爱坚信不疑\r\n\r\nときめきを(抱いて)進めるだろう\r\n\r\n定能将悸动（怀抱）向前迈进\r\n\r\n \r\n\r\n(恐がる癖は捨てちゃえ)とびきりの笑顔で\r\n\r\n（丢掉我怯弱的个性）用那最美的微笑\r\n\r\n(跳んで跳んで高く)僕らと今を\r\n\r\n（跳吧跳吧跳得更高）令我们与当下\r\n\r\n(弱気な僕にさよなら)消さないで笑顔で\r\n\r\n（向怯弱的我说再见）用那抹不去的笑容\r\n\r\n(跳んで跳んで高く)僕らは今のなかで\r\n\r\n（跳吧跳吧跳得更高）我们就活在当下\r\n\r\n \r\n\r\n輝きを待ってた\r\n\r\n等待绽放自己的光芒','/song/1684855544268僕らのLIVE 君とのLIFE - μ\'s.mp3'),(14,16,'TheFatRat-No No No','No No No',NULL,NULL,'/img/songPic/1684855647896nonono.png','Every time you two are getting rough\r\n\r\n每当你们双方不合直至拳脚相向\r\n\r\nMy mind just sounds like Shia LaBeouf\r\n\r\n我的思绪就开始喧嚣如同拉博夫\r\n\r\nIt says no no no no no\r\n\r\n它向我咆哮着抵抗着\r\n\r\nNo no no no no\r\n\r\n停下吧\r\n\r\nJust no no no no no\r\n\r\n别再继续下去了\r\n\r\nAnd every time I see him with you\r\n\r\n每当我目睹他堂而皇之与你同在\r\n\r\nMy heart sounds like Shia LaBeouf\r\n\r\n我的心脏就开始牵扯如同拉博夫\r\n\r\nTo no no no no no\r\n\r\n它不停絮叨着拒绝着\r\n\r\nNo no no no no\r\n\r\n放弃吧\r\n\r\nNo no\r\n\r\n再见吧\r\n\r\nNo no no no no\r\n\r\n别再让我痛楚\r\n\r\nNo no no no no\r\n\r\n别再备受煎熬\r\n\r\nNo no no no no\r\n\r\n别再如枕利刃\r\n\r\nNo no no no no\r\n\r\n停下吧\r\n\r\nNo no no no no\r\n\r\n终止吧\r\n\r\nNo no no no no\r\n\r\n结束吧\r\n\r\nNo no no no no\r\n\r\n是时候该写下片尾语\r\n\r\nNo no no no no\r\n\r\n是时候该画上休止符\r\n\r\nEvery time you two are getting rough\r\n\r\n每当你们双方不合直至拳脚相向\r\n\r\nMy mind just sounds like Shia LaBeouf\r\n\r\n我的思绪就开始喧嚣如同拉博夫\r\n\r\nIt says no no no no no\r\n\r\n它向我咆哮着抵抗着\r\n\r\nNo no no no no\r\n\r\n停下吧\r\n\r\nJust no no no no no\r\n\r\n别再继续下去了\r\n\r\nAnd every time I see him with you\r\n\r\n每当我目睹他陪在你的身旁\r\n\r\nMy heart sounds like Shia LaBeouf\r\n\r\n我的心脏就开始牵扯如同拉博夫\r\n\r\nTo no no no no no\r\n\r\n它不停絮叨着拒绝着\r\n\r\nNo no no no no\r\n\r\n放弃吧\r\n\r\nNo no\r\n\r\n再见吧\r\n\r\nNo no no no no\r\n\r\n别再让我痛楚\r\n\r\nNo no no no no\r\n\r\n别再备受煎熬\r\n\r\nNo no no no no\r\n\r\n别再如枕利刃\r\n\r\nNo no no no no\r\n\r\n停下吧\r\n\r\nNo no no no no\r\n\r\n终止吧\r\n\r\nNo no no no no\r\n\r\n结束吧\r\n\r\nNo no no no no\r\n\r\n是时候该写下片尾语\r\n\r\nNo no no no no\r\n\r\n是时候该画上休止符','/song/1684855643282No No No - TheFatRat.mp3'),(15,16,'TheFatRat-Unity','Unity',NULL,NULL,'/img/songPic/1684855708570unity.png','Stand together like we\'re rocks in a wall\r\n\r\n如那高强凝聚的石块般同舟共立\r\n\r\nGrowing stronger everyday even more\r\n\r\n每一天都比从前更坚强挺立\r\n\r\nStand together in the eye of the storm\r\n\r\n在那风暴的中心齐心共济\r\n\r\nAnd show the whole world who we are oh\r\n\r\n向世界秀出我们真正的自己\r\n\r\nKeep on walking to the sound of the drums\r\n\r\n随那战鼓之声持续前进\r\n\r\nFeel the fire run through our lungs\r\n\r\n感受那火般热烈穿肺钻心\r\n\r\nFind our treasure in the light of the sun\r\n\r\n在那旭日光芒中寻得我们珍视的珍惜\r\n\r\nAnd show the whole world who we are oh\r\n\r\n向世界秀出我们真正的自己','/song/1684855705400Unity - TheFatRat.mp3'),(16,17,'Stamatis-You\'ll Come As a Lightning','Marble King',NULL,NULL,'/img/songPic/1684855802743linghting.png','Θά \'ρθεις σαν αστραπή (Thá \'rthis san astrapí)\r\n\r\n你将如闪电般归来\r\n\r\nθά\' χει η χώρα γιορτή (thá\' khi i khóra yiortí)\r\n\r\n举国上下一同欢庆\r\n\r\nθάλασσα γη και ουρανός (thálasa yi ke uranós)\r\n\r\n大地，海洋和天空\r\n\r\nστο δικό σου φως. (sto dhikó su fos.)\r\n\r\n受你的光芒照耀。\r\n\r\nΘα ντυθώ στα λευκά (Tha dithó sta lefká)\r\n\r\n我将身穿白色衣服\r\n\r\nνα σ\' αγγίξω ξανά (na s\' angíxo xaná)\r\n\r\n我将重新再触摸你\r\n\r\nφως εσύ και καρδιά μου εγώ (fos esí ke kardhiá mu eghó)\r\n\r\n你的光芒与我的心\r\n\r\nπόσο σ\' αγαπώ. (póso s\' aghapó.)\r\n\r\n我是如此的爱你。\r\n\r\nΒασιλεύς Βασιλέων, Βασιλεί Βοήθει, (Vasilefs Vasiléon, Vasilí Voḯthi,)\r\n\r\n万王之王，拯救之王，（指耶稣基督）\r\n\r\nέλεος, έλεος Επουράνιε Θεέ (éleos, éleos Epuránie Theé)\r\n\r\n天堂的上帝请施展仁慈\r\n\r\nΚωνσταντίν Δραγάτσης Παλαιολόγ, (Konstandín Dhraghátsis Paleológh,)\r\n\r\n君士坦丁·德拉伽齐斯·巴列奥略\r\n\r\nέλεω Θεού Αυτοκράτωρ των Ρωμαίων. (éleo Theú Aftokrátor ton Romeon.)\r\n\r\n承蒙上帝恩典罗马人的皇帝。\r\n\r\nΣτην πύλη του αγίου Ρωμανού, (Stin píli tu ayíu Romanú,)\r\n\r\n在圣罗曼努斯大门前，\r\n\r\nκαβαλικά την φάρα του την ασπροποδαράτην, (kavaliká tin fára tu tin aspropodharátin,)\r\n\r\n他骑着一匹白腿的马，\r\n\r\nΤέσσερα Βήτα, έλεος, έλεος, Μαρμαράς, (Tésera Víta, éleos, éleos, Marmarás, )\r\n\r\n四个贝塔（指耶稣基督），请施展仁慈，马尔马拉斯（君士坦丁十一世的别称），\r\n\r\nΒόσπορος και Μαύρη Τρίτη (Vósporos ke Mav́ri Tríti)\r\n\r\n博斯普鲁斯海峡和黑色星期二\r\n\r\nΦρίξον ήλιε, στέναξον γη, (Fríxon ílie, sténaxon yi,)\r\n\r\n太阳在颤抖，大地在叹息，\r\n\r\nΕάλω ή πόλη, Εάλω η πόλη (Eálo í póli, Eálo i póli)\r\n\r\n城市陷落，城市陷落（指君士坦丁堡陷落）\r\n\r\nΒασιλεύουσα, πύλη χρυσή (Vasilev́usa, píli khrisí)\r\n\r\n瓦西列乌撒（君士坦丁堡的别称，意为“统治之城”），金色城门\r\n\r\nκι ο πορφυρογέννητος στην κόκκινη μηλιά. (ki o porfiroyénitos stin kókini miliá.)\r\n\r\n红色苹果树下的普尔菲罗耶尼图斯（东罗马帝国皇子的荣誉称号，意为“紫衣出身”，指君士坦丁十一世）\r\n\r\nΗ πόλη ήταν το σπαθί, η πόλη το κοντάρι, (I póli ítan to spathí, i póli to kondári,)\r\n\r\n城市是刀剑，城市是长矛，\r\n\r\nη πόλη ήταν το κλειδί της Ρωμανίας όλης (i póli ítan to klidhí tis Romanías ólis)\r\n\r\n城市是整个罗马帝国的钥匙\r\n\r\nΣώπασε Κυρά Δέσποινα και μην πολυδακρύζεις, (Sópase Kirá Dhéspina ke min polidhakrízis,)\r\n\r\n圣母请不要哭泣，\r\n\r\nπάλι με χρόνια με καιρούς, πάλι δικά Σου θά ναι. (páli me khrónia me keroús, páli dhiká Su thá ne.)\r\n\r\n多年以后它仍将属于你。\r\n\r\nΣτην πύλη του Ρωμανού (Stin píli tu Romanú)\r\n\r\n在罗曼努斯大门前\r\n\r\nέφυγες για αλλού (éfiyes yia alú)\r\n\r\n你去了其他的地方\r\n\r\nκι άγγελος θα σε φέρει εδώ (ki ángelos tha se féri edhó)\r\n\r\n当正确的时间来临\r\n\r\nστον σωστό καιρό. (ston sostó keró.)\r\n\r\n一位天使将把你带回这里。\r\n\r\nΜες την Άγια Σοφιά (Mes tin Áyia Sofiá)\r\n\r\n在圣索菲亚大教堂\r\n\r\nθα βρεθούμε ξανά (tha vrethúme xaná)\r\n\r\n在未来礼拜的时候\r\n\r\nλειτουργία μελλοντική (liturgía melondikí)\r\n\r\n同全体希腊人一起\r\n\r\nοι Έλληνες μαζί (i Élines mazí)\r\n\r\n我们将会重逢\r\n\r\nΒασιλεύς Βασιλέων, Βασιλεί Βοήθει, (Vasilefs Vasiléon, Vasilí Voḯthi,)\r\n\r\n万王之王，拯救之王，（指耶稣基督）\r\n\r\nέλεος, έλεος Επουράνιε Θεέ (éleos, éleos Epuránie Theé)\r\n\r\n天堂的上帝请施展仁慈\r\n\r\nΚωνσταντίν Δραγάτσης Παλαιολόγ, (Konstandín Dhraghátsis Paleológh,)\r\n\r\n君士坦丁·德拉伽齐斯·巴列奥略\r\n\r\nέλεω Θεού Αυτοκράτωρ των Ρωμαίων. (éleo Theú Aftokrátor ton Romeon.)\r\n\r\n承蒙上帝恩典罗马人的皇帝。\r\n\r\nΣτην πύλη του αγίου Ρωμανού, (Stin píli tu ayíu Romanú,)\r\n\r\n在圣罗曼努斯大门前，\r\n\r\nκαβαλικά την φάρα του την ασπροποδαράτην, (kavaliká tin fára tu tin aspropodharátin,)\r\n\r\n他骑着一匹白腿的马，\r\n\r\nΤέσσερα Βήτα, έλεος, έλεος, Μαρμαράς, (Tésera Víta, éleos, éleos, Marmarás, )\r\n\r\n四个贝塔（指耶稣基督），请施展仁慈，马尔马拉斯（君士坦丁十一世的别称），\r\n\r\nΒόσπορος και Μαύρη Τρίτη (Vósporos ke Mav́ri Tríti)\r\n\r\n博斯普鲁斯海峡和黑色星期二\r\n\r\nΦρίξον ήλιε, στέναξον γη, (Fríxon ílie, sténaxon yi,)\r\n\r\n太阳在颤抖，大地在叹息，\r\n\r\nΕάλω ή πόλη, Εάλω η πόλη (Eálo í póli, Eálo i póli)\r\n\r\n城市陷落，城市陷落（指君士坦丁堡陷落）\r\n\r\nΒασιλεύουσα, πύλη χρυσή (Vasilev́usa, píli khrisí)\r\n\r\n瓦西列乌撒（君士坦丁堡的别称，意为“统治之城”），金色城门\r\n\r\nκι ο πορφυρογέννητος στην κόκκινη μηλιά. (ki o porfiroyénitos stin kókini miliá.)\r\n\r\n红色苹果树下的普尔菲罗耶尼图斯（东罗马帝国皇子的荣誉称号，意为“紫衣出身”，指君士坦丁十一世）\r\n\r\nΗ πόλη ήταν το σπαθί, η πόλη το κοντάρι, (I póli ítan to spathí, i póli to kondári,)\r\n\r\n城市是刀剑，城市是长矛，\r\n\r\nη πόλη ήταν το κλειδί της Ρωμανίας όλης (i póli ítan to klidhí tis Romanías ólis)\r\n\r\n城市是整个罗马帝国的钥匙\r\n\r\nΣώπασε Κυρά Δέσποινα και μην πολυδακρύζεις, (Sópase Kirá Dhéspina ke min polidhakrízis,)\r\n\r\n圣母请不要哭泣，\r\n\r\nπάλι με χρόνια με καιρούς, πάλι δικά Σου θά ναι. (páli me khrónia me keroús, páli dhiká Su thá ne.)\r\n\r\n多年以后它仍将属于你。\r\n\r\nΘά \'ρθεις σαν αστραπή (Thá \'rthis san astrapí)\r\n\r\n你将如闪电般归来\r\n\r\nθά\' χει η χώρα γιορτή (thá\' khi i khóra yiortí)\r\n\r\n举国上下一同欢庆\r\n\r\nθάλασσα γη και ουρανός (thálasa yi ke uranós)\r\n\r\n大地，海洋和天空\r\n\r\nστο δικό σου φως. (sto dhikó su fos.)\r\n\r\n受你的光芒照耀。\r\n\r\nΜες την Άγια Σοφιά (Mes tin Áyia Sofiá)\r\n\r\n在圣索菲亚大教堂\r\n\r\nθα βρεθούμε ξανά (tha vrethúme xaná)\r\n\r\n在未来礼拜的时候\r\n\r\nλειτουργία μελλοντική (liturgía melondikí)\r\n\r\n同全体希腊人一起\r\n\r\nοι Έλληνες μαζί (i Élines mazí)\r\n\r\n我们将会重逢\r\n\r\nΚωνσταντίνος Δραγάτσης Παλαιολόγος (Konstandínos Dhraghátsis Paleológos)\r\n\r\n君士坦丁诺斯·德拉伽齐斯·巴列奥略格斯','/song/1684855795425你将如闪电般归来.mp3'),(17,18,'Linkin Park-Heavy','One More Light',NULL,NULL,'/img/songPic/1684855903361lp.png','I don’t like my mind right now\r\n\r\n我厌恶此刻的思绪\r\n\r\nStacking up problems that are so unnecessary\r\n\r\n正将无关痛痒的种种问题堆砌而起\r\n\r\nWish that I could slow things down\r\n\r\n还期望自己能放慢节奏\r\n\r\nI wanna let go but there’s comfort in the panic\r\n\r\n想释手却感到惶恐里尚存一丝安逸\r\n\r\nAnd I drive myself crazy\r\n\r\n把自我往疯狂逼近\r\n\r\nThinking everything\'s about me\r\n\r\n觉得所有事情都牵连自己\r\n\r\nYeah I drive myself crazy\r\n\r\n变得越来越歇斯底里\r\n\r\nCause I can’t escape the gravity\r\n\r\n因我终究逃不过地心引力\r\n\r\n \r\n\r\nI\'m holding on\r\n\r\n我还放不下\r\n\r\nWhy is everything so heavy\r\n\r\n为何一切都这样沉重无比\r\n\r\nHolding on\r\n\r\n紧握难舍\r\n\r\nSo much more than I can carry\r\n\r\n负担得过多我已承受不起\r\n\r\nI keep dragging around what\'s bringing me down\r\n\r\n一路上拖曳着难以割舍的累赘前进\r\n\r\nIf I just let go, I\'d be set free\r\n\r\n倘若放手，便无束无拘\r\n\r\nHolding on\r\n\r\n仍在挣扎\r\n\r\nWhy is everything so heavy\r\n\r\n为何一切都这样沉重无比\r\n\r\n \r\n\r\nYou say that I\'m paranoid\r\n\r\n你说是我执迷不悟\r\n\r\nBut I’m pretty sure the world is out to get me\r\n\r\n但我确信这世界再不为我留一席之地\r\n\r\nIt’s not like I make the choice\r\n\r\n不觉得这是自作自受\r\n\r\nTo let my mind stay so ******* messy\r\n\r\n我怎可能让自己心神不宁\r\n\r\nI know I\'m not the center of the universe\r\n\r\n我知自己并非茫茫宇宙的中心\r\n\r\nBut you keep spinning round me just the same\r\n\r\n但你仍然盘旋在周让我无法脱离\r\n\r\nI know I\'m not the center of the universe\r\n\r\n我知自己并非茫茫宇宙的中心\r\n\r\nBut you keep spinning round me just the same\r\n\r\n可你依旧如影随形让我挥之不去\r\n\r\n \r\n\r\nI\'m holding on\r\n\r\n我还放不下\r\n\r\nWhy is everything so heavy\r\n\r\n为何这一切沉重无比\r\n\r\nHolding on\r\n\r\n紧握难舍\r\n\r\nSo much more than I can carry\r\n\r\n负担得过多我已承受不起\r\n\r\nI keep dragging around what\'s bringing me down\r\n\r\n一路上拖曳着难以割舍的累赘前进\r\n\r\nIf I just let go, I\'d be set free\r\n\r\n若我肯放手，便无束无拘\r\n\r\nHolding on\r\n\r\n仍在挣扎\r\n\r\nWhy is everything so heavy\r\n\r\n为何一切都这样沉重无比\r\n\r\n \r\n\r\nI know I\'m not the center of the universe\r\n\r\n我知自己并非茫茫宇宙的中心\r\n\r\nBut you keep spinning round me just the same\r\n\r\n但你仍然盘旋在周让我无法脱离\r\n\r\nI know I\'m not the center of the universe\r\n\r\n我知自己并非茫茫宇宙的中心\r\n\r\nBut you keep spinning round me just the same\r\n\r\n可你依旧如影随形让我挥之不去\r\n\r\nAnd I drive myself crazy\r\n\r\n把自我往疯狂逼近\r\n\r\nThinking everything’s about me\r\n\r\n觉得所有事情都牵连自己\r\n\r\n \r\n\r\nI\'m holding on\r\n\r\n我还放不下\r\n\r\nWhy is everything so heavy\r\n\r\n为何一切都这样沉重无比\r\n\r\nHolding on\r\n\r\n紧握难舍\r\n\r\nSo much more than I can carry\r\n\r\n负担得过多我已承受不起\r\n\r\nI keep dragging around what\'s bringing me down\r\n\r\n一路上拖曳着难以割舍的累赘前进\r\n\r\nIf I just let go, I\'d be set free\r\n\r\n倘若放手，便无束无拘\r\n\r\nHolding on\r\n\r\n仍在挣扎\r\n\r\nWhy is everything so heavy\r\n\r\n为何一切都这样沉重无比\r\n\r\nWhy is everything so heavy\r\n\r\n为何一切都这样沉重无比\r\n\r\nWhy is everything so heavy\r\n\r\n为何一切都这样沉重无比','/song/1684855898205Heavy.mp3'),(18,18,'Linkin Park-Forgotten (Album Version)','Hybrid Theory (Bonus Edition)',NULL,NULL,'/img/songPic/1684856023236lp2.png','From the top to the bottom\r\n\r\n我的情绪从巅峰跌至谷底\r\n\r\nBottom to top I stop\r\n\r\n当它再次高涨时，我却犹豫踟蹰\r\n\r\nAt the core I\'ve forgotten\r\n\r\n处于思维漩涡的中心，我却已遗忘\r\n\r\nIn the middle of my thoughts\r\n\r\n当我迷失在自己构建的思维空间时\r\n\r\nTaken far from my safety\r\n\r\n我感到如此躁动不安\r\n\r\nThe picture is there\r\n\r\n当再次看到那张照片时\r\n\r\nThe memory won\'t escape me\r\n\r\n那段记忆又映入我脑海\r\n\r\nBut why should I care\r\n\r\n但我为什么要在乎呢\r\n\r\nFrom the top to the bottom\r\n\r\n我的情绪从巅峰跌至谷底\r\n\r\nBottom to top I stop\r\n\r\n当它再次高涨时，我却犹豫踟蹰\r\n\r\nAt the core I\'ve forgotten\r\n\r\n处于思维漩涡的中心，我却已遗忘\r\n\r\nIn the middle of my thoughts\r\n\r\n当我迷失在自己构建的思维空间时\r\n\r\nTaken far from my safety\r\n\r\n我感到如此躁动不安\r\n\r\nThe picture is there\r\n\r\n当再次看到那张照片时\r\n\r\nThe memory won\'t escape me\r\n\r\n那段记忆又映入我脑海\r\n\r\nBut why should I care\r\n\r\n但我为什么要在乎呢\r\n\r\nThere\'s a place so dark you can\'t see the end\r\n\r\n有一些地方黑不见底\r\n\r\n(Skies cock back) and shock that which can\'t defend\r\n\r\n雷神大怒，冲击着毫无防备的事物\r\n\r\nThe rain then sends dripping an acidic question\r\n\r\n嘲讽如同暴雨扑面而来\r\n\r\nForcefully, the power of suggestion\r\n\r\n内心暗示的力量是如此的强烈\r\n\r\nThen with the eyes tightly shut looking thought the rust and rot\r\n\r\n试图用紧闭的双眼去透视腐朽和尘埃\r\n\r\nAnd dust a spot of light floods the floor\r\n\r\n少许光芒在地板上蔓延开来\r\n\r\nAnd pours over the rusted world of pretend\r\n\r\n进而覆盖了这个虚伪的世界\r\n\r\nThe eyes ease open and it\'s dark again\r\n\r\n松开双眼后还是同样黑暗\r\n\r\nFrom the top to the bottom\r\n\r\n我的情绪从巅峰跌至谷底\r\n\r\nBottom to top I stop\r\n\r\n当它再次高涨时，我却犹豫踟蹰\r\n\r\nAt the core I\'ve forgotten\r\n\r\n处于思维漩涡的中心，我却已遗忘\r\n\r\nIn the middle of my thoughts\r\n\r\n当我迷失在自己构建的思维空间时\r\n\r\nTaken far from my safety\r\n\r\n我感到如此躁动不安\r\n\r\nThe picture is there\r\n\r\n当再次看到那张照片时\r\n\r\nThe memory won\'t escape me\r\n\r\n那段记忆又映入我脑海\r\n\r\nBut why should I care\r\n\r\n但我为什么要在乎呢\r\n\r\nIn the memory you\'ll find me\r\n\r\n在记忆的大楼里你会找到我\r\n\r\nEyes burning up\r\n\r\n我的双眼迸射出熊熊烈焰\r\n\r\nThe darkness holding me tightly\r\n\r\n黑暗牢牢困住我\r\n\r\nUntil the sun rises up\r\n\r\n直到日头东升\r\n\r\n \r\n\r\nMoving all around screaming of the ups and downs\r\n\r\n驱赶了世间沉浮中人们痛苦的叫喊\r\n\r\nPollution manifested in perpetual sound\r\n\r\n无尽的噪音充斥在耳边\r\n\r\nThe wheels go round and the sunset creeps behind\r\n\r\n车轮不停在转，太阳留恋的爬过\r\n\r\nStreet lamps, chain-link and concrete\r\n\r\n街灯，铁丝网，和混凝土\r\n\r\nA little piece of paper with a picture drawn floats\r\n\r\n一张带有图画的小纸块\r\n\r\nOn down the street till the wind is gone\r\n\r\n在街道上随风飘扬\r\n\r\nThe memory now is like the picture was then\r\n\r\n我的记忆就像那时的画面\r\n\r\nWhen the paper\'s crumpled up it can\'t be perfect again\r\n\r\n当纸片被弄皱，它已不再完整\r\n\r\nFrom the top to the bottom\r\n\r\n我的情绪从巅峰跌至谷底\r\n\r\nBottom to top I stop\r\n\r\n当它再次高涨时，我却犹豫踟蹰\r\n\r\nAt the core I\'ve forgotten\r\n\r\n处于思维漩涡的中心，我却已遗忘\r\n\r\nIn the middle of my thoughts\r\n\r\n当我迷失在自己构建的思维空间时\r\n\r\nTaken far from my safety\r\n\r\n我感到如此躁动不安\r\n\r\nThe picture is there\r\n\r\n当再次看到那张照片时\r\n\r\nThe memory won\'t escape me\r\n\r\n那段记忆又映入我脑海\r\n\r\nBut why should I care\r\n\r\n但我为什么要在乎呢\r\n\r\nFrom the top to the bottom\r\n\r\n我的情绪从巅峰跌至谷底\r\n\r\nBottom to top I stop\r\n\r\n当它再次高涨时，我却犹豫踟蹰\r\n\r\nAt the core I\'ve forgotten\r\n\r\n处于思维漩涡的中心，我却已遗忘\r\n\r\nIn the middle of my thoughts\r\n\r\n当我迷失在自己构建的思维空间时\r\n\r\nTaken far from my safety\r\n\r\n我感到如此躁动不安\r\n\r\nThe picture is there\r\n\r\n当再次看到那张照片时\r\n\r\nThe memory won\'t escape me\r\n\r\n那段记忆又映入我脑海\r\n\r\nBut why should I care\r\n\r\n但我为什么要在乎呢\r\n\r\nIn the memory you\'ll find me\r\n\r\n在记忆的大楼里你会找到我\r\n\r\nEyes burning up\r\n\r\n我的双眼迸射出熊熊烈焰\r\n\r\nThe darkness holding me tightly\r\n\r\n黑暗牢牢困住我\r\n\r\nUntil the sun rises up\r\n\r\n直到日头东升\r\n\r\n \r\n\r\nNow you got me caught in the act\r\n\r\n现在是你让我陷入这种境地\r\n\r\nYou bring the thought back\r\n\r\n你向我灌输这种思想\r\n\r\nI\'m telling you that\r\n\r\n我直说了吧\r\n\r\nI see it right through you\r\n\r\n我已经看透你了\r\n\r\nNow you got me caught in the act\r\n\r\n现在是你让我陷入这种境地\r\n\r\nYou bring the thought back\r\n\r\n你向我灌输这种思想\r\n\r\nI\'m telling you that\r\n\r\n我直说了吧\r\n\r\nI see it right through you\r\n\r\n我已经看透你了\r\n\r\nNow you got me caught in the act\r\n\r\n现在是你让我陷入这种境地\r\n\r\nYou bring the thought back\r\n\r\n你向我灌输这种思想\r\n\r\nI\'m telling you that\r\n\r\n我直说了吧\r\n\r\nI see it right through you\r\n\r\n我已经看透你了\r\n\r\nNow you got me caught in the act\r\n\r\n现在是你让我陷入这种境地\r\n\r\nYou bring the thought back\r\n\r\n你向我灌输这种思想\r\n\r\nI\'m telling you that\r\n\r\n我直说了吧\r\n\r\nI see it right through you\r\n\r\n我已经看透你了\r\n\r\nNow you got me caught in the act\r\n\r\n现在是你让我陷入这种境地\r\n\r\nYou bring the thought back\r\n\r\n你向我灌输这种思想\r\n\r\nI\'m telling you that\r\n\r\n我直说了吧\r\n\r\nI see it right through you\r\n\r\n我已经看透你了\r\n\r\nNow you got me caught in the act\r\n\r\n现在是你让我陷入这种境地\r\n\r\nYou bring the thought back\r\n\r\n你向我灌输这种思想\r\n\r\nI\'m telling you that\r\n\r\n我直说了吧\r\n\r\nI see it right through you\r\n\r\n我已经看透你了\r\n\r\nNow you got me caught in the act\r\n\r\n现在是你让我陷入这种境地\r\n\r\nYou bring the thought back\r\n\r\n你向我灌输这种思想\r\n\r\nI\'m telling you that\r\n\r\n我直说了吧\r\n\r\nI see it right through you\r\n\r\n我已经看透你了\r\n\r\nIn the memory you\'ll find me\r\n\r\n在记忆的大楼里你会找到我\r\n\r\nEyes burning up\r\n\r\n我的双眼迸射出熊熊烈焰\r\n\r\nThe darkness holding me tightly\r\n\r\n黑暗牢牢困住我\r\n\r\nUntil the sun rises up\r\n\r\n直到日头东升\r\n\r\nIn the memory you\'ll find me\r\n\r\n在记忆的大楼里你会找到我\r\n\r\nEyes burning up\r\n\r\n我的双眼迸射出熊熊烈焰\r\n\r\nThe darkness holding me tightly\r\n\r\n黑暗牢牢困住我\r\n\r\nUntil the sun rises up\r\n\r\n直到日头东升','/song/1684856020466Linkin Park - Forgotten (Album Version).mp3'),(19,18,'Linkin Park-From The Inside (Live)','Meteora',NULL,NULL,'/img/songPic/1684856124282lp3.png','I don\'t know who to trust, no surprise\r\n\r\n不知道这世间还存在多少信任。不必惊讶\r\n\r\nEveryone feels so far away from me\r\n\r\n感觉每个人都在远离我\r\n\r\n \r\n\r\nHeavy thoughts sift through dust, and the lies\r\n\r\n沉重的思想筛过尘埃和谎言\r\n\r\n \r\n\r\nTrying not to break, but I\'m so tired of this deceit\r\n\r\n努力不去打破，但我早已厌倦欺骗\r\n\r\nEvery time I try to make myself, get back up on my feet\r\n\r\n每次试着找回自己，让自己重新振作\r\n\r\nAll I ever think about is this, all the tiring time between\r\n\r\n而回忆里存在的都是 那些令人厌烦的时光\r\n\r\nAnd how, trying to put my trust in you, just takes so much out of me\r\n\r\n要我怎样你才会相信我 并且让我不会感到心力憔悴？\r\n\r\nTake everything from the inside\r\n\r\n我拿出内心所有事，对你毫无保留\r\n\r\nAnd throw it all away\r\n\r\n对你毫无保留\r\n\r\n\'Cause I swear, for the last time\r\n\r\n因为我发誓，这是最后一次\r\n\r\nI won\'t trust myself with you\r\n\r\n再也不会任自己掉进你的谎言\r\n\r\n \r\n\r\nTension is building inside, steadily\r\n\r\n内心的紧张感，持续不断\r\n\r\nEveryone feels so far away from me\r\n\r\n感觉每个人都那么遥远\r\n\r\nHeavy thoughts forcing their way, out of me\r\n\r\n沉重的思想逼迫他们远离我\r\n\r\nTrying not to break, but I\'m so tired of this deceit\r\n\r\n努力不去打破，但我早已厌倦欺骗\r\n\r\nEvery time I try to make myself, get back up on my feet\r\n\r\n每当我重新审视自己，恢复自我时\r\n\r\nAll I ever think about is this, all the tiring time between\r\n\r\n我能想到的都是 那些令人厌烦的时光\r\n\r\nAnd how, trying to put my trust in you, just takes so much out of me\r\n\r\n如何把我的信任交付于你  而我又不需要付出太多的代价\r\n\r\nTake everything from the inside\r\n\r\n我拿出内心所有事\r\n\r\nAnd throw it all away\r\n\r\n对你毫无保留\r\n\r\n\'Cause I swear, for the last time\r\n\r\n因为我发誓，这是最后一次\r\n\r\nI won\'t trust myself with you\r\n\r\n再也不会任自己掉进你的谎言\r\n\r\n \r\n\r\nI won\'t waste myself on you\r\n\r\n我！不！会！再！把！我！的！时！间！浪！费！在！你！的！身！上！\r\n\r\n \r\n\r\nYou\r\n\r\n你！\r\n\r\nYou\r\n\r\n你！\r\n\r\n \r\n\r\nWaste myself on you\r\n\r\n不会和你一起虚度时光！\r\n\r\n \r\n\r\nYou\r\n\r\n你！\r\n\r\n \r\n\r\nYou\r\n\r\n你！\r\n\r\n \r\n\r\nI take everything from the inside\r\n\r\n我将……拿出内心所有事\r\n\r\nAnd throw it all away\r\n\r\n对你毫无保留\r\n\r\n\'Cause I swear, for the last time\r\n\r\n因为我发誓，这是最后一次\r\n\r\nI won\'t trust myself with you\r\n\r\n再也不会任自己掉进你的谎言\r\n\r\n \r\n\r\nEverything from the inside\r\n\r\n深埋在内心的所有回忆\r\n\r\nAnd just throw it all away\r\n\r\n统统把他们扔掉\r\n\r\n\'Cause I swear, for the last time\r\n\r\n因为我发誓，这是最后一次\r\n\r\nI won\'t trust myself with you\r\n\r\n再也不会任自己掉进你的谎言\r\n\r\n \r\n\r\nYou\r\n\r\n你的谎言！\r\n\r\nYou\r\n\r\n你的谎言！','/song/1684856120025Linkin Park - From The Inside (Live) - live.mp3'),(20,18,'Linkin Park-By Myself','Hybrid Theory',NULL,NULL,'/img/songPic/1684856205600lp2.png','What do I do to ignore them behind me\r\n\r\n为了忽视身后的声音我该如何做？\r\n\r\nDo I follow my instincts blindly\r\n\r\n是要盲目的遵从直觉吗？\r\n\r\nDo I hide my pride from these bad dreams\r\n\r\n还是将骄傲隐藏在那些噩梦之中？\r\n\r\nAnd give in to sad thoughts that are maddening\r\n\r\n然后向令人发怒的哀伤想法妥协？\r\n\r\nDo I sit here and try to stand it\r\n\r\n我要处于这环境中尝试忍受？（这句话运用双关）\r\n\r\nOr do I try to catch them red-handed\r\n\r\n还是立即抓住那些不安想法？\r\n\r\nDo I trust some and get fooled by phoniness\r\n\r\n我要相信一些然后被虚伪愚弄？\r\n\r\nOr do I trust nobody and live in loneliness\r\n\r\n还是谁也不相信与孤独做同伴？\r\n\r\nBecause I can\'t hold on when I\'m stretched so thin\r\n\r\n当我紧绷之时我承受不住\r\n\r\nI make the right moves but I\'m lost within\r\n\r\n即使我做了正确的行动但我仍迷失自己\r\n\r\nI put on my daily facade but then\r\n\r\n我每天就像披戴假面一般，可然后\r\n\r\nI just end up getting hurt again\r\n\r\n我只是草草结束然后再次受伤\r\n\r\nBy myself （myself）\r\n\r\n独自一人（独自！）\r\n\r\nI ask why but in my mind I find\r\n\r\n我询问着原因但我在脑海中发现\r\n\r\nI can\'t rely on myself （myself）\r\n\r\n我无法依靠自己（自己！）\r\n\r\nI ask why but in my mind I find\r\n\r\n我询问原因但在脑海中我发现\r\n\r\nI can\'t rely on myself\r\n\r\n我无法依靠自己\r\n\r\nI can\'t hold on\r\n\r\n当我神经紧绷时\r\n\r\nTo what I want when I\'m stretched so thin\r\n\r\n（我坚持不住对欲望的追求！）\r\n\r\nIt\'s all too much to take in\r\n\r\n我要承受的东西太多了\r\n\r\nI can\'t hold on\r\n\r\n我坚持不住所有事情\r\n\r\nTo anything watching everything spin\r\n\r\n（我注视着一切不停的自旋！）\r\n\r\nWith thoughts of failure sinking in\r\n\r\n随着失败的想法被我领悟\r\n\r\nIf I Turn my back I\'m defenseless\r\n\r\n如果我背对世界我就十分脆弱\r\n\r\nAnd to go blindly seems senseless\r\n\r\n如果盲目的前行看上去毫无意义\r\n\r\nIf I hide my pride and let it all go on then they\'ll\r\n\r\n如果我隐藏起我的自傲然后让一切继续\r\n\r\nTake from me till everything is gone\r\n\r\n它们会摄取我自身直到一切消逝\r\n\r\nIf I let them go I\'ll be outdone\r\n\r\n如果我放手释怀有些过犹不及\r\n\r\nBut if I try to catch them I\'ll be outrun\r\n\r\n如果我尝试抓住它们我就会逃避\r\n\r\nIf I\'m killed by the questions like a cancer\r\n\r\n如果我像患癌症一样被问题击毙\r\n\r\nThen I\'ll be buried in the silence of the answer\r\n\r\n然后我就会被答案的寂静埋葬\r\n\r\nBy myself （myself）\r\n\r\n孤身一人！\r\n\r\nI ask why but in my mind I find\r\n\r\n究竟为什么，但在我的想法里我发现\r\n\r\nI can\'t rely on myself （myself）\r\n\r\n我无法依靠自己\r\n\r\nI ask why but in my mind I find\r\n\r\n究竟为什么，我发现\r\n\r\nI can\'t rely on myself\r\n\r\n我依靠不了自己\r\n\r\nI can\'t hold on\r\n\r\n我坚持不住了\r\n\r\nTo what I want when I\'m stretched so thin\r\n\r\n对于我的希望来讲我过于紧绷！\r\n\r\nIt\'s all too much to take in\r\n\r\n我要承受的东西太多了！\r\n\r\nI can\'t hold on\r\n\r\n我受不了\r\n\r\nTo anything watching everything spin\r\n\r\n对于任何事情来讲我注视任何事情的旋转\r\n\r\nWith thoughts of failure sinking in\r\n\r\n我沉溺在失败的想法中\r\n\r\nHow do you think I\'ve lost so much\r\n\r\n你怎么认定我失去的多少\r\n\r\nI\'m so afraid I\'m out of touch\r\n\r\n我太恐惧于和外界失联\r\n\r\nHow do you expect I will know what to do\r\n\r\n你怎么认定我下一步棋的走向\r\n\r\nWhen all I know is what you tell me to\r\n\r\n我知道的一切是你告诉我的\r\n\r\nDon\'t you know\r\n\r\n你不知道吗！\r\n\r\nI can\'t tell you how to make it go\r\n\r\n我没法告诉你它怎么离开\r\n\r\nNo matter what I do how hard I try\r\n\r\n不管我做了什么，我怎么努力\r\n\r\nI can\'t seem to convince myself why\r\n\r\n我似乎都无法说服自己\r\n\r\nI\'m stuck on the outside\r\n\r\n为何我死死被排除在外\r\n\r\nDon\'t you know\r\n\r\n你不知道吗！\r\n\r\nI can\'t tell you how to make it go\r\n\r\n我没法告诉你它为什么消散\r\n\r\nNo matter what I do how hard I try\r\n\r\n不管我做了什么，我怎么努力\r\n\r\nI can\'t seem to convince myself why\r\n\r\n我似乎都无法说服自己\r\n\r\nI\'m stuck on the outside\r\n\r\n为何我死死被排除在外\r\n\r\nI can\'t hold on\r\n\r\n当我向自己施压时\r\n\r\nTo what I want when I\'m stretched so thin\r\n\r\n对于我的希冀我坚持不下去\r\n\r\nIt\'s all too much to take in\r\n\r\n我承受的东西太多了\r\n\r\nI can\'t hold on\r\n\r\n我坚持不住任何事！\r\n\r\nTo anything watching everything spin\r\n\r\n注视着一切无休止的自旋\r\n\r\nWith thoughts of failure sinking in\r\n\r\n我沉溺在失败的想法之中\r\n\r\nI can\'t hold on\r\n\r\n当我向自己施压时\r\n\r\nTo what I want when I\'m stretched so thin\r\n\r\n对于我的希冀我坚持不下去\r\n\r\nIt\'s all too much to take in\r\n\r\n我承受的东西太多了\r\n\r\nI can\'t hold on\r\n\r\n当我向自己施压时\r\n\r\nTo anything watching everything spin\r\n\r\n对于自己的希冀我无法坚持\r\n\r\nWith thoughts of failure sinking in\r\n\r\n我沉溺在失败的想法之中','/song/1684856200751By Myself (Live) - live - Linkin Park.mp3'),(21,19,'The Treorchy Male Voice Choir-Do You Hear the People Sing?','Do You Hear the People Sing?',NULL,NULL,'/img/songPic/1684856393166dyhlps.png','Do you hear the people sing?\r\nSinging the song of angry men?\r\nIt is the music of the people\r\nWho will not be slaves again!\r\nWhen the beating of your heart\r\nEchoes the beating of the drums\r\nThere is a life about to start\r\nWhen tomorrow comes!\r\nWill you join in our crusade?\r\nWho will be strong and stand with me?\r\nBeyond the barricade\r\nIs there a world you long to see?\r\nThen join in the fight\r\nThat will give you the right to be free!\r\nDo you hear the people sing?\r\nSinging the song of angry men?\r\nIt is the music of the people\r\nWho will not be slaves again!\r\nWhen the beating of your heart\r\nEchoes the beating of the drums\r\nThere is a life about to start\r\nWhen tomorrow comes!\r\nWill you give all you can give\r\nSo that our banner may advance?\r\nSome will fall and some will live\r\nWill you stand up and take your chance?\r\nThe blood of the martyrs\r\nWill water the meadows of France!\r\nDo you hear the people sing?\r\nSinging the song of angry men?\r\nIt is the music of the people\r\nWho will not be slaves again!\r\nWhen the beating of your heart\r\nEchoes the beating of the drums\r\nThere is a life about to start\r\nWhen tomorrow comes','/song/1684856390451Ameritz Digital Karaoke - Do You Hear the People Sing (In the Style of Les Miserables) ［Karaoke Version］.mp3'),(22,19,'The Treorchy Male Voice Choir-Do You Hear the People Sing?','Do You Hear the People Sing?',NULL,NULL,'/img/songPic/1684856430586d2.png','Do you hear the people sing?\r\nSinging the song of angry men?\r\nIt is the music of the people\r\nWho will not be slaves again!\r\nWhen the beating of your heart\r\nEchoes the beating of the drums\r\nThere is a life about to start\r\nWhen tomorrow comes!\r\nWill you join in our crusade?\r\nWho will be strong and stand with me?\r\nBeyond the barricade\r\nIs there a world you long to see?\r\nThen join in the fight\r\nThat will give you the right to be free!\r\nDo you hear the people sing?\r\nSinging the song of angry men?\r\nIt is the music of the people\r\nWho will not be slaves again!\r\nWhen the beating of your heart\r\nEchoes the beating of the drums\r\nThere is a life about to start\r\nWhen tomorrow comes!\r\nWill you give all you can give\r\nSo that our banner may advance?\r\nSome will fall and some will live\r\nWill you stand up and take your chance?\r\nThe blood of the martyrs\r\nWill water the meadows of France!\r\nDo you hear the people sing?\r\nSinging the song of angry men?\r\nIt is the music of the people\r\nWho will not be slaves again!\r\nWhen the beating of your heart\r\nEchoes the beating of the drums\r\nThere is a life about to start\r\nWhen tomorrow comes','/song/1684856425895The Treorchy Male Voice Choir - Do You Hear the People Sing.mp3'),(23,20,'A路人-如何让白鼠爱上学习','热门华语260',NULL,NULL,'/img/songPic/1684856551560r.png','Hi you guys!\r\n\r\n大家好\r\n\r\nI\'m a fu*king African\r\n\r\n我是他喵的非洲人，\r\n\r\nMichael Jack\r\n\r\n卖扣姐，\r\n\r\nand today,it a story of how to do to the gaoji\r\n\r\n这节课我们来讲讲如何\r\n\r\nit\'s a story of how to set your body free\r\n\r\n讲讲如何释放你的\r\n\r\nmake you fall in love in day one,two,three!\r\n\r\n一二三天内让爱淹没你，\r\n\r\nYo it\'s a grade-one rule goes primary\r\n\r\n刚到一年级有一个惯例，\r\n\r\nBig crowds heard with your memory\r\n\r\n要给大家讲讲你的故事，\r\n\r\nSo here I here I go,go,go\r\n\r\n所以我就冲冲冲上去讲，\r\n\r\nLearining\'s something you won\'t say\r\n\r\n既然学了也用不上，\r\n\r\nWhy not be a fu*king gay?\r\n\r\n当个，岂不美哉？\r\n\r\nFa Fa Fa Fa Fu*king gay\r\n\r\n当他喵喵喵喵个~，\r\n\r\nSo listen carefully\r\n\r\n所以你听仔细，\r\n\r\nI\'m being frankly\r\n\r\n我坦白跟你讲，\r\n\r\nCoz\' you are so ugly\r\n\r\n一切都因为你是个丑，\r\n\r\nand it\'s a tragedy (QAQ)\r\n\r\n哦简直就是个悲剧QAQ，\r\n\r\nduang!\r\n\r\n- ( ゜- ゜)つロ\r\n\r\noh oh tragedy,tragedy(QAQ)\r\n\r\n哦哦简直就是个放满悲剧的茶几\r\n\r\nso come and ask me why you are so ugly\r\n\r\n然后你现在又来问我你为什么是个丑，\r\n\r\nand we come over with something critical\r\n\r\n这时候我们就能发现一些神奇的东西，\r\n\r\nlesson one you gotta be someone beautiful\r\n\r\n颜值是一切的前提，\r\n\r\nfulfill your heart with love so colourful\r\n\r\n让你的生活充满爱的色彩，\r\n\r\nbut you\'re so ugly and I\'m not helpful\r\n\r\n然而你是个丑and我无能为力，\r\n\r\nand everyone of you want some real effect\r\n\r\n所有人都想跟我要效果，\r\n\r\nI say cut it off,cut it off,throw your books and cut it off\r\n\r\n我说省省吧省省吧~让你的书都随风而逝吧，\r\n\r\nso stop being shy and you still ask me why\r\n\r\n如果你还是厚着脸皮问我到底怎么办，\r\n\r\njust ready to gaoji and you will start to fly\r\n\r\n只要就能让你飞起！\r\n\r\nGaoji needs your pratice,yoooo,and your feeling\r\n\r\n需要感悟，哟，需要练习\r\n\r\njust find a sacred place and you will know the Bilibili\r\n\r\n只要找到我们的圣地没错就是哔哩哔哩\r\n\r\nwatch it search it love it get it and do not forget it\r\n\r\n搜完看完玩完你就会永远忘不掉，\r\n\r\nand that\'s the only way you will gonna make it\r\n\r\n这就是你唯一需要做的努力，\r\n\r\nBilibili inserted 4 SB(s)\r\n\r\n哔哩哔哩内置了四个大ShuaiBi\r\n\r\nmake herrington yell with 1080 HD\r\n\r\n让你超清观看王の奥义，\r\n\r\nInterest is your key\r\n\r\n兴趣就是钥匙，\r\n\r\nset your motion free\r\n\r\n释放你的意识\r\n\r\nand gaoji is a miracle so you will believe\r\n\r\n你就会拜服于的神迹，\r\n\r\nYo one night I find my machine sabotaged\r\n\r\n一天晚上我发现我的电脑受到了攻击，\r\n\r\nHere we have a great movie,halt,enlarge and enlarge\r\n\r\n就这样把这部电影放大再放大，\r\n\r\nEverything clarified with bright and dark dark\r\n\r\n一切都会看的分！毫！不！差！\r\n\r\nEveryone shouted with caoniba ba\r\n\r\nAnd why\'s there\'re so many years and we don\'t have it?\r\n\r\n那为什么这么多年我们还没有普及这个黑科技？\r\n\r\nCoz\' Gaoji needs an accumlation\r\n\r\n因为需要积累，\r\n\r\nGaoji needs your meditation\r\n\r\n需要冥思，\r\n\r\nHey man show me the money\r\n\r\n嘿兄弟交出你的软妹币！\r\n\r\nHey man bring your 450(放肆！)\r\n\r\n一人只要450ˊ_>ˋ，\r\n\r\nChinese parents and we don\'t understand\r\n\r\n中国的家长啊真是千篇一律，\r\n\r\nThey say read it,read it\r\n\r\n他们总说读书去！读书去！\r\n\r\nor you will not beat it\r\n\r\n要不然你就被人轻易击垮了，\r\n\r\nyou ruined your future and you don\'t know how meet it\r\n\r\n就这么抹掉了你的未来感受迷失理想的痛苦，\r\n\r\nbut that\'s the way and we know how to treat it\r\n\r\n但这原本应该是我们自己去选择的道路，\r\n\r\nThey say 74 is unreasonable!\r\n\r\n他们总说啊74分就不可原谅，\r\n\r\ncoz\' Chinese kids are so remarkable!\r\n\r\n其实中国的孩子都十分卓越，\r\n\r\nlearning everything which is unreliable!\r\n\r\n无论什么掉东西都要学，\r\n\r\nmasturbated 12 years oh unbelievable!\r\n\r\n就这么了十二年简直就是奇迹！\r\n\r\nYou guys need the avocation and the motivation\r\n\r\n兄弟们其实需要真正的爱好与干劲，\r\n\r\nYou guys must get stronger to prevent the ejaculation\r\n\r\n兄弟们需要强健身体防止提前社经，。\r\n\r\nYou guys need some shitty stuff to get the inspiration\r\n\r\n兄弟们也需要一些鼓舞来振奋起来，\r\n\r\nIt\'s a new word called Gaojilation\r\n\r\n这一切的来源就是“力”，\r\n\r\nAnd I open Bilibili\r\n\r\n我打开哔哩哔哩，\r\n\r\ncheck it check it finding\r\n\r\n查看查看搜索\r\n\r\nand I found,Aluren,messing with billy\r\n\r\n我一搜，A路人，正在搞比利，\r\n\r\nAmong the crowd\r\n\r\n人群当中，\r\n\r\nwhy my hair looks Fu*king green!\r\n\r\n我的头发为什么是绿的呢！！！\r\n\r\nLuren loves me so much and I must do Gaoji !\r\n\r\n路人这么爱我我一定要努力，\r\n\r\nPass along the love and bring your buddy home\r\n\r\n过段时间就可以把基友带回家，。\r\n\r\nand you won\'t say no,you won\'t feel alone\r\n\r\n无法抗拒的幸福将过去的孤独代替，\r\n\r\nAnd you had made your mind and set your body free\r\n\r\n就这样升华了你的与意识，\r\n\r\nand you know how to love with suck a Goubi !\r\n\r\n然后你就知道了如何爱上一个！','/song/1684856538879如何让白鼠爱上学习 - 英语RAP - A路人.mp3'),(24,18,'Linkin Park-burm it down','Living Things',NULL,NULL,'/img/songPic/1685926957255living life.png','The cycle repeated\r\n\r\n命运证明它重复着\r\n\r\nAs explosions broke in the sky\r\n\r\n当爆炸在天空出现时\r\n\r\nAll that I needed\r\n\r\n我所需要的\r\n\r\nWas the one thing I couldn\'t find\r\n\r\n是我在这个世界找不到的\r\n\r\n \r\n\r\nAnd you were there at the turn\r\n\r\n而你站在那儿\r\n\r\nWaiting to let me know\r\n\r\n等着要让我明白这一切：\r\n\r\n \r\n\r\nWe\'re building it up\r\n\r\n我们建立起世界\r\n\r\nTo break it back down\r\n\r\n再将它彻底摧毁\r\n\r\nWe\'re building it up\r\n\r\n我们建立起世界\r\n\r\nTo burn it down\r\n\r\n再把它化作火光，燃烧殆尽\r\n\r\nWe can\'t wait\r\n\r\n似乎迫不及待般地\r\n\r\nTo burn it to the ground\r\n\r\n要将它烧毁化为尘土\r\n\r\n \r\n\r\nThe colors conflicted\r\n\r\n鲜血，白骨，灰尘，火光，交错堆叠\r\n\r\nAs the flames climbed into the clouds\r\n\r\n随着升腾的烈焰攀入云端\r\n\r\nI wanted to fix this\r\n\r\n我想修理弥补这一切\r\n\r\nBut couldn\'t stop from tearing it down\r\n\r\n但无法停止将它撕裂破坏\r\n\r\n \r\n\r\nAnd you were there at the turn\r\n\r\n而你站在那儿\r\n\r\nCaught in the burning glow\r\n\r\n站在那燃烧的火光之中\r\n\r\nAnd I was there at the turn\r\n\r\n而我在那里等候\r\n\r\nWaiting to let you know\r\n\r\n等着要让你明白：\r\n\r\n \r\n\r\nWe\'re building it up\r\n\r\n我们建立起世界\r\n\r\nTo break it back down\r\n\r\n再亲手将它摧毁\r\n\r\nWe\'re building it up\r\n\r\n我们建立起这一切\r\n\r\nTo burn it down\r\n\r\n再将它燃烧殆尽\r\n\r\nWe can\'t wait\r\n\r\n似乎迫不及待般地\r\n\r\nTo burn it to the ground\r\n\r\n要将它烧毁化为尘土\r\n\r\n \r\n\r\nYou told me yes, you held me high\r\n\r\n你给我肯定的答案  你高高将我举起\r\n\r\nAnd I believed when you told that lie\r\n\r\n我也会去相信你所说的谎言\r\n\r\nI played soldier, you played king\r\n\r\n我当士兵   你做国王\r\n\r\nAnd struck me down when I kissed that ring\r\n\r\n在我低头亲吻你的戒指时趁我不备捅我一刀\r\n\r\nYou lost that right, to hold that crown\r\n\r\n你无权再拥有那王冠\r\n\r\nI built you up but you let me down\r\n\r\n我协助你登上高峰 但你却让我失望\r\n\r\nSo when you fall, I\'ll take my turn\r\n\r\n在你马失前蹄时我就会采取行动\r\n\r\nAnd fan the flames and your blazes burn\r\n\r\n在你被焚烧之时扇一把风\r\n\r\nAnd you were there at the turn\r\n\r\n而你就在那儿\r\n\r\nAnd you were there at the turn\r\n\r\n而你就在那儿\r\n\r\nWaiting to let me know\r\n\r\n等着和我摊牌说\r\n\r\n \r\n\r\nWe\'re building it up\r\n\r\n我们建立起这一切\r\n\r\nTo break it back down\r\n\r\n只是为了要将它彻底摧毁\r\n\r\nWe\'re building it up\r\n\r\n我们建立起这一切\r\n\r\nTo burn it down\r\n\r\n只是为了要将它燃烧殆尽\r\n\r\nWe can\'t wait\r\n\r\n我们迫不及待地\r\n\r\nTo burn it to the ground\r\n\r\n要将它烧毁化为尘土\r\n\r\n \r\n\r\nWhen you fall, I\'ll take my turn\r\n\r\n所以当你失蹄时 我将伺机而动\r\n\r\nAnd fan the flames and your blazes burn\r\n\r\n而当你惹火上身时 我会扇风助燃\r\n\r\n \r\n\r\nWe can\'t wait\r\n\r\n我们迫不及待地\r\n\r\nTo burn it to the ground\r\n\r\n要将你烧化为尘土\r\n\r\n \r\n\r\nWhen you fall, I\'ll take my turn\r\n\r\n所以当你失蹄时 我将采取行动\r\n\r\nAnd fan the flames and your blazes burn\r\n\r\n而当你惹火上身时 我会扇风助燃\r\n\r\n \r\n\r\nWe can\'t wait\r\n\r\n我们迫不及待地\r\n\r\nTo burn it to the ground\r\n\r\n要将罪恶的当权者化为尘土','/song/1685926902622The Higher Concept Linkin Park - Burn It Down.flac');
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_list`
--

DROP TABLE IF EXISTS `song_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `introduction` text,
  `style` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='歌单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_list`
--

LOCK TABLES `song_list` WRITE;
/*!40000 ALTER TABLE `song_list` DISABLE KEYS */;
INSERT INTO `song_list` VALUES (6,'Do You Hear the People Sing','/img/songListPic/1684856920599dyhlps.png','This is not just a song, this is an ANTHEM! DID YOU KNOW that the June Rebellion took place between June 5-6 in 1832? And to celebrate its anniversary, this week on Screen Bites it is going to be full of \'\'music of a people who will not be slaves again!\'\'  Les Misérables (2012) SYNOPSIS: After 19 years as a prisoner, Jean Valjean (Hugh Jackman) is freed by Javert (Russell Crowe), the officer in charge of the prison workforce. Valjean promptly breaks parole but later uses money from stolen silver to reinvent himself as a mayor and factory owner. Javert vows to bring Valjean back to prison. Eight years later, Valjean becomes the guardian of a child named Cosette after her mother\'s (Anne Hathaway) death, but Javert\'s relentless pursuit means that peace will be a long time coming.','欧美'),(7,'香港经典之声','/img/songListPic/1684857022597hk.png','《香港经典之声》是一张精选的香港经典歌曲歌单，其中包含了许多标志性的粤语歌曲。这些歌曲承载着香港独特的音乐风格和文化内涵，让人回味无穷。无论是怀旧的老歌还是现代的流行曲，这个歌单将带你走进香港音乐的世界，感受其中的情感和回忆。','粤语'),(8,'Linkin Park精选集','/img/songListPic/1684857199449lp5.png','《Linkin Park Greatest Hits》是一张收录了Linkin Park乐队的经典歌曲的专辑。Linkin Park是一支知名的摇滚乐队，他们的音乐融合了硬摇滚、另类金属和电子音乐元素，以独特的声音和深情的歌词而著名。这个歌单中的歌曲展现了Linkin Park的独特风格和强烈的情感表达。','欧美'),(9,'μ\'s精选集','/img/songListPic/1684857202365love live.png','《Love Live! School Idol Project》是一张收录了μ\'s的歌曲的专辑。μ\'s是一个由九位声优组成的虚拟偶像团体，他们在动画《Love Live! School Idol Project》中扮演学园偶像的角色。这个歌单中的歌曲充满了活力和青春，展现了偶像们的努力和梦想追求。','日韩'),(10,'电音精选集','/img/songListPic/1684920230941unity.png','喜欢电音请进','轻音乐'),(11,'11111',NULL,'','');
/*!40000 ALTER TABLE `song_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_support`
--

DROP TABLE IF EXISTS `user_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_support` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_support`
--

LOCK TABLES `user_support` WRITE;
/*!40000 ALTER TABLE `user_support` DISABLE KEYS */;
INSERT INTO `user_support` VALUES (30,12,10),(31,11,7),(35,11,10),(36,13,10),(37,11,24),(38,15,29),(39,17,7),(40,18,34),(41,18,7);
/*!40000 ALTER TABLE `user_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'music'
--

--
-- Dumping routines for database 'music'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-18 11:33:58
