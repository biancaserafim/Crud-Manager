CREATE DATABASE  IF NOT EXISTS `crud_manager` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crud_manager`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: crud_manager
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `role` varchar(128) NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (2,'Padaria Pão Quente','Atendente','2018-02-01','2019-06-30',1),(3,'Mercado Bom Preço','Repositor','2019-07-15','2020-12-20',1),(4,'Tech Sul Informática','Técnico de suporte','2021-01-10','2022-03-31',1),(5,'Agro Café Machado','Auxiliar administrativo','2022-04-05','2023-08-18',1),(6,'Escola Aprender Mais','Monitor','2023-02-01','2023-11-30',1),(7,'Loja Moda Fácil','Vendedor','2023-12-04','2024-09-13',1),(8,'Softwares & Cia','Estagiário de TI','2024-10-01',NULL,1),(9,'Rede Farma Saúde','Atendente de balcão','2025-01-20',NULL,1),(10,'Oficina Mecânica AutoCar','Ajudante de mecânico','2016-05-02','2017-08-30',1),(11,'Restaurante Sabor Mineiro','Garçom','2017-09-10','2018-01-25',1),(12,'Construtora Horizonte','Auxiliar de almoxarifado','2020-01-15','2020-11-10',1),(13,'Clínica Vida Plena','Recepcionista','2021-06-01','2022-02-28',1),(14,'Transportadora Rápido Sul','Assistente de logística','2022-09-01','2023-07-15',1),(15,'Agência Digital Criativa','Social Media','2024-02-12','2024-11-20',1),(16,'Academia Corpo em Movimento','Consultor de vendas','2025-03-03',NULL,1),(17,'Supermercado Família','Operador de caixa','2015-03-02','2016-04-15',1),(18,'Hotel Bela Vista','Mensageiro','2016-09-01','2017-04-30',1),(19,'Gráfica Expressa','Arte-finalista','2018-08-10','2019-05-20',1),(20,'Auto Peças Brasil','Conferente de estoque','2019-10-01','2020-08-14',1),(21,'Imobiliária Casa Nova','Corretor de imóveis','2021-03-15','2022-01-31',1),(22,'Laboratório Exame Certo','Auxiliar de coleta','2022-05-02','2023-01-20',1),(23,'Pet Shop Amigo Fiel','Banhista e tosador','2023-03-01','2023-12-15',1),(24,'Contabilidade Precisão','Assistente fiscal','2024-01-08','2024-10-30',1),(25,'Fábrica Móveis Rústicos','Marceneiro auxiliar','2025-02-03','2025-11-28',1),(26,'Inova Cloud Sistemas','Desenvolvedor Júnior','2026-01-12',NULL,1);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `post_date` date NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Olá do Emerson','2026-11-15',1),(2,'Olá da Luiza','2026-11-15',2),(3,'Olá da Denise','2026-11-15',3),(4,'Olá do Noé','2026-11-15',4),(5,'Olá da Rosânia','2026-11-15',5),(6,'Olá da Rosânia 1','2026-11-15',5),(8,'Olá da Rosânia 3','2026-11-15',5),(13,'Primeiro post de teste','2026-11-01',1),(14,'Segundo post de teste','2026-11-02',1),(15,'Terceiro post de teste','2026-11-03',1),(16,'Quarto post de teste','2026-11-04',1),(17,'Quinto post de teste','2026-11-05',1),(18,'Sexto post de teste','2026-11-06',1),(19,'Sétimo post de teste','2026-11-07',1),(23,'Post de teste 02 - novidades do dia','2026-11-02',1),(24,'Post de teste 03 - estudando Servlets','2026-11-03',1),(25,'Post de teste 04 - projeto CRUD','2026-11-04',1),(26,'Post de teste 05 - testando a lista','2026-11-05',1),(27,'Post de teste 06 - segunda página','2026-11-06',1),(28,'Post de teste 07 - mais um post','2026-11-07',1),(29,'Post de teste 08 - quase lá','2026-11-08',1),(30,'Post de teste 09 - paginação','2026-11-09',1),(31,'Post de teste 10 - fim da página 2','2026-11-10',1),(32,'Post de teste 11 - terceira página','2026-11-11',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit` enum('UNIDADE','QUILO','LITRO') NOT NULL,
  `expiration_date` date NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (6,'Arroz 5kg',28.90,'UNIDADE','2027-01-15',6),(8,'Tomate',6.99,'QUILO','2026-11-30',8),(9,'Leite Integral',5.20,'LITRO','2026-12-20',9),(10,'Suco de Laranja',12.40,'LITRO','2027-02-05',10),(11,'Açúcar Refinado',4.80,'QUILO','2027-06-01',7),(13,'Detergente 500ml',2.99,'UNIDADE','2028-01-01',13),(14,'Pão Francês',14.00,'QUILO','2026-11-25',7);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `payment_term` enum('A_VISTA','7_DIAS','15_DIAS','30_DIAS') NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (6,'Distribuidora Sul','contato@distsul.com','35999990001','30_DIAS',1),(7,'Atacado Minas','vendas@atacadominas.com','35999990002','A_VISTA',2),(8,'Hortifruti Boa Terra','pedidos@boaterra.com','35999990003','7_DIAS',3),(9,'Laticínios Serra Azul','comercial@serraazul.com','35999990004','15_DIAS',4),(10,'Bebidas Mantiqueira','contato@mantiqueira.com','35999990005','30_DIAS',5),(11,'Mercearia Central','mercearia@central.com','35999990006','A_VISTA',1),(13,'Limpeza Total','contato@limpezatotal.com','35999990008','30_DIAS',3),(14,'Padaria Pão Quente','padaria@paoquente.com','35999990009','7_DIAS',4);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Emerson Carvalho','M','emerson@mail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),(2,'Luiza Carvalho','F','lu@mail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),(3,'Elenice Carvalho','F','le@mail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),(4,'Noé Carvalho','M','noe@mail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),(5,'Rosânia Carvalho','F','ro@mail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),(8,'lia','F','li@gmail.com','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b'),(10,'Bruno Martins','M','bruno.martins@email.com',''),(11,'Beatriz Rocha','F','beatriz.rocha@email.com',''),(12,'Diego Carvalho','M','diego.carvalho@email.com',''),(13,'Larissa Mendes','F','larissa.mendes@email.com',''),(14,'Felipe Barbosa','M','felipe.barbosa@email.com',''),(15,'Vanessa Ribeiro','F','vanessa.ribeiro@email.com',''),(16,'Rodrigo Teixeira','M','rodrigo.teixeira@email.com',''),(17,'Patrícia Gomes','F','patricia.gomes@email.com',''),(18,'Gustavo Azevedo','M','gustavo.azevedo@email.com',''),(19,'Aline Moreira','F','aline.moreira@email.com',''),(21,'Ana Souza','F','ana.souza@teste.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),(22,'Bruno Lima','M','bruno.lima@teste.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),(23,'Carla Dias','F','carla.dias@teste.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),(24,'Diego Alves','M','diego.alves@teste.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),(25,'Elisa Rocha','F','elisa.rocha@teste.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),(26,'Fábio Costa','M','fabio.costa@teste.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),(27,'Lucas Almeida','M','lucas.almeida@email.com','55a5e9e78207b4df8699d60886fa070079463547b095d1a05bc719bb4e6cd251'),(28,'Mariana Costa','F','mariana.costa@email.com','f91c5a9d03815bd384982f0b3de4968dad27c57d7ad252bb83218c6d5e6ba467'),(29,'Pedro Henrique Silva','M','pedro.silva@email.com','5feadddd041a836c742ccba61d11ebbc505a805552aec2cfc1225452a26683fb'),(30,'Juliana Ferreira','F','juliana.ferreira@email.com','45ea01b3706699bd46248b9e11bdee52f00173fbaeb12c0af5cf0b570a855f48'),(31,'Rafael Oliveira','M','rafael.oliveira@email.com','4bddd101a55dc79270f0e19e7261ababd00ce01c2c393b1b1a6f98ceb216255b'),(32,'Camila Santos','F','camila.santos@email.com','ecd5e4c6e5eadd860d64a0c052a376bf9314012d992fc0b93184020825110d33'),(33,'Gabriel Souza','M','gabriel.souza@email.com','638fd1775b53e6fdb72c52acd1443355783dd7707b216e3d3d21bc5e1f80820e'),(34,'Fernanda Lima','F','fernanda.lima@email.com','8f15e8bae4aaf037403504820a18d10bfd5b4bace18322a2ea335c16ac6058c8'),(35,'Thiago Pereira','M','thiago.pereira@email.com','23396ea58421ef06ea12e23820e38da142ec06d4c4282589a8154f3982d1c49e'),(36,'Amanda Rodrigues','F','amanda.rodrigues@email.com','28eec1755faeb63a907968b09949f2f05894045ba8412f49848a549c60245929');
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

-- Dump completed on 2026-11-16 19:21:07
