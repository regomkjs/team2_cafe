drop database if exists cafe;

create database if not exists cafe;
use cafe;

drop table if exists `category`;
CREATE TABLE if not exists `category` (
	`ca_name`	varchar(15)	primary key
);

drop table if exists `board`;
CREATE TABLE if not exists `board` (
	`bo_num`	int	primary key auto_increment,
	`bo_name`	varchar(15) not NULL,
	`bo_ca_name`	varchar(15)	NOT NULL
);

drop table if exists `head`;
CREATE TABLE if not exists `head` (
	`he_num`	int	primary key auto_increment,
	`he_name`	varchar(15) not NULL,
	`he_bo_num`	int	NOT NULL
);

drop table if exists `post`;
CREATE TABLE if not exists `post` (
	`po_num`	int primary key auto_increment,
	`po_title`	varchar(50) not NULL,
	`po_content`	longtext not NULL,
	`po_writer`	varchar(12)	not NULL,
	`po_view`	int default 0 not NULL,
	`po_datetime`	datetime not NULL,
	`po_he_num`	int	NOT NULL,
	`po_me_id`	varchar(12)	NOT NULL
);

drop table if exists `picture`;
CREATE TABLE if not exists `picture` (
	`pi_num` int primary key auto_increment,
	`pi_name` varchar(150) not NULL,
	`pi_ori_name` varchar(50) not NULL,
	`pi_po_num`	int	NOT NULL
);

drop table if exists `comment`;
CREATE TABLE if not exists `comment` (
	`co_num`	int	primary key auto_increment,
	`co_ori_num`	int default 0 not NULL,
	`co_writer`	varchar(12)	not NULL,
	`co_content`	text not NULL,
	`co_datetime`	datetime not NULL,
	`co_me_id`	varchar(12)	NOT NULL,
	`co_po_num`	int	NOT NULL
);

drop table if exists `member`;
CREATE TABLE if not exists `member` (
	`me_id`	varchar(12)	primary key,
	`me_pw`	varchar(15) not NULL,
	`me_email`	varchar(30) not NULL,
	`me_phone`	varchar(13) not NULL,
	`me_nick`	varchar(12) default null unique,
	`me_date`	date not NULL,
	`me_gr_num`	int	NOT NULL
);

drop table if exists `grade`;
CREATE TABLE if not exists `grade` (
	`gr_num`	int	primary key auto_increment,
	`gr_name`	varchar(10)	NULL
);

drop table if exists `used_nick`;
CREATE TABLE if not exists `used_nick` (
	`un_nick`	varchar(12)	primary key,
	`un_me_id`	varchar(12)	NOT NULL
);

drop table if exists `like`;
CREATE TABLE if not exists `like` (
	`li_num`	int auto_increment primary key,
	`li_me_id`	varchar(12)	NOT NULL,
    `li_po_num`	int	NOT NULL,
    `li_state`	int default 1 NOT NULL,
	KEY `FK_member_TO_like_1` (`li_me_id`),
	KEY `FK_post_TO_like_1` (`li_po_num`),
	CONSTRAINT `FK_member_TO_like_1` FOREIGN KEY (`li_me_id`) REFERENCES `member` (`me_id`),
	CONSTRAINT `FK_post_TO_like_1` FOREIGN KEY (`li_po_num`) REFERENCES `post` (`po_num`)
);


ALTER TABLE `board` ADD CONSTRAINT `FK_category_TO_board_1` FOREIGN KEY (
	`bo_ca_name`
)
REFERENCES `category` (
	`ca_name`
);
ALTER TABLE `head` ADD CONSTRAINT `FK_board_TO_head_1` FOREIGN KEY (
	`he_bo_num`
)
REFERENCES `board` (
	`bo_num`
);
ALTER TABLE `post` ADD CONSTRAINT `FK_head_TO_post_1` FOREIGN KEY (
	`po_he_num`
)
REFERENCES `head` (
	`he_num`
);
ALTER TABLE `post` ADD CONSTRAINT `FK_member_TO_post_1` FOREIGN KEY (
	`po_me_id`
)
REFERENCES `member` (
	`me_id`
);
ALTER TABLE `picture` ADD CONSTRAINT `FK_post_TO_picture_1` FOREIGN KEY (
	`pi_po_num`
)
REFERENCES `post` (
	`po_num`
);
ALTER TABLE `comment` ADD CONSTRAINT `FK_member_TO_comment_1` FOREIGN KEY (
	`co_me_id`
)
REFERENCES `member` (
	`me_id`
);
ALTER TABLE `comment` ADD CONSTRAINT `FK_post_TO_comment_1` FOREIGN KEY (
	`co_po_num`
)
REFERENCES `post` (
	`po_num`
);
ALTER TABLE `member` ADD CONSTRAINT `FK_grade_TO_member_1` FOREIGN KEY (
	`me_gr_num`
)
REFERENCES `grade` (
	`gr_num`
);
ALTER TABLE `used_nick` ADD CONSTRAINT `FK_member_TO_used_nick_1` FOREIGN KEY (
	`un_me_id`
)
REFERENCES `member` (
	`me_id`
);
