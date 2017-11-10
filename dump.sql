-- MySQL dump 10.13  Distrib 5.5.52, for Linux (x86_64)
--
-- Host: localhost    Database: virtualcartx
-- ------------------------------------------------------
-- Server version	5.5.52

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
-- Table structure for table `admin_types`
--

DROP TABLE IF EXISTS `admin_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userType` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_types`
--

LOCK TABLES `admin_types` WRITE;
/*!40000 ALTER TABLE `admin_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `id_type` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_admins` (`id_type`),
  CONSTRAINT `FK_admins` FOREIGN KEY (`id_type`) REFERENCES `admin_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionid` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `ordered` tinyint(1) NOT NULL DEFAULT '0',
  `payment_type` int(11) NOT NULL,
  `token` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `payer_id` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `currency_code` varchar(10) COLLATE latin1_general_ci DEFAULT 'USD',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_item_count` int(11) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `tax` decimal(8,2) NOT NULL,
  `shipping` decimal(8,2) NOT NULL,
  `total` decimal(8,2) unsigned NOT NULL,
  `order_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `authorization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'prakash','hiranandani',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Failure',NULL,'1','','2013-10-09 17:31:53'),(2,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Failure',NULL,'1','','2013-11-04 13:54:35'),(6,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-11-04 17:12:03'),(7,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-11-05 00:01:27'),(8,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-11-07 16:45:27'),(9,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-01 19:15:05'),(10,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-01 19:18:47'),(11,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-01 19:41:29'),(12,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Failure',NULL,'1','','2013-12-01 19:47:14'),(13,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','',0,0.00,0.00,0.00,0.00,'',NULL,NULL,'1','','2013-12-01 20:04:53'),(15,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-01 20:08:07'),(19,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-05 12:50:59'),(20,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Failure',NULL,'1','','2013-12-05 12:53:08'),(22,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-05 13:01:51'),(23,'prakash','hiranandani',NULL,NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-05 13:03:45'),(24,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-05 13:15:57'),(25,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 13:01:25'),(26,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 13:37:24'),(27,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 13:54:29'),(28,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 13:57:23'),(29,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 13:58:54'),(30,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 14:00:09'),(31,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 14:23:55'),(33,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 14:28:05'),(34,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 14:29:07'),(35,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 14:30:35'),(36,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 14:33:28'),(37,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 14:34:35'),(38,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 14:35:22'),(39,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-09 14:36:37'),(40,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-16 17:15:21'),(41,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-16 17:21:19'),(42,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-16 17:29:48'),(43,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-16 17:31:26'),(44,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-16 17:37:26'),(45,'prakash','hiranandani','prakash.hiranandani@gmail.com',NULL,NULL,'apt 307','mountain view','94043','CA','US','','apt 307','mountain view','94043','CA','US',0,0.00,0.00,0.00,0.00,'','Success',NULL,'2','','2013-12-16 17:41:28'),(46,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','',0,0.00,0.00,0.00,0.00,'',NULL,NULL,'1','','2014-03-11 10:34:14');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(250) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
INSERT INTO `payment_types` VALUES (1,'paypal','paypal payment type'),(2,'Credit Card','Credit Card Payment type'),(3,'Google Check Out','Google Check Out');
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `product_description` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `price` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `admin_id` int(11) NOT NULL,
  `is_online` tinyint(1) DEFAULT '0',
  `sku` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `category` int(11) NOT NULL DEFAULT '1',
  `product_image` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `thumbs` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `zip` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `useremail` varchar(250) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `status` varchar(256) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `agerange` int(11) DEFAULT NULL,
  `facebook_id` bigint(20) unsigned DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-10 15:08:04
