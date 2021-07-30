-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: jv42_khanh_huy_project_final
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(200) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fullName` varchar(100) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `checkin_date` date DEFAULT NULL,
  `checkout_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `totalPrice` double NOT NULL,
  `user_id` int DEFAULT NULL,
  `booking_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_b0lktxjcwfcjsc7ucd1qxvduu` (`email`),
  KEY `FKkgseyy7t56x7lkjgu3wah5s3t` (`user_id`),
  CONSTRAINT `FKkgseyy7t56x7lkjgu3wah5s3t` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'Da Nang','1991-10-22','abc@gmail.com','Nguyen','MALE','0999999999','2021-07-01','2021-07-02','2021-07-03','CHECKED_IN',7856750.000000001,4,'1rety3'),(2,'Da Nang','1992-02-02','def@gmail.com','Nguyen Dai','MALE','0101010101','2021-06-30','2021-07-01','2021-07-10','CHECKED_IN',6289250.000000001,2,'2mt146'),(3,'Quang Nam','1992-02-02','123@gmail.com','Nguyen Long','MALE','0101010101','2021-06-30','2021-07-01','2021-07-05','CHECKED_OUT',7365600.000000001,NULL,'1po07r'),(4,'Hue','1995-01-01','qwe@gmail.com','Bui Thai','FEMALE','113113113','2021-07-01','2021-07-09','2021-07-12','CANCELED',1113750.0000000002,NULL,'35343D');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_detail`
--

DROP TABLE IF EXISTS `booking_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discount` double DEFAULT NULL,
  `price` double NOT NULL,
  `booking_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK59941ondg9nwaifm2umnrduev` (`booking_id`),
  KEY `FK2as656q44xfhmm1ohbea9co6b` (`room_id`),
  CONSTRAINT `FK2as656q44xfhmm1ohbea9co6b` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `FK59941ondg9nwaifm2umnrduev` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_detail`
--

