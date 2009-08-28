-- MySQL dump 10.13  Distrib 5.1.37, for Win32 (ia32)
--
-- Host: localhost    Database: julia
-- ------------------------------------------------------
-- Server version	5.1.37

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
-- Current Database: `julia`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `julia` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `julia`;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `c_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `title_addition` varchar(20) NOT NULL,
  `firm_name` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `plz` varchar(10) NOT NULL,
  `tel_1` varchar(20) NOT NULL,
  `tel_2` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `town` varchar(45) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Yusuf','Mohammed','Dr. Phil.','Google','Strasse','','','','','',''),(2,'John','Smith','Dr. Phil.3','Google4','Strasse5','154236','tel_18','tel_29','fax10','mymail11','Berlin7'),(3,'','','','','','','','','','','');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `j_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `finished` tinyint(3) unsigned NOT NULL,
  `bid_needed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `c_first_name` varchar(45) NOT NULL,
  `c_last_name` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `c_tel_1` varchar(20) NOT NULL,
  `c_tel_2` varchar(20) NOT NULL,
  `c_street` varchar(45) NOT NULL,
  `c_town` varchar(45) NOT NULL,
  `c_email` varchar(45) NOT NULL,
  `c_plz` varchar(10) NOT NULL,
  `c_title_addition` varchar(20) NOT NULL,
  `c_id` int(10) unsigned NOT NULL,
  `short_description` varchar(150) NOT NULL,
  `c_fax` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `bill_send` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `paid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `c_firm_name` varchar(45) NOT NULL,
  PRIMARY KEY (`j_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,0,0,'TV broken','Felix','Stiehler','','','Strasse','','','','',1,'1','','2009-08-27 20:20:01',0,0,''),(2,0,0,'PC broken','Felix','Stiehler','','','Strasse','','','','',1,'23','','2009-08-27 22:20:01',0,0,''),(3,0,0,'Graka broken','Felix2','Stiehler1','tel_18','tel_29','Strasse5','Berlin7','mymail11','154236','',2,'345','fax10','2009-08-27 18:20:01',0,0,''),(9,0,1,'lang','Felix','Stiehler','','','Strasse','','','','',1,'Graka im Eimer','','2009-08-28 03:02:57',0,0,'');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_service`
--

DROP TABLE IF EXISTS `job_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_service` (
  `jsv_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jsvt_id` int(10) unsigned NOT NULL,
  `u_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `description` text NOT NULL,
  `real_price` float NOT NULL,
  `j_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`jsv_id`),
  KEY `FK_job_service_1` (`jsvt_id`),
  KEY `FK_job_service_2` (`u_id`),
  KEY `FK_job_service_3` (`j_id`),
  CONSTRAINT `FK_job_service_1` FOREIGN KEY (`jsvt_id`) REFERENCES `job_service_type` (`jsvt_id`),
  CONSTRAINT `FK_job_service_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `FK_job_service_3` FOREIGN KEY (`j_id`) REFERENCES `job` (`j_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_service`
--

LOCK TABLES `job_service` WRITE;
/*!40000 ALTER TABLE `job_service` DISABLE KEYS */;
INSERT INTO `job_service` VALUES (1,1,1,'2009-08-27 20:20:01','tolle montage',13.56,1,1),(2,2,1,'2009-08-27 23:20:01','gemacht',12.34,1,1),(3,3,2,'2009-08-27 21:20:01','lala',11.11,1,1),(4,1,2,'2009-08-27 21:20:05','beginn',13.4,2,1),(11,1,1,'2009-08-28 23:24:23','',10,1,1),(12,11,1,'2009-08-28 23:26:22','',56.99,1,1),(13,2,1,'2009-08-28 23:38:54','Mainboard',20.12,1,1),(14,2,1,'2009-08-28 23:43:09','',20,1,1),(15,2,1,'2009-08-28 23:43:24','',20,1,1),(16,2,1,'2009-08-28 23:43:33','',20,1,4);
/*!40000 ALTER TABLE `job_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_service_type`
--

DROP TABLE IF EXISTS `job_service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_service_type` (
  `jsvt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`jsvt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_service_type`
--

LOCK TABLES `job_service_type` WRITE;
/*!40000 ALTER TABLE `job_service_type` DISABLE KEYS */;
INSERT INTO `job_service_type` VALUES (1,'Montage PC',10),(2,'PC Mainboardtausch',20),(3,'PC Lüfterinstallation',15.3),(11,'Montage Server',56.99);
/*!40000 ALTER TABLE `job_service_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_status`
--

DROP TABLE IF EXISTS `job_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_status` (
  `js_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jst_id` int(10) unsigned NOT NULL,
  `j_id` int(10) unsigned NOT NULL,
  `u_id` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`js_id`),
  KEY `FK_job_status_1` (`jst_id`),
  KEY `FK_job_status_2` (`j_id`),
  KEY `FK_job_status_3` (`u_id`),
  CONSTRAINT `FK_job_status_1` FOREIGN KEY (`jst_id`) REFERENCES `job_status_type` (`jst_id`),
  CONSTRAINT `FK_job_status_2` FOREIGN KEY (`j_id`) REFERENCES `job` (`j_id`),
  CONSTRAINT `FK_job_status_3` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_status`
--

LOCK TABLES `job_status` WRITE;
/*!40000 ALTER TABLE `job_status` DISABLE KEYS */;
INSERT INTO `job_status` VALUES (4,1,1,1,'2005-11-30 12:00:00','111'),(5,2,1,1,'2005-11-30 12:45:00','211'),(6,4,2,1,'2005-11-30 12:50:00','121'),(7,1,2,2,'2005-11-30 12:12:00','122'),(19,4,2,1,'2009-08-28 23:13:29','BESTELLT');
/*!40000 ALTER TABLE `job_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_status_type`
--

DROP TABLE IF EXISTS `job_status_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_status_type` (
  `jst_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`jst_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_status_type`
--

LOCK TABLES `job_status_type` WRITE;
/*!40000 ALTER TABLE `job_status_type` DISABLE KEYS */;
INSERT INTO `job_status_type` VALUES (1,'Gerät eingegangen'),(2,'Gerät in Bearbeitung (Fehlersuche)'),(3,'KV erstellt'),(4,'Ersatzteile bestellt'),(5,'Gerät eingeschickt'),(6,'Gerät abholbereit'),(7,'Gerät an den Kunden versandt'),(8,'Auftrag entgegen genommen');
/*!40000 ALTER TABLE `job_status_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `u_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `password` char(32) NOT NULL,
  `admin_permission` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tech_permission` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `managment_permission` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Felix','Stiehler','4df1ee97499d792b84e317e2db00c65e',0,1,1),(2,'Matthias','Theobald','4df1ee97499d792b84e317e2db00c65e',0,1,0),(3,'Meier','John','4df1ee97499d792b84e317e2db00c65e',0,0,1),(4,'test','test','7815696ecbf1c96e6894b779456d330e',1,0,1),(5,'vorname','name','4df1ee97499d792b84e317e2db00c65e',0,1,1),(6,'Geis','Konstantin','4df1ee97499d792b84e317e2db00c65e',0,1,1),(7,'Geis','Konstantin','4df1ee97499d792b84e317e2db00c65e',0,1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'julia'
--
/*!50003 DROP FUNCTION IF EXISTS `split` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `split`(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
) RETURNS varchar(255) CHARSET latin1
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_customer`(IN _first_name char(45),
                                         IN _last_name char(45),
                                         IN _title_addition char(20),
                                         IN _firm_name char(45),
                                         IN _street char(45),
                                         IN _plz char(10),
                                         IN _tel_1 char(20),
                                         IN _tel_2 char(20),
                                         IN _fax char(20),
                                         IN _email char(45),
                                         IN _town char(45))
BEGIN
  INSERT INTO customer (first_name,
                        last_name,
                        title_addition,
                        firm_name,
                        street,
                        plz,
                        tel_1,
                        tel_2,
                        fax,
                        email,
                        town) VALUES (
    _first_name,
    _last_name,
    _title_addition,
    _firm_name,
    _street,
    _plz,
    _tel_1,
    _tel_2,
    _fax,
    _email,
    _town);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_custom_job_service` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_custom_job_service`(IN _job_id INTEGER UNSIGNED,
                                                   IN _user_id INTEGER UNSIGNED,
                                                   IN _description TEXT,
                                                   IN _custom_type CHAR(100),
                                                   IN _price FLOAT,
                                                   IN _amount INTEGER UNSIGNED)
BEGIN
  INSERT INTO job_service_type (name, price) VALUES (
    _custom_type,
    _price);


  INSERT INTO job_service (j_id, u_id, description, jsvt_id, real_price, amount, `date`) VALUES (
    _job_id,
    _user_id,
    _description,
    LAST_INSERT_ID(),
    _price,
    _amount,
    NOW());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_job` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_job`(IN _user_id INTEGER UNSIGNED,
                                    IN _customer_id INTEGER UNSIGNED,
                                    IN _bid_needed TINYINT UNSIGNED,
                                    IN _description TEXT,
                                    IN _short_description char(150),
                                    IN _c_first_name char(45),
                                    IN _c_last_name char(45),
                                    IN _c_street char(45),
                                    IN _c_plz char(10),
                                    IN _c_town char(45),
                                    IN _c_tel_1 char(20),
                                    IN _c_tel_2 char(20),
                                    IN _c_fax char(20),
                                    IN _c_email char(45))
BEGIN
  INSERT INTO job (c_id,
                   bid_needed,
                   description,
                   short_description,
                   finished,
                   `date`,
                   c_first_name,
                   c_last_name,
                   c_street,
                   c_plz,
                   c_town,
                   c_tel_1,
                   c_tel_2,
                   c_fax,
                   c_email) VALUES (
    _customer_id,
    _bid_needed,
    _description,
    _short_description,
    0,
    NOW(),
    _c_first_name,
    _c_last_name,
    _c_street,
    _c_plz,
    _c_town,
    _c_tel_1,
    _c_tel_2,
    _c_fax,
    _c_email);


  INSERT INTO job_status (j_id, jst_id, u_id, `date`) VALUES (
    LAST_INSERT_ID(),
    8,
    _user_id,
    NOW());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_job_service` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_job_service`(IN _job_id INTEGER UNSIGNED,
                                            IN _user_id INTEGER UNSIGNED,
                                            IN _description TEXT,
                                            IN _type_id INTEGER UNSIGNED,
                                            IN _price FLOAT,
                                            IN _amount INTEGER UNSIGNED)
BEGIN
  INSERT INTO job_service (j_id, u_id, description, jsvt_id, real_price, amount, `date`) VALUES (
    _job_id,
    _user_id,
    _description,
    _type_id,
    _price,
    _amount,
    NOW());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_job_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_job_status`(IN _job_id INTEGER UNSIGNED,
                                           IN _user_id INTEGER UNSIGNED,
                                           IN _jst_id INTEGER UNSIGNED,
                                           IN _description TEXT)
BEGIN
  INSERT INTO job_status (j_id, u_id, jst_id, description, `date`) VALUES (
    _job_id,
    _user_id,
    _jst_id,
    _description,
    NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_user`(IN _first_name char(45),
                                     IN _last_name char(45),
                                     IN _admin_permission TINYINT,
                                     IN _tech_permission TINYINT,
                                     IN _managment_permission TINYINT,
                                     IN _password char(32))
BEGIN
  INSERT INTO `user` (first_name, last_name, admin_permission, tech_permission, managment_permission, `password`) VALUES (
    _first_name,
    _last_name,
    _admin_permission,
    _tech_permission,
    _managment_permission,
    _password);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `edit_customer`(IN _customer_id INTEGER UNSIGNED,
                                         IN _first_name char(45),
                                         IN _last_name char(45),
                                         IN _title_addition char(20),
                                         IN _firm_name char(45),
                                         IN _street char(45),
                                         IN _plz char(10),
                                         IN _tel_1 char(20),
                                         IN _tel_2 char(20),
                                         IN _fax char(20),
                                         IN _email char(45),
                                         IN _town char(45))
BEGIN
  UPDATE customer
  SET first_name = _first_name,
      last_name  = _last_name,
      title_addition = _title_addition,
      firm_name = _firm_name,
      street = _street,
      plz = _plz,
      tel_1 = _tel_1,
      tel_2 = _tel_2,
      fax = _fax,
      email = _email,
      town = _town
  WHERE c_id = _customer_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_user_rights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `edit_user_rights`(IN _user_id INTEGER UNSIGNED,
                                             IN _admin_permission TINYINT,
                                             IN _tech_permission TINYINT,
                                             IN _managment_permission TINYINT)
BEGIN
  UPDATE `user`
  SET admin_permission = _admin_permission,
      tech_permission = _tech_permission,
      managment_permission = _managment_permission
  WHERE u_id = _user_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_customers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_customers`()
BEGIN
  SELECT first_name,
         last_name,
         firm_name,
         town,
         c_id as customer_id
  FROM customer
  ORDER BY last_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_customer_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_customer_info`(IN _customer_id INTEGER UNSIGNED)
BEGIN
  SELECT first_name,
         last_name,
         title_addition,
         firm_name,
         street,
         plz,
         tel_1,
         tel_2,
         fax,
         email,
         town,
         c_id as customer_id
  FROM customer
  WHERE c_id = _customer_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_jobs_latest_changes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_jobs_latest_changes`()
BEGIN
  SELECT DISTINCT j.j_id as job_id,
                  j.description as job_description,
                  u.u_id as user_id,
                  u.user_first_name,
                  u.user_last_name,
                  js.`date`,
                  js.description,
                  jst.name
  FROM job as j
  JOIN `user` as u
  JOIN job_status as js
  JOIN job_status_type as jst
    ON j.u_id = u.u_id
    AND js.j_id = j_id
    AND js.jst_id = jst.jst_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_job_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_job_info`(IN _job_id INTEGER UNSIGNED)
BEGIN
  SELECT j_id as job_id, 
         description,
         short_description,
         bid_needed,
         `date`,
         finished,
         paid,
         bill_send,
         c_first_name,
         c_last_name,
         c_title_addition,
         c_firm_name,
         c_street,
         c_plz,
         c_tel_1,
         c_tel_2,
         c_fax,
         c_email,
         c_town,
         c_id as customer_id
  FROM job
  WHERE j_id = _job_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_job_services` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_job_services`(IN _job_id INTEGER UNSIGNED)
BEGIN
  SELECT jsv.j_id as job_id,
         jsv.u_id as user_id,
         jsv.jsvt_id as job_service_id,
         jsv.`date`,
         jsv.description,
         u.first_name,
         u.last_name,
         jsvt.name as service_name,
         jsv.real_price as service_price,
         jsv.amount
  FROM job_service as jsv
  JOIN `user` as u
  JOIN job_service_type as jsvt
    ON jsv.u_id = u.u_id
    AND jsv.jsvt_id = jsvt.jsvt_id
  WHERE j_id = _job_id
  ORDER BY jsv.`date`;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_job_service_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_job_service_types`()
BEGIN
  SELECT jsvt_id as type_id, name, price
  FROM job_service_type;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_job_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_job_status`(IN _job_id INTEGER UNSIGNED)
BEGIN
  SELECT js.j_id as job_id,
         js.u_id as user_id,
         js.jst_id as job_status_id,
         js.`date`,
         js.description,
         u.first_name,
         u.last_name,
         jst.name as status_name
  FROM job_status as js
  JOIN `user` as u
  JOIN job_status_type as jst
    ON js.u_id = u.u_id
    AND js.jst_id = jst.jst_id
  WHERE j_id = _job_id
  ORDER BY js.`date`;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_job_status_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_job_status_types`()
BEGIN
  SELECT jst_id as type_id, name
  FROM job_status_type;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_latest_jobs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_latest_jobs`(IN `offset` INTEGER UNSIGNED, IN length INTEGER UNSIGNED)
BEGIN
  SET @rownum:=0;

  SELECT job_id,
         description,
         initial_date,
         status_name,
         user_first_name,
         user_last_name,
         last_status_date
  FROM (
    SELECT (@rownum := @rownum+1) as row_number,
           j.j_id as job_id,
           j.description,
           j.`date` as initial_date,
           jst.name as status_name,
           u.first_name as user_first_name,
           u.last_name as user_last_name,
           max(js.`date`) as last_status_date
    FROM job as j
    JOIN job_status as js
    JOIN job_status_type as jst
    JOIN `user`as u
      ON js.j_id = j.j_id
      AND js.jst_id = jst.jst_id
      AND js.u_id = u.u_id
    GROUP BY j.j_id
    ORDER BY j.`date` DESC
    ) as t
  WHERE row_number > `offset` AND row_number <= (`offset` + length);


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_login_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_login_data`(IN _first_name varchar(45), IN _last_name varchar(45), IN _password char(32))
BEGIN
  SELECT u_id as user_id,
         admin_permission,
         tech_permission,
         managment_permission
  FROM `user`
  WHERE first_name = _first_name
    AND last_name = _last_name
    AND `password` = _password;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_users`()
BEGIN
  SELECT u_id as user_id,
         admin_permission,
         tech_permission,
         managment_permission,
         first_name,
         last_name
  FROM `user`
  ORDER BY last_name;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_user_info`(IN _user_id INTEGER UNSIGNED)
BEGIN
  SELECT u_id as user_id,
         admin_permission,
         tech_permission,
         managment_permission,
         first_name,
         last_name
  FROM `user`
  WHERE u_id = _user_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-08-28 23:45:58
