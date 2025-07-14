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
-- Table structure for table `cartoes`
--

DROP TABLE IF EXISTS `cartoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartoes` (
  `IdPartida` int NOT NULL,
  `Rodada` int NOT NULL,
  `Clube` varchar(45) NOT NULL,
  `Cartao` varchar(10) NOT NULL DEFAULT '-',
  `Atleta` varchar(45) NOT NULL,
  `NumCamisa` int NOT NULL,
  `Posicao` char(2) NOT NULL COMMENT 'Ataque - AT\nMeio Campista - MC\nDefensor - DF\nGoleiro - GL',
  `Minuto` int DEFAULT NULL,
  KEY `fk_Cartoes_CampeonatoBrasileiro1_idx` (`IdPartida`),
  CONSTRAINT `fk_Cartoes_CampeonatoBrasileiro1` FOREIGN KEY (`IdPartida`) REFERENCES `campeonatobrasileiro` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoes`
--

LOCK TABLES `cartoes` WRITE;
/*!40000 ALTER TABLE `cartoes` DISABLE KEYS */;
INSERT INTO `cartoes` VALUES (8026,1,'Palmeiras','Amarelo','José Manuel Alberto López',18,'MC',37),(8026,1,'Cuiaba','Amarelo','Mateusinho',98,'DF',48),(8026,1,'Cuiaba','Amarelo','Deyverson',16,'AT',6),(8026,1,'Cuiaba','Vermelho','Filipe Augusto Carvalho Souza',5,'MC',57),(8026,1,'Palmeiras','Amarelo','Jhonatan dos Santos Rosa',40,'MC',66),(8026,1,'Cuiaba','Amarelo','Filipe Augusto Carvalho Souza',5,'MC',52),(8026,1,'Cuiaba','Amarelo','Jonathan Cafú',7,'MC',45),(8027,1,'America-MG','Amarelo','Éder',33,'DF',45),(8027,1,'Fluminense','Amarelo','John Kennedy',9,'AT',45),(8027,1,'America-MG','Amarelo','Nino Paraíba',2,'DF',48),(8027,1,'America-MG','Amarelo','Iago Maidana',3,'DF',41),(8027,1,'Fluminense','Amarelo','Vitor Mendes',4,'DF',40),(8029,1,'Bragantino','Amarelo','Juninho Capixaba',29,'DF',73),(8029,1,'Bahia','Amarelo','Vítor Jacaré',29,'MC',22),(8029,1,'Bragantino','Amarelo','Lucão',40,'GL',84),(8029,1,'Bragantino','Amarelo','Jadsom',5,'MC',41),(8030,1,'Athletico-PR','Amarelo','Pedro Henrique Ribeiro Gonçalves',34,'DF',10),(8030,1,'Goias','Amarelo','Bruno Melo',19,'DF',83),(8030,1,'Athletico-PR','Amarelo','Pablo Felipe Teixeira',92,'AT',90),(8030,1,'Goias','Amarelo','Jhonny Lucas',77,'MC',90);
/*!40000 ALTER TABLE `cartoes` ENABLE KEYS */;
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
