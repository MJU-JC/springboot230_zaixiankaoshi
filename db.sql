/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - zaixianyuanchengkaoshixitong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zaixianyuanchengkaoshixitong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zaixianyuanchengkaoshixitong`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/config1.jpg'),(2,'轮播图2','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/config2.jpg'),(3,'轮播图3','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='字典';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'sex_types','性别类型',1,'男',NULL,NULL,'2022-04-16 20:52:49'),(2,'sex_types','性别类型',2,'女',NULL,NULL,'2022-04-16 20:52:49'),(3,'gonggao_types','公告类型',1,'公告类型1',NULL,NULL,'2022-04-16 20:52:49'),(4,'gonggao_types','公告类型',2,'公告类型2',NULL,NULL,'2022-04-16 20:52:49'),(5,'examquestion_types','试题类型',1,'单选题',NULL,NULL,'2022-04-16 20:52:49'),(6,'examquestion_types','试题类型',2,'多选题',NULL,NULL,'2022-04-16 20:52:49'),(7,'examquestion_types','试题类型',3,'判断题',NULL,NULL,'2022-04-16 20:52:49'),(8,'examquestion_types','试题类型',4,'填空题',NULL,NULL,'2022-04-16 20:52:49'),(9,'exampaper_types','试卷状态',1,'启用',NULL,NULL,'2022-04-16 20:52:49'),(10,'exampaper_types','试卷状态',2,'禁用',NULL,NULL,'2022-04-16 20:52:49'),(11,'gonggao_types','公告类型',3,'公告类型3',NULL,'','2022-04-16 21:12:00');

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_name` varchar(200) NOT NULL COMMENT '试卷名称 Search111',
  `exampaper_date` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `exampaper_myscore` int(20) NOT NULL DEFAULT '0' COMMENT '试卷总分数',
  `exampaper_types` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态 Search111',
  `exampaper_delete` int(255) DEFAULT '0' COMMENT '逻辑删除（0代表未删除 1代表已删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`exampaper_name`,`exampaper_date`,`exampaper_myscore`,`exampaper_types`,`exampaper_delete`,`create_time`) values (1,'考试试卷1',100,100,1,1,'2022-04-16 20:52:49'),(2,'试卷2',100,62,1,1,'2022-04-16 21:12:22');

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_id` int(20) NOT NULL COMMENT '所属试卷id（外键）',
  `examquestion_name` varchar(200) NOT NULL COMMENT '试题名称 Search111',
  `examquestion_options` longtext COMMENT '选项，json字符串',
  `examquestion_score` int(20) DEFAULT '0' COMMENT '分值 Search111',
  `examquestion_answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `examquestion_analysis` longtext COMMENT '答案解析',
  `examquestion_types` int(20) DEFAULT '0' COMMENT '试题类型',
  `examquestion_sequence` int(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`exampaper_id`,`examquestion_name`,`examquestion_options`,`examquestion_score`,`examquestion_answer`,`examquestion_analysis`,`examquestion_types`,`examquestion_sequence`,`create_time`) values (1,1,'单选题1','[{\"text\":\"答案A\",\"code\":\"A\"},{\"text\":\"答案B\",\"code\":\"B\"},{\"text\":\"正确答案C\",\"code\":\"C\"},{\"text\":\"答案D\",\"code\":\"D\"}]',10,'C','无',1,1,'2022-04-16 20:52:49'),(2,1,'多选题1','[{\"text\":\"答案A\",\"code\":\"A\"},{\"text\":\"正确答案B\",\"code\":\"B\"},{\"text\":\"正确答案C\",\"code\":\"C\"},{\"text\":\"答案D\",\"code\":\"D\"}]',34,'B,C','无',2,2,'2022-04-16 20:52:49'),(3,1,'填空题(正)_____','[]',41,'正','无',4,3,'2022-04-16 20:52:49'),(4,1,'判断题1','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',11,'A','无',3,4,'2022-04-16 20:52:49'),(5,1,'单选题2','[{\"text\":\"答案A\",\"code\":\"A\"},{\"text\":\"正确答案B\",\"code\":\"B\"},{\"text\":\"答案C\",\"code\":\"C\"},{\"text\":\"答案D\",\"code\":\"D\"}]',4,'B','无',1,5,'2022-04-16 20:52:49'),(6,2,'试题2的试题1','[{\"text\":\"A\",\"code\":\"A\"},{\"text\":\"B\",\"code\":\"B\"},{\"text\":\"C\",\"code\":\"C\"},{\"text\":\"正确D\",\"code\":\"D\"}]',12,'D','无',1,2,'2022-04-16 21:13:14'),(7,2,'试卷2的试题2','[{\"text\":\"A\",\"code\":\"A\"},{\"text\":\"正确B\",\"code\":\"B\"},{\"text\":\"C\",\"code\":\"C\"},{\"text\":\"正确D\",\"code\":\"D\"}]',20,'B,D','五十多个',2,3,'2022-04-16 21:14:09'),(8,2,'试卷2的试题3','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',30,'A','违规',3,54,'2022-04-16 21:14:33');

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examrecord_uuid_number` varchar(200) DEFAULT NULL COMMENT '考试编号',
  `yonghu_id` int(20) NOT NULL COMMENT '考试用户',
  `exampaper_id` int(20) NOT NULL COMMENT '所属试卷id（外键）',
  `total_score` int(200) DEFAULT NULL COMMENT '所得总分',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '考试时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`examrecord_uuid_number`,`yonghu_id`,`exampaper_id`,`total_score`,`insert_time`,`create_time`) values (1,'1650114632287',1,1,38,'2022-04-16 21:10:32','2022-04-16 21:10:32');

/*Table structure for table `examredetails` */

DROP TABLE IF EXISTS `examredetails`;

CREATE TABLE `examredetails` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examredetails_uuid_number` varchar(200) DEFAULT NULL COMMENT '试卷编号',
  `yonghu_id` int(20) NOT NULL COMMENT '用户id',
  `examquestion_id` int(20) NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  `examredetails_myscore` int(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='答题详情表';

/*Data for the table `examredetails` */

insert  into `examredetails`(`id`,`examredetails_uuid_number`,`yonghu_id`,`examquestion_id`,`examredetails_myanswer`,`examredetails_myscore`,`create_time`) values (1,'1650114632287',1,5,'B',4,'2022-04-16 21:10:36'),(2,'1650114632287',1,4,'B',0,'2022-04-16 21:10:38'),(3,'1650114632287',1,3,'sgggh',0,'2022-04-16 21:10:41'),(4,'1650114632287',1,2,'B,C',34,'2022-04-16 21:10:44'),(5,'1650114632287',1,1,'B',0,'2022-04-16 21:10:47');

/*Table structure for table `examrewrongquestion` */

DROP TABLE IF EXISTS `examrewrongquestion`;

CREATE TABLE `examrewrongquestion` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(20) NOT NULL COMMENT '用户id',
  `exampaper_id` int(20) NOT NULL COMMENT '试卷（外键）',
  `examquestion_id` int(20) NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生作答',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='错题表';

/*Data for the table `examrewrongquestion` */

insert  into `examrewrongquestion`(`id`,`yonghu_id`,`exampaper_id`,`examquestion_id`,`examredetails_myanswer`,`insert_time`,`create_time`) values (1,1,1,4,'B','2022-04-16 21:10:38','2022-04-16 21:10:38'),(2,1,1,3,'sgggh','2022-04-16 21:10:41','2022-04-16 21:10:41'),(3,1,1,1,'B','2022-04-16 21:10:47','2022-04-16 21:10:47');

/*Table structure for table `gonggao` */

DROP TABLE IF EXISTS `gonggao`;

CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111  ',
  `gonggao_photo` varchar(200) DEFAULT NULL COMMENT '公告图片 ',
  `gonggao_types` int(11) NOT NULL COMMENT '公告类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告发布时间 ',
  `gonggao_content` text COMMENT '公告详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='公告';

/*Data for the table `gonggao` */

insert  into `gonggao`(`id`,`gonggao_name`,`gonggao_photo`,`gonggao_types`,`insert_time`,`gonggao_content`,`create_time`) values (1,'公告名称1','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/gonggao1.jpg',1,'2022-04-16 20:52:53','公告详情1','2022-04-16 20:52:53'),(2,'公告名称2','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/gonggao2.jpg',2,'2022-04-16 20:52:53','公告详情2','2022-04-16 20:52:53'),(3,'公告名称3','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/gonggao3.jpg',1,'2022-04-16 20:52:53','公告详情3','2022-04-16 20:52:53'),(4,'公告名称4','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/gonggao4.jpg',2,'2022-04-16 20:52:53','公告详情4','2022-04-16 20:52:53'),(5,'公告名称5','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/gonggao5.jpg',2,'2022-04-16 20:52:53','公告详情5','2022-04-16 20:52:53'),(6,'公告11','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/1650114968178.jpg',1,'2022-04-16 21:16:11','<p>高公公1111</p>','2022-04-16 21:16:11');

/*Table structure for table `laoshi` */

DROP TABLE IF EXISTS `laoshi`;

CREATE TABLE `laoshi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `laoshi_name` varchar(200) DEFAULT NULL COMMENT '老师姓名 Search111 ',
  `laoshi_phone` varchar(200) DEFAULT NULL COMMENT '老师手机号',
  `laoshi_id_number` varchar(200) DEFAULT NULL COMMENT '老师身份证号',
  `laoshi_photo` varchar(200) DEFAULT NULL COMMENT '老师头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `laoshi_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='老师';

/*Data for the table `laoshi` */

insert  into `laoshi`(`id`,`username`,`password`,`laoshi_name`,`laoshi_phone`,`laoshi_id_number`,`laoshi_photo`,`sex_types`,`laoshi_email`,`create_time`) values (1,'a1','123456','老师姓名1','17703786901','410224199610232001','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/laoshi1.jpg',2,'1@qq.com','2022-04-16 20:52:53'),(2,'a2','123456','老师姓名2','17703786902','410224199610232002','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/laoshi2.jpg',2,'2@qq.com','2022-04-16 20:52:53'),(3,'a3','123456','老师姓名3','17703786903','410224199610232003','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/laoshi3.jpg',2,'3@qq.com','2022-04-16 20:52:53');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,6,'admin','users','管理员','tpaudc2c7ohgryujuh4plb07mxx278v4','2022-04-16 20:52:28','2022-04-16 22:19:23'),(2,1,'a1','yonghu','用户','l430j1fqe4fayo21n916avpvumxkygwv','2022-04-16 21:09:27','2022-04-16 22:15:32'),(3,1,'a1','laoshi','老师','rwj5a5ux2v7ckc4isb19ackqrul0ysig','2022-04-16 21:15:51','2022-04-16 22:15:52');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (6,'admin','admin','管理员','2022-05-02 14:51:13');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_phone`,`yonghu_id_number`,`yonghu_photo`,`sex_types`,`yonghu_email`,`create_time`) values (1,'a1','123456','用户姓名1','17703786901','410224199610232001','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/yonghu1.jpg',1,'1@qq.com','2022-04-16 20:52:53'),(2,'a2','123456','用户姓名2','17703786902','410224199610232002','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/yonghu2.jpg',2,'2@qq.com','2022-04-16 20:52:53'),(3,'a3','123456','用户姓名3','17703786903','410224199610232003','http://localhost:8080/zaixianyuanchengkaoshixitong/upload/yonghu3.jpg',1,'3@qq.com','2022-04-16 20:52:53');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
