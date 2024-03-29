#
# TABLE STRUCTURE FOR: admin_groups
#

DROP TABLE IF EXISTS `admin_groups`;

CREATE TABLE `admin_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('1', 'webmaster', 'Webmaster');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('2', 'admin', 'Administrator');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('3', 'manager', 'Manager');
INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES ('4', 'staff', 'Staff');


#
# TABLE STRUCTURE FOR: admin_login_attempts
#

DROP TABLE IF EXISTS `admin_login_attempts`;

CREATE TABLE `admin_login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: admin_users
#

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('1', '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, NULL, NULL, NULL, NULL, NULL, '1451900190', '1547038411', '1', 'Webmaster', 'Espino');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('2', '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, NULL, NULL, NULL, NULL, NULL, '1451900228', '1465489580', '1', 'Admin', '');
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('3', '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, '1451900430', '1465489585', '1', 'Manager', NULL);
INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES ('4', '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, '1451900439', '1543351321', '1', 'Staff', '');


#
# TABLE STRUCTURE FOR: admin_users_groups
#

DROP TABLE IF EXISTS `admin_users_groups`;

CREATE TABLE `admin_users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('1', '1', '1');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('2', '2', '2');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('3', '3', '3');
INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES ('4', '4', '4');


#
# TABLE STRUCTURE FOR: api_access
#

DROP TABLE IF EXISTS `api_access`;

CREATE TABLE `api_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: api_keys
#

DROP TABLE IF EXISTS `api_keys`;

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES ('1', '0', 'anonymous', '1', '1', '0', NULL, '1463388382');


#
# TABLE STRUCTURE FOR: api_limits
#

DROP TABLE IF EXISTS `api_limits`;

CREATE TABLE `api_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: api_logs
#

DROP TABLE IF EXISTS `api_logs`;

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: dep_tickets
#

DROP TABLE IF EXISTS `dep_tickets`;

CREATE TABLE `dep_tickets` (
  `id_depts` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`id_depts`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `dep_tickets` (`id_depts`, `description`) VALUES ('2', 'Sales');
INSERT INTO `dep_tickets` (`id_depts`, `description`) VALUES ('3', 'Presales');


#
# TABLE STRUCTURE FOR: groups
#

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `groups` (`id`, `name`, `description`) VALUES ('1', 'members', 'General User');


#
# TABLE STRUCTURE FOR: history_ticket
#

DROP TABLE IF EXISTS `history_ticket`;

CREATE TABLE `history_ticket` (
  `id_dep` int(11) DEFAULT NULL,
  `id_support` int(10) DEFAULT NULL,
  `id_sta` int(10) NOT NULL,
  `num_user` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('3', '1', '2', '2');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('3', '1', '2', '2');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('3', '1', '2', '2');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('3', '1', '2', '2');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('3', '1', '2', '1');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('2', '2', '1', '2');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('2', '2', '1', '1');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('3', '133333', '2', '1');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('3', '1', '2', '1');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('2', '1', '1', '2');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('3', '3', '1', '2');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('3', '3', '1', '2');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('2', '1', '1', '2');
INSERT INTO `history_ticket` (`id_dep`, `id_support`, `id_sta`, `num_user`) VALUES ('2', '1', '2', '2');


#
# TABLE STRUCTURE FOR: login_attempts
#

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: prueba
#

DROP TABLE IF EXISTS `prueba`;

CREATE TABLE `prueba` (
  `prueba` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `prueba` (`prueba`) VALUES ('0');
INSERT INTO `prueba` (`prueba`) VALUES ('1');
INSERT INTO `prueba` (`prueba`) VALUES ('1');
INSERT INTO `prueba` (`prueba`) VALUES ('2');
INSERT INTO `prueba` (`prueba`) VALUES ('2');
INSERT INTO `prueba` (`prueba`) VALUES ('1');
INSERT INTO `prueba` (`prueba`) VALUES ('1');
INSERT INTO `prueba` (`prueba`) VALUES ('1');
INSERT INTO `prueba` (`prueba`) VALUES ('1');
INSERT INTO `prueba` (`prueba`) VALUES ('1');
INSERT INTO `prueba` (`prueba`) VALUES ('2');


#
# TABLE STRUCTURE FOR: ticket
#

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
  `id_ticket` int(10) NOT NULL AUTO_INCREMENT,
  `dataopen` date NOT NULL,
  `dateclose` date NOT NULL,
  `user_open` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `file` varchar(60) NOT NULL,
  `id_status` int(10) NOT NULL,
  `id_depts` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `id_prio` int(3) NOT NULL,
  PRIMARY KEY (`id_ticket`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `ticket` (`id_ticket`, `dataopen`, `dateclose`, `user_open`, `subject`, `message`, `file`, `id_status`, `id_depts`, `id`, `id_prio`) VALUES ('1', '2019-01-04', '2019-01-24', 'espino.rodrigo@gmail.com', 'ALCANCE PROFAT', '<p style=\"text-align: center;\">\n	<a id=\"asdasd\" name=\"asdasd\"></a></p>\n<p style=\"text-align: center;\">\n	&nbsp;</p>\n<p style=\"text-align: center;\">\n	asddasdasd</p>\n<p style=\"text-align: center;\">\n	&nbsp;</p>\n<p style=\"text-align: center;\">\n	asdasd</p>\n<p style=\"text-align: center;\">\n	asd</p>\n<p style=\"text-align: center;\">\n	&nbsp;</p>\n<p style=\"text-align: center;\">\n	asd</p>\n<p style=\"text-align: center;\">\n	asd</p>\n<p style=\"text-align: center;\">\n	as</p>\n<p style=\"text-align: center;\">\n	da<img alt=\"\" height=\"20\" src=\"http://localhost/ticket/assets/grocery_crud/texteditor/ckeditor/plugins/smiley/images/angel_smile.gif\" title=\"\" width=\"20\" /></p>\n', '5c1ee-profat-interfaces-interfaces-de-profat.doc', '2', '2', '2', '3');
INSERT INTO `ticket` (`id_ticket`, `dataopen`, `dateclose`, `user_open`, `subject`, `message`, `file`, `id_status`, `id_depts`, `id`, `id_prio`) VALUES ('2', '2018-11-06', '0000-00-00', '', 'prueba 333', '<p>\n	asdasdasdasdasd</p>\n', 'f069b-cuestionario-examen-unidad-3-segunda-parte.docx', '1', '2', '1', '3');
INSERT INTO `ticket` (`id_ticket`, `dataopen`, `dateclose`, `user_open`, `subject`, `message`, `file`, `id_status`, `id_depts`, `id`, `id_prio`) VALUES ('3', '2018-12-20', '2018-12-27', '', '', '', '9c1b3-unidad-1-actividad-obligatoria.docx', '1', '3', '2', '1');


#
# TABLE STRUCTURE FOR: ticket_priority
#

DROP TABLE IF EXISTS `ticket_priority`;

CREATE TABLE `ticket_priority` (
  `id_priority` int(3) NOT NULL AUTO_INCREMENT,
  `description` varchar(11) NOT NULL,
  PRIMARY KEY (`id_priority`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `ticket_priority` (`id_priority`, `description`) VALUES ('1', 'LOW');
INSERT INTO `ticket_priority` (`id_priority`, `description`) VALUES ('3', 'HIGH');


#
# TABLE STRUCTURE FOR: ticket_stratus
#

DROP TABLE IF EXISTS `ticket_stratus`;

CREATE TABLE `ticket_stratus` (
  `id_status` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(40) NOT NULL,
  PRIMARY KEY (`id_status`),
  UNIQUE KEY `id_status` (`id_status`),
  KEY `id_status_2` (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `ticket_stratus` (`id_status`, `description`) VALUES ('1', 'OPEN');
INSERT INTO `ticket_stratus` (`id_status`, `description`) VALUES ('2', 'CLOSED');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES ('1', '127.0.0.1', 'member', '$2y$08$kkqUE2hrqAJtg.pPnAhvL.1iE7LIujK5LZ61arONLpaBBWh/ek61G', NULL, 'member@member.com', NULL, NULL, NULL, NULL, '1451903855', '1451905011', '1', 'Member', 'One', NULL, NULL);
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES ('2', '::1', 'rodrigo', '$2y$08$mjxqpeKOs1eM4QCq7Mhf6OnH1mribK0opWSYUzZzqzALeJcERkHaa', NULL, 'rodrigoespino@gmail.com', NULL, NULL, NULL, NULL, '1541692608', NULL, '1', 'rodrigo', 'espino', NULL, NULL);


#
# TABLE STRUCTURE FOR: users_groups
#

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('1', '1', '1');
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES ('2', '2', '1');


