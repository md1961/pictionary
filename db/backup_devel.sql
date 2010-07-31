-- MySQL dump 10.11
--
-- Host: localhost    Database: pictionary_development
-- ------------------------------------------------------
-- Server version	5.0.45-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `abbr` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `name_zen` varchar(255) default NULL,
  `phonetic` varchar(255) default NULL,
  `color` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'P','Person/Place/Animal','人物/場所/動物','じんぶつ/ばしょ/どうぶつ','yellow'),(2,'O','Object','物体（もの）','ぶったい','cyan'),(3,'A','Action','動作（うごき）','どうさ','orange'),(4,'D','Difficult','難解（むずかしい）','なんかい','lime'),(5,'AP','All Play','全員問題','ぜんいんもんだい','red');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20100724131029'),('20100725004458');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `name_zen` varchar(255) default NULL,
  `phonetic` varchar(255) default NULL,
  `category_id` int(11) default NULL,
  `is_active` tinyint(1) NOT NULL default '1',
  `used` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'dog','犬','いぬ',1,1,0),(2,'remote controller','リモコン','りもこん',2,1,0),(3,'kiss','キスする','きすする',3,1,0),(4,'uninhabited island','無人島','むじんとう',4,1,0),(5,'mikan','みかん','みかん',5,1,0),(6,'cat','猫','ねこ',1,1,0),(7,'panda','パンダ','ぱんだ',1,1,0),(8,'Wii','Wii','うぃー',2,1,0),(9,'rice bowl','お茶碗','おちゃわん',2,1,0),(10,'book','本','ほん',2,1,0),(11,'carry','運ぶ','はこぶ',3,1,0),(12,'run','走る','はしる',3,1,0),(13,'walk','歩く','あるく',3,1,0),(14,'detective','探偵','たんてい',4,1,0),(15,'board game','ボードゲーム','ぼーどげーむ',4,1,0),(16,'practice','練習','れんしゅう',4,1,0),(17,'go','囲碁','いご',5,1,0),(18,'soccer','サッカー','さっかー',5,1,0),(19,'pokemon','ポケモン','ぽけもん',4,1,0),(20,'house','家','いえ',5,1,0),(21,'sengawa','仙川','せんがわ',4,1,0),(22,'Japan','日本','にほん',1,1,0),(23,'marathon','マラソン','まらそん',4,1,0),(24,'fireman','消防士','しょうぼうし',1,1,0),(25,'horse','馬','うま',1,1,0),(26,'zebra','シマウマ','しまうま',5,1,0),(27,'Nintendo DS','ニンテンドーDS','にんてんどーでぃーえす',5,1,0),(28,'DVD','DVD','でぃーぶいでぃー',2,1,0),(29,'climb','登る','のぼる',3,1,0),(30,'descend','下る','くだる',3,1,0),(31,'chair','椅子','いす',2,1,0),(32,'table','テーブル','てーぶる',2,1,0),(33,'police','警察','けいさつ',4,1,0),(34,'desk','机','つくえ',2,1,0),(35,'shogi','将棋','しょうぎ',5,1,0),(36,'hospital','病院','びょういん',1,1,0),(37,'Canada','カナダ','かなだ',1,1,0),(38,'throw','投げる','なげる',3,1,0),(39,'cry','泣く','なく',3,1,0),(40,'key','鍵','かぎ',5,1,0),(41,'the earth','地球','ちきゅう',1,1,0),(42,'turtle','亀','かめ',5,1,0),(43,'lion','ライオン','らいおん',1,1,0),(44,'cheetah','チーター','ちーたー',4,1,0),(45,'wall','壁','かべ',2,1,0),(46,'king','王様','おうさま',1,1,0),(47,'queen','女王','じょおう',1,1,0),(48,'tree','木','き',2,1,0),(49,'washbowl','洗面器','せんめんき',2,1,0),(50,'washroom','トイレ','といれ',5,1,0),(51,'lie','寝る','ねる',3,1,0),(52,'sleep','眠る','ねむる',4,1,0),(53,'fly','飛ぶ','とぶ',3,1,0),(54,'listen','聞く','きく',3,1,0),(55,'talk','しゃべる','しゃべる',3,1,0),(56,'shovel','シャベル','しゃべる',2,1,0),(57,'bucket','バケツ','ばけつ',5,1,0),(58,'color','色','いろ',4,1,0),(59,'calendar','カレンダー','かれんだー',2,1,0),(60,'garbage','ごみ','ごみ',4,1,0),(61,'paper','紙','かみ',5,1,0),(62,'church','教会','きょうかい',1,1,0),(63,'pizza','ピザ','ぴざ',2,1,0),(64,'rice','米','こめ',5,1,0),(65,'animal','動物','どうぶつ',4,1,0),(66,'signal','信号','しんごう',2,1,0),(67,'dance','踊る','おどる',3,1,0),(68,'tenniz','テニス','てにす',5,1,0),(69,'ship','船','ふね',5,1,0),(70,'pistol','ピストル','ぴすとる',5,1,0),(71,'offense','攻撃','こうげき',4,1,0),(72,'defense','守備','しゅび',4,1,0),(73,'swim','泳ぐ','およぐ',3,1,0),(74,'look','見る','みる',3,1,0),(75,'pilot','パイロット','ぱいろっと',1,1,0),(76,'water','水','みず',2,1,0),(77,'television','テレビ','てれび',5,1,0),(78,'railroad station','駅','えき',1,1,0),(79,'Shuhei','秀平','しゅうへい',4,1,0),(80,'the rest','余り','あまり',4,1,0),(81,'hit','打つ','うつ',3,1,0),(82,'open','開く','ひらく',3,1,0),(83,'close','閉める','しめる',3,1,0),(84,'picture','写真','しゃしん',2,1,0),(85,'video','ビデオ','びでお',4,1,0),(86,'comics','漫画','まんが',5,1,0),(87,'potato','じゃがいも','じゃがいも',2,1,0),(88,'forest','森','もり',1,1,0),(89,'department store','デパート','でぱーと',4,1,0),(90,'glasses','眼鏡','めがね',2,1,0),(91,'fish','魚','さかな',5,1,0),(92,'curry and rice','カレーライス','かれーらいす',2,1,0),(93,'lake','湖','みずうみ',1,1,0),(94,'camel','らくだ','らくだ',5,1,0),(95,'tissues','ティッシュ','てぃっしゅ',2,1,0),(96,'giraffe','きりん','きりん',1,1,0),(97,'Kintaro','金太郎','きんたろう',1,1,0),(98,'chase','追いかける','おいかける',3,1,0),(99,'history','歴史','れきし',4,1,0),(100,'garlic','にんにく','にんにく',4,1,0);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-07-31  0:26:31
