-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopping_cart
-- ------------------------------------------------------
-- Server version	8.0.43

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
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Admin','admin123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartid` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `quantity` int DEFAULT '1',
  PRIMARY KEY (`cartid`),
  KEY `userid` (`userid`),
  KEY `pid` (`pid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,1,1),(2,1,2,2),(3,6,2,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `itemid` int NOT NULL AUTO_INCREMENT,
  `orderid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `orderid` (`orderid`),
  KEY `pid` (`pid`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,2999),(2,1,2,2,3499),(3,2,1,1,1999),(4,2,2,1,2499),(5,3,2,1,2499),(6,3,3,1,2999),(7,4,2,1,2499),(8,5,6,5,3499),(9,6,1,4,1999),(10,7,2,1,2499),(11,8,2,5,2499),(12,9,3,6,2999),(13,10,1,6,1999),(14,11,2,4,2499),(15,12,1,7,1999),(16,13,3,1,2999),(17,13,5,5,3299),(18,14,7,6,2899),(19,15,9,4,2599),(20,16,4,2,2799),(21,17,4,2,2799),(22,18,2,5,2499),(23,19,6,3,3499),(24,19,7,12,2899),(25,19,9,3,2599),(26,20,1,2,2999);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT 'Placed',
  PRIMARY KEY (`orderid`),
  KEY `userid` (`userid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,9997,'2025-12-16 08:46:14','Placed'),(2,1,4498,'2025-12-16 09:13:54','Placed'),(3,1,5498,'2025-12-16 09:20:02','Placed'),(4,1,2499,'2025-12-16 09:57:42','Placed'),(5,1,17495,'2025-12-22 10:23:13','Placed'),(6,1,7996,'2025-12-22 11:04:43','Placed'),(7,1,2499,'2025-12-22 11:05:10','Placed'),(8,1,12495,'2025-12-23 08:17:37','Placed'),(9,1,17994,'2025-12-23 08:18:08','Placed'),(10,1,11994,'2025-12-23 09:27:57','Placed'),(11,1,9996,'2025-12-23 09:35:33','Placed'),(12,4,13993,'2025-12-23 17:31:40','Placed'),(13,4,19494,'2025-12-23 17:32:52','Placed'),(14,5,17394,'2025-12-24 03:42:32','Placed'),(15,5,10396,'2025-12-24 03:43:14','Placed'),(16,1,5598,'2025-12-24 04:37:22','Placed'),(17,1,5598,'2025-12-24 04:42:54','Cancelled'),(18,1,12495,'2025-12-24 05:41:16','Shipped'),(19,4,53082,'2025-12-31 06:08:58','Cancelled'),(20,6,5998,'2026-01-24 09:44:57','Placed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Running Shoes 1','Comfortable running shoes',2999,'Shoes',14,'shoes1.jpeg'),(2,'Casual Shoes 2','Stylish casual shoes',2499,'Shoes',15,'shoes2.jpeg'),(3,'Sports Shoes 3','Lightweight sports shoes',2999,'Shoes',8,'shoes3.jpeg'),(4,'Running Shoes 4','Comfortable walking shoes',2799,'Shoes',10,'shoes4.jpeg'),(5,'Sports Shoes 5','Trendy sneakers for daily wear',3299,'Shoes',8,'shoes5.jpeg'),(6,'Casual Shoes 6','Office and formal wear shoes',3499,'Shoes',15,'shoes6.jpeg'),(7,'Running Shoes 7','Shoes for gym and workouts',2899,'Shoes',12,'shoes7.jpeg'),(8,'Sports Shoes 8','Shoes for trekking and hiking',3999,'Shoes',8,'shoes8.jpeg'),(9,'Casual Shoes 9','Comfortable loafers for men',2599,'Shoes',15,'shoes9.jpeg'),(12,'crazy shoes','Very classy',3999,'female wear',35,'shoesbrown.jpeg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Janavi','janavi@gmail.com','1111','Pune','7777777777'),(2,'Amit','amit@gmail.com','2222','Mumbai','8888888888'),(3,'janavip','janavip@gmail.com','2222','22 shivparavati','2345678912'),(4,'jagruti','jagruti@gmail.com','jagruti','Kolhapur','4254052421'),(5,'Megha','megha@gmail.com','megha','Dubai','2345678923'),(6,'jan','jan@gmail.com','1111','mmcoe','2323213232');
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

-- Dump completed on 2026-02-19 15:50:42