LOCK TABLES `booking_detail` WRITE;
/*!40000 ALTER TABLE `booking_detail` DISABLE KEYS */;
INSERT INTO `booking_detail` VALUES (1,59.5,6000000,1,5),(2,59.5,3500000,2,11),(3,59.5,3200000,3,9),(4,59.5,2500000,1,7),(5,59.5,2500000,4,10);
/*!40000 ALTER TABLE `booking_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convenient`
--

DROP TABLE IF EXISTS `convenient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convenient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenient`
--

LOCK TABLES `convenient` WRITE;
/*!40000 ALTER TABLE `convenient` DISABLE KEYS */;
INSERT INTO `convenient` VALUES (1,NULL,'Individual controlled air-condition'),(2,'','IDD telephone'),(3,'','In-room safe'),(4,'','Hair dryer'),(5,NULL,'Coffee making facilities'),(6,NULL,'Comb'),(7,NULL,'Sanitary bag'),(8,NULL,'Complimentary high speed internet'),(9,NULL,'Kettle'),(10,NULL,'Work desk'),(11,NULL,'Slippers'),(12,NULL,'Refrigerator'),(13,NULL,'Cotton buds'),(14,NULL,'Bath gel'),(15,NULL,'Satellite TV'),(16,NULL,'Mineral water, tea and coffee'),(17,NULL,'Wardrobe'),(18,NULL,'24-hour in-room dining'),(19,NULL,'Toothbrush'),(20,NULL,'Bathing-cap'),(21,NULL,'Shampoo');
/*!40000 ALTER TABLE `convenient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card` (
  `id` int NOT NULL AUTO_INCREMENT,
  `balance` double NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `cvc_code` varchar(3) NOT NULL,
  `expire_date` date DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(200) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fullName` varchar(100) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `idCard` varchar(20) NOT NULL,
  `bookingDetail_id` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_l30f0fvs78rfwtjbim6nqo2cp` (`email`),
  KEY `FKsfrikcak0kkjlnt2w8yximxdh` (`bookingDetail_id`),
  CONSTRAINT `FKsfrikcak0kkjlnt2w8yximxdh` FOREIGN KEY (`bookingDetail_id`) REFERENCES `booking_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (8,'HaiPhong','2002-01-01','toto@gmail.com','Toto','OTHER','23424234242','12sds12313',1,'2021-07-12'),(11,'DaNang123','2003-01-01','test@gmail.com','Test','FEMALE','453546345345','34543534543543',NULL,'2021-07-12');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `roomtype_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsky9wwrgpqo26onl39k6bkks2` (`roomtype_id`),
  KEY `FKn6wcxemqp1wb32ww47lilxktv` (`service_id`),
  CONSTRAINT `FKn6wcxemqp1wb32ww47lilxktv` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `FKsky9wwrgpqo26onl39k6bkks2` FOREIGN KEY (`roomtype_id`) REFERENCES `room_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (16,'rt_deluxe_twin_ocean_1553047601.jpg',19,NULL),(17,'rt_deluxe_twin_ocean__3__1553047601.jpg',19,NULL),(18,'rt_deluxe_twin_ocean__2__1553047599.jpg',19,NULL),(19,'rt_deluxe_twin__ocean_1553047599.jpg',19,NULL),(21,'rt_deluxe_twin_1553047339.jpg',20,NULL),(23,'rt_grand_suite_1553048380.jpg',21,NULL),(24,'rt_grand_suite__5__1553048379.jpg',21,NULL),(25,'rt_grand_suite__3__1553048377.jpg',21,NULL),(26,'rt_grand_suite__2__1553048377.jpg',21,NULL),(28,'rt_mt_luxury_danang__4_of_178__1559794177.jpg',22,NULL),(31,'_mg_3631.jpg',23,NULL),(32,'_mg_3575.jpg',23,NULL),(33,'_mg_3583.jpg',23,NULL),(34,'_mg_3590.jpg',23,NULL),(35,'_mg_3609.jpg',23,NULL),(36,'_mg_3620.jpg',23,NULL),(38,'rt_mt_luxyry___anang__2_of_178__-_resize_1559794115.jpg',22,NULL),(39,'rt_grand_suite__4__1553048377.jpg',21,NULL),(40,'_mg_2893.jpg',NULL,9),(41,'_mg_2835.jpg',NULL,9),(42,'_mg_2824.jpg',NULL,9),(43,'_mg_4595.jpg',NULL,8),(44,'_mg_4570.jpg',NULL,8),(45,'_mg_4239.jpg',NULL,8),(46,'_mg_3514.jpg',NULL,7),(47,'_mg_3535.jpg',NULL,7),(48,'_mg_3526.jpg',NULL,7),(49,'_mg_2893 (1).jpg',NULL,7),(50,'_mg_3526 (1).jpg',NULL,6),(51,'_mg_3534.jpg',NULL,6),(52,'cocktails630x416.png',NULL,5),(53,'downtownmiamicocktail612x338.jpg',NULL,5),(54,'19433995_l1024x624.jpg',NULL,4),(55,'cocktails630x416.png',NULL,4),(56,'downtownmiamicocktail612x338.jpg',NULL,4),(57,'6a670ac1508f442cac494d76770e1ded.jpg',NULL,10),(58,'12e764b.jpg',NULL,10),(59,'gym_1.jpg',NULL,10),(60,'dumbbellsequipment7tipsgym.jpg',NULL,10),(61,'tennis_racket.jpg',NULL,11),(62,'santennis.jpg',NULL,11),(63,'73693b8147d46016a4b4bfd1fee6f9bc.jpg',NULL,12),(64,'15864512256_8c2de20a30_b.jpg',NULL,12),(65,'dayspamassage.jpg',NULL,12),(66,'dsc_0138.jpg',NULL,13),(67,'19433995_l1024x624.jpg',NULL,13),(68,'hotelserivcebellheader.jpg',NULL,14),(69,'hotelservice19.jpg',NULL,14),(70,'roomservicetray.jpg',NULL,14),(71,'cocktails630x416.png',NULL,15),(72,'rt_deluxe_king__5__1553047599.jpg',19,NULL),(75,'rt_deluxe_twin__2__1553047339.jpg',20,NULL);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  `credit_card_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqewrl4xrv9eiad6eab3aoja65` (`booking_id`),
  KEY `FK41brulskee4m5ppls85o6go9r` (`credit_card_id`),
  CONSTRAINT `FK41brulskee4m5ppls85o6go9r` FOREIGN KEY (`credit_card_id`) REFERENCES `credit_card` (`id`),
  CONSTRAINT `FKqewrl4xrv9eiad6eab3aoja65` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,7365600.000000001,NULL,'2021-07-06',3,NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `discount` double NOT NULL,
  `end_date` date DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `start_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (18,'2021-07-01','FREE EARLY CI & LATE CO',59.5,'2021-08-31','FLASH DEAL','2021-07-01','ONHOLE');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `number_of_bed` int NOT NULL,
  `price` double NOT NULL,
  `room_number` varchar(100) NOT NULL,
  `status` varchar(255) NOT NULL,
  `roomtype_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK92wwx13iwxnrx4g08dv6dpd2e` (`roomtype_id`),
  CONSTRAINT `FK92wwx13iwxnrx4g08dv6dpd2e` FOREIGN KEY (`roomtype_id`) REFERENCES `room_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (5,'2021-07-01',2,6000000,'GS01','AVAILABLE',21),(6,'2021-07-01',2,4500000,'GS02','AVAILABLE',21),(7,'2021-07-02',2,2500000,'SP01','AVAILABLE',22),(8,'2021-07-02',2,3000000,'SP02','AVAILABLE',22),(9,'2021-07-03',1,3200000,'DL01','AVAILABLE',20),(10,'2021-07-03',2,3600000,'DL02','AVAILABLE',20),(11,'2021-07-04',1,3500000,'DLO01','AVAILABLE',19),(12,'2021-07-04',2,3500000,'DLO02','AVAILABLE',19);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `guests` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `size_room` varchar(100) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES (19,'2021-06-28',NULL,2,'DELUXE OCEAN VIEW','35 m2','AVAILABLE'),(20,'2021-06-28','Deluxe rooms are international five-star standard rooms with an average area of 33-35m2; double/twin bed with city view. New and modern equipment goes together with the elegant interior design. Our guests will have the best choices of landscapes and views.',2,'DELUXE','33 - 35 m2','AVAILABLE'),(21,'2021-06-29','This charming room overlooks the magnificent view of My Khe beach and Da Nang city. Elegant dÃ©cor and large sitting area with sofa, coffee table.',2,'GRAND SUITE','89 m2','AVAILABLE'),(22,'2021-06-29','New and modern equipment goes together with the elegant interior design. Our guests will have the best choices of landscapes and views',2,'SUPERIOR','35 m2','AVAILABLE'),(23,'2021-07-01',NULL,2,'PRESIDENTIAL SUITE','405 m2','UNAVAILABLE');
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtype_convenient`
--

DROP TABLE IF EXISTS `roomtype_convenient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomtype_convenient` (
  `roomtype_id` int NOT NULL,
  `convenient_id` int NOT NULL,
  KEY `FKn7953dra3crkjp3e51x88n1ab` (`convenient_id`),
  KEY `FKhhmrwyrnmt109sgyfl7qjtyd3` (`roomtype_id`),
  CONSTRAINT `FKhhmrwyrnmt109sgyfl7qjtyd3` FOREIGN KEY (`roomtype_id`) REFERENCES `room_type` (`id`),
  CONSTRAINT `FKn7953dra3crkjp3e51x88n1ab` FOREIGN KEY (`convenient_id`) REFERENCES `convenient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtype_convenient`
--

LOCK TABLES `roomtype_convenient` WRITE;
/*!40000 ALTER TABLE `roomtype_convenient` DISABLE KEYS */;
INSERT INTO `roomtype_convenient` VALUES (21,1),(21,2),(21,3),(21,4),(21,5),(21,6),(21,7),(21,8),(21,9),(21,10),(21,11),(21,12),(21,13),(21,14),(21,15),(21,16),(21,17),(21,18),(21,19),(21,20),(21,21),(22,1),(22,2),(22,3),(22,4),(22,5),(22,6),(22,7),(22,8),(22,9),(22,10),(22,11),(22,12),(22,13),(22,14),(22,15),(22,16),(22,17),(22,18),(22,19),(22,20),(22,21),(23,1),(23,2),(23,3),(23,4),(23,5),(23,6),(23,7),(23,8),(23,9),(23,10),(23,11),(23,12),(23,13),(23,14),(23,15),(23,16),(23,17),(23,18),(23,19),(23,20),(23,21),(19,1),(19,2),(19,3),(19,4),(19,5),(19,6),(19,7),(19,8),(19,9),(19,10),(19,11),(19,12),(19,13),(19,14),(19,15),(19,16),(19,17),(19,18),(19,19),(19,20),(19,21),(20,1),(20,2),(20,3),(20,4),(20,5),(20,6),(20,7),(20,8),(20,9),(20,10),(20,11),(20,12),(20,13),(20,14),(20,15),(20,16),(20,17),(20,18),(20,19),(20,20),(20,21);
/*!40000 ALTER TABLE `roomtype_convenient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtype_promotion`
--

DROP TABLE IF EXISTS `roomtype_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomtype_promotion` (
  `promotion_id` int NOT NULL,
  `roomtype_id` int NOT NULL,
  KEY `FKe1x16hs5iob6mxrgy5thahpvt` (`roomtype_id`),
  KEY `FKaanbf5sbwfrd9qx9d5xgfmwxy` (`promotion_id`),
  CONSTRAINT `FKaanbf5sbwfrd9qx9d5xgfmwxy` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`),
  CONSTRAINT `FKe1x16hs5iob6mxrgy5thahpvt` FOREIGN KEY (`roomtype_id`) REFERENCES `room_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtype_promotion`
--

LOCK TABLES `roomtype_promotion` WRITE;
/*!40000 ALTER TABLE `roomtype_promotion` DISABLE KEYS */;
INSERT INTO `roomtype_promotion` VALUES (18,19),(18,20),(18,21),(18,22),(18,23);
/*!40000 ALTER TABLE `roomtype_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `open_time` varchar(20) DEFAULT NULL,
  `phone_number` varchar(1000) DEFAULT NULL,
  `price` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (4,'2021-07-01','Rooftop Bar serves cocktails, cool martinis, spirits and refreshments to those that wish to enjoy the active Da Nang city from 40th floor.','40th ,41st Floor','Rooftop Bar','7:00 - 23:00',NULL,300000,'AVAILABLE'),(5,'2021-07-01','Refresh and relax yourself with Non Nuoc  Bar at Hotel Lobby with vibrant themed space and live music.','Lobby','Non Nuoc Bar','6:00 - 23:00',NULL,1000000,'AVAILABLE'),(6,'2021-07-02','VIP Dining rooms are at the guests, disposal, as well as private services and professional chef.','3rd floor','VIP Dining Room','Upon Request',NULL,1000000,'AVAILABLE'),(7,'2021-07-02','VIP Lounge is particularly designed to bring out the most exclusive and ultimate need of luxury for our VIP guests.','39th floor','VIP Lounge','6:00 - 22:00',NULL,1500000,'AVAILABLE'),(8,'2021-07-03','At Moc Son Banquet Hall, a variety of delicious dishes prepared to satisfy the most exclusive taste as well as a system of modern equipment available to meet any requirement of gala, parties and events.',NULL,'Moc Son Banquet Hall','Upon Request',NULL,500000,'AVAILABLE'),(9,'2021-07-03','Here a delicious dinner or lunch is an excellent opportunity to enjoy the day and to delight in ocean breeze. The restaurant also serves buffet breakfast. Capacity: 300 pax','2nd floor','Kim Son restaurant','6h00 - 22h30',NULL,1200000,'AVAILABLE'),(10,'2021-07-04','Whether you need to be in top form for a whole day of meetings, or simply want to be fit, your efforts will be rewarded in our Gym.','6th floor','GYM','6:00 - 20:00',NULL,200000,'AVAILABLE'),(11,'2021-07-04','Tennis Court is available for the lovers of Tennis that even on holidays enjoy a game or two, or even for those of you that would just like to test your tennis skills during your holiday.','6th floor','Tennis Court','6:00 - 22:00',NULL,300000,'AVAILABLE'),(12,'2021-07-05','The hotel Spa therapists are at the guests service to provide them with rejuvenating health and beauty treatments at the Hoa Su Spa & Massage situated right on 7th floor.','7th floor','Hoa Su Spa & Massage','9:00 - 23: 30',NULL,400000,'AVAILABLE'),(13,'2021-07-05','Guests can relax in swimming pool, to make the most out of their vacation.','6th floor','Swimming Pool','6:00 - 20:00',NULL,200000,'AVAILABLE'),(14,'2021-07-06','Kid corner, Currency exchange, 24 hours Room service, Laundry and Dry cleaning services, Airline tickets, Photocopy and Secretarial services, Services birthday / Wedding',NULL,'Other Services','Upon request',NULL,0,'AVAILABLE'),(15,'2021-07-06','Take a swing and ace your time with friends and family at one of the most delightful five star karaoke rooms at our hotel.','6th floor','Karaoke','9:00 - 23:30',NULL,200000,'AVAILABLE');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_booking`
--

DROP TABLE IF EXISTS `service_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `service_book_date` date DEFAULT NULL,
  `booking_detail_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnkolpdkbywa8gnr2uwqk5uxpi` (`booking_detail_id`),
  KEY `FKfhagsornipto6hjb58le3g4s2` (`service_id`),
  CONSTRAINT `FKfhagsornipto6hjb58le3g4s2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `FKnkolpdkbywa8gnr2uwqk5uxpi` FOREIGN KEY (`booking_detail_id`) REFERENCES `booking_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_booking`
--

LOCK TABLES `service_booking` WRITE;
/*!40000 ALTER TABLE `service_booking` DISABLE KEYS */;
INSERT INTO `service_booking` VALUES (16,300000,1,'2021-07-03',1,4),(17,300000,1,'2021-07-03',2,4),(19,1000000,4,'2021-07-03',3,5),(51,1000000,4,'2021-07-04',2,5),(52,1000000,1,'2021-07-04',4,5),(53,200000,1,'2021-07-04',4,15),(54,200000,3,'2021-07-04',1,10),(55,400000,1,'2021-07-06',3,12),(57,1000000,1,'2021-07-06',3,5),(58,300000,2,'2021-07-06',4,4),(59,1000000,1,'2021-07-06',1,5);
/*!40000 ALTER TABLE `service_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(200) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fullName` varchar(100) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(255) NOT NULL,
  `vote` int DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'DaNang','1991-10-22','wonderful19922@gmail.com','Nguyen Ngoc Huy','MALE','0969461086','$2a$10$zeq2jxYPx.HHwqDVoVkkRuwFY48goAS.zvjGqqe2ncmgLPTcX19ke','ACTIVE',0,'2021-07-01'),(2,'QuangNam1','1992-02-02','nghuymt@gmail.com','Nguyen Van Huy','MALE','0947829795','$2a$10$yUOJhkHVnVCwuqJlxoqGxu0FeD2bma6GdR/ctBYbfOyly6Ufhf0Pm','UNACTIVE',5,'2021-07-01'),(3,'Hue','1993-03-03','nguyenhuy.dentec@gmail.com','Nguyen Ba Huy','MALE','0999999999','$2a$10$pwoTSJtNlTe71XSJR56pxeOeqIqWj0WQbmm5j1cPTo9tqZh1kKi56','ACTIVE',5,'2021-07-01'),(4,'QuangNgai','1996-06-09','hello@gmail.com','Nguyen Kim Huy','MALE','0111111111','$2a$10$zeq2jxYPx.HHwqDVoVkkRuwFY48goAS.zvjGqqe2ncmgLPTcX19ke','ACTIVE',5,'2021-07-02');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_commment`
--

DROP TABLE IF EXISTS `user_commment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_commment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbmmmut7bj23m5vtfw00lknr0h` (`user_id`),
  KEY `FKpcaqlmsixq6wjypcuwqfkssn4` (`room_id`),
  CONSTRAINT `FKbmmmut7bj23m5vtfw00lknr0h` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKpcaqlmsixq6wjypcuwqfkssn4` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_commment`
--

LOCK TABLES `user_commment` WRITE;
/*!40000 ALTER TABLE `user_commment` DISABLE KEYS */;
INSERT INTO `user_commment` VALUES (1,'Ten toi la Nguyen Ngoc Huy. Khach san nay nhieu phong dep qua, dang cap so 1 the gioi.','2021-06-01',1,NULL),(2,'Toi la An. Khach san nay qua pro.','2021-06-01',2,NULL),(3,'Lai la toi day. Review chut choi.','2021-06-04',1,NULL),(6,'Chan qua troi qua dat.','2021-07-05',2,NULL),(7,'Cho toi xin it niem vui.','2021-07-05',2,NULL),(8,'Co ai nghe tui noi gi khong vay troi?','2021-07-05',3,NULL),(9,'hleajdhasasd asdsad ','2021-07-06',3,NULL);
/*!40000 ALTER TABLE `user_commment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `userRole` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'ROLE_USER',NULL),(2,'ROLE_ADMIN',NULL),(3,'ROLE_RECEPTIONIST',NULL),(4,'ROLE_MANAGER',NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_relationship`
--

DROP TABLE IF EXISTS `user_role_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role_relationship` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKjrky4py4v4t0v3aw7mmc92sne` (`role_id`),
  CONSTRAINT `FKehp88qoke5p45o64h3j6p08q5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKjrky4py4v4t0v3aw7mmc92sne` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_relationship`
--

LOCK TABLES `user_role_relationship` WRITE;
/*!40000 ALTER TABLE `user_role_relationship` DISABLE KEYS */;
INSERT INTO `user_role_relationship` VALUES (4,1),(1,2),(1,3),(2,3),(3,3),(1,4),(2,4),(3,4);
/*!40000 ALTER TABLE `user_role_relationship` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-12 21:44:32
