Create database jspbigwork
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(4) unsigned NOT NULL,
  `user_name` varchar(16) NOT NULL,
  `user_pwd` char(32) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user` (`user_type`,`user_name`)
)

CREATE TABLE `news` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_title` varchar(128) NOT NULL,
  `news_context` text NOT NULL,
  `news_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`news_id`)
)
