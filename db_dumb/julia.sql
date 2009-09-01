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
-- Table structure for table `cash`
--

DROP TABLE IF EXISTS `cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash` (
  `cash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int(10) unsigned NOT NULL,
  `record` varchar(20) NOT NULL,
  `price` float(7,2) NOT NULL,
  `total` float(7,2) NOT NULL,
  `description` varchar(150) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`cash_id`),
  KEY `FK_cash_1` (`u_id`),
  CONSTRAINT `FK_cash_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash`
--

LOCK TABLES `cash` WRITE;
/*!40000 ALTER TABLE `cash` DISABLE KEYS */;
INSERT INTO `cash` VALUES (40,1,'123',15.00,15.00,'Kabel','2009-08-31 17:18:22'),(69,1,'1',12.00,0.00,'Lankabel','2009-09-01 17:08:33'),(70,1,'2',532.00,532.00,'Computer','2009-09-01 17:08:46'),(71,1,'3',-2.00,530.00,'Kaffee','2009-09-01 17:08:59'),(72,1,'4',-2.00,528.00,'Kekse','2009-09-01 17:09:17'),(73,1,'5',2.32,530.32,'Adapter','2009-09-01 17:09:34'),(74,1,'6',-5.00,525.32,'Kuchen','2009-09-01 17:10:35'),(75,1,'7',-5.00,520.32,'Kuchen','2009-09-01 17:11:04'),(76,1,'8',-2.32,518.00,'Kuchen','2009-09-01 17:18:22');
/*!40000 ALTER TABLE `cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `c_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_of_address` varchar(4) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `title_addition` varchar(20) NOT NULL,
  `firm_name` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `plz` varchar(10) NOT NULL,
  `town` varchar(45) DEFAULT NULL,
  `tel_1` varchar(20) NOT NULL,
  `tel_2` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12545 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Frau','Yusuf','Mohammed','Dr. Phil.','Google','Strasse','','','','','',''),(2,'Herr','John','Smith','Dr. Phil.3','Google4','Strasse5','154236','Berlin7','tel_18','tel_29','fax10','mymail11'),(12543,'Herr','Gerd','Müller','Dr.','Microsoft','Berlinerstr.13','12456','Potsdam','0175-12389612','0175-12389614','0175-12389647','gerd@web.de'),(12544,'Frau','Steward','Martha','Dipl. Ing.','thefirm','Plötzenstraße 81','45692','Hohenschönhausen','0152-3645897','0152-3645898','0152-3645899','dsagg@afef.fr');
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
  `short_description` varchar(150) DEFAULT NULL,
  `description` text,
  `date` datetime DEFAULT NULL,
  `bid_needed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `c_form_of_address` varchar(4) NOT NULL,
  `c_id` int(10) unsigned DEFAULT NULL,
  `c_first_name` varchar(45) NOT NULL,
  `c_last_name` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `c_tel_1` varchar(20) NOT NULL,
  `c_tel_2` varchar(20) NOT NULL,
  `c_fax` varchar(20) NOT NULL,
  `c_firm_name` varchar(45) DEFAULT NULL,
  `c_street` varchar(45) NOT NULL,
  `c_town` varchar(45) NOT NULL,
  `c_email` varchar(45) NOT NULL,
  `c_plz` varchar(10) NOT NULL,
  `c_title_addition` varchar(20) NOT NULL,
  PRIMARY KEY (`j_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'TV kaputt','TV broken','2009-08-27 20:20:01',0,'Herr',13648,'Felix','Stiehler','','','','','Hellstraße 3','Berlin','','12345','Dr.'),(2,'PC kaputt','PC broken','2009-08-27 22:20:01',0,'',12543,'Felix','Stiehler','','','','','Strasse','','','',''),(3,'345','Graka broken','2009-08-27 18:20:01',0,'',2,'Felix2','Stiehler1','tel_18','tel_29','fax10','','Strasse5','Berlin7','mymail11','154236',''),(9,'Graka im Eimer','lang','2009-08-28 03:02:57',0,'',1,'Felix','Stiehler','','','','','Strasse','','','',''),(12,'Server Farm Aufbau Hohenschönhausen','Lorem ipsum...','2009-08-30 01:59:45',0,'',12544,'Steward','Martha','0152-3645897','0152-3645898','0152-3645899',NULL,'Plötzenstraße 81','Hohenschönhausen','dsagg@afef.fr','45692',''),(14,'Server Reperatur','Festplatte muss ausgetauscht werden','2009-08-31 21:40:32',0,'Frau',12544,'Steward','Martha','0152-3645897','0152-3645898','0152-3645899',NULL,'Plötzenstraße 81','Hohenschönhausen','dsagg@afef.fr','45692','');
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
  `real_price` float(7,2) NOT NULL,
  `j_id` int(10) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`jsv_id`),
  KEY `FK_job_service_1` (`jsvt_id`),
  KEY `FK_job_service_2` (`u_id`),
  KEY `FK_job_service_3` (`j_id`),
  CONSTRAINT `FK_job_service_1` FOREIGN KEY (`jsvt_id`) REFERENCES `job_service_type` (`jsvt_id`),
  CONSTRAINT `FK_job_service_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `FK_job_service_3` FOREIGN KEY (`j_id`) REFERENCES `job` (`j_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_service`
--

LOCK TABLES `job_service` WRITE;
/*!40000 ALTER TABLE `job_service` DISABLE KEYS */;
INSERT INTO `job_service` VALUES (1,1,1,'2009-08-27 20:20:01','tolle montage',13.56,1,1),(2,2,1,'2009-08-27 23:20:01','gemacht',12.34,1,1),(16,2,1,'2009-08-28 23:43:33','',20.00,1,4),(19,12,1,'2009-08-31 21:44:52','',15.00,14,1),(20,1,1,'2009-09-01 00:29:38','',100.62,2,3);
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
  `price` float(7,2) NOT NULL,
  PRIMARY KEY (`jsvt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_service_type`
--

LOCK TABLES `job_service_type` WRITE;
/*!40000 ALTER TABLE `job_service_type` DISABLE KEYS */;
INSERT INTO `job_service_type` VALUES (1,'Montage PC',10.00),(2,'PC Mainboardtausch',20.00),(3,'PC Lüfterinstallation',15.30),(11,'Montage Server',56.99),(12,'Fehlersuche',15.00),(13,'PC RAM Tausch',5.89);
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
  UNIQUE KEY `UNIQUE_5` (`jst_id`,`j_id`),
  KEY `FK_job_status_1` (`jst_id`),
  KEY `FK_job_status_2` (`j_id`),
  KEY `FK_job_status_3` (`u_id`),
  CONSTRAINT `FK_job_status_1` FOREIGN KEY (`jst_id`) REFERENCES `job_status_type` (`jst_id`),
  CONSTRAINT `FK_job_status_2` FOREIGN KEY (`j_id`) REFERENCES `job` (`j_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_job_status_3` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_status`
