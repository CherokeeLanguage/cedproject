

-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: testDatabase
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (8,0,'test','test');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `announcements` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `announcement` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (1,18,'<h3>Holiday Words</h3> \r\nᎤᎵᎮᎵᏍᏗ ᏗᎦᎸᏉᏗ ᎢᎦ -- Happy Holidays<br/>\r\nᏓᏂᏍᏓᏲᎯᎲᎢ -- Christmas<br/>\r\n ᏧᏂᏍᏓᏲᏟᏕᎾ ᏒᎯᏰᏱ -- Christmas Eve<br/>\r\nᎤᎵᎮᎵᏍᏗ ᏓᏂᏍᏓᏲᎯᎲ -- Merry Christmas<br/>\r\nᎢᏤ ᎠᏕᏘᏱᏍᎬ -- New Year<br/>',_binary '','Holiday Words'),(2,10,'<div style=\"width:100%; background-color:red;color:white;padding: 5px 5px 5px 5px\">See additional announcements <a href=\"/announcementsPage\">here</a></div>',_binary '\0','alert'),(3,0,'ᏧᎾᏓᎸᏉᏗ ᎢᎦ - Valentine\'s Day',_binary '\0','Valentines Day'),(4,7,'<h3>Easter/Spring Words</h3>\r\nᎧᏬᏂ - April<br/>\r\nᏥᏌ ᏚᎴᎯᏌᏅ - Easter (O)<br/>\r\nᏧᏪᏥ ᏓᏂᏑᏫᏍᎬᎢ - Easter (G)<br/>\r\nᎧᏃᎯᏰᏍᎩ ᎢᎦ - Good Friday<br/>\r\nᏥᏍᏚ - Rabbit<br/>\r\nᏧᏪᏥ - eggs<br/>\r\nᎧᏬᏂ ᎤᏁᎫ ᎢᎦ - April Fool\'s Day<br/><br/>',_binary '\0','Easter Words'),(5,3,'ᎠᎵᎮᎵᏍᏗ ᎢᎦ -- Thanksgiving Day<br/>\r\nᎬᎾ - Turkey<br/>\r\nᏎᎷ ᎦᏚ - Cornbread<br/>',_binary '\0','Thanksgiving');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,'numbers, cardinal'),(5,0,'numbers, ordinal'),(6,0,'States'),(7,0,'Plants'),(8,0,'Water Animals'),(9,0,'Reptiles'),(10,0,'Birds'),(11,0,'Trees'),(12,0,'Clouds'),(13,0,'Bugs'),(14,0,'Weather');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corpus_source`
--

DROP TABLE IF EXISTS `corpus_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `corpus_source` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `source_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corpus_source`
--

