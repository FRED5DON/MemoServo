
CREATE TABLE `note` (
`_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`title` varchar(255) NOT NULL,
`content` longtext NULL,
`uid` bigint(20) NOT NULL COMMENT '用户id',
`createTime` datetime NULL,
`usrName` varchar(255) NULL,
`usrIcon` varchar(255) NULL,
`type` int(11) NULL,
`state` int(11) NULL DEFAULT 0 COMMENT '状态',
`endTime` datetime NULL,
`category` varchar(255) NULL,
`categoryvalue` varchar(255) NULL,
`viewcount` int(11) NULL DEFAULT 0 COMMENT '查看次数',
`lovecount` int(11) NULL DEFAULT 0 COMMENT '赞次数',
`forwcount` int(11) NULL DEFAULT 0 COMMENT '转发次数',
PRIMARY KEY (`_id`) ,
UNIQUE INDEX `id` (`_id` ASC)
);

CREATE TABLE `user` (
`_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`usrpwd` varchar(255) NULL,
`usrname` varchar(11) NULL,
`name` varchar(30) NULL,
`exp` int(11) NULL,
`rank` int(11) NULL COMMENT '用户等级',
`phone` varchar(20) NULL,
`favor` varchar(255) NULL COMMENT '擅长CODE集合',
`usrIcon` varchar(255) NULL,
`age` int NULL,
`gender` varchar(255) NULL,
`address` varchar(255) NULL,
`partical` varchar(255) NULL COMMENT '连接第三方的域id集合',
`lastActive` datetime NULL COMMENT '最后一次活跃',
`cid` bigint(20) NULL COMMENT '帐户id',
`state` int(11) NULL COMMENT '用户状态',
`isVip` tinyint(2) NULL DEFAULT 0,
`isVerified` tinyint(2) NULL,
`vid` int(20) NULL COMMENT '身份证号',
`vidSrc` varchar(255) NULL COMMENT '身份证图片src',
`nickName` varchar(30) NULL,
`frds` longtext NULL,
`jifen` bigint(20) NULL DEFAULT 0,
`coins` bigint(20) NULL DEFAULT 0,
PRIMARY KEY (`_id`) ,
UNIQUE INDEX `id` (`_id` ASC)
);

CREATE TABLE `account` (
`_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '帐户id',
`type` int(11) NOT NULL COMMENT '账户类型',
`remain` double NULL,
`pulled` double NULL,
`count` double NULL COMMENT '总计',
`state` int(11) NULL COMMENT '帐户状态',
`usrId` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
`pways` varchar(255) NULL COMMENT '渠道s',
PRIMARY KEY (`_id`) 
);

CREATE TABLE `record` (
`_id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录id',
`id` bigint(11) NOT NULL COMMENT '归属id',
`desc` varchar(255) NULL COMMENT '描述',
`beginDate` datetime NULL,
`endDate` datetime NULL,
`from` varchar(255) NULL COMMENT '产生者id',
`to` varchar(255) NULL COMMENT '消费者id',
`value` varchar(255) NULL,
`type` int(11) NULL COMMENT '类型',
`state` int(11) NOT NULL COMMENT '状态',
PRIMARY KEY (`_id`) 
);

CREATE TABLE `code` (
`code` int(11) NOT NULL,
`msg` varchar(255) NULL,
PRIMARY KEY (`code`) ,
UNIQUE INDEX `code` (`code` ASC)
);

CREATE TABLE `log` (
`_id` bigint(20) NOT NULL,
`id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`from` varchar(255) NULL,
`to` varchar(255) NULL,
`owner` varchar(30) NULL,
`ownerId` bigint(20) NULL,
`actionType` varchar(255) NULL,
`createTime` datetime NULL,
`platform` int(11) NULL,
PRIMARY KEY (`id`) 
);

CREATE TABLE `config` (
`_id` bigint(20) UNSIGNED NOT NULL,
`host` varchar(255) NULL,
`platform` int(11) NULL,
`bucket` varchar(255) NULL,
`privority` varchar(255) NULL COMMENT '权限',
`url` varchar(255) NULL,
`version` varchar(255) NULL,
`isForce` tinyint(1) NULL,
`createTime` datetime NULL,
PRIMARY KEY (`_id`) 
);

CREATE TABLE `msg` (
`_id` bigint(20) UNSIGNED NOT NULL COMMENT 'note’s id',
`from` varchar(255) NULL,
`to` varchar(255) NULL,
`contents` longtext NULL,
`ctime` datetime NULL,
`type` int(11) NULL COMMENT '类型【备用可做聊天记录】',
`fromId` bigint(20) NULL,
`toId` bigint(20) NULL,
PRIMARY KEY (`_id`) 
);

CREATE TABLE `contents` (
`_id` bigint(20) NOT NULL,
`text` varchar(255) NULL,
`mediaList` longtext NULL,
`type` int(11) NULL,
`template` varchar(255) NULL COMMENT '模版【web】',
`url` varchar(255) NULL COMMENT '如果不为空且为正规url该优先级最高',
PRIMARY KEY (`_id`) 
);

CREATE TABLE `profit` (
`_id` bigint(20) UNSIGNED NOT NULL COMMENT 'note‘s id',
`profit` double(20,0) NULL,
`count` int(11) NULL DEFAULT 1 COMMENT '如果count不为1说明需要分发 不只一个',
`state` int(11) NULL COMMENT '状态是否可用',
PRIMARY KEY (`_id`) 
);

CREATE TABLE `frds` (
`_id` bigint UNSIGNED NOT NULL,
`descName` varchar(255) NULL,
`lists` longtext NULL,
`gender` tinyint(1) NULL,
`nickName` varchar(255) NULL,
`tags` varchar(255) NULL,
PRIMARY KEY (`_id`) 
);

