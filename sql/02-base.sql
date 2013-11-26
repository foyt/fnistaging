-- MySQL dump 10.13  Distrib 5.6.14, for osx10.7 (x86_64)
--
-- Host: localhost    Database: fni
-- ------------------------------------------------------
-- Server version	5.6.14

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
-- Table structure for table `BookPublication`
--

DROP TABLE IF EXISTS `BookPublication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BookPublication` (
  `numberOfPages` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `downloadableFile_id` bigint(20) DEFAULT NULL,
  `printableFile_id` bigint(20) DEFAULT NULL,
  `downloadCount` bigint(20) NOT NULL,
  `printCount` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDEF10B637A4BC5A2` (`id`),
  KEY `FKDEF10B631A0DA1FA` (`printableFile_id`),
  KEY `FKDEF10B63FFFBE53F` (`downloadableFile_id`),
  CONSTRAINT `FKDEF10B631A0DA1FA` FOREIGN KEY (`printableFile_id`) REFERENCES `PublicationFile` (`id`),
  CONSTRAINT `FKDEF10B637A4BC5A2` FOREIGN KEY (`id`) REFERENCES `publication` (`id`),
  CONSTRAINT `FKDEF10B63FFFBE53F` FOREIGN KEY (`downloadableFile_id`) REFERENCES `PublicationFile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ForumTopicWatcher`
--

DROP TABLE IF EXISTS `ForumTopicWatcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ForumTopicWatcher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `topic_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK409EB92E843409C0` (`user_id`),
  KEY `FK409EB92E49D83166` (`topic_id`),
  CONSTRAINT `FK409EB92E49D83166` FOREIGN KEY (`topic_id`) REFERENCES `ForumTopic` (`id`),
  CONSTRAINT `FK409EB92E843409C0` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GoogleDocument`
--

DROP TABLE IF EXISTS `GoogleDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GoogleDocument` (
  `documentId` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  `mimeType` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK12901694AF6980D4` (`id`),
  CONSTRAINT `FK12901694AF6980D4` FOREIGN KEY (`id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Order_`
--

DROP TABLE IF EXISTS `Order_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `canceled` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `customerCompany` varchar(255) DEFAULT NULL,
  `customerEmail` varchar(255) NOT NULL,
  `customerFirstName` varchar(255) NOT NULL,
  `customerLastName` varchar(255) NOT NULL,
  `customerMobile` varchar(255) DEFAULT NULL,
  `customerPhone` varchar(255) DEFAULT NULL,
  `delivered` datetime DEFAULT NULL,
  `notes` longtext,
  `orderStatus` varchar(255) DEFAULT NULL,
  `paid` datetime DEFAULT NULL,
  `shipped` datetime DEFAULT NULL,
  `shippingCosts` double DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `deliveryAddress_id` bigint(20) DEFAULT NULL,
  `accessKey` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8D444EF1E8F43688` (`deliveryAddress_id`),
  KEY `FK8D444EF1235998CD` (`customer_id`),
  CONSTRAINT `FK8D444EF1235998CD` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK8D444EF1E8F43688` FOREIGN KEY (`deliveryAddress_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Publication`
--

DROP TABLE IF EXISTS `Publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publication` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `depth` int(11) DEFAULT NULL,
  `description` longtext,
  `height` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `published` bit(1) NOT NULL,
  `urlName` varchar(255) NOT NULL,
  `weight` double DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `defaultImage_id` bigint(20) DEFAULT NULL,
  `forumTopic_id` bigint(20) DEFAULT NULL,
  `modifier_id` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK23254A0C62DEC8D4` (`defaultImage_id`),
  KEY `FK23254A0CBC9F0D87` (`forumTopic_id`),
  KEY `FK23254A0C30F50734` (`modifier_id`),
  KEY `FK23254A0CDF300DBF` (`creator_id`),
  KEY `FK23254A0C96B36FDD` (`language_id`),
  CONSTRAINT `FK23254A0C96B36FDD` FOREIGN KEY (`language_id`) REFERENCES `Language` (`id`),
  CONSTRAINT `FK23254A0C30F50734` FOREIGN KEY (`modifier_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK23254A0C62DEC8D4` FOREIGN KEY (`defaultImage_id`) REFERENCES `publicationimage` (`id`),
  CONSTRAINT `FK23254A0CBC9F0D87` FOREIGN KEY (`forumTopic_id`) REFERENCES `forumtopic` (`id`),
  CONSTRAINT `FK23254A0CDF300DBF` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addressType` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postalCode` varchar(255) NOT NULL,
  `street1` varchar(255) NOT NULL,
  `street2` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1ED033D4843409C0` (`user_id`),
  KEY `FK1ED033D4FE69B477` (`country_id`),
  CONSTRAINT `FK1ED033D4843409C0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK1ED033D4FE69B477` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `binary_`
--

DROP TABLE IF EXISTS `binary_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `binary_` (
  `contentType` varchar(255) DEFAULT NULL,
  `data` longblob,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5CC40C5EAF6980D4` (`id`),
  CONSTRAINT `FK5CC40C5EAF6980D4` FOREIGN KEY (`id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blogcategory`
--

DROP TABLE IF EXISTS `blogcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nextSync` datetime DEFAULT NULL,
  `sync` varchar(255) NOT NULL,
  `syncUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blogentry`
--

DROP TABLE IF EXISTS `blogentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogentry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorName` varchar(255) DEFAULT NULL,
  `content` longtext,
  `created` datetime NOT NULL,
  `guid` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `modified` datetime NOT NULL,
  `summary` longtext NOT NULL,
  `title` varchar(255) NOT NULL,
  `urlName` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `modifier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB03A7DD0FA83A208` (`category_id`),
  KEY `FKB03A7DD030F50734` (`modifier_id`),
  KEY `FKB03A7DD0DF300DBF` (`creator_id`),
  CONSTRAINT `FKB03A7DD030F50734` FOREIGN KEY (`modifier_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKB03A7DD0DF300DBF` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKB03A7DD0FA83A208` FOREIGN KEY (`category_id`) REFERENCES `blogcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blogentrytag`
--

DROP TABLE IF EXISTS `blogentrytag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogentrytag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entry_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE6B837AA504B562C` (`entry_id`),
  KEY `FKE6B837AACF6AE9AC` (`tag_id`),
  CONSTRAINT `FKE6B837AA504B562C` FOREIGN KEY (`entry_id`) REFERENCES `blogentry` (`id`),
  CONSTRAINT `FKE6B837AACF6AE9AC` FOREIGN KEY (`tag_id`) REFERENCES `blogtag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blogtag`
--

DROP TABLE IF EXISTS `blogtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogtag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chatmessage`
--

DROP TABLE IF EXISTS `chatmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `received` bit(1) NOT NULL,
  `sent` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `to_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK11CAB96F91639DD3` (`to_id`),
  KEY `FK11CAB96F67605244` (`from_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chatpresence`
--

DROP TABLE IF EXISTS `chatpresence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatpresence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mode` varchar(255) DEFAULT NULL,
  `sent` datetime DEFAULT NULL,
  `statusMessage` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `to_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF6FF109391639DD3` (`to_id`),
  KEY `FKF6FF109367605244` (`from_id`)
) ENGINE=MyISAM AUTO_INCREMENT=798 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=493 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `data` longtext,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3737353BAF6980D4` (`id`),
  CONSTRAINT `FK3737353BAF6980D4` FOREIGN KEY (`id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documentrevision`
--

DROP TABLE IF EXISTS `documentrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentrevision` (
  `id` bigint(20) NOT NULL,
  `document_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5B46E636EF26266C` (`document_id`),
  KEY `FK5B46E636E09D3CF` (`id`),
  CONSTRAINT `FK5B46E636E09D3CF` FOREIGN KEY (`id`) REFERENCES `materialrevision` (`id`),
  CONSTRAINT `FK5B46E636EF26266C` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropboxfile`
--

DROP TABLE IF EXISTS `dropboxfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropboxfile` (
  `dropboxPath` varchar(255) NOT NULL,
  `mimeType` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK15ECA7F8AF6980D4` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropboxfolder`
--

DROP TABLE IF EXISTS `dropboxfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropboxfolder` (
  `id` bigint(20) NOT NULL,
  `dropboxPath` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4DB71FEAC2E9B49B` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dropboxrootfolder`
--

DROP TABLE IF EXISTS `dropboxrootfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropboxrootfolder` (
  `deltaCursor` varchar(255) DEFAULT NULL,
  `lastSynchronized` datetime DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK208BBD6CC2E9B49B` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK21699CBBC2A42E` (`id`),
  CONSTRAINT `FK21699CBBC2A42E` FOREIGN KEY (`id`) REFERENCES `binary_` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7DC2088EAF6980D4` (`id`),
  CONSTRAINT `FK7DC2088EAF6980D4` FOREIGN KEY (`id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `name` varchar(255) NOT NULL,
  `urlName` varchar(255) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `allowTopicCreation` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK40E9D014D4EA1E` (`category_id`),
  CONSTRAINT `FK40E9D014D4EA1E` FOREIGN KEY (`category_id`) REFERENCES `forumcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forumcategory`
--

DROP TABLE IF EXISTS `forumcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forumcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forummessage`
--

DROP TABLE IF EXISTS `forummessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forummessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `views` bigint(20) NOT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCBB87C6A63CE750` (`author_id`),
  CONSTRAINT `FKCBB87C6A63CE750` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forumpost`
--

DROP TABLE IF EXISTS `forumpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forumpost` (
  `content` longtext NOT NULL,
  `id` bigint(20) NOT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF1AC4141CBAD77E` (`id`),
  KEY `FKF1AC4141743E60B6` (`topic_id`),
  CONSTRAINT `FKF1AC4141743E60B6` FOREIGN KEY (`topic_id`) REFERENCES `forumtopic` (`id`),
  CONSTRAINT `FKF1AC4141CBAD77E` FOREIGN KEY (`id`) REFERENCES `forummessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forumtopic`
--

DROP TABLE IF EXISTS `forumtopic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forumtopic` (
  `subject` varchar(255) NOT NULL,
  `urlName` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  `forum_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK441438AECBAD77E` (`id`),
  KEY `FK441438AE8DE625FD` (`forum_id`),
  CONSTRAINT `FK441438AE8DE625FD` FOREIGN KEY (`forum_id`) REFERENCES `forum` (`id`),
  CONSTRAINT `FK441438AECBAD77E` FOREIGN KEY (`id`) REFERENCES `forummessage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `friendconfirmkey`
--

DROP TABLE IF EXISTS `friendconfirmkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendconfirmkey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `value` varchar(255) NOT NULL,
  `friend_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8FF3C4DD4583F510` (`user_id`),
  KEY `FK8FF3C4DD8D8015D` (`friend_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gamelibrarytag`
--

DROP TABLE IF EXISTS `gamelibrarytag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gamelibrarytag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `text` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK437B93BBBC2A42E` (`id`),
  CONSTRAINT `FK437B93BBBC2A42E` FOREIGN KEY (`id`) REFERENCES `binary_` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `internalauth`
--

DROP TABLE IF EXISTS `internalauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internalauth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `verified` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4FEC6254583F510` (`user_id`),
  CONSTRAINT `FK4FEC6254583F510` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ISO2` varchar(255) DEFAULT NULL,
  `ISO3` varchar(255) DEFAULT NULL,
  `localized` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `illusionSession_id` bigint(20) DEFAULT NULL,
  `modifier_id` bigint(20) DEFAULT NULL,
  `millimetersPerPoint` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK12D3CF244F284` (`modifier_id`),
  KEY `FK12D3CA07FF90F` (`creator_id`),
  KEY `FK12D3C877E8AFD` (`illusionSession_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maplayer`
--

DROP TABLE IF EXISTS `maplayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maplayer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `indexColumn` int(11) NOT NULL,
  `map_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD729D75CC069B98` (`map_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maptile`
--

DROP TABLE IF EXISTS `maptile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maptile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contentType` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `fileName` longtext NOT NULL,
  `modified` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `modifier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9517F60AF244F284` (`modifier_id`),
  KEY `FK9517F60AA07FF90F` (`creator_id`),
  CONSTRAINT `FK9517F60AA07FF90F` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK9517F60AF244F284` FOREIGN KEY (`modifier_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maptiletag`
--

DROP TABLE IF EXISTS `maptiletag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maptiletag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mapTile_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2F621D304149C9F8` (`mapTile_id`),
  KEY `FK2F621D30CEB137C7` (`tag_id`),
  CONSTRAINT `FK2F621D304149C9F8` FOREIGN KEY (`mapTile_id`) REFERENCES `maptile` (`id`),
  CONSTRAINT `FK2F621D30CEB137C7` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maptokenlayer`
--

DROP TABLE IF EXISTS `maptokenlayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maptokenlayer` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK47912D3491D8B9D2` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mapvectorimagelayer`
--

DROP TABLE IF EXISTS `mapvectorimagelayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapvectorimagelayer` (
  `id` bigint(20) NOT NULL,
  `vectorImage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC299BB591D8B9D2` (`id`),
  KEY `FKC299BB51162EC8` (`vectorImage_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `publicity` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `urlName` varchar(255) NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `modifier_id` bigint(20) DEFAULT NULL,
  `parentFolder_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_URLNAME` (`creator_id`,`parentFolder_id`,`urlName`),
  KEY `FK15ADC947B25D94A2` (`parentFolder_id`),
  KEY `FK15ADC947F244F284` (`modifier_id`),
  KEY `FK15ADC947A07FF90F` (`creator_id`),
  KEY `FK15ADC947DA22168D` (`language_id`),
  CONSTRAINT `FK15ADC947A07FF90F` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK15ADC947B25D94A2` FOREIGN KEY (`parentFolder_id`) REFERENCES `folder` (`id`),
  CONSTRAINT `FK15ADC947DA22168D` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `FK15ADC947F244F284` FOREIGN KEY (`modifier_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1573 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materialrevision`
--

DROP TABLE IF EXISTS `materialrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialrevision` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `completeRevision` bit(1) NOT NULL,
  `compressed` bit(1) NOT NULL,
  `created` datetime NOT NULL,
  `data` longblob,
  `revision` bigint(20) NOT NULL,
  `checksum` varchar(255) DEFAULT NULL,
  `clientId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37692 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materialrevisionsetting`
--

DROP TABLE IF EXISTS `materialrevisionsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialrevisionsetting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `key_id` bigint(20) DEFAULT NULL,
  `materialRevision_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2946C9AEC8AEB583` (`key_id`),
  KEY `FK2946C9AEB465B2C` (`materialRevision_id`)
) ENGINE=MyISAM AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materialrevisiontag`
--

DROP TABLE IF EXISTS `materialrevisiontag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialrevisiontag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `removed` tinyint(1) NOT NULL,
  `materialRevision_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAB59D9F8B465B2C` (`materialRevision_id`),
  KEY `FKAB59D9F8CEB137C7` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materialsetting`
--

DROP TABLE IF EXISTS `materialsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialsetting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `key_id` bigint(20) DEFAULT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK12F92F09C8AEB583` (`key_id`),
  KEY `FK12F92F0916B31AEC` (`material_id`)
) ENGINE=MyISAM AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materialsettingkey`
--

DROP TABLE IF EXISTS `materialsettingkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialsettingkey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materialtag`
--

DROP TABLE IF EXISTS `materialtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialtag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `material_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCAB324D316B31AEC` (`material_id`),
  KEY `FKCAB324D3CEB137C7` (`tag_id`),
  CONSTRAINT `FKCAB324D316B31AEC` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  CONSTRAINT `FKCAB324D3CEB137C7` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materialthumbnail`
--

DROP TABLE IF EXISTS `materialthumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialthumbnail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longblob,
  `contentType` varchar(255) DEFAULT NULL,
  `size` varchar(255) NOT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2DE3276516B31AEC` (`material_id`),
  CONSTRAINT `FK2DE3276516B31AEC` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materialview`
--

DROP TABLE IF EXISTS `materialview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialview` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `viewed` datetime NOT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8BB27C8C4583F510` (`user_id`),
  KEY `FK8BB27C8C16B31AEC` (`material_id`),
  CONSTRAINT `FK8BB27C8C16B31AEC` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  CONSTRAINT `FK8BB27C8C4583F510` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `sent` datetime NOT NULL,
  `subject` varchar(255) NOT NULL,
  `threadId` varchar(255) NOT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9C2397E750343666` (`sender_id`),
  CONSTRAINT `FK9C2397E750343666` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messagefolder`
--

DROP TABLE IF EXISTS `messagefolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messagefolder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC57D735B16AA528` (`owner_id`),
  CONSTRAINT `FKBC57D735B16AA528` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multiuserchatmessage`
--

DROP TABLE IF EXISTS `multiuserchatmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multiuserchatmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `roomJid` varchar(255) NOT NULL,
  `sent` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8EF7EE6B67605244` (`from_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multiuserchatpresence`
--

DROP TABLE IF EXISTS `multiuserchatpresence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multiuserchatpresence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mode` varchar(255) DEFAULT NULL,
  `roomJid` varchar(255) NOT NULL,
  `sent` datetime DEFAULT NULL,
  `statusMessage` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `to_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1F787B1791639DD3` (`to_id`),
  KEY `FK1F787B1767605244` (`from_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unitPrice` double DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `publication_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK60163F61A66A4895` (`publication_id`),
  KEY `FK60163F61646E3D95` (`order_id`),
  CONSTRAINT `FK60163F61646E3D95` FOREIGN KEY (`order_id`) REFERENCES `order_` (`id`),
  CONSTRAINT `FK60163F61A66A4895` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passwordresetkey`
--

DROP TABLE IF EXISTS `passwordresetkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwordresetkey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `value` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEA5B6A6B4583F510` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pdf`
--

DROP TABLE IF EXISTS `pdf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdf` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK138D2BBC2A42E` (`id`),
  CONSTRAINT `FK138D2BBC2A42E` FOREIGN KEY (`id`) REFERENCES `binary_` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permalink`
--

DROP TABLE IF EXISTS `permalink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permalink` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9F3B0EEB16B31AEC` (`material_id`),
  CONSTRAINT `FK9F3B0EEB16B31AEC` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publicationauthor`
--

DROP TABLE IF EXISTS `publicationauthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicationauthor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `publication_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF0E29EB7A66A4895` (`publication_id`),
  KEY `FKF0E29EB7E4ECFC00` (`author_id`),
  CONSTRAINT `FKF0E29EB7A66A4895` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`id`),
  CONSTRAINT `FKF0E29EB7E4ECFC00` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publicationfile`
--

DROP TABLE IF EXISTS `publicationfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicationfile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longblob NOT NULL,
  `contentType` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publicationimage`
--

DROP TABLE IF EXISTS `publicationimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicationimage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longblob NOT NULL,
  `contentType` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `modifier_id` bigint(20) DEFAULT NULL,
  `publication_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6B4AD6AFA66A4895` (`publication_id`),
  KEY `FK6B4AD6AF30F50734` (`modifier_id`),
  KEY `FK6B4AD6AFDF300DBF` (`creator_id`),
  CONSTRAINT `FK6B4AD6AF30F50734` FOREIGN KEY (`modifier_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK6B4AD6AFA66A4895` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`id`),
  CONSTRAINT `FK6B4AD6AFDF300DBF` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publicationtag`
--

DROP TABLE IF EXISTS `publicationtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicationtag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF06531EEA66A4895` (`publication_id`),
  KEY `FKF06531EEEA6FE216` (`tag_id`),
  CONSTRAINT `FKF06531EEA66A4895` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`id`),
  CONSTRAINT `FKF06531EEEA6FE216` FOREIGN KEY (`tag_id`) REFERENCES `gamelibrarytag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipientmessage`
--

DROP TABLE IF EXISTS `recipientmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipientmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `read_` bit(1) NOT NULL,
  `removed` bit(1) NOT NULL,
  `starred` bit(1) NOT NULL,
  `folder_id` bigint(20) DEFAULT NULL,
  `message_id` bigint(20) DEFAULT NULL,
  `recipient_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK14DF8BCE9103A32A` (`folder_id`),
  KEY `FK14DF8BCE99A72402` (`recipient_id`),
  KEY `FK14DF8BCEDBB2B063` (`message_id`),
  CONSTRAINT `FK14DF8BCE9103A32A` FOREIGN KEY (`folder_id`) REFERENCES `messagefolder` (`id`),
  CONSTRAINT `FK14DF8BCE99A72402` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK14DF8BCEDBB2B063` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `deliveryMethodId` varchar(255) DEFAULT NULL,
  `modified` datetime NOT NULL,
  `sessionId` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `deliveryAddress_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKABBC40C8E8F43688` (`deliveryAddress_id`),
  KEY `FKABBC40C8235998CD` (`customer_id`),
  CONSTRAINT `FKABBC40C8235998CD` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKABBC40C8E8F43688` FOREIGN KEY (`deliveryAddress_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shoppingcartitem`
--

DROP TABLE IF EXISTS `shoppingcartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcartitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `publication_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFEC18BFBA66A4895` (`publication_id`),
  KEY `FKFEC18BFB5A6F4447` (`cart_id`),
  CONSTRAINT `FKFEC18BFB5A6F4447` FOREIGN KEY (`cart_id`) REFERENCES `shoppingcart` (`id`),
  CONSTRAINT `FKFEC18BFBA66A4895` FOREIGN KEY (`publication_id`) REFERENCES `publication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `starredmaterial`
--

DROP TABLE IF EXISTS `starredmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `starredmaterial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF69E4B264583F510` (`user_id`),
  KEY `FKF69E4B2616B31AEC` (`material_id`),
  CONSTRAINT `FKF69E4B2616B31AEC` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  CONSTRAINT `FKF69E4B264583F510` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemsetting`
--

DROP TABLE IF EXISTS `systemsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemsetting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `settingKey` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ubuntuonefile`
--

DROP TABLE IF EXISTS `ubuntuonefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubuntuonefile` (
  `contentPath` varchar(255) NOT NULL,
  `generation` bigint(20) NOT NULL,
  `mimeType` varchar(255) NOT NULL,
  `ubuntuOneKey` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE4F49FFBAF6980D4` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ubuntuonefolder`
--

DROP TABLE IF EXISTS `ubuntuonefolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubuntuonefolder` (
  `contentPath` varchar(255) NOT NULL,
  `generation` bigint(20) NOT NULL,
  `ubuntuOneKey` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7AA1232DC2E9B49B` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ubuntuonerootfolder`
--

DROP TABLE IF EXISTS `ubuntuonerootfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubuntuonerootfolder` (
  `generation` bigint(20) DEFAULT NULL,
  `lastSynchronized` datetime DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF66C672FC2E9B49B` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archived` bit(1) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `premiumExpires` datetime DEFAULT NULL,
  `registrationDate` datetime NOT NULL,
  `role` varchar(255) NOT NULL,
  `about` longtext,
  `mobile` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `profileImageSource` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userchatcredentials`
--

DROP TABLE IF EXISTS `userchatcredentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userchatcredentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `userJid` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK746255194583F510` (`user_id`),
  CONSTRAINT `FK746255194583F510` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userchattoken`
--

DROP TABLE IF EXISTS `userchattoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userchattoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4A305D64583F510` (`user_id`),
  CONSTRAINT `FK4A305D64583F510` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usercontactfield`
--

DROP TABLE IF EXISTS `usercontactfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usercontactfield` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEA6A4C45843409C0` (`user_id`),
  CONSTRAINT `FKEA6A4C45843409C0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useremail`
--

DROP TABLE IF EXISTS `useremail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useremail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `primaryEmail` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK8A3D36714583F510` (`user_id`),
  CONSTRAINT `FK8A3D36714583F510` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userfriend`
--

DROP TABLE IF EXISTS `userfriend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userfriend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `confirmed` bit(1) NOT NULL,
  `friend_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBF687A694583F510` (`user_id`),
  KEY `FKBF687A698D8015D` (`friend_id`),
  CONSTRAINT `FKBF687A694583F510` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKBF687A698D8015D` FOREIGN KEY (`friend_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useridentifier`
--

DROP TABLE IF EXISTS `useridentifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useridentifier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `authSource` varchar(255) NOT NULL,
  `sourceId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90C83EF44583F510` (`user_id`),
  CONSTRAINT `FK90C83EF44583F510` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userimage`
--

DROP TABLE IF EXISTS `userimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userimage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contentType` varchar(255) DEFAULT NULL,
  `data` longblob,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8A759430843409C0` (`user_id`),
  CONSTRAINT `FK8A759430843409C0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usermaterialrole`
--

DROP TABLE IF EXISTS `usermaterialrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermaterialrole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK218999C84583F510` (`user_id`),
  KEY `FK218999C816B31AEC` (`material_id`),
  CONSTRAINT `FK218999C816B31AEC` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  CONSTRAINT `FK218999C84583F510` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersetting`
--

DROP TABLE IF EXISTS `usersetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersetting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `userSettingKey_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC7CA97E54583F510` (`user_id`),
  KEY `FKC7CA97E51C91B730` (`userSettingKey_id`),
  CONSTRAINT `FKC7CA97E51C91B730` FOREIGN KEY (`userSettingKey_id`) REFERENCES `usersettingkey` (`id`),
  CONSTRAINT `FKC7CA97E54583F510` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=729 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usersettingkey`
--

DROP TABLE IF EXISTS `usersettingkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersettingkey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usertoken`
--

DROP TABLE IF EXISTS `usertoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expires` datetime DEFAULT NULL,
  `grantedScopes` varchar(255) DEFAULT NULL,
  `token` varchar(1024) NOT NULL,
  `userIdentifier_id` bigint(20) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8B11A4CEF9F7110` (`userIdentifier_id`),
  CONSTRAINT `FK8B11A4CEF9F7110` FOREIGN KEY (`userIdentifier_id`) REFERENCES `useridentifier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=909 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userverificationkey`
--

DROP TABLE IF EXISTS `userverificationkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userverificationkey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `value` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK237559CA4583F510` (`user_id`),
  CONSTRAINT `FK237559CA4583F510` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vectorimage`
--

DROP TABLE IF EXISTS `vectorimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vectorimage` (
  `data` longtext,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK84E0D1B8AF6980D4` (`id`),
  CONSTRAINT `FK84E0D1B8AF6980D4` FOREIGN KEY (`id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vectorimagerevision`
--

DROP TABLE IF EXISTS `vectorimagerevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vectorimagerevision` (
  `id` bigint(20) NOT NULL,
  `vectorImage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8FEB5B3E09D3CF` (`id`),
  KEY `FK8FEB5B31162EC8` (`vectorImage_id`),
  CONSTRAINT `FK8FEB5B31162EC8` FOREIGN KEY (`vectorImage_id`) REFERENCES `vectorimage` (`id`),
  CONSTRAINT `FK8FEB5B3E09D3CF` FOREIGN KEY (`id`) REFERENCES `materialrevision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xmppuser`
--

DROP TABLE IF EXISTS `xmppuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xmppuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userJid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-17 17:38:05
