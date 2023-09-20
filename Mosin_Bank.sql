-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	5.7.42-0ubuntu0.18.04.1

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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `acc_no` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`acc_no`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `Branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,'BOB',10000),(2,'ICICI',20000),(3,'AXIS',25000),(4,'HDFC',35000),(5,'BOM',45000),(6,'APNA_BANK',55000),(7,'SBI',65000),(8,'CENTRAL_BANK_OF_INDIA',5000),(9,'JANTA_BANK',59000),(10,'CANARA_BANK',57000),(11,'Magarpatta',25600760);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Borrower`
--

DROP TABLE IF EXISTS `Borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Borrower` (
  `cust_name` varchar(255) DEFAULT NULL,
  `loan_no` int(11) DEFAULT NULL,
  KEY `cust_name` (`cust_name`),
  KEY `loan_no` (`loan_no`),
  CONSTRAINT `Borrower_ibfk_1` FOREIGN KEY (`cust_name`) REFERENCES `Customer` (`cust_name`),
  CONSTRAINT `Borrower_ibfk_2` FOREIGN KEY (`loan_no`) REFERENCES `loan` (`loan_no`),
  CONSTRAINT `loan_no` FOREIGN KEY (`loan_no`) REFERENCES `loan` (`loan_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrower`
--

LOCK TABLES `Borrower` WRITE;
/*!40000 ALTER TABLE `Borrower` DISABLE KEYS */;
INSERT INTO `Borrower` VALUES ('MALASHA',100),('JAYESH',102),('JANHAVI',103),('DIVYANSHI',104),('HEENA',105),('PRIYANSH',106),('PRIYANSHI',107),('RIYANSHI',108),('PRATHAM',109),('Mosin',1023);
/*!40000 ALTER TABLE `Borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Branch` (
  `branch_name` varchar(255) NOT NULL,
  `branch_city` varchar(20) DEFAULT NULL,
  `assests` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES ('APNA_BANK','ahemdabad','1200'),('AXIS','banglore','14520'),('BOB','pune','100214'),('BOM','delhi','100012'),('CANARA_BANK','nagar','102142'),('CENTRAL_BANK_OF_INDIA','latur','102543'),('HDFC','odisa','100023'),('ICICI','chennai','1057423'),('JANTA_BANK','kolhapur','104751'),('Magarpatta','Pune','1045781'),('SBI','nashik','1059691');
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `cust_name` varchar(20) NOT NULL,
  `cust_street` varchar(30) DEFAULT NULL,
  `cust_city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cust_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('DHRUV','nana peth','chennai'),('DIVYANSHI','somwar peth','delhi'),('HEENA','mangalwar peth','ahemdabad'),('JANHAVI','pull peth','odisa'),('JAYESH','rasta peth','banglore'),('MALASHA','bhawani peth','pune'),('Mosin','Magarpatta','Pune'),('PRATHAM','raviwar peth','nagar'),('PRIYANSH','guruwar peth','nashik'),('PRIYANSHI','shrukwar peth','latur'),('RIYANSHI','shaniwar peth','kolhapur');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Depositor`
--

DROP TABLE IF EXISTS `Depositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depositor` (
  `cust_name` varchar(255) DEFAULT NULL,
  `acc_no` int(11) DEFAULT NULL,
  KEY `acc_no` (`acc_no`),
  KEY `cust_name` (`cust_name`),
  CONSTRAINT `Depositor_ibfk_1` FOREIGN KEY (`acc_no`) REFERENCES `Account` (`acc_no`),
  CONSTRAINT `Depositor_ibfk_2` FOREIGN KEY (`cust_name`) REFERENCES `Customer` (`cust_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Depositor`
--

LOCK TABLES `Depositor` WRITE;
/*!40000 ALTER TABLE `Depositor` DISABLE KEYS */;
INSERT INTO `Depositor` VALUES ('MALASHA',1),('DHRUV',2),('JAYESH',3),('JANHAVI',4),('DIVYANSHI',5),('HEENA',6),('PRIYANSH',7),('PRIYANSHI',8),('RIYANSHI',9),('PRATHAM',10),('Mosin',11);
/*!40000 ALTER TABLE `Depositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `loan_no` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`loan_no`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `Branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (100,'BOB',500),(101,'ICICI',1000),(103,'HDFC',2000),(104,'BOM',0),(105,'APNA_BANK',3000),(106,'SBI',0),(107,'CENTRAL_BANK_OF_INDIA',2000),(108,'JANTA_BANK',0),(109,'CANARA_BANK',30),(1023,'Magarpatta',9050000);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-20 15:08:42
