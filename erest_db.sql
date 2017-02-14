/*
SQLyog Ultimate v8.55 
MySQL - 5.5.38 : Database - erest_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erest_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `erest_db`;

/*Table structure for table `slot` */

DROP TABLE IF EXISTS `slot`;

CREATE TABLE `slot` (
  `slotno` int(5) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`slotno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `slot` */

insert  into `slot`(`slotno`,`status`,`dateupdated`) values (1,'FREE','2017-02-14 12:55:20');

/*Table structure for table `slot_reservation` */

DROP TABLE IF EXISTS `slot_reservation`;

CREATE TABLE `slot_reservation` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `slotno` int(5) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `from_time` varchar(20) DEFAULT NULL,
  `to_time` varchar(20) DEFAULT NULL,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usercreated` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `slot_reservation` */

insert  into `slot_reservation`(`id`,`slotno`,`status`,`from_time`,`to_time`,`dateupdated`,`usercreated`) values (1,1,'BUK','2017-02-14 12:19:07','2017-02-14 12:55:07','2017-02-14 12:19:07',NULL);

/*Table structure for table `slothistory` */

DROP TABLE IF EXISTS `slothistory`;

CREATE TABLE `slothistory` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `slotno` int(5) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `channel` varchar(20) DEFAULT NULL,
  `from` varchar(20) DEFAULT NULL,
  `to` varchar(20) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `slothistory` */

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `code` varchar(10) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sortkey` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `status` */

insert  into `status`(`code`,`description`,`sortkey`) values ('BUK','Booked','slot'),('FREE','Free','tbl'),('FREE','Free','slot'),('USE','Use','slot'),('OCU','Occupy','tbl'),('RSV','Reserve','tbl');

/*Table structure for table `tbl` */

DROP TABLE IF EXISTS `tbl`;

CREATE TABLE `tbl` (
  `tableno` int(5) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tableno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl` */

insert  into `tbl`(`tableno`,`status`,`dateupdated`) values (1,'OCU','2017-02-14 14:27:22');

/*Table structure for table `tbl_order` */

DROP TABLE IF EXISTS `tbl_order`;

CREATE TABLE `tbl_order` (
  `orderid` int(5) NOT NULL AUTO_INCREMENT,
  `tableno` int(5) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `usercreated` varchar(20) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userupdated` varchar(20) DEFAULT NULL,
  `dateupdated` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_order` */

/*Table structure for table `tbl_reservation` */

DROP TABLE IF EXISTS `tbl_reservation`;

CREATE TABLE `tbl_reservation` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tableno` int(5) DEFAULT NULL,
  `from` varchar(20) DEFAULT NULL,
  `to` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `keycode` varchar(20) DEFAULT NULL,
  `usercreated` varchar(20) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userupdated` varchar(20) DEFAULT NULL,
  `dateupdated` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_reservation` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) DEFAULT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` text,
  `email` varchar(200) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
