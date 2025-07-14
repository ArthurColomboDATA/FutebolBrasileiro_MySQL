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
-- Table structure for table `campeonatobrasileiro`
--

DROP TABLE IF EXISTS `campeonatobrasileiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campeonatobrasileiro` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID da partida',
  `Data` date NOT NULL,
  `Rodada` int NOT NULL COMMENT 'Rodada do Brasileirão',
  `Horário` time NOT NULL COMMENT 'Horário da Partida',
  `Mandante` varchar(150) NOT NULL COMMENT 'Clube Mandante',
  `Visitante` varchar(150) NOT NULL,
  `FormaçãoMandante` varchar(15) NOT NULL,
  `FormaçãoVisitante` varchar(15) NOT NULL,
  `TecnicoMandante` varchar(45) NOT NULL,
  `TecnicoVisitante` varchar(45) NOT NULL,
  `Vencedor` varchar(150) NOT NULL,
  `Arena` varchar(125) NOT NULL,
  `MandantePlacar` int NOT NULL DEFAULT '0',
  `VisitantePlacar` int NOT NULL DEFAULT '0',
  `MandanteEstado` char(2) NOT NULL COMMENT 'UF do time',
  `VisitanteEstado` char(2) NOT NULL COMMENT 'UF do time',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8046 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campeonatobrasileiro`
--

LOCK TABLES `campeonatobrasileiro` WRITE;
/*!40000 ALTER TABLE `campeonatobrasileiro` DISABLE KEYS */;
INSERT INTO `campeonatobrasileiro` VALUES (8026,'2023-04-15',1,'16:01:00','Palmeiras','Cuiaba','4-2-3-1','4-2-3-1','A. Moreira Ferreira','I. Abreu Vieira','Palmeiras','Allianz Parque',2,1,'SP','MT'),(8027,'2023-04-15',1,'16:02:00','America-MG','Fluminense','4-2-3-1','4-2-2-2','V. Carmo Mancini','F. Diniz Silva','Fluminense','Estádio Raimundo Sampaio',0,3,'MG','RJ'),(8028,'2023-04-15',1,'18:33:00','Botafogo-RJ','Sao Paulo','4-2-3-1','4-1-4-1','L. Ribeiro de Castro','R. Ceni','Botafogo-RJ','Estádio Nilton Santos',2,1,'RJ','SP'),(8029,'2023-04-15',1,'18:31:00','Bragantino','Bahia','4-2-3-1','3-4-3_','P. Faria Caixinha','R. Alves Paiva','Bragantino','Nabizão',2,1,'SP','BA'),(8030,'2023-04-15',1,'18:31:00','Athletico-PR','Goias','4-2-3-1','4-2-3-1','P. Turra','E. Rodrigues de Ávila','Athletico-PR','Ligga Arena',2,0,'PR','GO'),(8031,'2023-04-15',1,'18:32:00','Fortaleza','Internacional','4-2-2-2','4-2-3-1','J. Vojvoda','L. Venker de Menezes','-','Arena Castelão',1,1,'CE','RS'),(8032,'2023-04-15',1,'21:00:00','Atletico-MG','Vasco','4-3-3_','4-3-3_','E. Coudet','M. Nogueira Barbieri','Vasco',' Mineirão',1,2,'MG','RJ'),(8033,'2023-04-16',1,'16:03:00','Corinthians','Cruzeiro','4-2-3-1','4-2-3-1','F. Lázaro Rodrigues Alves','P. Marques da Costa Filipe','Corinthians','Neo Química Arena',2,1,'SP','MG'),(8034,'2023-04-16',1,'16:00:00','Flamengo','Coritiba','4-2-3-1','4-3-3_','J. Sampaoli Moya','A. Cardoso de Oliveira','Flamengo',' Maracanã',3,0,'RJ','PR'),(8035,'2023-04-16',1,'18:30:00','Gremio','Santos','4-2-3-1','4-3-3_','Renato Gaúcho','O. Hellmann','Gremio',' Alfredo Jaconi',1,0,'RS','SP'),(8036,'2023-04-22',2,'16:00:00','Fluminense','Athletico-PR','4-2-3-1','4-2-3-1','F. Diniz Silva','P. Turra','Fluminense',' Maracanã',2,0,'RJ','PR'),(8037,'2023-04-22',2,'18:31:00','Sao Paulo','America-MG','4-1-3-2','4-2-3-1','D. Silvestre Júnior','V. Carmo Mancini','Sao Paulo',' Morumbi',3,0,'SP','MG'),(8038,'2023-04-22',2,'18:30:00','Cuiaba','Bragantino','4-2-3-1','4-3-3_','I. Abreu Vieira','P. Faria Caixinha','-','Arena Pantanal',1,1,'MT','SP'),(8039,'2023-04-22',2,'20:59:00','Cruzeiro','Gremio','4-2-3-1','4-2-3-1','P. Marques da Costa Filipe','Renato Gaúcho','Cruzeiro','Estádio Raimundo Sampaio',1,0,'MG','RS'),(8040,'2023-04-23',2,'11:01:00','Internacional','Flamengo','4-2-3-1','4-1-2-1-2','L. Venker de Menezes','J. Sampaoli Moya','Internacional','Estádio Beira-Rio',2,1,'RS','RJ'),(8041,'2023-04-23',2,'16:00:00','Santos','Atletico-MG','4-4-2_','4-4-2_','O. Hellmann','E. Coudet','-','Estádio Urbano Caldeira',0,0,'SP','MG'),(8042,'2023-04-23',2,'16:00:00','Vasco','Palmeiras','4-3-3_','4-2-3-1','C. Maldonado','V. Castanheira Penas','-',' Maracanã',2,2,'RJ','SP'),(8043,'2023-04-23',2,'18:31:00','Coritiba','Fortaleza','3-1-4-2','4-4-2_','L. De Souza','J. Vojvoda','Fortaleza',' Couto Pereira',0,3,'PR','CE'),(8044,'2023-04-23',2,'19:00:00','Goias','Corinthians','4-2-3-1','4-2-3-1','E. Rodrigues de Ávila','A. Stival','Goias','Estádio Hailé Pinheiro - Serrinha',3,1,'GO','SP'),(8045,'2023-04-24',2,'20:00:00','Bahia','Botafogo-RJ','5-4-1_','4-2-3-1','R. Alves Paiva','L. Ribeiro de Castro','Botafogo-RJ','Itaipava Arena Fonte Nova',1,2,'BA','RJ');
/*!40000 ALTER TABLE `campeonatobrasileiro` ENABLE KEYS */;
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
