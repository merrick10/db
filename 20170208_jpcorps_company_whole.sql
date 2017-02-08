/*
SQLyog Ultimate v12.09 (32 bit)
MySQL - 5.5.16 : Database - jpcorps
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jpcorps` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jpcorps`;

/*Table structure for table `bbspost` */

DROP TABLE IF EXISTS `bbspost`;

CREATE TABLE `bbspost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `istopic` int(1) NOT NULL DEFAULT '0',
  `topicid` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `authorid` varchar(16) NOT NULL,
  `clicktimes` int(11) NOT NULL DEFAULT '0',
  `replytimes` int(11) NOT NULL DEFAULT '0',
  `posttime` datetime NOT NULL,
  `istop` int(1) NOT NULL DEFAULT '3',
  `islock` int(1) NOT NULL DEFAULT '0',
  `isdel` int(1) NOT NULL DEFAULT '0',
  `lastmodifytime` datetime DEFAULT NULL,
  `clickers` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topicid` (`topicid`),
  KEY `authorid` (`authorid`),
  KEY `posttime` (`posttime`),
  KEY `isdel` (`isdel`),
  CONSTRAINT `bbspost_ibfk_1` FOREIGN KEY (`authorid`) REFERENCES `siteuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=utf8;

/*Data for the table `bbspost` */

insert  into `bbspost`(`id`,`istopic`,`topicid`,`title`,`content`,`authorid`,`clicktimes`,`replytimes`,`posttime`,`istop`,`islock`,`isdel`,`lastmodifytime`,`clickers`) values (1,0,11,'111','爱爱爱','u5',0,0,'2017-02-01 12:35:55',3,0,0,NULL,''),(419,1,11,'I\'m administrator',' 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\" 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\" 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\" 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\" 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\" 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\"','admin',2,2,'2017-02-01 01:28:08',3,0,0,NULL,'u5,a'),(421,1,22,'22','234234234','u5',3,4,'2017-02-01 15:30:14',3,0,0,NULL,'admin,a'),(422,0,11,'111','dfsdfasf','user1',0,0,'2017-02-02 12:36:27',3,0,0,NULL,''),(426,0,11,'111','ffffffffff','user2',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(429,0,11,'111','ffffffffff','user2',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(436,1,33,'33333','			<tr><td colspan=\"3\" class=\"topictitle\">	<div class=\"puber\" style=\"\">话题: XXXXXXXXXXXX  	</div></td></tr>		\r\n			<tr><td  style=\"text-align: left; \"><div class=\"puber\" >発表者：XXX&nbsp;&nbsp;作成時間：XXXX/XX/XX XX:XX:XX</div></td>\r\n				<td style=\"text-align: right;\">#1</td>\r\n				</tr>\r\n			<tr class=\"article1\"><td style=\"\"  colspan=\"3\"><div class=\"postcontent\">XXXXXXXXXXXX</div></td></tr>	\r\n			<tr class=\"respbtn1\"><td  colspan=\"3\"><div class=\"rbtns\">\r\n				<input class=\"normalbtn\" type=\"button\" value=\"編集\"/>&nbsp;&nbsp;&nbsp;\r\n				<input class=\"normalbtn\" type=\"button\" value=\"返信\"/>	</div></td></tr>	\r\n			<tr class=\"sep1\"><td colspan=\"2\"></td></tr>\r\n			\r\n				\r\n			\r\n			<tr>\r\n				<td  style=\"text-align: left;\">\r\n					<div class=\"responser\" >返信者：XXX&nbsp;&nbsp;\r\n					返信時間：XXXX/XX/XX XX:XX:XX			</div>				</td>		<td style=\"text-align: right;\">	<span>\r\n						<input type=\"button\" class=\"headbtn\" value=\"删除回复\" />\r\n						</span></td>\r\n				<td style=\"text-align: right;\">	#2	</td>	\r\n			</tr>\r\n			<tr ><td  colspan=\"3\"><div class=\"respcontent\">XXXXXXXXXXXX	</div></td></tr>\r\n			<tr class=\"sep1\"><td colspan=\"3\"></td></tr>\r\n			\r\n			\r\n			\r\n			<tr>\r\n				<td  style=\"text-align: left;\">\r\n					<div class=\"responser\" >返信者：XXX&nbsp;&nbsp;返信時間：XXXX/XX/XX XX:XX:XX\r\n						&nbsp;&nbsp;<span>\r\n						\r\n						<input type=\"button\" class=\"headbtn\" value=\"删除回复\"/></span>\r\n					</div>\r\n				</td>\r\n				<td style=\"text-align: right;\">\r\n					#3\r\n				</td>\r\n			</tr>\r\n			<tr class=\"\">\r\n				<td style=\"\" colspan=\"2\">\r\n					<div class=\"respcontent\">XXXXXXXXXXXX				\r\n					\r\n					</div>\r\n				</td>\r\n			</tr>\r\n			<tr class=\"sep1\">\r\n				<td colspan=\"2\"></td>\r\n			</tr>\r\n\r\n\r\n			<tr>\r\n				<td  style=\"text-align: left;\">\r\n					<div class=\"responser\" >返信者：XXX&nbsp;&nbsp;返信時間：XXXX/XX/XX XX:XX:XX\r\n						&nbsp;&nbsp;<span><input type=\"button\" class=\"headbtn\" value=\"删除回复\"/></span>\r\n					</div>\r\n				</td>\r\n				<td style=\"text-align: right;\">\r\n					#4\r\n				</td>\r\n			</tr>\r\n			<tr class=\"\">\r\n				<td style=\"\"  colspan=\"2\">\r\n					<div class=\"respcontent\">XXXXXXXXXXXX				</div>\r\n				</td>\r\n			</tr>\r\n			<tr class=\"sep1\">\r\n				<td colspan=\"2\"></td>\r\n			</tr>\r\n			\r\n			<tr>\r\n				<td  style=\"text-align: left;\">\r\n					<div class=\"responser\" >返信者：XXX&nbsp;&nbsp;返信時間：XXXX/XX/XX XX:XX:XX\r\n						&nbsp;&nbsp;<span><input type=\"button\" class=\"headbtn\" value=\"删除回复\"/></span>\r\n					</div>\r\n				</td>\r\n				<td style=\"text-align: right;\">\r\n					#5\r\n				</td>\r\n			</tr>\r\n			<tr class=\"\">\r\n				<td style=\"\"  colspan=\"2\">\r\n					<div class=\"respcontent\">XXXXXXXXXXXX				</div>\r\n				</td>\r\n			</tr>\r\n			<tr class=\"sep1\" >\r\n				<td  colspan=\"2\"></td>\r\n			</tr>	','user2',5,1,'2017-02-03 13:15:39',3,0,0,NULL,'u5,admin,a'),(444,1,1486458239953,'a','a','admin',2,1,'2017-02-07 17:03:59',0,0,0,NULL,'u5,a'),(445,0,11,'I\'m administrator','管理员的回复','admin',0,0,'2017-02-07 17:17:43',0,0,0,NULL,''),(446,0,11,'I\'m administrator','管理员的回复2','admin',0,0,'2017-02-07 17:18:16',0,0,0,NULL,''),(447,0,11,'I\'m administrator','admin\'s 3','admin',0,0,'2017-02-08 08:36:00',0,0,0,NULL,''),(448,0,11,'I\'m administrator','admin 4','admin',0,0,'2017-02-08 08:36:12',0,0,0,NULL,''),(449,0,11,'I\'m administrator','admin 5','admin',0,0,'2017-02-08 08:36:22',0,0,0,NULL,''),(450,0,11,'I\'m administrator','admin 6','admin',0,0,'2017-02-08 08:36:35',0,0,0,NULL,''),(451,1,1486514213943,'ab','ab','admin',2,0,'2017-02-08 08:36:53',0,0,0,NULL,'u5,a'),(452,0,11,'I\'m administrator','??中文','admin',0,0,'2017-02-08 08:38:02',0,0,0,NULL,''),(453,0,11,'I\'m administrator','??中文','admin',0,0,'2017-02-08 08:42:44',0,0,0,NULL,''),(454,0,11,'I\'m administrator','??中文','admin',0,0,'2017-02-08 08:44:42',0,0,0,NULL,''),(455,0,11,'I\'m administrator','??中文','admin',0,0,'2017-02-08 08:45:20',0,0,0,NULL,''),(456,0,11,'I\'m administrator','u5','u5',0,0,'2017-02-08 09:12:45',0,0,0,NULL,''),(457,0,22,'22','1','u5',0,0,'2017-02-08 09:13:02',0,0,0,NULL,''),(458,0,22,'22','2','u5',0,0,'2017-02-08 09:15:06',0,0,0,NULL,''),(459,0,22,'22','3','u5',0,0,'2017-02-08 09:15:23',0,0,0,NULL,''),(460,0,22,'22','5','u5',0,0,'2017-02-08 09:15:32',0,0,0,NULL,''),(461,1,1486519475356,'newA','Ab','admin',1,3,'2017-02-08 10:04:35',0,0,0,NULL,'u5'),(462,0,1486519475356,'newA','1','admin',0,0,'2017-02-08 10:06:39',0,0,0,NULL,''),(463,0,1486519475356,'newA','2','admin',0,0,'2017-02-08 10:06:44',0,0,0,NULL,''),(464,0,1486458239953,'a','hi','a',0,0,'2017-02-08 10:17:06',0,0,0,NULL,''),(465,0,33,'33333','aaa','a',0,0,'2017-02-08 10:17:20',0,0,0,NULL,''),(467,1,1486521644899,'Ab','Ab','a',0,1,'2017-02-08 10:40:44',0,0,0,'2017-02-08 10:47:54',''),(468,0,1486521644899,'A','23','a',0,0,'2017-02-08 10:47:45',0,0,0,NULL,''),(469,0,11,'I\'m administrator','bbb','a',0,0,'2017-02-08 10:54:55',0,0,0,NULL,''),(470,1,1486531525428,'uuu1','uuuu1','u5',0,1,'2017-02-08 13:25:25',0,0,0,'2017-02-08 13:26:38',''),(471,0,1486531525428,'uuu1','bbbbb','u5',0,0,'2017-02-08 13:27:52',0,0,0,NULL,''),(472,0,9717,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(473,0,7037,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(474,0,6033,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(475,0,9054,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(476,0,7173,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(477,0,8700,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(478,0,1983,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(479,0,3813,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(480,0,3119,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(481,0,4156,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(482,0,1421,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(483,0,4636,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(484,0,8918,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(485,0,684,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(486,0,6665,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(487,0,1273,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(488,0,6368,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(489,0,8022,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(490,0,1005,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(491,0,959,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(492,0,1779,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(493,0,6021,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(494,0,4765,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(495,0,5763,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(496,0,4520,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(497,0,5313,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(498,0,3003,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(499,0,9077,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(500,0,6375,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(501,0,4645,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(502,0,4099,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(503,0,6559,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(504,0,498,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(505,0,2813,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(506,0,2570,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(507,0,4411,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(508,0,4347,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(509,0,8502,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(510,0,9468,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(511,0,1836,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(512,0,773,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(513,0,8358,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(514,0,9469,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(515,0,2273,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(516,0,2959,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(517,0,7977,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(518,0,1006,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(519,0,1101,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(520,0,2484,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(521,0,9119,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(522,0,8142,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(523,0,3352,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(524,0,2334,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(525,0,1616,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(526,0,1078,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(527,0,542,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(528,0,9473,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(529,0,5743,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(530,0,292,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(531,0,4235,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(532,0,296,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(533,0,8776,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(534,0,2994,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(535,0,8641,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(536,0,4222,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(537,0,5186,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(538,0,3263,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(539,0,760,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(540,0,4011,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(541,0,7772,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(542,0,6830,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(543,0,832,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(544,0,3670,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(545,0,5856,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(546,0,8268,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(547,0,3775,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(548,0,4068,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(549,0,9018,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(552,1,8167,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(553,1,8744,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(554,1,9218,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(555,1,9861,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(556,1,1648,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(557,1,8657,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(558,1,8344,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(559,1,5747,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(560,1,3702,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(561,1,1270,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(562,1,5245,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(563,1,2416,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(579,1,6301,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(580,1,2016,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(581,1,1178,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(582,1,9840,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(583,1,5667,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(584,1,8815,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(585,1,7076,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(586,1,8933,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(587,1,3439,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(588,1,395,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(589,1,1656,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(590,1,7097,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(591,1,516,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(612,1,5385,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(613,1,264,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(614,1,5169,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(615,1,5050,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(616,1,9744,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(617,1,3571,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(618,1,8624,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(619,1,2405,'111','ffffffffff','u5',1,0,'2017-02-08 12:36:55',3,0,0,NULL,'admin'),(620,1,6152,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(621,1,3548,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(627,1,3760,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(628,1,2744,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(629,1,2440,'1112','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,'2017-02-08 13:40:06','');

/*Table structure for table `clubact` */

DROP TABLE IF EXISTS `clubact`;

CREATE TABLE `clubact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type2` varchar(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pubday` date NOT NULL,
  `content` text NOT NULL,
  `ispub` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `type2` (`type2`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `clubact` */

insert  into `clubact`(`id`,`type2`,`title`,`pubday`,`content`,`ispub`) values (1,'2','hahala','2017-01-09','running sport','1'),(2,'2','aaa','2017-01-10','xxxx','0'),(4,'1','sadf','2017-01-17','afa','1'),(6,'3','t111111111111','2017-01-10','111','1'),(8,'1','日系企业年底喝酒00000000000000000000000000000000000000000000000000000000000000000000000000000000000','2017-01-03','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1','1'),(9,'3','2017','2016-03-31','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','0'),(10,'1','1','2017-01-02','1','1'),(11,'1','1','2017-01-02','1','1'),(12,'1','35','2017-01-04','5','0');

/*Table structure for table `emailgroup` */

DROP TABLE IF EXISTS `emailgroup`;

CREATE TABLE `emailgroup` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `mailaddrs` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emailgroup` */

/*Table structure for table `govinfo` */

DROP TABLE IF EXISTS `govinfo`;

CREATE TABLE `govinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type2` varchar(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pubday` date NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type2` (`type2`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `govinfo` */

insert  into `govinfo`(`id`,`type2`,`title`,`pubday`,`content`) values (4,'1','v','2017-01-16','vvvvv'),(5,'3','bbbbbbbbbbbbbbbb','2017-01-24','bbbbbbbbbbb'),(6,'1','asf','2017-01-13','f');

/*Table structure for table `maildetail` */

DROP TABLE IF EXISTS `maildetail`;

CREATE TABLE `maildetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `receiver` text,
  `cc` text,
  `title` varchar(200) NOT NULL,
  `content` text,
  `attach` varchar(100) DEFAULT NULL,
  `sendstat` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `maildetail` */

insert  into `maildetail`(`id`,`type`,`sender`,`receiver`,`cc`,`title`,`content`,`attach`,`sendstat`) values (1,1,'a@b.c',NULL,NULL,'title1',NULL,NULL,0);

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `dtype` varchar(16) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`,`dtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `settings` */

insert  into `settings`(`id`,`name`,`dtype`,`level`,`remark`) values ('001','日系独資企業','COMFORM',NULL,NULL),('001','機械','COMPROFESS',NULL,NULL),('001','SMTP','EMAILSET',NULL,NULL),('002','合弁企業','COMFORM',NULL,NULL),('002','機械部品','COMPROFESS',NULL,NULL),('002','127.0.0.1','EMAILSET',NULL,NULL),('003','中華系企業','COMFORM',NULL,NULL),('003','電気','COMPROFESS',NULL,NULL),('003','25','EMAILSET',NULL,NULL),('004','常州以外','COMFORM',NULL,NULL),('004','電気部品','COMPROFESS',NULL,NULL),('004','0','EMAILSET',NULL,NULL),('005','その他','COMFORM',NULL,NULL),('005','製造その他','COMPROFESS',NULL,NULL),('005','0','EMAILSET',NULL,NULL),('006','服飾雑貨','COMPROFESS',NULL,NULL),('006','','EMAILSET',NULL,NULL),('007','貿易','COMPROFESS',NULL,NULL),('007','','EMAILSET',NULL,NULL),('008','運輸','COMPROFESS',NULL,NULL),('008','','EMAILSET',NULL,NULL),('009','飲食','COMPROFESS',NULL,NULL),('009','','EMAILSET',NULL,NULL),('010','サービス','COMPROFESS',NULL,NULL),('010','[CZJPCOMS-ADMIN]','EMAILSET',NULL,NULL),('011','POP3','EMAILSET',NULL,NULL);

/*Table structure for table `siteuser` */

DROP TABLE IF EXISTS `siteuser`;

CREATE TABLE `siteuser` (
  `id` varchar(16) NOT NULL,
  `name` varchar(32) NOT NULL,
  `cipher` varchar(32) NOT NULL,
  `gender` int(1) DEFAULT '1',
  `birth` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `intro` varchar(100) DEFAULT NULL,
  `level` int(1) NOT NULL DEFAULT '1',
  `lastlogin` datetime DEFAULT NULL,
  `lastpost` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `siteuser` */

insert  into `siteuser`(`id`,`name`,`cipher`,`gender`,`birth`,`email`,`tel`,`intro`,`level`,`lastlogin`,`lastpost`) values ('a','老AAAAAAAAAAAAAAAAAAAAAAAAA','a',1,'1972-01-12','aaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',1,NULL,'2017-02-08 10:54:55'),('admin','管理员','123',1,NULL,NULL,NULL,NULL,0,NULL,NULL),('u5','油五','u5',0,'1972-01-23','aaaa','111','11234',1,NULL,'2017-02-08 13:40:06'),('user1','Apache','user1',0,'2007-01-18','a@A.A','1234567','hi',1,NULL,'2017-01-01 13:34:34'),('user2','tom','user2',0,'2009-02-02','b@b.c111','1356662222','hello3',1,NULL,'2017-01-04 13:34:52');

/*Table structure for table `tonggao` */

DROP TABLE IF EXISTS `tonggao`;

CREATE TABLE `tonggao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type2` varchar(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pubday` date NOT NULL,
  `content` text NOT NULL,
  `ispub` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `type2` (`type2`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `tonggao` */

insert  into `tonggao`(`id`,`type2`,`title`,`pubday`,`content`,`ispub`) values (3,'2','oki','2017-01-24','oki','1'),(13,'1','sf','2017-01-20','asdf','1'),(14,'1','fb','2017-01-12','asdf','1');

/*Table structure for table `vipcoms` */

DROP TABLE IF EXISTS `vipcoms`;

CREATE TABLE `vipcoms` (
  `id` varchar(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `profession` varchar(3) NOT NULL,
  `content` varchar(50) DEFAULT NULL,
  `wuhao` varchar(50) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `cpform` varchar(3) DEFAULT NULL,
  `zuochengri` bigint(20) DEFAULT NULL,
  `viptype` int(1) NOT NULL DEFAULT '1',
  `remark1` varchar(50) DEFAULT NULL,
  `remark2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_profession` (`profession`),
  KEY `idx_cpform` (`cpform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vipcoms` */

insert  into `vipcoms`(`id`,`name`,`profession`,`content`,`wuhao`,`addr`,`tel`,`email`,`homepage`,`introduce`,`fax`,`cpform`,`zuochengri`,`viptype`,`remark1`,`remark2`) values ('aaa','a','001','aaa','a','a','a','a','https://www.baidu.com','a<p style=\"color:red;\">ABC</p>','a','003',1485160980952,3,'tianningsi1.jpg',NULL),('S001','XXX公司','001','','','','','','','2<em>红色</em>','','001',1485149487711,2,NULL,NULL),('X001','XXXYS','008','YUNS','0000001','CZ','137','A@B','WWW.WWW.COM','1112343425		11231		<strong>***</strong>	','159','002',1485149460572,1,NULL,NULL);

/*Table structure for table `vipcomstaff` */

DROP TABLE IF EXISTS `vipcomstaff`;

CREATE TABLE `vipcomstaff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hname` varchar(32) NOT NULL,
  `jname` varchar(32) DEFAULT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `comid` varchar(8) NOT NULL,
  `mtype` int(1) NOT NULL DEFAULT '1',
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comid` (`comid`),
  CONSTRAINT `vipcomstaff_ibfk_1` FOREIGN KEY (`comid`) REFERENCES `vipcoms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `vipcomstaff` */

insert  into `vipcomstaff`(`id`,`hname`,`jname`,`pos`,`comid`,`mtype`,`mobile`,`email`,`tel`,`fax`) values (2,'木村 匡伸','嘎嘎嘎嘎',NULL,'S001',1,NULL,NULL,NULL,NULL),(3,'X2','X3','X4','S001',0,'X5','X6','X7','X8'),(5,'exxxxxxxxxxxxx aaaaaaaaaaaaaaaaa','e','e','X001',0,'e','e','e','e');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
