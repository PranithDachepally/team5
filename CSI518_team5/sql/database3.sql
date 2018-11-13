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

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  `course_capcity` int(11) NOT NULL,
  `instructor` varchar(45) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_id_UNIQUE` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1



LOCK TABLES `course` WRITE;
INSERT INTO `course` VALUES (1,'CSI500-Operating System',30,'John'),(2,'CSI518-Software Engineering',30,'George'),(3,'CSI535-Aritificial Intelligence',50,'John');
UNLOCK TABLES;

