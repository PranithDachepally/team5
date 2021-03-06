UNLOCK TABLES;

DROP database IF EXISTS `csi518_school_sys`;

DROP user IF EXISTS `team5`;
DROP user IF EXISTS `team5`@`localhost`;
CREATE user `team5`@`localhost` IDENTIFIED BY 'icsi518';

CREATE DATABASE `csi518_school_sys` /*!40100 DEFAULT CHARACTER SET latin1 */;
GRANT ALL PRIVILEGES ON `csi518_school_sys`.* TO `team5`@`localhost`;

USE `csi518_school_sys`;


CREATE TABLE `role` (
  `idroles` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idroles`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'admin'),(2,'teacher'),(3,'student'),(4,'parent');
UNLOCK TABLES;


DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'admin',NULL,NULL,NULL,'password',1),(2,'eu664771','emre','ugurlu','eugurlu@albany.edu','password',3),(3,'pranith','Pranith','Dachepally','pdachepally@albany.edu','1234',3);

UNLOCK TABLES;

DROP TABLE IF EXISTS 'msg';

CREATE TABLE `msg` (
  `from` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `content` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `idorganization` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(45) DEFAULT NULL,
  `contact_name` varchar(45) DEFAULT NULL,
  `contact_email` varchar(45) DEFAULT NULL,
  `email_server` varchar(45) DEFAULT NULL,
  `email_un` varchar(45) DEFAULT NULL,
  `email_pw` varchar(45) DEFAULT NULL,
  `email_port` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idorganization`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `organization` WRITE;

INSERT INTO `organization` VALUES (1,'Suny ','University at Albany','518-452-0000','Nobody','eugurlu@albany.edu','smtp.gmail.com','icsi518.team5','team5.icsi518','587');

UNLOCK TABLES;

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  `course_capcity` int(11) NOT NULL,
  `instructor` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_id_UNIQUE` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;



LOCK TABLES `course` WRITE;
INSERT INTO `course` VALUES (1,'CSI500-Operating System',30,2),(2,'CSI518-Software Engineering',30,2),(3,'CSI535-Aritificial Intelligence',50,4);
UNLOCK TABLES;

DROP TABLE IF EXISTS 'apt';

CREATE TABLE `apt` (
  `receiverid` int(11) NOT NULL,
  `rfisrtname` varchar(45) NOT NULL,
  `rlastname` varchar(45) NOT NULL,
  `senderid` int(11) NOT NULL,
  `sfirstname` varchar(45) NOT NULL,
  `slastname` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `class` (
  `idclass` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idclass`),
  KEY `course_id_idx` (`course_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,1,3);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `file` (
  `idfile` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`idfile`,`iduser`),
  KEY `iduser_idx` (`iduser`),
  CONSTRAINT `iduser` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `grade` varchar(45) NOT NULL,
  `attendance` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
