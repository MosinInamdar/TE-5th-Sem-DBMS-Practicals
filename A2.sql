-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: A2
-- ------------------------------------------------------
-- Server version	5.7.40-0ubuntu0.18.04.1

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
  `Acc_no` int(20) NOT NULL,
  `branch_name` varchar(20) DEFAULT NULL,
  `balance` int(10) NOT NULL,
  PRIMARY KEY (`Acc_no`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `Branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (100,'kothrud',2154),(101,'baner',21254),(102,'ramwadi',21654),(103,'wadia',216540),(104,'yerwada',123057),(105,'nigdi',12307),(106,'shastrinagar',122307),(107,'kharadi',12207),(108,'akrudi',65512),(109,'hadapsar',655012),(110,'Kotak Magarpatta',20000),(111,'SBI Camp',30000);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Borrower`
--

DROP TABLE IF EXISTS `Borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Borrower` (
  `cust_name` varchar(20) DEFAULT NULL,
  `loan_no` int(20) DEFAULT NULL,
  KEY `cust_name` (`cust_name`),
  KEY `loan_no` (`loan_no`),
  CONSTRAINT `Borrower_ibfk_1` FOREIGN KEY (`cust_name`) REFERENCES `Customer` (`cust_name`),
  CONSTRAINT `Borrower_ibfk_2` FOREIGN KEY (`loan_no`) REFERENCES `Loan` (`loan_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrower`
--

LOCK TABLES `Borrower` WRITE;
/*!40000 ALTER TABLE `Borrower` DISABLE KEYS */;
INSERT INTO `Borrower` VALUES ('Amaan',21),('Ayush',25),('Monis',32),('Mosin',462),('Onkar',465),('Prithviraj',42),('Pushkaraj',232),('Yogi',2632);
/*!40000 ALTER TABLE `Borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Branch` (
  `branch_name` varchar(20) NOT NULL,
  `branch_city` varchar(20) DEFAULT NULL,
  `assets` int(11) DEFAULT NULL,
  PRIMARY KEY (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES ('akrudi','pune',1203),('baner','pune',1145),('hadapsar','pune',1545),('kharadi','pune',2165),('Kotak Magarpatta','Pune',10),('kothrud','pune',2565),('nigdi','pune',2569),('ramwadi','pune',3052),('SBI Camp','Pune',20),('shastrinagar','pune',3562),('wadia','pune',3584),('yerwada','pune',3594);
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
  `cust_street` varchar(20) DEFAULT NULL,
  `cust_city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cust_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('Amaan','street17','pune'),('Ayush','street13','pune'),('Monis','street16','pune'),('Mosin','Magarpatta','Pune'),('Onkar','street16','pune'),('Prithviraj','street14','pune'),('Pushkaraj','Camp','Pune'),('Yogi','street12','pune');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Depositor`
--

DROP TABLE IF EXISTS `Depositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Depositor` (
  `cust_name` varchar(20) DEFAULT NULL,
  `acc_no` int(20) DEFAULT NULL,
  KEY `cust_name` (`cust_name`),
  KEY `acc_no` (`acc_no`),
  CONSTRAINT `Depositor_ibfk_1` FOREIGN KEY (`cust_name`) REFERENCES `Customer` (`cust_name`),
  CONSTRAINT `Depositor_ibfk_2` FOREIGN KEY (`acc_no`) REFERENCES `Account` (`Acc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Depositor`
--

LOCK TABLES `Depositor` WRITE;
/*!40000 ALTER TABLE `Depositor` DISABLE KEYS */;
INSERT INTO `Depositor` VALUES ('Amaan',100),('Ayush',101),('Monis',102),('Mosin',103),('Onkar',104),('Prithviraj',105),('Pushkaraj',106),('Yogi',107);
/*!40000 ALTER TABLE `Depositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loan`
--

DROP TABLE IF EXISTS `Loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Loan` (
  `loan_no` int(20) NOT NULL,
  `branch_name` varchar(20) DEFAULT NULL,
  `amount` int(20) DEFAULT NULL,
  PRIMARY KEY (`loan_no`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `Loan_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `Branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loan`
--

LOCK TABLES `Loan` WRITE;
/*!40000 ALTER TABLE `Loan` DISABLE KEYS */;
INSERT INTO `Loan` VALUES (21,'yerwada',12453),(25,'kothrud',315304),(32,'akrudi',1253),(42,'wadia',1253),(52,'shastrinagar',31534),(232,'akrudi',12503),(462,'nigdi',315344),(465,'nigdi',31554),(875,'SBI Camp',600000),(1823,'Kotak Magarpatta',500000),(2632,'akrudi',120311);
/*!40000 ALTER TABLE `Loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-25  9:50:46