LOCK TABLES `corpus_source` WRITE;
/*!40000 ALTER TABLE `corpus_source` DISABLE KEYS */;
INSERT INTO `corpus_source` VALUES (45,1,'Charlottes Web'),(46,0,'chunestudy'),(47,0,'Horse Story'),(48,1,'CNT'),(49,0,'Chapel Hill'),(50,0,'Seqyoah Cabin'),(51,0,'The Beast'),(52,0,'Wolf Wears Shoes'),(53,0,'A Walk In The Woods'),(54,0,'Gardening'),(55,0,'Littlefish'),(56,0,'Very Windy Day'),(57,0,'Apple Tree'),(58,0,'Buddy Blue Bird'),(59,0,'Sequoyah'),(60,0,'Spearfinger'),(61,0,'Cherokee Phoenix'),(62,0,'Memorial For Cherokee Alignment');
/*!40000 ALTER TABLE `corpus_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `vsecondimpertone` varchar(255) DEFAULT NULL,
  `definitionlarge` varchar(255) DEFAULT NULL,
  `modified` datetime NOT NULL,
  `definitiond` varchar(255) DEFAULT NULL,
  `entrytone` varchar(255) DEFAULT NULL,
  `vthirdprestone` varchar(255) DEFAULT NULL,
  `vthirdprestranslit` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `nounadjpluraltone` varchar(255) DEFAULT NULL,
  `crossreferencet` varchar(255) DEFAULT NULL,
  `vsecondimperm` varchar(255) DEFAULT NULL,
  `sentenceq` varchar(255) DEFAULT NULL,
  `partofspeechc` varchar(255) DEFAULT NULL,
  `vfirstprestone` varchar(255) DEFAULT NULL,
  `vthirdinfsyllp` varchar(255) DEFAULT NULL,
  `vthirdinfo` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `sentenceenglishs` varchar(255) DEFAULT NULL,
  `admin_id` bigint NOT NULL,
  `entrytranslit` varchar(255) DEFAULT NULL,
  `vthirdinftranslit` varchar(255) DEFAULT NULL,
  `vthirdpasti` varchar(255) DEFAULT NULL,
  `nounadjpluraltranslit` varchar(255) DEFAULT NULL,
  `vthirdpressylll` varchar(255) DEFAULT NULL,
  `vthirdpasttone` varchar(255) DEFAULT NULL,
  `vsecondimpertranslit` varchar(255) DEFAULT NULL,
  `vfirstpresg` varchar(255) DEFAULT NULL,
  `vfirstpresh` varchar(255) DEFAULT NULL,
  `vthirdpastsyllj` varchar(255) DEFAULT NULL,
  `sentencesyllr` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `vthirdpasttranslit` varchar(255) DEFAULT NULL,
  `sentencetranslit` varchar(255) DEFAULT NULL,
  `nounadjpluralsyllf` varchar(255) DEFAULT NULL,
  `nounadjplurale` varchar(255) DEFAULT NULL,
  `entrya` varchar(255) DEFAULT NULL,
  `vthirdinftone` varchar(255) DEFAULT NULL,
  `vsecondimpersylln` varchar(255) DEFAULT NULL,
  `syllabaryb` varchar(255) DEFAULT NULL,
  `etymology` varchar(255) DEFAULT NULL,
  `vfirstprestranslit` varchar(255) DEFAULT NULL,
  `vthirdpresk` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpnnw5hqnqb0aloxnrjpahprju` (`admin_id`),
  CONSTRAINT `FKpnnw5hqnqb0aloxnrjpahprju` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=593 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likespreadsheets`
--

DROP TABLE IF EXISTS `likespreadsheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `likespreadsheets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `crossreferencet` varchar(255) DEFAULT NULL,
  `definitiond` varchar(255) NOT NULL,
  `entrya` varchar(255) NOT NULL,
  `nounadjplurale` varchar(255) DEFAULT NULL,
  `nounadjpluralsyllf` varchar(255) DEFAULT NULL,
  `partofspeechc` varchar(255) DEFAULT NULL,
  `sentenceenglishs` varchar(255) DEFAULT NULL,
  `sentenceq` varchar(255) DEFAULT NULL,
  `sentencesyllr` varchar(255) DEFAULT NULL,
  `syllabaryb` varchar(255) DEFAULT NULL,
  `vfirstpresg` varchar(255) DEFAULT NULL,
  `vfirstpresh` varchar(255) DEFAULT NULL,
  `vsecondimperm` text,
  `vsecondimpersylln` varchar(255) DEFAULT NULL,
  `vthirdinfo` text,
  `vthirdinfsyllp` varchar(255) DEFAULT NULL,
  `vthirdpasti` text,
  `vthirdpastsyllj` varchar(255) DEFAULT NULL,
  `vthirdpresk` text,
  `vthirdpressylll` varchar(255) DEFAULT NULL,
  `entrytranslit` varchar(255) DEFAULT NULL,
  `nounadjpluraltranslit` varchar(255) DEFAULT NULL,
  `sentencetranslit` varchar(255) DEFAULT NULL,
  `vfirstprestranslit` varchar(255) DEFAULT NULL,
  `vsecondimpertranslit` varchar(255) DEFAULT NULL,
  `vthirdinftranslit` varchar(255) DEFAULT NULL,
  `vthirdpasttranslit` varchar(255) DEFAULT NULL,
  `vthirdprestranslit` varchar(255) DEFAULT NULL,
  `entrytone` varchar(255) DEFAULT NULL,
  `nounadjpluraltone` varchar(255) DEFAULT NULL,
  `vfirstprestone` varchar(255) DEFAULT NULL,
  `vsecondimpertone` varchar(255) DEFAULT NULL,
  `vthirdinftone` varchar(255) DEFAULT NULL,
  `vthirdpasttone` varchar(255) DEFAULT NULL,
  `vthirdprestone` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `definitionlarge` text,
  `etymology` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `notes` text,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `crossrererencet` (`crossreferencet`),
  KEY `definitiond` (`definitiond`),
  KEY `entrya` (`entrya`),
  KEY `nounadjplurale` (`nounadjplurale`),
  KEY `nounadjpluralsyllf` (`nounadjpluralsyllf`),
  KEY `partofspeechc` (`partofspeechc`),
  KEY `syllabaryb` (`syllabaryb`),
  KEY `vfirstpresg` (`vfirstpresg`),
  KEY `vfirstpresh` (`vfirstpresh`),
  KEY `vsecondimpersylln` (`vsecondimpersylln`),
  KEY `vthirdinfsyllp` (`vthirdinfsyllp`),
  KEY `vthirdpastsyllj` (`vthirdpastsyllj`),
  KEY `vthirdpressylll` (`vthirdpressylll`),
  KEY `entrytranslit` (`entrytranslit`),
  KEY `nounadjpluraltranslit` (`nounadjpluraltranslit`),
  KEY `vfirstprestranslit` (`vfirstprestranslit`),
  KEY `vsecondimpertranslit` (`vsecondimpertranslit`),
  KEY `vthirdinftranslit` (`vthirdinftranslit`),
  KEY `vthirdpasttranslit` (`vthirdpasttranslit`),
  KEY `vthirdprestranslit` (`vthirdprestranslit`),
  KEY `entrytone` (`entrytone`),
  KEY `nounadjpluraltone` (`nounadjpluraltone`),
  KEY `vfirstprestone` (`vfirstprestone`),
  KEY `vsecondimpertone` (`vsecondimpertone`),
  KEY `vthirdinftone` (`vthirdinftone`),
  KEY `vthirdpasttone` (`vthirdpasttone`),
  KEY `vthirdprestone` (`vthirdprestone`),
  KEY `source` (`source`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB AUTO_INCREMENT=102403 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likespreadsheets`
--

LOCK TABLES `likespreadsheets` WRITE;
/*!40000 ALTER TABLE `likespreadsheets` DISABLE KEYS */;
INSERT INTO `likespreadsheets` VALUES (72181,1,'','third person animate (see Gram. II, A)','a-','','','n. pref.','','','','','','','','','','','','','','','','','','','','','','','a-','','','','','','','ced','','','','','2018-12-22 20:42:10'),(72190,1,'adadega (bounce)','he\'s bouncing it','adadinvdiha','','','vt','The ball player is <u>bouncing</u> the ball hard.','Na alasgalisgi sdayi <u>adadinvdiha</u> sgwahlesdi.','Ꮎ ᎠᎳᏍᎦᎵᏍᎩ ᏍᏓᏱ <u>ᎠᏓᏗᏅᏗᎭ</u> ᏍᏆᏞᏍᏗ.','ᎠᏓᏗᏅᏗᎭ','gadadinvdiha','ᎦᏓᏗᏅᏗᎭ','hadadinvda','ᎭᏓᏗᏅᏓ','udadinvdohdi','ᎤᏓᏗᏅᏙᏗ','udadinvtanvi','ᎤᏓᏗᏅᏔᏅᎢ','adadinvdisgoi','ᎠᏓᏗᏅᏗᏍᎪᎢ','adadinvdiha','','na alasgalisgi sdayi adadinvdiha squatlesdi','gadadinvdiha','hadadinvda','udadinvdodi','udadinvtanvi','adadinvdisgoi','a1da.2di23nv32di.2ha','','ga.2da.2di23nv32di.2ha','ha.2da.2di23nv1da','u2da.2di23nv32doh2di','u1da.2di23nv32ta.2nv23?i','a1da2di23nv32di2sgo3?i','ced','','','','','2018-12-22 20:42:11'),(72191,1,'adadlosdi, gadlohiha','he\'s putting on a belt','adadlohiha','','','vt','<u>She put on a</u> pretty <u>belt</u> when she went to town.','Uwoduhi adadlosdi <u>udadlohlvi</u> digaduhv uwena.','ᎤᏬᏚᎯ ᎠᏓᏠᏍᏗ <u>ᎤᏓᏠᏢᎢ</u> ᏗᎦᏚᎲ ᎤᏪᎾ.','ᎠᏓᏠᎯᎭ','gadadlohiha','ᎦᏓᏠᎯᎭ','hadadloga','ᎭᏓᏠᎦ','udadlosdi','ᎤᏓᏠᏍᏗ','udadlohlvi','ᎤᏓᏠᏢᎢ','adadlohihoi','ᎠᏓᏠᎯᎰᎢ','adatlohiha','','uwotuhi adatlosdi udatlotlvi digatuhv uwena','gadatlohiha','hadatloga','udatlosdi','udatlotlvi','adatlohihoi','a1da3dlo2hi.3ha','','ga.2da3dlo2hi.3ha','ha.2da1dlo23ga','u2da1dlo23sdi','u1da3dlo2hlv23i','a1da3dlo23hi2ho3?i','ced','','','','','2018-12-22 20:42:11'),(72195,4,'','1. tender  2. very young, new','adagei','anidagei','ᎠᏂᏓᎨᎢ','adj','She bought <u>tender</u> green beans at the store. <u>A very young</u> child drinks only milk.','<u>Anidage</u> tuya anije duhwasv didananvi. <u>Adage</u> ayohli unvdigwu iga aditasgoi.','<u>ᎠᏂᏓᎨ</u> ᏚᏯ ᎠᏂᏤ ᏚᏩᏒ ᏗᏓᎾᏅᎢ. <u>ᎠᏓᎨ</u> ᎠᏲᏟ ᎤᏅᏗᏊ ᎢᎦ ᎠᏗᏔᏍᎪᎢ.','ᎠᏓᎨᎢ','','','','','','','','','','','adagei','anidagei','anidage tuya anitse tuwasv didananvi adage ayotli unvdiquu iga aditasgoi','','','','','','a.3da.2ge4?i','a.2ni3da.2ge4?i','','','','','','ced','','','','','2018-12-22 20:42:12'),(72205,2,'','he\'s denying him, it','adahyiha','','','vt','When he was accused of stealing, <u>he denied it</u>. <u>I am denying him</u> because I don\'t know him.','Unosgisv aguistana, <u>udahyilvi</u>. <u>Jiyadayiha</u>, hlahehno yijiyoliga.','ᎤᏃᏍᎩᏒ ᎠᎫᎢᏍᏔᎾ, <u>ᎤᏓᏱᎸᎢ</u>. <u>ᏥᏯᏓᏱᎭ</u>, ᏝᎮᏃ ᏱᏥᏲᎵᎦ.','ᎠᏓᏱᎭ','jiyadayiha, gadayiha','ᏥᏯᏓᏱᎭ, ᎦᏓᏱᎭ','hiyadayiga, hadayhga','ᎯᏯᏓᏱᎦ, ᎭᏓᏴᎦ','udayhsdi','ᎤᏓᏴᏍᏗ','udahyilvi','ᎤᏓᏱᎸᎢ','adahyihoi','ᎠᏓᏱᎰᎢ','adayiha','','unosgisv aguistana, <u>udayilvi</u>. <u>tsiyadayiha</u>, tlaheno yitsiyoliga.','','','udayvsdi','udayilvi','adayihoi','a1da.2hyi.3ha','','ji2ya.2da.?2yi.3ha, ga.2da.?2yi.3ha','hi2ya.2da.2yi1ga, ha2dayh2ga','u2dayh2sdi','u1da.2hyi.2lv23?i','a1da.2hyi.2ho3?i','ced','','','','','2019-12-09 17:15:52'),(72223,1,'adanhtehdi, adanhtehiloa','he\'s thinking','adanhteha','','','vt','What are <u>you thinking about</u>?','Gado usdi <u>hadanhteha</u>?','ᎦᏙ ᎤᏍᏗ <u>ᎭᏓᏅᏖᎭ</u>?','ᎠᏓᏅᏖᎭ','gadanvteha','ᎦᏓᏅᏖᎭ','hadanhtvla','ᎭᏓᏅᏛᎳ','udanhtehdi','ᎤᏓᏅᏖᏗ','udanhtehlvi','ᎤᏓᏅᏖᏢᎢ','adanhtesgoi','ᎠᏓᏅᏖᏍᎪᎢ','adanvteha','','gado usdi hadanvteha','gadanvteha','hadanvtvla','udanvtedi','udanvtetlvi','adanvtesgoi','a1danh2te.3ha','','ga.2da2nv1te.3ha','ha.2danh2tv23la','u2danh2teh2di','u1danh2te23hlv3?i','a1danh2te23sgo.3?i','ced','','','','','2018-12-22 20:42:15'),(72230,4,'','he\'s ordering it','adanvsga','','','vt','<u>He orders</u> a new car every year.','Sudetiyvda iyudali ije dagwalela <u>adanvsgoi</u>.','ᏑᏕᏘᏴᏓ ᎢᏳᏓᎵ ᎢᏤ ᏓᏆᎴᎳ <u>ᎠᏓᏅᏍᎪᎢ</u>.','ᎠᏓᏅᏍᎦ','gadanvsga','ᎦᏓᏅᏍᎦ','hadanvla','ᎭᏓᏅᎳ','udanvsdi','ᎤᏓᏅᏍᏗ','udanvsvi','ᎤᏓᏅᏒᎢ','adanvsgoi','ᎠᏓᏅᏍᎪᎢ','adanvsga','','sudetiyvda iyudali itse daqualela adanvsgoi','gadanvsga','hadanvla','udanvsdi','udanvsvi','adanvsgoi','a1da.2nv23sga','','ga.2da.2nv3sga','ha.2da.2nv23la','u2da.2nv23sdi','u1da.2nv23sv3?i','a1da.2nv23sgo.3?i','ced','','','','','2018-12-22 20:42:15'),(72296,1,'','eager','agahliyi','anigahliyi','ᎠᏂᎦᏟᏱ','adj., adv','He\'s always <u>eager</u> to help.','Nigohilv <u>agahliyi</u> geso udasdehldii.','ᏂᎪᎯᎸ <u>ᎠᎦᏟᏱ</u> ᎨᏐ ᎤᏓᏍᏕᏟᏗᎢ.','ᎠᎦᏟᏱ','','','','','','','','','','','agatliyi','anigatliyi','nigohilv agatliyi geso udasdetlidii','','','','','','a.2ga.2hli4yi','a.2ni2ga.2hli4yi','','','','','','ced','','','','','2018-12-22 20:42:22'),(72472,1,'','1.n.right position, right hand,  2. adj. right-handed','aktisi','aniktisi','ᎠᏂᎦᏘᏏ','n.,  adj','He throws a ball with <u>his right hand</u>.','<u>Aktisi</u> gvhdi udego sgwahlesdi.','<u>ᎠᎦᏘᏏ</u> ᎬᏗ ᎤᏕᎪ ᏍᏆᏞᏍᏗ.','ᎠᎦᏘᏏ','','','','','','','','','','','agatisi','anigatisi','agatisi gvdi udego squatlesdi','','','','','','a.2kti2si','a.2ni2kti2si','','','','','','ced','','','','','2018-12-22 20:42:39'),(72494,4,'','and, or','ale','','','conj','I see men <u>and</u> women. If you want to go <u>or</u> not, that\'s just fine.','Anisgaya <u>ale</u> anigehya gajigowhtiha. Jenvsdi yijaduli, <u>ale</u> hla yigi osigwu.','ᎠᏂᏍᎦᏯ <u>ᎠᎴ</u> ᎠᏂᎨᏯ ᎦᏥᎪᏩᏘᎭ. ᏤᏅᏍᏗ ᏱᏣᏚᎵ, <u>ᎠᎴ</u> Ꮭ ᏱᎩ ᎣᏏᏊ.','ᎠᎴ','','','','','','','','','','','ale','','anisgaya ale anigeya gatsigowatiha tsenvsdi yitsaduli ale tla yigi osiquu','','','','','','a.2le','','','','','','','ced','','','','','2018-12-22 20:42:41'),(72585,1,'','peculiar','asegi','anisegi','ᎠᏂᏎᎩ','adj. , adv','I felt <u>peculiar</u> for awhile.','<u>Asegi</u> agwadanhdadv hlega.','<u>ᎠᏎᎩ</u> ᎠᏆᏓᏅᏓᏛ ᏞᎦ.','ᎠᏎᎩ','','','','','','','','','','','asegi','anisegi','asegi aquadanvdadv tlega','','','','','','a.2se4gi','a.2ni2se4gi','','','','','','ced','','','','','2018-12-22 20:42:50'),(72587,1,'','but','asehno, asehnv','','','conj','I was going to go outside <u>but</u> it\'s too cold.','Doyi dagesisv <u>asehnv</u> do uhyvdla.','ᏙᏱ ᏓᎨᏏᏒ <u>ᎠᏎᏅ</u> Ꮩ ᎤᏴᏜ.','ᎠᏎᏃ, ᎠᏎᏅ','','','','','','','','','','','aseno, asenv','','doyi dagesisv asenv do uyvdla','','','','','','a2se3hno, a2se3hnv','','','','','','','ced','','','','','2018-12-22 20:42:50'),(72761,1,'','better','dajehla','','','adv., adj','Which one is <u>better</u>?','Gado usdi <u>dajehla</u>?','ᎦᏙ ᎤᏍᏗ <u>ᏓᏤᏝ</u>.','ᏓᏤᏝ','','','','','','','','','','','datsetla','','gado usdi datsetla','','','','','','da1je23hla','','','','','','','ced','','','','','2018-12-22 20:43:07'),(72803,1,'ayohiha','1. v. t. he\'s shooting at him  2. v.i. he\'s shooting','dasdayohiha','','','v.t., v.i.','<u>He</u> barely <u>shot</u> the gun because the trigger was hard to pull.','Segajv <u>dusdayohlv</u> galogwe asdayv gojanesdii iyusdi.','ᏎᎦᏨ <u>ᏚᏍᏓᏲᏢ</u> ᎦᎶᏇ ᎠᏍᏓᏴ ᎪᏣᏁᏍᏗᎢ ᎢᏳᏍᏗ.','ᏓᏍᏓᏲᎯᎭ','dejisdayohiha','ᏕᏥᏍᏓᏲᎯᎭ','tisdayoha, tisdayoha','ᏘᏍᏓᏲᎭ, ᏘᏍᏓᏲᎭ','jusdayosdi','ᏧᏍᏓᏲᏍᏗ','dusdayohlvi','ᏚᏍᏓᏲᏢᎢ','dasdayohihoi','ᏓᏍᏓᏲᎯᎰᎢ','dasdayohiha','','segatsv tusdayotlv galoque asdayv gotsanesdii iyusdi','detsisdayohiha','','tsusdayosdi','tusdayotlvi','dasdayohihoi','da1sda.2yo2hi.3ha','','de2ji32sda.2yo2hi.3ha','ti32sda.2yo23ha, ti.2sda.3yo2ha','ju2sda.2yo2sdi','du1sda.2yo2hlv23?i','da1sda.2yo2hi.2ho3?i','ced','','','','','2018-12-22 20:43:11'),(72807,1,'asgina','1. v.t. he\'s cursing him, it  2. v.i. he\'s cursing','dasginadia','','','v.t., v.i.','<u>He curses</u> when something makes him angry.','<u>Dasginadisgo</u> gosdi yuhnalvstana.','<u>ᏓᏍᎩᎾᏗᏍᎪ</u> ᎪᏍᏗ ᏳᎿᎸᏍᏔᎾ.','ᏓᏍᎩᎾᏗᎠ','dejisginadia','ᏕᏥᏍᎩᎾᏗᎠ','tisginada, tisginada','ᏘᏍᎩᎾᏓ, ᏘᏍᎩᎾᏓ','jusginadisdi','ᏧᏍᎩᎾᏗᏍᏗ','dusginadvi','ᏚᏍᎩᎾᏛᎢ','dasginadisgoi','ᏓᏍᎩᎾᏗᏍᎪᎢ','dasginadia','','dasginadisgo gosdi yuhnalvstana','detsisginadia','','tsusginadisdi','tusginatvi','dasginadisgoi','da1sgi23na3di.2?a','','de2ji32sgi23na3di.2?a','ti32sgi23na3da, ti.2sgi3na2da','ju2sgi23na3disdi','du1sgi23na3dv23?i','da1sgi23na3di1sgo3?i','ced','','','','','2018-12-22 20:43:12'),(72808,1,'asihtvniha','1. v. t. he\'s clapping his hands 2. v.i. he\'s applauding','dasihtvniha','','','v.t., v.i.','When the president finished his speech, the people <u>applauded</u>.','Ugvwiyuhi uwonisohna <u>dunasihtvnilv</u> yvwi.','ᎤᎬᏫᏳᎯ ᎤᏬᏂᏐᎿ <u>ᏚᎾᏏᏛᏂᎸ</u> ᏴᏫ.','ᏓᏏᏛᏂᎭ','degasihtvniha','ᏕᎦᏏᏛᏂᎭ','tasihtvniga','ᏔᏏᏛᏂᎦ','jusihtvnisdi','ᏧᏏᏛᏂᏍᏗ','dusihtvnilvi','ᏚᏏᏛᏂᎸᎢ','dasihtvnihoi','ᏓᏏᏛᏂᎰᎢ','dasitvniha','','ugvwiyuhi uwonisohna tunasitvnilv yvwi','degasitvniha','tasitvniga','tsusitvnisdi','tusitvnilvi','dasitvnihoi','da1sih2tv3ni.2ha','','de2ga32sih2tv3ni.2ha','ta.2sih3tv2ni1ga','ju2sih2tv23ni32sdi','du1sih2tv23ni32lv23?i','da1sih2tv3ni.2ho3?i','ced','','','','','2018-12-22 20:43:12'),(72835,1,'','noun prefix plural (see Gram. II, A)','di-','','','prefix','','','','Ꮧ-','','','','','','','','','','','di','','','','','','','','di-','','','','','','','ced','','','','','2018-12-22 20:43:14'),(72836,1,'','(see de-)','di-','','','prefix','','','','Ꮧ-','','','','','','','','','','','di','','','','','','','','di-','','','','','','','ced','','','','','2018-12-22 20:43:14'),(72837,1,'','verbal prefix - distant position (see Gram. I, A)','di-','','','prefix','','','','Ꮧ-','','','','','','','','','','','di','','','','','','','','di-','','','','','','','ced','','','','','2018-12-22 20:43:15'),(72860,1,'','toward','didla','','','prep','I saw him walking <u>toward</u> the road.','Nvnohi <u>didla</u> waisv juwijigowahta.','ᏅᏃᎯ <u>ᏗᏜ</u> ᏩᎢᏒ ᏧᏫᏥᎪᏩᏔ.','ᏗᏜ','','','','','','','','','','','didla','','nvnohi didla waisv tsuwitsigowata','','','','','','di3dla','','','','','','','ced','','','','','2018-12-22 20:43:17'),(72943,3,'','he\'s working','dulvhwisdaneha','','','vi','That student <u>works</u> all day Saturday.','Na didehlohgwasgi Dodagwidena udodagwada <u>dulvhwisdanehoi</u>.','Ꮎ ᏗᏕᏠᏆᏍᎩ ᏙᏓᏈᏕᎾ ᎤᏙᏓᏆᏓ <u>ᏚᎸᏫᏍᏓᏁᎰᎢ</u>.','ᏚᎸᏫᏍᏓᏁᎭ','dagilvhwisdaneha','ᏓᎩᎸᏫᏍᏓᏁᎭ','dijalvhwisdasi','ᏗᏣᎸᏫᏍᏓᏏ','julvhwisdanehdi','ᏧᎸᏫᏍᏓᏁᏗ','dulvhwisdanelvi','ᏚᎸᏫᏍᏓᏁᎸᎢ','dulvhwisdanehoi','ᏚᎸᏫᏍᏓᏁᎰᎢ','tulvwesdaneha','','na didetloquasgi dodaquidena udodaquada tulvwisdanehoi','dagilvwisdaneha','ditsalvwisdasi','tsulvwisdanedi','tulvwisdanelvi','tulvwisdanehoi','du1lv23hwi.3sda1ne.2ha','','da1gi.2lv23hwi.3sda1ne.2ha','di2ja.3lv3hwi2sda1si','ju2lv23hwi.3sda1neh2di','du1lv23hwi.3sda1ne2lv23?i','du1lv23hwi.3sda1ne2ho3?i','ced','','','','','2018-12-22 20:43:25'),(72945,1,'','he\'s making footsteps','dusdanohyvhga','','','vi','I hear someone <u>making footsteps</u>.','Kilo <u>dusdanohyvhgv</u> gatvgia.','ᎩᎶ <u>ᏚᏍᏓᏃᏴᎬ</u> ᎦᏛᎩᎠ.','ᏚᏍᏓᏃᏴᎦ','dagwasdanohyvhga','ᏓᏆᏍᏓᏃᏴᎦ','dijasdanohyvla','ᏗᏣᏍᏓᏃᏴᎳ','jusdanohyvhlisdi','ᏧᏍᏓᏃᏴᏟᏍᏗ','dusdanohyvhgvi','ᏚᏍᏓᏃᏴᎬᎢ','dusdanohyvhgoi','ᏚᏍᏓᏃᏴᎪᎢ','tusdanoyvga','','gilo tusdanoyvgv gatvgia','daquasdanoyvga','ditsasdanoyvla','tsusdanoyvtlisdi','tusdanoyvgvi','tusdanoyvgoi','du3sda.2no2hyvh2ga','','da1gwa3sda.2no2hyvh3ga','di.2ja3sda.2no2hyv23la','ju1sda.2no2hyv2hli.2sdi','du3sda.2no2hyvh2gv23?i','du3sda.2no2hyvh2go3?i','ced','','','','','2018-12-22 20:43:25'),(72947,4,'','he\'s tired','duyawega','','','vi','<u>Is he tired</u> when he returns from work?','<u>Duyawegos</u> yiuluhj julvhwisdanelidolv?','<u>ᏚᏯᏪᎪᏍ</u> ᏱᎤᎷᏣ ᏣᎸᏪᏍᏓᏁᎵᏙᎸ?','ᏚᏯᏪᎦ','dagiyawega','ᏓᎩᏯᏪᎦ','dijayawegi','ᏗᏣᏯᏪᎩ','juyawesdi','ᏧᏯᏪᏍᏗ','duyawejvi','ᏚᏯᏪᏨᎢ','duyawegoi','ᏚᏯᏪᎪᎢ','tuyawega','','tuyawegos yiulutsa tsalvwesdanelidolv','dagiyawega','ditsayawegi','tsuyawesdi','tuyewetsvi','tuyawegoi','du1ya.2we3ga','','da1gi2ya.2we3ga','di.2ja.3ya.3we1gi','ju2ya.2we1sdi','du1ya.2we3jv23?i','du1ya.2we3go3?i','ced','','','','','2018-12-22 20:43:25'),(72950,1,'','affirmative, (see Gram. I, D)','-dv','','','v., n., adj. suf','','','','','','','','','','','','','','','','','','','','','','','-dv','','','','','','','ced','','','','','2018-12-22 20:43:26'),(73078,4,'','1. v.i. he\'s passing by without stopping 2. v.t. he\'s passing it (test, exam, etc.)','galosga','','','v.i., v.t.','He passed by us without even saying anything. <u>He passed</u> easily when he was tested.','Gosdi nudvhnvna <u>ulosv</u> ojidonav navi. Ahida <u>ulosv</u> ajigoliyea.','ᎪᏍᏗ ᏄᏛᏅᎾ <u>ᎤᎶᏒ</u> ᎣᏥᏙᎾᎥ ᎾᎥᎢ. ᎠᎯᏓ <u>ᎤᎶᏒ</u> ᎠᏥᎪᎵᏰᎠ.','ᎦᎶᏍᎦ','jilosga','ᏥᎶᏍᎦ','hilohi','ᎯᎶᎯ','ulohisdi','ᎤᎶᎯᏍᏗ','ulosvi','ᎤᎶᏒᎢ','galosgoi','ᎦᎶᏍᎪᎢ','galosga','','gosdi nudvnvna ulosv otsidonav navi ahida ulosv atsigoliyea','tsilosga','hilohi','ulohisdi','ulosvi','galosgoi','ga.2lo2sga','','ji.2lo1sga','hi.2lo23hi','u2lo2hi.2sdi','u1lo2sv23?i','ga.2lo2sgo3?i','ced','','','','','2018-12-22 20:43:38'),(73093,4,'','he\'s selling it','ganadega','','','v.tv','Hurry! Let\'s get there <u>before he sells</u> the house.','Nula! <u>Nunadinvdagwu</u> galhjode winijuhjvi.','ᏄᎳ! <u>ᏄᎾᏗᏅᏓᏊ</u> ᎦᎵᏦᏕ ᏫᏂᏧᏨᎢ.','ᎦᎾᏕᎦ','jinadega','ᏥᎾᏕᎦ','hinaduga','ᎯᎾᏚᎦ','unadinvdi','ᎤᎾᏗᏅᏗ','unadinvsvi','ᎤᎾᏗᏅᏒᎢ','ganadegoi','ᎦᎾᏕᎪᎢ','ganadega','','nula! <u>nunadinvdaquu</u> galitsode winitsutsvi.','tsinadega','hinatuga','unadinvdi','unadinvsvi','ganadegoi','ga.2na.2de3ga','','ji.2na.2de3ga','hi2na2du1ga','u2na2di23nv32di','u1na.2di23nv32sv23?i','ga.2na.2de3go3?i','ced','','','','','2019-12-09 17:15:53'),(73233,1,'','ourselves (you alone and I) (see Gram III, A)','ginvsa','','','pron','','','','ᎩᏅᏌ','','','','','','','','','','','ginvsa','','','','','','','','gi2nv23sa','','','','','','','ced','','','','','2018-12-22 20:43:52'),(73249,3,'hlagohusdi','something','gohusdi, gosdi','','','pron','They are looking for <u>something</u>, but I don\'t know what it is.','Gohusdi unihyo asehnv hla yagwanhta iyusdi gesvi.','<u>ᎪᎱᏍᏗ</u> ᎤᏂᏲ ᎠᏎᏅ Ꮭ ᏯᏆᎾᏔ ᎢᏳᏍᏗ ᎨᏒᎢ.','ᎪᎱᏍᏗ, ᎪᏍᏗ','','','','','','','','','','','gohusdi, gosdi','','gohusdi uniyo asenv tla yaquanata iyusdi gesvi','','','','','','go2hu4sdi, go4sdi','','','','','','','ced','','','','','2018-12-22 20:43:54'),(73290,1,'','with, by means of','gvhdi','','','prep','He hit the nail <u>with</u> a hammer. She conversed <u>by means of</u> Cherokee.','Ganvgwalosdi <u>gvhdi</u> uwahnilv yvgi. Jalagi <u>gvhdi</u> duhlinohehhri.','ᎦᏅᏆᎶᏍᏗ <u>ᎬᏗ</u> ᎤᏩᏂᎸ ᏴᎩ. ᏣᎳᎩ <u>ᎬᏗ</u> ᏚᎵᏃᎮᏢᎢ','ᎬᏗ','','','','','','','','','','','gvdi','','ganvqualosdi gvdi uwanilv yvgi tsalagi gvdi dulinohetlvi','','','','','','gvh4di','','','','','','','ced','','','','','2018-12-22 20:43:57'),(73315,1,'','1. only, just 2. still','-gwu','','','n., v. suf','','','','','','','','','','','','','','','','','','','','','','','-gwu','','','','','','','ced','','','','','2018-12-22 20:44:00'),(73316,1,'','second person singular','h-','','','v. pref.','','','','','','','','','','','','','','','','','','','','','','','h-','','','','','','','ced','','','','','2018-12-22 20:44:00'),(73317,1,'','partitive','-ha','','','n. suf','','','','','','','','','','','','','','','','','','','','','','','-ha','','','','','','','ced','','','','','2018-12-22 20:44:00'),(73319,1,'','under','hawini','','','prep','I can stay <u>under</u> water for two minutes.','Eligwu tali iyatahwostanv yigeda amayi <u>hawini</u>.','ᎡᎵᏊ ᏔᎵ ᎢᏯᏔᏬᏍᏔᏅ ᏱᎨᏓ ᎠᎹᏱ <u>ᎭᏫᏂ</u>.','ᎭᏫᏂ','','','','','','','','','','','hawini','','eliquu tali iyatawostanv yigeda amayi hawini','','','','','','ha.2wi4ni','','','','','','','ced','','','','','2018-12-22 20:44:00'),(73322,1,'','because','-hehno','','','conj','','','','','','','','','','','','','','','','','','','','','','','-hehno','','','','','','','ced','','','','','2018-12-22 20:44:01'),(73323,1,'','and','-hno','','','conj. suf','','','','','','','','','','','','','','','','','','','','','','','-hno','','','','','','','ced','','','','','2018-12-22 20:44:01'),(73325,1,'','(see -i)','-hi','','','n. suf','','','','','','','','','','','','','','','','','','','','','','','-hi','','','','','','','ced','','','','','2018-12-22 20:44:01'),(73343,1,'','and (see Gram. III, F)','-hno','','','suf','','','','','','','','','','','','','','','','','','','','','','','-hno','','','','','','','ced','','','','','2018-12-22 20:44:03'),(73344,1,'','okay','howa','','','interj','Inadawouga. <u>Howa</u>.','Let\'s go swimming. <u>Okay</u>.','ᎢᎾᏓᏬᎤᎦ. <u>ᎰᏩ</u>.','ᎰᏩ','','','','','','','','','','','howa','','inadawouga howa','','','','','','ho.2wa','','','','','','','ced','','','','','2018-12-22 20:44:03'),(73346,1,'','Question marker (see Gram. I, D)','-hv','','','n., v. suf','','','','-Ꮂ','','','','','','','','','','','hv','','','','','','','','-hv','','','','','','','ced','','','','','2018-12-22 20:44:03'),(73350,1,'','repetitive (see Gram. I, A)','i-','','','v. pref.','','','','Ꭲ-','','','','','','','','','','','i','','','','','','','','i-','','','','','','','ced','','','','','2018-12-22 20:44:03'),(73351,1,'','locative (see Gram. II, B)','-i','','','n. suf','','','','-Ꭲ','','','','','','','','','','','i','','','','','','','','-i','','','','','','','ced','','','','','2018-12-22 20:44:03'),(73352,1,'','agent (see Gram.II, B)','-i','','','n. suf','','','','-Ꭲ','','','','','','','','','','','i','','','','','','','','-i','','','','','','','ced','','','','','2018-12-22 20:44:03'),(73420,1,'','question marker (see Gram. I, D)','-ju','','','n., v. suf','','','','-Ꮷ','','','','','','','','','','','tsu','','','','','','','','-ju','','','','','','','ced','','','','','2018-12-22 20:44:10'),(73454,1,'','adj .suf. extremely, exceptionally (see Gram. III, B)','-jv, -jvi','','','adj. suf','','','','-Ꮸ, -ᏨᎢ','','','','','','','','','','','tsv, tsvi','','','','','','','','-jv, -jv?i','','','','','','','ced','','','','','2018-12-22 20:44:13'),(73514,1,'','or (see Gram. I D)','-ke','','','n., v. suf','','','','','','','','','','','','','','','','','','','','','','','-ke','','','','','','','ced','','','','','2018-12-22 20:44:19'),(73546,1,'','1. lateral position, 2. already, 3. reference to previously noted action (see Gram. I, A)','n-','','','v. prefix','','','','','','','','','','','','','','','','','','','','','','','n-','','','','','','','ced','','','','','2018-12-22 20:44:22'),(73547,1,'','plural (see Gram. I, B)','-n-','','','v. prefix','','','','','','','','','','','','','','','','','','','','','','','-n-','','','','','','','ced','','','','','2018-12-22 20:44:22'),(73548,1,'','here','na','','','interj','<u>Here</u>! Here is the money I owe you!','<u>Na</u>! Ahani adela jikstuga.','<u>Ꮎ</u>! ᎠᎭᏂ ᎠᏕᎳ ᏥᏍᎩᏚᎦ.','Ꮎ','','','','','','','','','','','na','','na ahani adela tsisgiduga','','','','','','na','','','','','','','ced','','','','','2018-12-22 20:44:23'),(73550,1,'','and what about ____? (see Gram. II, B)','-na','','','n., pron. suf','','','','','','','','','','','','','','','','','','','','','','','-na','','','','','','','ced','','','','','2018-12-22 20:44:23'),(73554,2,'','','-nei','','','adj. suf. ordinal, (See Gram. III, B).','','','','','','','','','','','','','','','','','','','','','','','-nei','','','','','','','ced','','','numbers, ordinal','','2018-12-26 01:47:04'),(73566,1,'','and then','nogwule','','','conj','They might come tomorrow <u>and then</u> they might not.','Yaniluhgigwu sunale <u>nogwule</u> nuniluhjvnagwu yigi.','ᏯᏂᎷᎩᏊ ᏑᎾᎴ <u>ᏃᏊᎴ</u> ᏄᏂᎷᏨᎾᏊ ᏱᎩ.','ᏃᏊᎴ','','','','','','','','','','','noquule','','yanilugiquu sunale noquule nunilutsvnaquu yigi','','','','','','no23gwu.3le','','','','','','','ced','','','','','2018-12-22 20:44:24'),(73594,1,'','repeatedly (see Gram I, C)','-o-','','','v. suf','','','','','','','','','','','','','','','','','','','','','','','-o-','','','','','','','ced','','','','','2018-12-22 20:44:27'),(73601,1,'','completive (see Gram. I, C)','-ohn-','','','v. suf','','','','','','','','','','','','','','','','','','','','','','','-ohn-','','','','','','','ced','','','','','2018-12-22 20:44:28'),(73606,4,'','1. adj. good., 2. adv. Well','osda','','','adj., adv','This meat is <u>good</u> to eat. He speaks <u>well</u>.','Hia hawiya <u>osda</u> agisdi. <u>Osd</u> gawoni.','ᎯᎠ ᎭᏫᏯ <u>ᎣᏍᏓ</u> ᎠᎩᏍᏗ. <u>ᎣᏍᏓ</u> ᎦᏬᏂ.','ᎣᏍᏓ','','','','','','','','','','','osda','','hia hawiya osda agisdi osda gawoni','','','','','','o4sda','','','','','','','ced','','','','','2018-12-22 20:44:29'),(73623,1,'','hard, difficult','sdaya, sdayi','','','adj., adv','This rock is <u>hard</u>. He\'s working <u>hard</u>.','Hia nvya <u>sdaya</u>. <u>Sdaya</u> dulvhwisdane.','ᎯᎠ ᏅᏯ ᏍᏓᏯ. ᏍᏓᏯ ᏚᎸᏫᏍᏓᏁ.','ᏍᏓᏯ, ᏍᏓᏱ','','','','','','','','','','','sdaya, sdayi','','hia nvya sdaya sdaya dulvwisdane','','','','','','sda4ya, sda4yi','','','','','','','ced','','','','','2018-12-22 20:44:30'),(73649,1,'','katydid','sigigi','','','n','I hear <u>katydids</u>.','<u>Sgigi</u> naniwesgv gatvgia.','<u>ᏍᎩᎩ</u> ᎾᏂᏪᏍᎬ ᎦᏛᎩᎠ.','ᏏᎩᎩ','','','','','','','','','','','sigigi','','sgigi naniwesgv gadvgia','','','','','','si.2gi.2gi','','','','','','','ced','','','','','2018-12-22 20:44:33'),(73651,1,'','pig','sihgwa','','','n','How much does that <u>pig</u> weigh?','Hila iyudageda na <u>sihgwa</u>?','ᎯᎳ ᎢᏳᏓᎨᏓ Ꮎ <u>ᏏᏆ</u>?','ᏏᏆ','','','','','','','','','','','siqua','','hila iyudageda na siqua','','','','','','sih2gwa','','','','','','','ced','','','','','2018-12-22 20:44:33'),(73653,1,'','one month','sinvda','','','adv','They took <u>one month</u> in building the house.','<u>Sinvda</u> unihilidolv gahljode anahnesgesgvi.','<u>ᏏᏅᏓ</u> ᎤᏂᎯᎵᏙᎸ ᎦᎵᏦᏕ ᎠᏀᏁᏍᎨᏍᎬᎢ.','ᏏᏅᏓ','','','','','','','','','','','sinvda','','sinvda unihilidolv galitsode anahnesgesgvi','','','','','','si2nv4da','','','','','','','ced','','','','','2018-12-22 20:44:33'),(73655,1,'','opposite side (of a body of water)','skoni','','','n','He\'s standing on the <u>other side</u> fishing.','<u>Skoni</u> digadoga disuhvsga.','<u>ᏍᎪᏂ</u> ᏗᎦᏙᎦ ᏗᏑᎲᏍᎦ.','ᏍᎪᏂ','','','','','','','','','','','sgoni','','sgoni digadoga disuhvsga','','','','','','sko.2ni','','','','','','','ced','','','','','2018-12-22 20:44:33'),(73656,1,'','overseas','skoniyi','','','adv','Did you have to go <u>overseas</u> when you were in the service?','<u>Skoniyis</u> wijedasdi nulstane aniyosgi chiyavi?','<u>ᏍᎪᏂᏱᏍ</u> ᏫᏤᏓᏍᏗ ᏄᎵᏍᏔᏁ ᎠᏂᏲᏍᎩ ᏥᏯᎥᎢ?','ᏍᎪᏂᏱ','','','','','','','','','','','sgoniyi','','sgoniyis witsedasdi nulistane aniyosgi tsiyavi','','','','','','sko.2ni23yi','','','','','','','ced','','','','','2018-12-22 20:44:33'),(73657,1,'','horse','sogwili','','','n','They\'re racing <u>horses</u>.','<u>Sogwili</u> danatohgiyasdiha.','<u>ᏐᏈᎵ</u> ᏓᎾᏙᎩᏯᏍᏗᎭ.','ᏐᏈᎵ','','','','','','','','','','','soquili','','soquili danadogiyasdiha','','','','','','so23gwi.3li','','','','','','','ced','','','','','2018-12-22 20:44:33'),(73663,1,'','in the next room','soiyi','','','adv','Set this chair <u>in the next room</u>.','<u>Soiyi</u> hwisgilada hia gasgilo.','<u>ᏐᎢᏱ</u> ᏫᏍᎩᎳᏓ ᎯᎠ ᎦᏍᎩᎶ.','ᏐᎢᏱ','','','','','','','','','','','soiyi','','soiyi wisgilada hia gasgilo','','','','','','so.2?i23yi','','','','','','','ced','','','','','2018-12-22 20:44:34'),(73726,1,'udanhtisahnvi','1. friendly 2. gentle 3. pleasant','udanhti','unadanhti','ᎤᎾᏓᏅᏘ','adj., adv','<u>He is</u> very <u>pleasant</u> to talk with.','Udoyu <u>udanhti</u> ahlinohedodi.','ᎤᏙᏳ <u>ᎤᏓᏅᏘ</u> ᎠᏟᏃᎮᏙᏗ.','ᎤᏓᏅᏘ','','','','','','','','','','','udanvti','unadanvti','udoyu udanvti atlinohedodi','','','','','','u2danh4ti','u2na.2danh4ti','','','','','','ced','','','','','2018-12-22 20:44:40'),(73932,1,'','slow','usganoli','unisganoli, jusganoli','ᎤᏂᏍᎦᏃᎵ, ᏧᏍᎦᏃᎵ','adj. , adv','Some people are <u>slow</u> to get ready. Today seemed to go by <u>slow</u>.','Igada <u>unisganoli</u> geso unadvnvisdohdii. <u>Usganoli</u> galohi nigvwsdi kohi iga.','ᎢᎦᏓ <u>ᎤᏂᏍᎦᏃᎵ</u> ᎨᏐ ᎤᎾᏛᏅᎢᏍᏙᏗᎢ. <u>ᎤᏍᎦᏃᎵ</u> ᎦᎶᎯ ᏂᎬᏩᏍᏗ ᎪᎯ ᎢᎦ.','ᎤᏍᎦᏃᎵ','','','','','','','','','','','usganoli','','igada unisganoli geso unadvnvisdodii usganoli galohi nigvwasdi gohi iga','','','','','','u2sga.2no4li','u2ni2sga.2no4li, ju2sga.2no4li','','','','','','ced','','','','','2018-12-22 20:02:44'),(73940,1,'gasohii','behind a person','usotvi','junasotvi','ᏧᎾᏐᏛᎢ','prep','He didn\'t even see me standing <u>behind him</u>.','Hla sgwu yagigohe <u>usotv</u> jijidogvi.','Ꮭ ᏍᏊ ᏯᎩᎪᎮ <u>ᎤᏐᏛ</u> ᏥᏥᏙᎬᎢ.','ᎤᏐᏛᎢ','','','','','','','','','','','usotvi','tsunasotvi','tla squu yagigohe usodv tsitsidogvi','','','','','','u1so2tv4?i','ju2na1so2tv4?i','','','','','','ced','','','','','2018-12-22 20:02:45'),(74053,1,'','non-factual (see Gram. I, A)','y-','','','n. pref.','','','','','','','','','','','','','','','','','','','','','','','y-','','','','','','','ced','','','','','2018-12-22 20:02:57'),(74055,1,'','pure blood, full blood (see Gram. II, B)','-ya, -yai','','','n. suf','','','','','','','','','','','','','','','','','','','','','','','-ya, -ya?i','','','','','','','ced','','','','','2018-12-22 20:02:57'),(75705,1,'','purse','adela digalododi','','','','','','','ᎠᏕᎳ ᏗᎦᎶᏙᏗ','','','','','','','','','','','adela digalododi','','','','','','','','','','','','','','','cwl','','','','','2018-12-22 20:05:43'),(75706,1,'','push-ups','vyelv asaladodi','','','','','','','ᎥᏰᎸ ᎠᏌᎳᏙᏗ','','','','','','','','','','','vyelv asaladodi','','','','','','','','','','','','','','','cwl','','','','','2018-12-22 20:05:43'),(89535,2,'','log off','hinugoi','','','v','','','','ᎯᏄᎪᎢ','','','','','','','','','','','hinugoi','','','','','','','','','','','','','','','msct','To terminate a session with a computer accessed through a communications line usually a computer that is both distant and open to many users.','','','','2018-12-22 20:06:53'),(89553,2,'','upgrade','datsetlesdi nvga','','','v','','','','ᏓᏤᏞᏍᏗ ᏅᎦ','','','','','','','','','','','datsetlesdi nvga','','','','','','','','','','','','','','','msct','To change to a newer, and/or more powerful or sophisticated version of a product.','','','','2018-12-22 20:06:54'),(89558,2,'','access','gvyvsdi','','','v','','','','ᎬᏴᏍᏗ','','','','','','','','','','','gvyvsdi','','','','','','','','','','','','','','','msct','To gain entry to memory in order to read or write data.','','','','2018-12-22 20:06:55'),(89583,2,'','easily','ahidiyu','','','adv','','','','ᎠᎯᏗᏳ','','','','','','','','','','','ahidiyu','','','','','','','','','','','','','','','msct','Without difficulty.','','','','2018-12-22 20:06:57'),(89617,2,'','by default','adanetliyvsdisgi gesv iyusdi','','','adv','','','','ᎠᏓᏁᏟᏴᏍᏗᏍᎩ ᎨᏒ ᎢᏳᏍᏗ','','','','','','','','','','','adanetliyvsdisgi gesv iyusdi','','','','','','','','','','','','','','','msct','How a program\'s action is determined if the user does not make a choice or supply a required value.','','','','2018-12-22 20:07:01'),(89631,2,'','n/a','tla/ahani','','','Other','','','','Ꮭ/ᎠᎭᏂ','','','','','','','','','','','tla/ahani','','','','','','','','','','','','','','','msct','Pertaining to something for which an answer is not available or appropriate.','','','','2018-12-22 20:07:02'),(89763,2,'','USB drive','USB atlodagoliyesgi','','','n','','','','USB ᎠᏠᏓᎪᎵᏰᏍᎩ','','','','','','','','','','','nullnullnulli atlodagoliyesgi','','','','','','','','','','','','','','','msct','A small device used to store information. USB flash drives plug into computer USB ports so you can copy information to or from them, making it easy to share and transport information.','','','','2018-12-22 20:07:15'),(89764,2,'','domain','igvnidena wigalugv','','','n','','','','ᎢᎬᏂᏕᎾ ᏫᎦᎷᎬ','','','','','','','','','','','igvnidena wigalugv','','','','','','','','','','','','','','','msct','The set of possible values that you can specify for an independent variable in a function, or for a database attribute.','','','','2018-12-22 20:07:15'),(90176,2,'','private','gvsgatli','','','adj','','','','ᎬᏍᎦᏟ','','','','','','','','','','','gvsgatli','','','','','','','','','','','','','','','msct','Pertaining to an item that is only visible to the owner.','','','','2018-12-22 20:07:53'),(90182,2,'','disabled','digvwalvwisdanedi nigesv','','','adj','','','','ᏗᎬᏩᎸᏫᏍᏓᏁᏗ ᏂᎨᏒ','','','','','','','','','','','digvwalvwisdanedi nigesv','','','','','','','','','','','','','','','msct','Pertaining to the state of a control in which normal functionality is not available to a user.','','','','2018-12-22 20:07:54'),(90761,2,'','leveling','gvnadesdiha','','','Other','','','','ᎬᎾᏕᏍᏗᎭ','','','','','','','','','','','gvnadesdiha','','','','','','','','','','','','','','','msct','Resolving resource conflicts or overallocations by delaying or splitting certain tasks. When Project levels a resource, its selected assignments are distributed and rescheduled.','','','','2018-12-22 20:08:48'),(90903,2,'','.pst','.pst','','','Other','','','','.pst','','','','','','','','','','','.nullst','','','','','','','','','','','','','','','msct','The file name extension of a data file that stores your messages and other items on your computer.','','','','2018-12-22 20:09:01'),(90959,2,'','All rights reserved','nigav agihv asquanigodi.','','','Other','','','','ᏂᎦᎥ ᎠᎩᎲ ᎠᏍᏆᏂᎪᏗ.','','','','','','','','','','','nigav agihv asquanigodi.','','','','','','','','','','','','','','','msct','A statement indicating that the copyright holder reserves, or holds for their own use, all the rights provided by copyright law, such as distribution, performance, and creation of derivative works; that is, they have not waived any such right.','','','','2018-12-22 20:09:06'),(91234,2,'','deadlock-prone','asdaya asdoha - gvhvsdi nigesvna','','','adj','','','','ᎠᏍᏓᏯ ᎠᏍᏙᎭ - ᎬᎲᏍᏗ ᏂᎨᏒᎾ','','','','','','','','','','','asdaya asdoha  gvhvsdi nigesvna','','','','','','','','','','','','','','','msct','likely to produce a situation in which one of several threads is waiting for the other thread(s) to do something','','','','2018-12-22 20:09:32'),(92505,2,'','accident','udasegatsedi','','','','','','','ᎤᏓᏎᎦᏤᏗ','','','','','','','','','','','udasegatsedi','','','','','','','','','','','','','','','ncmed','','','','terms and conditions','2018-12-22 20:09:36'),(92506,2,'','ache','ehisdi','','','','','','','ᎡᎯᏍᎢ','','','','','','','','','','','ehisi','','','','','','','','','','','','','','','ncmed','','','','terms and conditions','2018-12-22 20:09:36'),(92720,2,'','aneurysm','giga uwedasdi utsalutida','','','','','','','ᎩᎦ ᎤᏪᏓᏍᏗ ᎤᏣᎷᏘᏓ','','','','','','','','','','','giga uwedasdi utsalutida','','','','','','','','','','','','','','','cnomed','','','','terms and conditions','2018-12-22 20:09:56'),(92721,2,'','bald','ugewoda','','','','','','','ᎤᎨᏬᏓ','','','','','','','','','','','ugewoda','','','','','','','','','','','','','','','cnomed','','','','terms and conditions','2018-12-22 20:09:56'),(92818,2,'','esophagus','ayvtsonv','','','','','','','ᎠᏴᏦᏅ','','','','','','','','','','','ayvtsonv','','','','','','','','','','','','','','','cnomed','','','','anatomy and terms','2018-12-22 20:10:05'),(92819,2,'','exam. room','unadagoliyedi','','','','','','','ᎤᎾᏓᎪᎵᏰᏗ','','','','','','','','','','','unadagoliyedi','','','','','','','','','','','','','','','cnomed','','','','anatomy and terms','2018-12-22 20:10:05'),(100412,1,'','His ring','uliyesusdawo','','','n-nr','','','','ᎤᎵᏰᏑᏍᏓᏬ','','','','','','','','','','','uliyesusdawo','','','','','','','','ulịyẹsụsdạwo','','','','','','','rrd','','','','','2018-12-22 20:21:37'),(101150,2,'','He is doing it','nadvneha','','','vt','… having under myself soldiers, and I say to this one, Go, and he goeth, and to another, Be coming, and he cometh, and to my servant, <u>Do this</u>, and <u>he doth</u> [it].’','[ᎹᏚ 8:9]','… ᎠᎴ ᏓᎩᎧᎭ ᎠᏂᏯᏫᏍᎩ ᎾᏍᎩ ᏕᎬᏆᏁᎶᏙᎢ, ᎩᎶᏃ ᎮᎾ ᏥᏲᏏ, ᎡᎪᎢ; ᏅᏩᏓᎴᏃ ᎡᎮᎾ ᏥᏲᏏ, ᏗᎡᎪᎢ; ᏥᏅᏏᏓᏍᏗᏃ, ᎯᎠ <u>ᎿᏛᎦ</u> ᏥᏲᏏ, ᎾᏍᎩ <u>ᎾᏛᏁᎰᎢ</u>.','ᎾᏛᏁᎭ','nigadvnea','ᏂᎦᏛᏁᎠ','hnadvnega','ᎿᏛᏁᎦ','iyuddi','ᎢᏳᏛᏗ','nudvnelvi','ᏄᏛᏁᎸᎢ','nadvnehoi','ᎾᏛᏁᎰᎢ','natvneha','','… ale dagikaha aniyawisgi nasgi degvquanelodoi, gilono hena tsiyosi, egoi; nvwadaleno ehena tsiyosi, diegoi; tsinvsidasdino, hia <u>hnadvga</u> tsiyosi, nasgi <u>nadvnehoi</u>.','nigatvnea','hnatvnega','iyutvdi','nutvnelvi','natvnehoi','nadṿneha','','nịgadṿnẹɂa','hnadṿnega','ịyudɂdi','nudṿnẹlv²³ɂi','nadṿneho³ɂi','rrd','','','','','2019-12-09 17:15:56'),(101154,1,'','It is because of.; It happens','nigalsgwetuiha','','','vi','','','','ᏂᎦᎵᏍᏇᏚᎢᎭ','nitsialsgweduiha','ᏂᏥᎠᎵᏍᏇᏚᎢᎭ','hnalsgwetua','ᎿᎵᏍᏇᏚᎠ','iyulsgwetuudi','ᎢᏳᎵᏍᏇᏚᎤᏗ','nulsgwetuanvi','ᏄᎵᏍᏇᏚᎠᏅᎢ','nigalsgwetuisgoi','ᏂᎦᎵᏍᏇᏚᎢᏍᎪᎢ','nigalisquetuiha','','','nitsialisquetuiha','hnalisquetua','iyulisquetuudi','nulisquetuanvi','nigalisquetuisgoi','nịgalsgwe³tụịha','','nịtsịalsgwe³dɂụịha','hnalsgwe³tụa','ịyulsgwe³tụudi','nulsgwe³tụạnv²³ɂi','nịgalsgwe³tụịsgo³ɂi','rrd','','','','','2018-12-22 20:22:44'),(101156,2,'','He is saying it.; He is uttering it','nigawea','','','vt','… <u>saying</u> “What shall I do?”','[ᏧᏁᎶᏗ ᏚᏂᎩᏒᏒᎢ]','… <u>ᏄᏪᏒᎩ</u>, “ᎦᏙᏃ ᏓᎦᏛᏁᎵ?”','ᏂᎦᏪᎠ','nitsiwea','ᏂᏥᏪᎠ','hniwe','ᏂᏪ','iyuwesdi','ᎢᏳᏪᏍᏗ','nuwesvi','ᏄᏪᏒᎢ','nigawesgoi','ᏂᎦᏪᏍᎪᎢ','nigawea','','… <u>nuwesvgi</u>, “gadono dagadvneli?”','nitsiwea','niwe','iyuwesdi','nuwesvi','nigawesgoi','nịgạwẹɂa','','nịtsịwẹɂa','hnịwe','ịyuwẹsdi','nuwẹsv²³ɂi','nịgạwẹsgo³ɂi','rrd','','','','','2019-12-09 17:15:56'),(101161,1,'','He is making it','nigvneha','','','vt','','','','ᏂᎬᏁᎭ','nigvnea','ᏂᎬᏁᎠ','hnvnega','ᏅᏁᎦ','iyuwhdi','ᎢᏳᏩᏗ','nuwanelvi','ᏄᏩᏁᎸᎢ','nigvnehoi','ᏂᎬᏁᎰᎢ','nigvneha','','','nigvnea','nvnega','iyuwadi','nuwanelvi','nigvnehoi','nịgvneha','','nịgvnẹɂa','hnvnega','ịyuwhdi','nuwanẹlv²³ɂi','nịgvneho³ɂi','rrd','','','','','2018-12-22 20:22:45'),(101168,2,'','A star.; Meadowlark, eastern.; biol. <em>Sturnella magna.</em>','nokwisi','','','n; gn','Lejili saw ten <u>meadowlarks</u> and then she saw six went away. How many <u>meadowlarks</u> does she see?','[ᏣᎳᎩ ᏅᎩᏁ ᏗᏂᏂᏙᎯ ᏗᏕᏲᏙᏗ]','ᎴᏥᎵ ᏍᎪᎯ <u>ᏃᏈᏏ</u> ᏚᎪᎮᎢ ᏃᎴ ᏑᏓᎵ ᏫᏚᎪᎮ. ᎭᎳᎢᎦ <u>ᏃᏈᏏ</u> ᏚᎪᎮᎢ?','ᏃᏈᏏ','','','','','','','','','','','noquisi','','letsili sgohi <u>noquisi</u> dugohei nole sudali widugohe. halaiga <u>noquisi</u> dugohei?','','','','','','nọkwịsi','','','','','','','rrd','','','','','2019-12-09 17:15:56'),(101297,1,'','He is separating','dagalenia','','','vi','','','','ᏓᎦᎴᏂᎠ','degagalenia','ᏕᎦᎦᎴᏂᎠ','tagalena','ᏔᎦᎴᎾ','tsugalenhdi','ᏧᎦᎴᏂᏗ','dugalenvvi','ᏚᎦᎴᏅᎥᎢ','dagalenisgoi','ᏓᎦᎴᏂᏍᎪᎢ','dagalenia','','','degagalenia','tagalena','tsugalenidi','tugalenvvi','dagalenisgoi','dagạlenịɂa','','degagạlenịɂa','tagạlena','tsugạlenhdi','dugạlenṿɂv²³ɂi','dagạlenisgo³ɂi','rrd','','','','','2018-12-22 20:22:57'),(101300,1,'','He is shelling corn','daktaliha','','','vi','','','','ᏓᎦᏔᎵᎭ','detsikdaliha','ᏕᏥᎦᏓᎵᎭ','tiktala','ᏘᎦᏔᎳ','tsuktahldi','ᏧᎦᏔᎵᏗ','duktalvhvi','ᏚᎦᏔᎸᎲᎢ','daktalisgoi','ᏓᎦᏔᎵᏍᎪᎢ','dagataliha','','','detsigadaliha','tigatala','tsugatalidi','tugatalvhvi','dagatalisgoi','daktạlịha','','detsịkdạlịha','tịktạla','tsuktahldi','duktạlṿhv²³ɂi','daktạlịsgo³ɂi','rrd','','','','','2018-12-22 20:22:57'),(101303,2,'','He is opening eyes.; He is looking','dakaniha','','','vi','… every one who <u>is looking</u> on a woman to desire her, …','[ᎹᏚ 5:28]','… ᎩᎶ ᎠᎨᏴ <u>ᏓᎧᏂᏍᎨᏍᏗ</u> ᏧᎾᏂᏏᏗᏱ ᎤᏚᎵᏍᎨᏍᏗ, …','ᏓᎧᏂᎭ','degakania','ᏕᎦᎧᏂᎠ','takanga','ᏔᎧᏂᎦ','tsukanhdi','ᏧᎧᏅᏗ','dukananvi','ᏚᎧᎾᏅᎢ','dakanhsgoi','ᏓᎧᏂᏍᎪᎢ','dakaniha','','… gilo ageyv <u>dakanisgesdi</u> tsunanisidiyi udulisgesdi, …','degakania','takaniga','tsukanvdi','tukananvi','dakanisgoi','dakạnịha','','degakạnịɂa','takạnɂga','tsukạnhdi','dukạnạnv²³ɂi','dakạnhsgo³ɂi','rrd','','','','','2019-12-09 17:15:56'),(101305,1,'','He is becoming blind','dakewoga','','','vi','','','','ᏓᎨᏬᎦ','detsikewoga','ᏕᏥᎨᏬᎦ','tikewogi','ᏘᎨᏬᎩ','tsukewoisdi','ᏧᎨᏬᎢᏍᏗ','dukewotsvi','ᏚᎨᏬᏨᎢ','dakewogoi','ᏓᎨᏬᎪᎢ','dagewoga','','','detsigewoga','tigewogi','tsugewoisdi','tugewotsvi','dagewogoi','dakewoga','','detsịkewoga','tịkewogi','tsukewọɂịsdi','dukewotsv²³ɂi','dakewogo³ɂi','rrd','','','','','2018-12-22 20:22:57'),(101314,2,'','He is rising from sitting','dalehvsga','','','vi','<u>rise</u>, go up and down through the land, to its length, and to its breadth, for to thee I give it.\'','[ᎼᏏ ᎢᎬᏱᏱ 13:17]','<u>ᏔᎴᎲᎦ</u>, ᎮᏓ ᏂᎦᏅᎯᏒ ᎠᎴ ᎾᏯᏛᎥ ᎯᎠ ᎦᏙᎯ; ᏂᎯᏰᏃ ᏓᎬᏁᎵ.','ᏓᎴᎲᏍᎦ','degalevsga','ᏕᎦᎴᎥᏍᎦ','talehvga','ᏔᎴᎲᎦ','','-','dulehnvi','ᏚᎴᏅᎢ','dalehvsgoi','ᏓᎴᎲᏍᎪᎢ','dalehvsga','','<u>talehvga</u>, heda niganvhisv ale nayadvv hia gadohi; nihiyeno dagvneli.','degalevsga','talehvga','','tulenvi','dalehvsgoi','dalehvsga','','degalẹɂvsga','talehvga','','dulẹɂhnv²³ɂi','dalehvsgo³ɂi','rrd','','','','','2019-12-09 17:15:56'),(101317,1,'','He is rocking a chair','dahlilukesga','','','vi','','','','ᏓᎵᎷᎨᏍᎦ','degalilukesga','ᏕᎦᎵᎷᎨᏍᎦ','tahlilukvli','ᏔᎵᎷᎬᎵ','tsuhlilukehdi','ᏧᎵᎷᎨᏗ','duhlilukehvi','ᏚᎵᎷᎨᎲᎢ','dahlilukesgoi','ᏓᎵᎷᎨᏍᎪᎢ','dalilugesga','','','degalilugesga','talilugvli','tsulilugedi','tulilugehvi','dalilugesgoi','dahlịlụkesga','','degạɂlịlụkesga','tahlịlụkvli','tsuhlịlụkehdi','duhlịlụkehv²³ɂi','dahlịlụkesgo³ɂi','rrd','','','','','2018-12-22 20:22:59'),(101318,1,'','He is skating','dahlinasvsdiha','','','vi','','','','ᏓᎵᎾᏒᏍᏗᎭ','degalinasvsdiha','ᏕᎦᎵᎾᏒᏍᏗᎭ','tahlinasvsda','ᏔᎵᎾᏒᏍᏓ','tsuhlinasvsdohdi','ᏧᎵᎾᏒᏍᏙᏗ','duhlinasvsdanvi','ᏚᎵᎾᏒᏍᏓᏅᎢ','dahlinasvsdisgoi','ᏓᎵᎾᏒᏍᏗᏍᎪᎢ','dalinasvsdiha','','','degalinasvsdiha','talinasvsda','tsulinasvsdodi','tulinasvsdanvi','dalinasvsdisgoi','dahlịnạsṿsdịha','','degạɂlịnạsṿsdịha','tahlịnạsṿsda','tsuhlịnạsṿsdohdi','duhlịnạsṿsdạnv²³ɂi','dahlịnạsṿsdịsgo³ɂi','rrd','','','','','2018-12-22 20:22:59'),(101319,2,'','He is kneeling','dahlinigwanvvsga','','','vi','And these things having said, <u>having bowed his knees</u>, with them all, he did pray,','[ᎨᏥᏅᏏᏛ ᏄᎾᏛᏁᎵᏙᎸᎢ 20:36]','ᎾᏍᎩᏃ ᎯᎠ ᏄᏪᏒ, <u>ᏚᎵᏂᏆᏅᏅᎩ</u> ᎠᎴ ᏂᎦᏛ ᎠᏂᎦᏔᎲ ᎤᏓᏙᎵᏍᏔᏅᎩ.','ᏓᎵᏂᏆᏅᎥᏍᎦ','degalinigwanvvsga','ᏕᎦᎵᏂᏆᏅᎥᏍᎦ','tahlinigwanvvga','ᏔᎵᏂᏆᏅᎥᎦ','tsuhlinigwanvdi','ᏧᎵᏂᏆᏅᏗ','duhlinigwanvnvi','ᏚᎵᏂᏆᏅᏅᎢ','dahlinigwanvvsgoi','ᏓᎵᏂᏆᏅᎥᏍᎪᎢ','daliniquanvvsga','','nasgino hia nuwesv, <u>duliniquanvnvgi</u> ale nigadv anigatahv udadolistanvgi.','degaliniquanvvsga','taliniquanvvga','tsuliniquanvdi','tuliniquanvnvi','daliniquanvvsgoi','dahlịni³gwạnṿɂvsga','','degạɂlịni³gwạnṿɂvsga','tahlịni³gwạnṿɂvga','tsuhlịni³gwạnvdi','duhlịni³gwạnṿɂnv²³ɂi','dahlịni³gwạnṿɂvsgo³ɂi','rrd','','','','','2019-12-09 17:15:56'),(101321,1,'','He is jumping up and down','dalitadega','','','vi','','','','ᏓᎵᏔᏕᎦ','degvlitadega','ᏕᎬᎵᏔᏕᎦ','','-','','-','dulitadesvi','ᏚᎵᏔᏕᏒᎢ','dalitadegoi','ᏓᎵᏔᏕᎪᎢ','dalitadega','','','degvlitadega','','','tulitadesvi','dalitadegoi','dalịtạdẹga','','degvlitạdẹga','','','dulịtạdẹsv²³ɂi','dalịtạdẹgo³ɂi','rrd','','','','','2018-12-22 20:22:59'),(101475,1,'','What','doiyuhsdi','','','pt','','','','ᏙᎢᏳᏍᏗ','','','','','','','','','','','doiyusdi','','','','','','','','doɂiyụhsdi','','','','','','','rrd','','','','','2018-12-22 20:23:13'),(101482,1,'','Burlap sack.; Bear nettle','toleda','','','n; gn','','','','ᏙᎴᏓ','','','','','','','','','','','doleda','','','','','','','','toleda','','','','','','','rrd','','','','','2018-12-22 20:23:13'),(101483,1,'','Why','doni','','','pt','','','','ᏙᏂ','','','','','','','','','','','doni','','','','','','','','doni','','','','','','','rrd','','','','','2018-12-22 20:23:13'),(101716,0,NULL,'thirty first','josgo sagwuhinei',NULL,NULL,'',NULL,NULL,NULL,'ᏦᏍᎪ ᏌᏊᎯᏁᎢ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tsosgo saquuhinei','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'fbgp',NULL,NULL,'numbers, ordinal',NULL,'2018-12-25 22:56:27'),(101814,0,NULL,'Softshell turtle; biol. family <em> Trionychidae</em>; Reptile','utlinowa',NULL,NULL,'',NULL,NULL,NULL,'ᎤᏟᏃᏩ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'utlinowa','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cnld',NULL,NULL,'Water Animals',NULL,'2019-05-24 16:25:01'),(101827,0,NULL,'Northern harrier; biol. <em>Circus hudsonius or Circus cyaneus hudsonius</em>; Raptor','tlvnowa (digadonvhida)',NULL,NULL,'',NULL,NULL,NULL,'ᏢᏃᏩ (ᏗᎦᏙᏅᎯᏓ)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tlvnowa nulldigadonvhidanull','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cnld',NULL,NULL,'Birds',NULL,'2019-05-24 16:49:32'),(101839,0,NULL,'Great egret; biol. <em>Ardea alba</em>; Shorebird','kanvsgowa',NULL,NULL,'prep',NULL,NULL,NULL,'ᎧᏅᏍᎪᏩ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'kanvsgowa','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cnld',NULL,NULL,'Birds',NULL,'2019-05-24 17:01:26'),(101858,0,NULL,'Blackbird; biol. <em>Turdus merula</em>; Songbird','tsisgwalisdi',NULL,NULL,'',NULL,NULL,NULL,'ᏥᏍᏆᎵᏍᏗ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tsisqualisdi','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cnld',NULL,NULL,'Birds',NULL,'2019-05-24 17:29:09'),(101887,0,NULL,'Summer tanager; biol. <em>Piranga rubra</em>; Songbird','jotla',NULL,NULL,'',NULL,NULL,NULL,'ᏦᏝ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tsotla','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cnld',NULL,NULL,'Birds',NULL,'2019-05-24 17:56:06'),(101889,0,NULL,'Tufted titmouse; biol. Baeolophus bicolor</em>; Songbird','ustli',NULL,NULL,'',NULL,NULL,NULL,'ᎤᏍᏟ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ustli','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cnld',NULL,NULL,'Birds',NULL,'2019-05-24 17:57:28'),(101967,0,NULL,'hoarfrost','unanusdi',NULL,NULL,'',NULL,NULL,NULL,'ᎤᎾᏄᏍᏗ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'unanusdi','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cnld',NULL,NULL,'Weather',NULL,'2019-05-25 01:01:36'),(101987,1,NULL,'The wind is blowing about.','ganoleha',NULL,NULL,'',NULL,NULL,NULL,'ᎦᏃᎴᎭ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ganoleha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cnld',NULL,NULL,'Weather',NULL,'2019-05-25 20:47:38'),(102151,0,NULL,'Platanus occidentalis','guwa unega, tsuwi yusdi, guwi yusdi une',NULL,NULL,NULL,NULL,NULL,NULL,'ᎫᏩ ᎤᏁᎦ, ᏧᏫ ᏳᏍᏗ, ᎫᏫ ᏳᏍᏗ ᎤᏁ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'banks',NULL,NULL,'Plants',NULL,'2019-08-31 21:48:24'),(102152,0,NULL,'Agrimonia parviflora','uniganasaha nawatialastati, kanatsisduga unitiligatladoei',NULL,NULL,NULL,NULL,NULL,NULL,'ᎤᏂᎦᎾᏌᎭ ᎾᏩᏘᎠᎳᏍᏔᏘ, ᎧᎾᏥᏍᏚᎦ ᎤᏂᏘᎵᎦᏝᏙᎡᎢ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'banks',NULL,NULL,'Plants',NULL,'2019-08-31 21:48:24'),(102312,3,'See also: ganvsdiha, He is being carried by it (something long)','he is sailing, he is traveling by ship','ganvsdiha',NULL,NULL,'','Acts: 27:1, And when it was determined that we should <u>sail</u> into Italy...','Getsinvsidv nunadvnelidolvi  27:1 hnaquo dudugotanv idali <u>woginvsdodiyi</u>','ᎨᏥᏅᏏᏛ  ᏄᎾᏛᏁᎵᏙᎸᎢ  27:1, ᎿᏉᏃ ᏚᏚᎪᏔᏅ ᎢᏓᎵ <u>ᏬᎩᏅᏍᏙᏗᏱ</u>','ᎦᏅᏍᏗᎭ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ganvsdiha',NULL,'getsinvsidv  nunadvnelidolvi  nullnullnullnullnulli hnaquono dudugotanv idali nullnullnullwoginvsdodiyinullnullnullnull',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CNT',NULL,NULL,NULL,NULL,'2020-05-16 18:58:41'),(102331,2,NULL,'orbit','adeyohv',NULL,NULL,'n.',NULL,NULL,NULL,'ᎠᏕᏲᎲ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'adeyohv',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CWL',NULL,NULL,NULL,NULL,'2020-06-14 17:47:34'),(102393,3,'unetselvgi','he is commanding him','kanetseha',NULL,NULL,'vt','These things <u>I command you,</u> that ye love one another. [John 15:17]','Nasgi hia nusdi <u>itsvnetseha,</u> ditsadagehiyu iyulisdodiyi.','ᎾᏍᎩ ᎯᎠ ᏄᏍᏗ <u>ᎢᏨᏁᏤᎭ</u> ᏗᏣᏓᎨᎯᏳ ᎢᏳᎵᏍᏙᏗᏱ. [ᏣᏂ ᎤᏬᏪᎳᏅᎯ 15:17]','ᎧᏁᏤᎭ','tsinetseha','ᏥᏁᏤᎭ','hinetsv','ᎯᏁᏨ','unetsedi','ᎤᏁᏤᏗ','unetselvi','ᎤᏁᏤᎸᎢ','kanetsehoi','ᎧᏁᏤᎰᎢ','kanetseha',NULL,NULL,'tsinetseha','hinetsv','unetsedi','unetselvi','kanetsehoi','kanetseha',NULL,'tsiɂnetseha','hihnetsv','uhnetsedi','uhnetselvɂi','kanetsehoɂi','CNT',NULL,NULL,NULL,NULL,'2020-09-22 03:04:51'),(102394,1,NULL,'He\'s winning','adatlosga',NULL,NULL,'vt',NULL,NULL,NULL,'ᎠᏓᏠᏍᎦ','gadatlosga','ᎦᏓᏠᏍᎦ','hadatlohi','ᎭᏓᏠᎯ','udatlohisdi','ᎤᏓᏠᎯᏍᏗ','udatlosvɂi','ᎤᏓᏠᏒᎢ','adatlosgoɂi','ᎠᏓᏠᏍᎪᎢ','adatlosga',NULL,NULL,'gadatlosga','hadatlohi','udatlohisdi','udatlosvi',NULL,'adatlosga',NULL,'gadatlosga','hadatlohi','udatlohisdi','udatlosvɂi','adatlosgoɂi','VRB',NULL,NULL,NULL,NULL,'2020-10-13 21:43:06'),(102395,0,NULL,'He\'s telling him','ganosea',NULL,NULL,'vt',NULL,NULL,NULL,'ᎦᏃᏎᎠ','jinosea','ᏥᏃᏎᎠ','hinohisi','ᎯᏃᎯᏏ','unosehdi','ᎤᏃᏎᏗ','unoselvi','ᎤᏃᏎᎸᎢ','ganosehoi','ᎦᏃᏎᎰᎢ','ganosea','','','tsinosea','hinohisi','unosedi','unoselvi','ganosehoi','ganoseɂa',NULL,'jinoseɂa','hinohisi','unosehdi','unoselvɂi','ganosehoɂi','VRB',NULL,NULL,NULL,NULL,'2020-10-13 22:18:02'),(102398,6,'agvdulo, alsduliɂa','he’s taking off, removing a mask, veil, face covering','algvduleɂa',NULL,NULL,'vt','So she arose and went away, and <u>laid aside (removed) her veil</u>... (Genesis 38:15)','Dulenvhno, ale uwenvsei, ale <u>ulgvdulesei</u>...','ᏚᎴᏁᏃ, ᎠᎴ ᎤᏪᏅᏎᎢ, ᎠᎴ <u>ᎤᎵᎬᏚᎴᏎᎢ</u>... (ᎼᏏ ᎢᎬᏱᏱ 38:19)','ᎠᎵᎬᏚᎴᎠ','galigvduleɂa','ᎦᎵᎬᏚᎴᎠ','halgvdulagi','ᎭᎵᎬᏚᎳᎩ','ulgvdulesdi','ᎤᎵᎬᏚᎴᏍᏗ','ulgvdulesvɂi','ᎤᎵᎬᏚᎴᏒᎢ','algvdulesgoɂi','ᎠᎵᎬᏚᎴᏍᎪᎢ','aligvdulea',NULL,'Dulenvno, ale uwenvsei, ale uligvdulesei...','galigvdulea','haligvdulagi','uligvdulesdi','uligvdulesvi','aligvdulesgoi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'uch',NULL,'agvdulo, alsduliɂa',NULL,'Dual and Plural pronouns take the \"de-\" plural prefix.','2020-11-16 01:37:40'),(102399,5,'agvdulo, alsduliɂa','he\'s putting on a mask, veil, face covering','algvduliɂa',NULL,NULL,'vt','She took off her widow’s garments, and <u>covered herself with a veil</u> (Genesis) 38:14)','Uwosulotsvhihno unuwosdi unuwoɂi, ale <u>ulgvdulaneɂi.</u>','ᎤᏬᏑᎶᏨᎯᏃ ᎤᏄᏬᏍᏗ ᎤᏄᏪᏎᎢ, ᎠᎴ <u>ᎤᎵᎬᏚᎳᏁᎢ</u> (ᎼᏏ ᎢᎬᏱᏱ 38:14)','ᎠᎵᎬᏚᎵᎠ','galigvduliɂa','ᎦᎵᎬᏚᎵᎠ','halgvdulvga','ᎭᎵᎬᏚᎸᎦ','ulgvdulodi','ᎤᎵᎬᏚᎶᏗ','ulgvdulanvɂi','ᎤᎵᎬᏚᎳᏅᎢ','algvdulisgoɂi','ᎠᎵᎬᏚᎵᏍᎪᎢ','aligvdulia',NULL,'uwosulotsvhino unuwosdi unuweseinulli ale nullnullnulluligvdulaneinullnullnullnulli nullmosi igvyiyi nullnullnullnullnullnull','galigvdulia','haligvdulvga','uligvdulodi','uligvdulanvi','aligvdulisgoi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UCH',NULL,'agvdulo, alsduliɂa',NULL,'Dual and Plural pronouns take the \"de-\" plural prefix for this verb.','2020-12-19 22:32:04'),(102400,1,'agvdulo, alisdulia','he\'s changing a mask (his), veil, face covering','alIgvdulaiyva',NULL,NULL,'vt',NULL,NULL,NULL,'ᎠᎵᎬᏚᎳᎢᏴᎠ','galigvdulaiyva','ᎦᎵᎬᏚᎳᎢᏴᎠ','haligvdulaiyvna','ᎭᎵᎬᏚᎳᎢᏴᎾ','uligvdulaiyvsdi','ᎤᎵᎬᏚᎳᎢᏴᏍᏗ','uligvdulaiyvsvi','ᎤᎵᎬᏚᎳᎢᏴᏒᎢ','aligvdulaiyvsgoi','ᎠᎵᎬᏚᎳᎢᏴᏍᎪᎢ','aligvdulaiyva',NULL,NULL,'galigvdulaiyva','haligvdulaiyvna','uligvdulaiyvsdi','uligvdulaiyvsvi','aligvdulaiyvsgoi','algvdulaɂiyvɂa',NULL,'galigvdulaɂiyvɂa','halgvdulaɂiyvna','ulgvdulaɂiyvsdi','ulgvdulaɂiyvsvɂi','algvdulaɂiyvsgoɂi','UCH',NULL,'agvdulo',NULL,'Dual and Plural pronouns take the \"de-\" plural prefix.','2020-12-19 22:32:29');
/*!40000 ALTER TABLE `likespreadsheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nlpcorpus`
--

DROP TABLE IF EXISTS `nlpcorpus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nlpcorpus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `syllabary` longtext NOT NULL,
  `english` longtext NOT NULL,
  `corpus_source_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbg5y7mvoxdgosfd61a60in7qn` (`corpus_source_id`),
  CONSTRAINT `FKbg5y7mvoxdgosfd61a60in7qn` FOREIGN KEY (`corpus_source_id`) REFERENCES `corpus_source` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nlpcorpus`
--

LOCK TABLES `nlpcorpus` WRITE;
/*!40000 ALTER TABLE `nlpcorpus` DISABLE KEYS */;
INSERT INTO `nlpcorpus` VALUES (1,2,'ᏌᎳᏓ ᏚᏏᎳᏛ','Charlotte\'s Web',45),(2,0,'I. ᎤᏓᎷᎸ ᏑᎾᎴ ᎠᎵᏍᏓᏴᏗ','I. Before Breakfast',45),(3,0,'“ᎦᏨ ᏛᏰᏏ ᎦᎷᏯᏍᏗ?” ᎤᏛᏛᏁ ᎤᏥ ᏲᎾ ᎤᏤᏍᏙ, ᏧᏃᏩ ᏓᏂᏌᎲᏍᎨ ᎦᏍᎩᎸ ᏑᎾᎴ ᎤᎾᎵᏍᏓᏴᏗ.','Where’s Papa going with that ax?” said Fern to her mother as they were setting the table for breakfast.',45),(3030,0,'Chunestudy feels at home as CHC curator - ᏣᎳᎩ','Chunestudy feels at home as CHC curator',46),(3031,0,'ᎠᏭ ᎤᏂᏴᏍᏗ, ᎣᎦᎳᎰᎹ.','PARK HILL, Okla.',46),(3050,0,'ᏐᏉ ᎢᏳᏩᎦᏘ, ᏥᏫᎾ ᏥᎨᎲ, ᎣᎩᎾᎵᎪᏓ ᎡᎲ ᎠᎨᏳᏣ.','Once when I was a young man, I had a girlfriend.',47),(3051,0,'ᏫᏥᎪᏩᏛᏗ ᎨᏒ, ᎢᏳᏓᎵᎭ ᏧᏪᏅᏒ.','Once in a while I would go visit her at her house.',47),(3052,0,'Ꮶ ᎢᏳᏟᎶᏓ ᎾᎥ, ᏧᏪᏅᏒ ᎨᎲ.','She lived about three miles away.',47),(3053,0,'ᎾᏗᏍᏊ, ᏒᎯᏰ ᏱᏄᎵᏍᏓᏅ ᏃᏉ ᎨᎪ, ᏧᎾᏕᎶᏆᏍᏗ ᏚᏂᏰᎵᏒ, ᎨᎪᏗ ᏒᏃᏱ ᎢᎪᎯᏓ ᏫᎨᏙᎰ.','In the evening I would leave, after school was finished, I would go and stay late into the night.',47),(3095,0,'ᎯᎠ ᎪᏪᎵ ᎧᏃᎮᎭ ᏧᏁᏢᏔᏅᏒ ᏥᏌ ᎦᎶᏁᏛ, ᏕᏫ ᎤᏪᏥ, ᎡᏆᎭᎻ ᎤᏪᏥ.','The book of the generation of Jesus Christ, the son of David, the son of Abraham.',48),(11051,0,'ᎬᏩᎦᏘᏯ ᎤᏓᏙᎵᏍᏗ ᎨᏒ ᎤᎬᏫᏳᎯ ᏥᏌ ᎦᎶᏁᏛ ᎢᎦᏤᎵᎦ ᎢᏤᎳᏗᏙᎮᏍᏗ ᏂᏥᎥᎢ. ᎡᎺᏅ.','The grace of the Lord Jesus be with the saints. Amen.',48),(11052,0,'“ᏐᏉ ᎢᏳᏩᎧᏘ Chapel Hill ᎨᏒᎢ…”','One Time in Chapel Hill…',49),(11072,0,'ᎤᏂᏩᏒ ᎣᏂ ᎾᏍᎩ ᏏᏉᏯ ᎤᏁᎳᏛ ᎤᏪᏘ ᎠᏍᏆᏂᎪᏗᏓᏅ ᎾᎿ ᏚᎵᏍᏗ ᎧᎸᎢ, ᎣᎦᎵᎰᎹ ᎠᏂᏃᎮᏍᎩ ᎤᎾᏙᏢᎯ ᎢᎤᏂᏍᏚᎢᏒᎢ ᎯᎠ ᎠᏓᏁᎸᎢ ᎾᎿ ᏕᎭᎷᏱ ᏔᎵᏍᎪ ᏐᏁᎵᏁ ᏃᎴ ᏓᏂᎳᏫᎬ ᎠᏊᎷᏍᏗ ᏚᏂᎦᎸᏒᎢ.','After purchasing Sequoyah’s Cabin Museum in September from the Oklahoma Historical Society, Cherokee Nation representatives re-opened the site on June 29 with a ceremonial ribbon-cutting.',50),(11073,0,'ᎯᎠ ᏓᏂᎳᏫᎬᎢ ᎤᎾᎵᏍᎪᎸᏔᏅ ᎠᎾᏓᏩᏛᎯᏙ ᎤᏂᎪᎵᏰᎢᏓᏍᏗ ᎯᎠ ᎤᏙᏢᏒ ᎤᏃᏢᎯᏌᏅᎢ.','The ceremony allowed visitors to look at the site’s improvements.',50),(11107,0,'ᎤᏔᏂᏓ ᎢᎾᏓ','The Beast',51),(11108,0,'ᏐᏉ ᎢᏳᏩᎫᏗ ᏣᎵ ᏃᎴ ᏍᏗᏫ ᎠᎵᏍᏓᏴᏗ ᎤᏂᏓᎾᏂᎩᏒᏎᎢ.','One day Charlie and Stephen went out for groceries.',51),(11152,0,'ᏩᎭᏯ ᏥᏚᎳᏑᏝᏅ: ᏏᏉᏯ ᎤᏃᎮᏢᏅ','WOLF WEARS SHOES Told by Sequoyah Guess',52),(11153,0,'ᎢᎸᎯᏳ ᏥᎨᏒ ᏂᎦᏓ ᎢᎾᎨ ᎠᏁᎯ ᏣᎳᎩ ᏣᏂᏬᏂᏍᎬ.','In the forever that was, all the forest dwellers spoke Cherokee.',52),(11250,0,'ᎠᏙᎯ ᏱᏤᏙᎳ, ᏙᎢᏳᏍᏗ ᎭᎦᏙᏍᏙᎢ?','When you go for a walk in the woods, what do you look at?',53),(11251,0,'ᏕᏧᎬ?','Trees?',53),(11352,0,'ᎠᏓᏅᏖᏍᎪ ᎢᏳᏍᏗ ᎠᎪᎵᏰᏍᎬ ᎦᏙᎯ.','She wonders about what she observes in the soil.',53),(11353,0,'ᎢᎪᎯᏓ ᎠᏛᏛᎮᏍᎪ ᎠᎵᏰᎾ.','Asmeret is always asking questions.',53),(11355,0,'ᎪᎨᏱᏨ ᎦᏙ ᏩᎾᎯ ᏱᏄᎵᏍᏔᎾ ᎦᏓᎷᎪᏗ, ᎠᏆᏤᎵ ᏏᏓᏁᎸ ᎣᏣᎴᏂᏍᎪ ᎣᏥᏫᏒᎥᏍᎬᎢ.','In the spring when the ground gets soft enough to turn, our family start putting in our garden.',54),(11356,0,'ᎤᎾᏨᏓᎵ ᎠᏎ ᎢᎪᎯᏓ ᎠᎬᏱ ᏗᏫᏍᏗ ᎨᏐᎢ.','The peas are always planted first.',54),(11374,0,'ᎤᏅᏓᏒ ᎾᎥᏂ ᎤᏍᏗ ᎠᎹ ᎦᏁᎮᎢ.','At the base of a large mountain was a small pond.',55),(11375,0,'ᏍᏈᏍᏓ ᎠᏣᏗ ᎠᏁᎮᎢ ᎠᎹ ᎦᏁᎲ.','Many fish lived in the pond.',55),(11472,0,'ᎠᎬᏱ ᏑᎾᎴ ᎤᏰᏤ ᎤᏃᎴ.','Wendy woke up early one morning.',56),(11473,0,'ᎤᎬᏍᏉᎡ, ᏕᎦᏅᏙᎬ ᏚᏅᎦᎸᎮ, ᏃᏉ ᏚᎭᏯᎴ ᏧᎿᏬᏍᏗ.','She washed her face, brushed her teeth, and began choosing clothes to wear.',56),(11490,0,'ᏌᏊᏃ ᎢᎦ ᎤᏍᏗ ᎠᏣᎳᎩ ᎠᏧᏣ ᏒᎦᏔ ᎤᎦᏔ ᎤᏫᏎᎢ ᎣᏂᏗᏜ ᏧᏪᏅᏒᎢ.','One day a little Cherokee boy planted an apple seed in his backyard.',57),(11491,0,'ᎾᏃ ᎠᏧᏣ ᎠᎹ ᎦᏁᏁᎮᎢ ᎤᎦᏔ ᎠᎴ ᎦᏄᎸ ᎧᎾᏍᏕᎸᎩᏍᎬᎢ.','The boy watered the seed and kept the weeds away.',57),(11533,0,'ᏌᎪᏂᎨ ᏥᏍᏆ ᏧᏓᏏ ᏧᏙᎢᏓ ᎡᎭᎢ, ᎣᏍᏓ ᎤᏓᏅᏘ ᎨᏎᎢ - ᎠᏍᏕᎵᏍᎨᎢ ᎤᏥ ᎠᏛᏅᎢᏍᏗᏍᎬ','There was a blue bird named Buddy, as happy as he could be - he was helping his mom get ready.',58),(11534,0,'ᏧᎦᏃᏮ ᏗᏁᏏᏎᎢ.','They were going south, you see.',58),(11600,0,'ᏗᏣᎧᏅᎦ ᎢᎾ ᎢᏗᎦᏔ ᏕᏈᎬᎢ, ᎠᏗᎭ ᎡᏙᏓ.','Look at the tall trees, says my father.',59),(11601,0,'ᎩᎦᎨᏃ ᎠᏓ ᏥᏕᏈᎦ.','They are redwood trees.',59),(11656,0,'ᎪᏍᏓᏱ ᏗᎦᏘᏍᏙᏗ ᎦᏰᏌᏛᎢ','Spearfinger',60),(11657,0,'ᎡᏘᏴ ᏥᎨᏒ ᎠᏂᏣᎳᎩ ᎠᏂᏴᏫ ᏙᎯᏯᎾᏊ ᏣᏁᎮᎢ ᎢᎾᎨᎢ ᎦᏚᏏ.','Long ago the Cherokee people lived in peace and harmony in the mountain forests.',60),(11706,0,'English','Cherokee',61),(11707,0,'ᎠᎵᏍᏓᏴᏗ ᎠᏲᎯᏍᏗ ᏲᏚᎵᎠ.','If you want to bring a side dish or a dessert, feel free to bring it.',61),(12133,0,'ᎡᏥᎸᏉᏗᏳ ᏗᏕᏚᎿᎢ ᏗᏥᎳᏫᎩ, ᎠᎴ ᎡᏥᎸᏉᏗᏳ ᎢᏥᎦᏴᎵᎨᎢ ᏩᏥᏂ ᎾᏅᎾᏛ ᎨᏥᏁᏤᎸᎯ ᏗᏥᎳᏫᏦᏅᎯ, ᎢᏣᏛᎪᏗ, ᎯᎠ ᎪᏪᎵ ᏫᏨᏅᎥᏏ.','To the Honorable the Senate and House of Representatives of the United States of America, in Congress assembled:',62),(12134,0,'ᎰᏍᎩᏂ ᎥᏝ ᏱᎪᎯᎩ ᎤᏓᎴᏅᎲ, ᏰᎵ ᎤᏓᏅᏖᏗᏳ ᏃᎦᎵᏍᏓᏁᎭ, ᎾᏍᎩᏃ ᎢᏳᏍᏗ ᎢᏣᏓᏙᎨᏣᏘᏳ ᎣᏥᎦᏔᎲ, ᎿᏉ ᏗᏥᏅ ᏬᏣᎦᏔᎲᏍᏓ, ᎢᏨᏯᏓᎪᎵᏍᏓᏏ.','Circumstances of late occurrence have troubled our hearts, and induced us at this time to appeal to you, knowing that you are generous and just.',62),(12135,0,'ᎤᏂᏦᏍᎩᏂ ᎢᏳᎾᏛᎿᏕᎩ, ᎠᎴ ᏗᏂᏩᎾᎦᎳᏉ ᏗᏂᏲᎵ ᏣᎾᏓᏙᎵᏍᏗᏍᎪ ᎢᏳᏍᏗ ᏃᏣᏛᏁᎵᎦ.','As weak and poor children are accustomed to look to their guardians and patrons for protection, so we would come and make our grievances known.',62),(12136,0,'ᏓᏍᎩᏯᏛᏓᏍᏓᏁᎵᏧ?','Will you listen to us?',62);
/*!40000 ALTER TABLE `nlpcorpus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_of_speech`
--

DROP TABLE IF EXISTS `part_of_speech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `part_of_speech` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `partofspeech` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_of_speech`
--

LOCK TABLES `part_of_speech` WRITE;
/*!40000 ALTER TABLE `part_of_speech` DISABLE KEYS */;
INSERT INTO `part_of_speech` VALUES (1,0,'intransitive verb','vi'),(2,0,'transitive verb','vt'),(3,0,'adjective','adj'),(4,0,'adverb','adv'),(5,0,'conjunction','conj'),(6,0,'interjection','interj'),(7,0,'prefix','prefix'),(8,0,'suffix','suf'),(9,0,'pronoun','pron'),(10,0,'preposition','prep'),(11,0,'noun','n');
/*!40000 ALTER TABLE `part_of_speech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,0,'useFont','true'),(2,0,'showAutocomplete','true'),(3,0,'newSearch','true');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_management`
--

DROP TABLE IF EXISTS `source_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `source_management` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `bibliography_fullapa` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `text_color` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `search_parameter` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_management`
--

LOCK TABLES `source_management` WRITE;
/*!40000 ALTER TABLE `source_management` DISABLE KEYS */;
INSERT INTO `source_management` VALUES (1,1,'Dr Durbin Feeling Cherokee English Dictionary 1975','ced','white','black',_binary '','Cherokee Dictinary','Cherokee English Dictionary','includeCED',''),(2,2,'Consortium Word List','cwl','grey','white',_binary '','cwl','cwl','includeConsortiumWordList','https://www.cherokee.org/media/4emjgbyy/2019consortium_wordlist.pdf'),(3,2,'Microsoft Computer Terms','msct','navy','white',_binary '','msct','msct','includeMicrosoftWordList','https://www.microsoft.com/en-us/p/%e1%8f%a3%e1%8e%b3%e1%8e%a9-%e1%8e%a1%e1%8f%8d%e1%8e%a6%e1%8f%82-%e1%8e%a5%e1%8e%a6%e1%8f%94%e1%8e%b2%e1%8e%a2-%e1%8e%a6%e1%8f%87%e1%8f%85%e1%8e%af/9mx15485n3rk?cid=msft_web_collection&activetab=pivot:overviewtab'),(4,2,'Medical terms in Giduwa (North Carolina/eastern dialect), based on class notes provided by Bo Taylor of the Eastern Band.','ncmed','#8B0000','white',_binary '','ncmed','ncmed','includeNCMedWordList','na'),(5,2,'Medical terms provided by Cherokee Nation (western dialect)','cnomed','#DC143C','white',_binary '','cnomed','cnomed','includeCNOMedWordList','na'),(6,2,'Noquisi Word List','noq','yellow','black',_binary '','noq','noq','includeNOQWordList','na'),(7,2,'Raven Rock Dictionary','rrd','#87CEEB','black',_binary '','rrd','rrd','includeRRD','na'),(9,1,'Holmes, R. B., & Smith, B. S. (1997). Beginning Cherokee. Norman: University of Oklahoma Press.','hsbc','orange','black',_binary '','Beginning Cherokee','Beginning Cherokee Book','includeHolmesSmith','n/a'),(10,0,'Montgomery-Anderson, B. (2008). A reference grammar of Oklahoma Cherokee.','magok','black','black',_binary '','A REFERENCE GRAMMAR OF OKLAHOMA CHEROKEE','A REFERENCE GRAMMAR OF OKLAHOMA CHEROKEE','includeMAGOK','na'),(11,0,'CED FB Group','fbgp','black','black',_binary '','FB Group','FB Group','includeFBGP','https://www.facebook.com/groups/656137241113977/'),(12,1,'CN Language Documents','cnld','black','black',_binary '','Cherokee Nation Language Documents','cnld','includeCNLD','https://cherokee.org/About-The-Nation/Cherokee-Language/Downloads'),(13,3,'Kirk, W. (2012). Verb Reference Book Didehloqwasgi. Northeastern State University','VRB','#035efc','white',_binary '','Verb Reference Book Didehloqwasgi','Cherokee Verb Reference Book','includeVRB','n/a'),(14,5,'Banks, William H. Jr. (1953), \"Ethnobotany of the Cherokee Indians. \" Master\'s Thesis, University of Tennessee','Banks','green','white',_binary '','Banks PDF','Banks PDF','Banks','Banks'),(15,1,'Cherokee New Testament','CNT','green','white',_binary '','Cherokee New Testament','The Biblical New Testament in Cherokee','includeCNT','na'),(16,3,'Hiroto Uchihara Tone and Accent in Oklahoma Cherokee (2013)','UCH','grey','black',_binary '','Hiroto Uchihara','Various linguistic articles (IJAL) and dissertation','includeUCH','n/a');
/*!40000 ALTER TABLE `source_management` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-13 13:39:23
