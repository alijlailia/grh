CREATE DATABASE  IF NOT EXISTS `grh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `grh`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: grh
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `authentification`
--

DROP TABLE IF EXISTS `authentification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentification` (
  `matricule` int NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`matricule`),
  CONSTRAINT `FK_employe_matricule_auth` FOREIGN KEY (`matricule`) REFERENCES `employe` (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentification`
--

LOCK TABLES `authentification` WRITE;
/*!40000 ALTER TABLE `authentification` DISABLE KEYS */;
INSERT INTO `authentification` VALUES (1,'{noop}1'),(2,'{noop}2'),(3,'{noop}3');
/*!40000 ALTER TABLE `authentification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conge`
--

DROP TABLE IF EXISTS `conge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conge` (
  `id` int NOT NULL,
  `matricle` int DEFAULT NULL,
  `date_demande` datetime DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `statut` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matricule_idx` (`matricle`),
  CONSTRAINT `FK_employe_matricule_conge` FOREIGN KEY (`matricle`) REFERENCES `employe` (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conge`
--

LOCK TABLES `conge` WRITE;
/*!40000 ALTER TABLE `conge` DISABLE KEYS */;
/*!40000 ALTER TABLE `conge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employe` (
  `matricule` int NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `fonction` varchar(45) NOT NULL,
  `num_cin` int DEFAULT NULL,
  `num_cnss` int DEFAULT NULL,
  `matricule_responsable` int DEFAULT NULL,
  PRIMARY KEY (`matricule`),
  UNIQUE KEY `matricule_UNIQUE` (`matricule`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `numCin_UNIQUE` (`num_cin`),
  UNIQUE KEY `numCnss_UNIQUE` (`num_cnss`),
  KEY `FK_employe_employe_idx` (`matricule_responsable`),
  CONSTRAINT `FK_employe_employe` FOREIGN KEY (`matricule_responsable`) REFERENCES `employe` (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,'Jlailia','Ali','email1',NULL,'a','2001-02-01','DIRECTEUR',1,1,NULL),(2,'Dallali','Ramzi','email2',NULL,'a','2000-01-01','CADRE',2,2,1),(3,'Tlijani','Samir','email3',NULL,'a','2001-01-15','OUVRIER',3,3,1),(4,'Nom1','Prénom1','email4',NULL,'a','2001-10-10','OUVRIER',4,4,2),(5,'Nom2','Prénom2','email5',NULL,'a','2001-10-10','OUVRIER',5,5,3),(33,'aaa','aaa','aaa@aaa.com','','',NULL,'OUVRIER',NULL,NULL,2);
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `matricule` int DEFAULT NULL,
  `objet` varchar(45) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `date_msg` datetime DEFAULT NULL,
  `statut` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_employe_matricule_idx` (`matricule`),
  CONSTRAINT `FK_employe_matricule` FOREIGN KEY (`matricule`) REFERENCES `employe` (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pointage`
--

DROP TABLE IF EXISTS `pointage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pointage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `matricule_chef` int NOT NULL,
  `matricule_employe` int NOT NULL,
  `mois` int NOT NULL,
  `nombre_jours` int DEFAULT NULL,
  `heures_supp` int DEFAULT NULL,
  `lieu_travail` varchar(45) DEFAULT NULL,
  `date_pointage` datetime DEFAULT NULL,
  `statut` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_pointage_idx` (`matricule_chef`),
  KEY `FK2_pointage_idx` (`matricule_employe`),
  CONSTRAINT `FK1` FOREIGN KEY (`matricule_chef`) REFERENCES `employe` (`matricule`),
  CONSTRAINT `FK2` FOREIGN KEY (`matricule_employe`) REFERENCES `employe` (`matricule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pointage`
--

LOCK TABLES `pointage` WRITE;
/*!40000 ALTER TABLE `pointage` DISABLE KEYS */;
/*!40000 ALTER TABLE `pointage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-07 12:17:38
