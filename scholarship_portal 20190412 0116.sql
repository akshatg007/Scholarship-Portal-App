-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.13-rc-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema scholarship_portal
--

CREATE DATABASE IF NOT EXISTS scholarship_portal;
USE scholarship_portal;

--
-- Definition of table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `fid` int(11) NOT NULL auto_increment,
  `feed` varchar(200) default NULL,
  PRIMARY KEY  (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` (`fid`,`feed`) VALUES 
 (1,'Add more Scholarships');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;


--
-- Definition of table `scholarship`
--

DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `description` varchar(100) default NULL,
  `state` varchar(30) default NULL,
  `stream` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scholarship`
--

/*!40000 ALTER TABLE `scholarship` DISABLE KEYS */;
INSERT INTO `scholarship` (`id`,`name`,`description`,`state`,`stream`) VALUES 
 (1,'National Means Cum Merit Scholarship','By MHRD,Govt of India','All','All');
/*!40000 ALTER TABLE `scholarship` ENABLE KEYS */;


--
-- Definition of table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL auto_increment,
  `sname` varchar(30) default NULL,
  `uname` varchar(30) default NULL,
  `pwd` varchar(30) default NULL,
  `email` varchar(30) default NULL,
  `phone` varchar(15) default NULL,
  `gender` varchar(10) default NULL,
  `state` varchar(30) default NULL,
  `stream` varchar(30) default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`sid`,`sname`,`uname`,`pwd`,`email`,`phone`,`gender`,`state`,`stream`) VALUES 
 (1,'Ankit','ankit','ankit','aktkasyap@gmail.com','1234567890','Male','Delhi','CSE');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
