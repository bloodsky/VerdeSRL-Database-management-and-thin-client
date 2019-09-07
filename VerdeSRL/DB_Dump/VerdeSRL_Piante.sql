-- MariaDB dump 10.17  Distrib 10.4.6-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: VerdeSRL
-- ------------------------------------------------------
-- Server version	10.4.6-MariaDB

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
-- Table structure for table `Piante`
--

DROP TABLE IF EXISTS `Piante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Piante` (
  `CodicePianta` int(11) NOT NULL AUTO_INCREMENT,
  `Giardino` tinyint(1) DEFAULT NULL,
  `Esotica` tinyint(1) DEFAULT NULL,
  `NomeComune` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NomeLatino` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CodFornitore` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodicePianta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Piante`
--

LOCK TABLES `Piante` WRITE;
/*!40000 ALTER TABLE `Piante` DISABLE KEYS */;
INSERT INTO `Piante` VALUES (1,1,0,'Caglio dei boschi','Galium sylvaticum L.',1),(2,1,1,'Garofanino ad ombrella','Holosteum umbellatum L.',2),(3,0,1,'Lacrime dItalia','Symphoricarpos albus Blake',3),(4,1,1,'Ruchetta selvatica','Diplotaxis tenuifolia',4),(5,0,1,'Violaciocca selvatica','Erysimum cheiranthoides',5);
/*!40000 ALTER TABLE `Piante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-26 15:49:44