--

LOCK TABLES `job_status` WRITE;
/*!40000 ALTER TABLE `job_status` DISABLE KEYS */;
INSERT INTO `job_status` VALUES (4,1,1,1,'2005-11-30 12:00:00','111'),(5,2,1,1,'2005-11-30 12:45:00','211'),(6,4,2,1,'2005-11-30 12:50:00','121'),(7,1,2,2,'2005-11-30 12:12:00','122'),(20,3,1,1,'2009-08-29 03:37:43','erstellt'),(21,6,1,1,'2009-08-29 22:48:03',''),(24,8,12,1,'2009-08-30 01:59:45',''),(25,1,12,1,'2009-08-30 02:14:57','Gerät erhalten'),(26,3,12,1,'2009-08-30 02:15:26','KV erstellt: 250€'),(27,6,2,1,'2009-08-30 02:20:04',''),(28,9,1,1,'2009-08-30 17:28:18',''),(29,11,1,1,'2009-08-30 17:57:55',''),(31,8,14,1,'2009-08-31 21:40:32',''),(32,12,2,1,'2009-09-01 01:28:06',''),(33,9,14,1,'2009-09-01 02:19:18',''),(34,10,14,1,'2009-09-01 02:26:36','');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_status_type`
--

LOCK TABLES `job_status_type` WRITE;
/*!40000 ALTER TABLE `job_status_type` DISABLE KEYS */;
INSERT INTO `job_status_type` VALUES (1,'Gerät eingegangen'),(2,'Gerät in Bearbeitung (Fehlersuche)'),(3,'KV erstellt'),(4,'Ersatzteile bestellt'),(5,'Gerät eingeschickt'),(6,'Gerät abholbereit'),(7,'Gerät an den Kunden versandt'),(8,'Auftrag entgegen genommen'),(9,'Rechnung erstellt'),(10,'Auftrag bezahlt'),(11,'Auftrag komplett abgeschlossen'),(12,'Auftrag bezahlt (Barzahlung)'),(13,'Reperatur abgeschlossen');
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
INSERT INTO `user` VALUES (1,'Felix','Stiehler','4df1ee97499d792b84e317e2db00c65e',1,1,1),(2,'Matthias','Theobald','4df1ee97499d792b84e317e2db00c65e',0,1,0),(3,'Meier','John','4df1ee97499d792b84e317e2db00c65e',0,0,1),(4,'test','test','7815696ecbf1c96e6894b779456d330e',1,0,1),(5,'vorname','name','4df1ee97499d792b84e317e2db00c65e',0,1,1),(6,'Geis','Konstantin','4df1ee97499d792b84e317e2db00c65e',0,1,1),(7,'Geis','Konstantin','4df1ee97499d792b84e317e2db00c65e',0,1,1);
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
/*!50003 DROP PROCEDURE IF EXISTS `add_cash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_cash`(IN _user_id INTEGER UNSIGNED,
                                     IN _record CHAR(20),
                                     IN _price FLOAT,
                                     IN _description CHAR(150))
BEGIN
  DECLARE new_total FLOAT(7,2) DEFAULT 0.00;

  SELECT IFNULL(total, 0) + _price
  INTO new_total
  FROM cash
  WHERE cash_id = (SELECT max(cash_id) FROM cash);

  INSERT cash (u_id, record, price, total, description, `date`) VALUES (
    _user_id,
    _record,
    _price,
    new_total,
    _description,
    NOW());

END */;;
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_customer`(IN _form_of_address char(4),
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
  INSERT INTO customer (form_of_address,
                        first_name,
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
    _form_of_address,
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
                                    IN _c_form_of_address char(4),
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
                   `date`,
                   c_form_of_address,
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
    now(),
    _c_form_of_address,
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
  DECLARE job_price FLOAT DEFAULT 0;

  INSERT INTO job_status (j_id, u_id, jst_id, description, `date`) VALUES (
    _job_id,
    _user_id,
    _jst_id,
    _description,
    NOW());

  IF (_jst_id = 12) THEN
    SELECT sum(real_price)
    INTO job_price
    FROM job_service
    WHERE j_id = _job_id;

    CALL add_cash(_user_id, job_price, concat('Barzahlung Rechnung: ', _job_id));
  END IF;
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
                                         IN _form_of_address char(4),
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
  SET form_of_address = _form_of_address,
      first_name = _first_name,
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
/*!50003 DROP PROCEDURE IF EXISTS `get_bill_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_bill_info`(IN _job_id INTEGER UNSIGNED)
BEGIN
  DECLARE customer_id INTEGER UNSIGNED DEFAULT null;

  SELECT c_id
  INTO customer_id
  FROM customer
  WHERE c_id = (SELECT c_id FROM job WHERE j_id = _job_id);


  IF (customer_id is not null) THEN
    SELECT c.c_id as customer_id,
           c.form_of_address,
           c.first_name,
           c.last_name,
           c.title_addition,
           c.firm_name,
           c.street,
           c.plz,
           c.town,
           sum(jsv.real_price * jsv.amount) as all_total,
           NOW() as `date`,
           _job_id as job_id
    FROM customer as c
    JOIN job_service as jsv
    WHERE jsv.j_id = _job_id
      AND c.c_id = customer_id;
  ELSE
    SELECT j.c_id as customer_id,
           j.c_form_of_address as form_of_address,
           j.c_first_name as first_name,
           j.c_last_name as last_name,
           j.c_title_addition as title_addition,
           j.c_firm_name as firm_name,
           j.c_street as street,
           j.c_plz as plz,
           j.c_town as town,
           sum(jsv.real_price * jsv.amount) as all_total,
           NOW() as `date`,
           _job_id as job_id
    FROM job as j
    JOIN job_service as jsv
    WHERE jsv.j_id = _job_id
      AND j.j_id = _job_id;
  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_cash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_cash`(IN _date_start char(8), IN _date_limit char(8))
BEGIN
  SELECT u.u_id as user_id,
         u.first_name,
         u.last_name,
         c.record,
         c.price,
         c.total,
         c.`date`,
         c.description
  FROM cash as c
  JOIN `user` as u
    ON c.u_id = u.u_id
  WHERE (date (c.`date`) <= str_to_date(_date_limit, '%d.%m.%y'))
    AND (date (c.`date`) >= str_to_date(_date_start, '%d.%m.%y'))
  ORDER BY c.cash_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_cash_print` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_cash_print`(IN _date_start char(8), IN _date_limit char(8))
BEGIN
  SET @carry = 0.00;

  SELECT total
  INTO @carry
  FROM cash
  WHERE cash.cash_id = (SELECT max(cash_id) FROM cash WHERE `date` < str_to_date(_date_limit, '%d.%m.%y'));


  SELECT round(@carry:=@carry+price, 2) as account,
         price,
         record,
         `date`,
         description
  FROM cash
  WHERE (date (`date`) <= str_to_date(_date_limit, '%d.%m.%y'))
    AND (date (`date`) >= str_to_date(_date_start, '%d.%m.%y'))
  ORDER BY cash_id;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_cash_print_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_cash_print_info`(IN _date_start char(8), IN _date_limit char(8))
BEGIN
  DECLARE carry FLOAT(7,2) DEFAULT 0.00;
  DECLARE in_total FLOAT(7,2) DEFAULT 0.00;
  DECLARE out_total FLOAT(7,2) DEFAULT 0.00;

  SELECT total
  INTO carry
  FROM cash
  WHERE cash.cash_id = (SELECT max(cash_id) FROM cash WHERE `date` < str_to_date(_date_start, '%d.%m.%y'));

  SELECT ifnull(sum(price), 0.00)
  INTO in_total
  FROM cash
  WHERE price >= 0.00
    AND (date (`date`) <= str_to_date(_date_limit, '%d.%m.%y'))
    AND (date (`date`) >= str_to_date(_date_start, '%d.%m.%y'));

  SELECT ifnull(sum(price), 0.00)
  INTO out_total
  FROM cash
  WHERE price < 0.00
    AND (date (`date`) <= str_to_date(_date_limit, '%d.%m.%y'))
    AND (date (`date`) >= str_to_date(_date_start, '%d.%m.%y'));

  SELECT carry,
         in_total,
         out_total,
         (in_total + out_total) as total,
         now() as cur_date,
         _date_start as date_start,
         _date_limit as date_limit;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_cash_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_cash_total`()
BEGIN
  SELECT total
  FROM cash
  WHERE cash_id = (SELECT max(cash_id) FROM cash);
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
  SELECT form_of_address,
         first_name,
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
  SELECT c_id as customer_id,
         form_of_address,
         first_name,
         last_name,
         title_addition,
         firm_name,
         street,
         plz,
         town,
         tel_1,
         tel_2,
         fax,
         email
  FROM customer
  WHERE c_id = _customer_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_customer_login_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_customer_login_data`(IN _first_name varchar(45), IN _last_name varchar(45), IN _password char(32))
BEGIN
  SELECT c_id as customer_id, form_of_address
  FROM customer
  WHERE first_name = _first_name
    AND last_name = _last_name
    AND c_id = _password;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_jobs_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_jobs_customer`(IN _customer_id INTEGER UNSIGNED)
BEGIN
  SELECT short_description, `date`, j_id as job_id
  FROM job
  WHERE c_id = _customer_id
  ORDER BY j_id;
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_jobs_latest_changes`(IN `offset` INTEGER UNSIGNED, IN length INTEGER UNSIGNED)
BEGIN
  SET @lim = CONCAT(' LIMIT ', `offset`, ',', length);
  SET @q = "
    SELECT j.j_id as job_id,
           j.short_description as short_description,
           j.description as description,
           u.u_id as user_id,
           u.first_name as user_first_name,
           u.last_name as user_last_name,
           js.`date` as last_status_date,
           js.js_id,
           jst.name as status_name
    FROM job as j
    JOIN `user` as u
    JOIN job_status as js
    JOIN job_status_type as jst
      ON js.u_id = u.u_id
      AND js.j_id = j.j_id
      AND js.jst_id = jst.jst_id
    ORDER BY js.js_id";

  SET @q = CONCAT(@q, @lim);
  PREPARE st FROM @q;
  EXECUTE st;
  DEALLOCATE PREPARE st;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_job_additional_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_job_additional_info`(IN _job_id INTEGER UNSIGNED)
BEGIN

  DECLARE bill_created TINYINT UNSIGNED DEFAULT null;
  DECLARE paid TINYINT UNSIGNED DEFAULT null;
  DECLARE finished TINYINT UNSIGNED DEFAULT null;
  DECLARE customer_listed TINYINT UNSIGNED DEFAULT null;

  SELECT js_id
  INTO bill_created
  FROM job_status
  WHERE j_id = _job_id
    AND jst_id = 9;


  SELECT js_id
  INTO paid
  FROM job_status
  WHERE j_id = _job_id
    AND jst_id = 10;

  SELECT js_id
  INTO finished
  FROM job_status
  WHERE j_id = _job_id
    AND jst_id = 11;

  SELECT c_id
  INTO customer_listed
  FROM customer
  WHERE c_id = (SELECT c_id FROM job WHERE j_id = _job_id);

  SELECT if (bill_created is null, 0, 1) as bill_created,
         if (paid is null, 0, 1) as paid,
         if (finished is null, 0, 1) as finished,
         if (customer_listed is null, 0, 1) as customer_listed;
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
         short_description,
         description,
         `date`,
         bid_needed,
         c_id as customer_id,
         c_first_name,
         c_last_name,
         c_title_addition,
         c_firm_name,
         c_street,
         c_plz,
         c_town,
         c_tel_1,
         c_tel_2,
         c_fax,
         c_email
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
  ORDER BY jsv.jsv_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_job_services_bill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_job_services_bill`(IN _job_id INTEGER UNSIGNED)
BEGIN
  SELECT jsvt.name as service_name,
         jsv.real_price as service_price,
         jsv.amount,
         (jsv.real_price * jsv.amount) as total
  FROM job_service as jsv
  JOIN job_service_type as jsvt
    ON jsv.jsvt_id = jsvt.jsvt_id
  WHERE j_id = _job_id
  ORDER BY jsv.jsv_id;
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
  FROM job_service_type
  ORDER BY name;
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
/*!50003 DROP PROCEDURE IF EXISTS `get_job_status_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_job_status_customer`(IN _customer_id INTEGER UNSIGNED)
BEGIN
  SELECT js.`date`, jst.name, j.j_id as job_id
  FROM job_status as js
  JOIN job_status_type as jst
  JOIN job as j
    ON js.jst_id = jst.jst_id
    AND js.j_id = j.j_id
  WHERE j.c_id = _customer_id
  ORDER BY j.j_id, js.js_id;
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
  FROM job_status_type
  ORDER BY name;
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
  SET @lim = CONCAT(' LIMIT ', `offset`, ',', length);
  SET @q = "SELECT j.j_id as job_id,
                   j.short_description,
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
            ORDER BY j.j_id DESC";

  SET @q = CONCAT(@q, @lim);
  PREPARE st FROM @q;
  EXECUTE st;
  DEALLOCATE PREPARE st;

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
/*!50003 DROP PROCEDURE IF EXISTS `get_stats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_stats`()
BEGIN
  DECLARE new_jobs INTEGER UNSIGNED DEFAULT 0;
  DECLARE status_added INTEGER UNSIGNED DEFAULT 0;
  DECLARE services_added INTEGER UNSIGNED DEFAULT 0;
  DECLARE services_sum FLOAT(7,2) DEFAULT 0;
  DECLARE cash_added INTEGER UNSIGNED DEFAULT 0;
  DECLARE cash_sum FLOAT(7,2) DEFAULT 0;
  DECLARE cur_date DATETIME default curdate();

  SELECT count(js_id)
  INTO new_jobs
  FROM job_status
  WHERE jst_id = 8
    AND `date` > cur_date;

  SELECT count(js_id)
  INTO status_added
  FROM job_status
  WHERE `date` > cur_date;

  SELECT count(jsv_id)
  INTO services_added
  FROM job_service
  WHERE `date` > cur_date;

  SELECT sum(real_price)
  INTO services_sum
  FROM job_service
  WHERE `date` > cur_date;

  SELECT count(cash_id)
  INTO cash_added
  FROM cash
  WHERE `date` > cur_date;

  SELECT sum(price)
  INTO cash_sum
  FROM cash
  WHERE `date` > cur_date;



  SELECT new_jobs, status_added, services_added, services_sum, cash_added, cash_sum, cur_date;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_unpaid_bills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_unpaid_bills`(IN `offset` INTEGER UNSIGNED, IN length INTEGER UNSIGNED)
BEGIN

SET @lim = CONCAT(' LIMIT ', `offset`, ',', length);
SET @q = "
  SELECT j.j_id,
         j.short_description,
         js.`date`
  FROM job as j
  JOIN job_status as js
    ON js.j_id = j.j_id
  WHERE js.jst_id = 9
  AND NOT EXISTS (SELECT *
                  FROM job_status as js
                  WHERE js.js_id = 10
                  AND js.j_id = j.j_id)


  ";

SET @q = CONCAT(@q, @lim);
PREPARE st FROM @q;
EXECUTE st;
DEALLOCATE PREPARE st;

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
/*!50003 DROP PROCEDURE IF EXISTS `test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `test`(IN `offset` INTEGER UNSIGNED, IN length INTEGER UNSIGNED)
BEGIN

SET @lim = CONCAT(' LIMIT ', `offset`, ',', length);
SET @q = "SELECT j.j_id as job_id,
                 j.short_description,
                 j.`date` as initial_date
          FROM job as j
          JOIN job_status as js
            ON js.j_id = j.j_id
          ORDER BY j.j_id DESC";

SET @q = CONCAT(@q, @lim);
PREPARE st FROM @q;
EXECUTE st;
DEALLOCATE PREPARE st;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `test1`(IN `offset` INTEGER UNSIGNED, IN length INTEGER UNSIGNED)
BEGIN
  SET @rownum:=0;

  SELECT j_id, row_number
  FROM (
    SELECT (@rownum := @rownum+1) as row_number,
           j_id
    FROM job as j
    ORDER BY j_id DESC
    ) as t
  WHERE row_number > `offset` AND row_number <= (`offset` + length);
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

-- Dump completed on 2009-09-01 20:53:51
