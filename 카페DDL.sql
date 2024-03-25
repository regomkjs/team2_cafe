DROP DATABASE IF EXISTS `cafe`;

CREATE DATABASE  IF NOT EXISTS `cafe`;

USE `cafe`;

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `ca_name` varchar(15) NOT NULL,
  PRIMARY KEY (`ca_name`)
) ;


DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `bo_num` int NOT NULL AUTO_INCREMENT,
  `bo_name` varchar(15) NOT NULL,
  `bo_ca_name` varchar(15) NOT NULL,
  PRIMARY KEY (`bo_num`),
  KEY `FK_category_TO_board_1` (`bo_ca_name`),
  CONSTRAINT `FK_category_TO_board_1` FOREIGN KEY (`bo_ca_name`) REFERENCES `category` (`ca_name`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `head`;

CREATE TABLE `head` (
  `he_num` int NOT NULL AUTO_INCREMENT,
  `he_name` varchar(15) NOT NULL,
  `he_bo_num` int NOT NULL,
  PRIMARY KEY (`he_num`),
  KEY `FK_board_TO_head_1` (`he_bo_num`),
  CONSTRAINT `FK_board_TO_head_1` FOREIGN KEY (`he_bo_num`) REFERENCES `board` (`bo_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

DROP TABLE IF EXISTS `grade`;

CREATE TABLE `grade` (
  `gr_num` int NOT NULL AUTO_INCREMENT,
  `gr_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`gr_num`)
) ;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `me_id` varchar(12) NOT NULL,
  `me_pw` varchar(15) NOT NULL,
  `me_email` varchar(30) NOT NULL,
  `me_phone` varchar(13) NOT NULL,
  `me_nick` varchar(12) DEFAULT NULL,
  `me_date` date NOT NULL,
  `me_gr_num` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`me_id`),
  UNIQUE KEY `me_nick` (`me_nick`),
  KEY `FK_grade_TO_member_1` (`me_gr_num`),
  CONSTRAINT `FK_grade_TO_member_1` FOREIGN KEY (`me_gr_num`) REFERENCES `grade` (`gr_num`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `used_nick`;

CREATE TABLE `used_nick` (
  `un_nick` varchar(12) NOT NULL,
  `un_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`un_nick`),
  KEY `FK_member_TO_used_nick_1` (`un_me_id`),
  CONSTRAINT `FK_member_TO_used_nick_1` FOREIGN KEY (`un_me_id`) REFERENCES `member` (`me_id`)
) ;



DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `po_num` int NOT NULL AUTO_INCREMENT,
  `po_title` varchar(50) NOT NULL,
  `po_content` longtext NOT NULL,
  `po_writer` varchar(12) NOT NULL,
  `po_view` int NOT NULL DEFAULT '0',
  `po_datetime` datetime NOT NULL,
  `po_he_num` int NOT NULL,
  `po_me_id` varchar(12) NOT NULL,
  PRIMARY KEY (`po_num`),
  KEY `FK_head_TO_post_1` (`po_he_num`),
  KEY `FK_member_TO_post_1` (`po_me_id`),
  CONSTRAINT `FK_head_TO_post_1` FOREIGN KEY (`po_he_num`) REFERENCES `head` (`he_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_member_TO_post_1` FOREIGN KEY (`po_me_id`) REFERENCES `member` (`me_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ;




DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `co_num` int NOT NULL AUTO_INCREMENT,
  `co_ori_num` int NOT NULL DEFAULT '0',
  `co_writer` varchar(12) NOT NULL,
  `co_content` text NOT NULL,
  `co_datetime` datetime NOT NULL,
  `co_me_id` varchar(12) NOT NULL,
  `co_po_num` int NOT NULL,
  PRIMARY KEY (`co_num`),
  KEY `FK_member_TO_comment_1` (`co_me_id`),
  KEY `FK_post_TO_comment_1` (`co_po_num`),
  CONSTRAINT `FK_member_TO_comment_1` FOREIGN KEY (`co_me_id`) REFERENCES `member` (`me_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_post_TO_comment_1` FOREIGN KEY (`co_po_num`) REFERENCES `post` (`po_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

DROP TABLE IF EXISTS `like`;

CREATE TABLE `like` (
  `li_num` int NOT NULL AUTO_INCREMENT,
  `li_me_id` varchar(12) NOT NULL,
  `li_po_num` int NOT NULL,
  `li_state` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`li_num`),
  KEY `FK_member_TO_like_1` (`li_me_id`),
  KEY `FK_post_TO_like_1` (`li_po_num`),
  CONSTRAINT `FK_member_TO_like_1` FOREIGN KEY (`li_me_id`) REFERENCES `member` (`me_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_post_TO_like_1` FOREIGN KEY (`li_po_num`) REFERENCES `post` (`po_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ;



drop table if exists `picture`;
CREATE TABLE if not exists `picture` (
	`pi_num` int primary key auto_increment,
	`pi_name` varchar(150) not NULL,
	`pi_ori_name` varchar(50) not NULL,
	`pi_po_num`	int	NOT NULL
);

ALTER TABLE `picture` ADD CONSTRAINT `FK_post_TO_picture_1` FOREIGN KEY (
	`pi_po_num`
)
REFERENCES `post` (
	`po_num`
);

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
