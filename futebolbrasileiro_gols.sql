-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: futebolbrasileiro
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `gols`
--

DROP TABLE IF EXISTS `gols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gols` (
  `IdPartida` int NOT NULL,
  `Rodada` int NOT NULL,
  `Clube` varchar(125) NOT NULL,
  `Atleta` varchar(45) NOT NULL,
  `Minuto` int NOT NULL COMMENT 'INT pois irá marcar o minuto do gol, dentro dos 90 minutos da partida. Considerando Limite 90',
  `TipoDeGol` varchar(25) DEFAULT NULL,
  KEY `fk_Gols_CampeonatoBrasileiro1_idx` (`IdPartida`),
  CONSTRAINT `fk_Gols_CampeonatoBrasileiro1` FOREIGN KEY (`IdPartida`) REFERENCES `campeonatobrasileiro` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gols`
--

LOCK TABLES `gols` WRITE;
/*!40000 ALTER TABLE `gols` DISABLE KEYS */;
INSERT INTO `gols` VALUES (8026,1,'Cuiaba','Raniele',45,NULL),(8026,1,'Palmeiras','Endrick',5,NULL),(8026,1,'Palmeiras','José Manuel Alberto López',65,NULL),(8027,1,'Fluminense','Germán Cano',52,NULL),(8027,1,'Fluminense','John Kennedy',60,NULL),(8027,1,'Fluminense','Leanderson da Silva Genésio',72,NULL),(8029,1,'Bragantino','Eduardo Sasha',70,NULL),(8029,1,'Bahia','Everaldo Stum',45,NULL),(8029,1,'Bragantino','Bruno Gonçalves',54,NULL),(8030,1,'Athletico-PR','Pedro Henrique Ribeiro Gonçalves',36,NULL),(8030,1,'Athletico-PR','Christian Roberto Alves Cardoso',57,NULL),(8031,1,'Fortaleza','Moisés Vieira da Veiga',56,NULL),(8031,1,'Internacional','Wanderson',54,NULL),(8028,1,'Botafogo-RJ','Tiquinho Soares',4,NULL),(8028,1,'Botafogo-RJ','Carlos Eduardo de Oliveira Alves',88,NULL),(8028,1,'Sao Paulo','Jonathan Calleri',15,NULL),(8032,1,'Vasco','Gabriel Pec',10,NULL),(8032,1,'Atletico-MG','Mauricio Lemos',45,NULL),(8032,1,'Vasco','Andrey Santos',5,NULL),(8034,1,'Flamengo','Ayrton Lucas Dantas de Medeiros',12,NULL);
/*!40000 ALTER TABLE `gols` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-02 23:14:03
