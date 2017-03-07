-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: jpcorps
-- ------------------------------------------------------
-- Server version	5.5.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP DATABASE IF EXISTS `jpcorps`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jpcorps` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jpcorps`;

--
-- Table structure for table `bbspost`
--

DROP TABLE IF EXISTS `bbspost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=682 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbspost`
--

LOCK TABLES `bbspost` WRITE;
/*!40000 ALTER TABLE `bbspost` DISABLE KEYS */;
INSERT INTO `bbspost` VALUES (1,0,11,'111','爱爱爱','u5',0,0,'2017-02-01 12:35:55',3,0,0,NULL,''),(419,1,11,'I\'m administrator',' 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\" 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\" 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\" 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\" 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\" 需要删除指定目录下的所有文件，但是手动删除是比较麻烦的。比如，一种情况有，该目录下的子目录及文件众多（如数万甚至数十万），此时手动删除的反应时间是让人抓狂的；还有一种情况，当需要定期清理时，每次都手动操作，显然也让人厌烦。所以，此时简单的批处理删除程序是有必要的。 下面是一个批处理删除指定目录下所有子目录及文件的示例，可将代码复制到文本文档，修改“D:\\tmp”为你要清理的目录，然后另存为.bat后缀的文件，再双击运行即可开始清理。\r\n\r\n \r\n@echo off\r\ncd /d D:\\tmp\\\r\nfor /d %%i in (*) do (\r\n    rd /s /q \"%%i\"\r\n    del /a /f /q *.*\r\n)\r\necho 删除完成！\r\n@pause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n删除当前目录下及其子文件夹中所有的空文件夹\r\n\r\n@echo off\r\nfor /f \"tokens=*\" %%a in (\'dir /b /ad /s^|sort /r\') do rd \"%%a\" 2>nul\r\necho   删除成功, 已删除所有空文件夹\r\npause\r\n\r\n \r\n\r\n》》》》》》》》》》》》》》\r\n\r\n \r\n\r\n命令为：\r\n\r\ndel /f /s /q 文件名\r\n\r\n/f ：指的是强制删除\r\n\r\n/s：指的是存在的子目录也删除\r\n\r\n/q：指的是不出现提示直接删除\r\n\r\n在这个命令执行前，首先要去处相对应文件的隐藏属性，\r\n\r\n命令为：attrib -s -h -w 文件名， 即去处该文件的隐藏 只读 系统等属性。\r\n\r\n\r\n\r\n\"ABC\"','admin',2,1,'2017-02-01 01:28:08',3,0,0,NULL,'u5,a'),(421,1,22,'22','234234234','u5',3,4,'2017-02-01 15:30:14',3,0,0,NULL,'admin,a'),(422,0,11,'111','dfsdfasf','user1',0,0,'2017-02-02 12:36:27',3,0,0,NULL,''),(426,0,11,'111','ffffffffff','user2',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(429,0,11,'111','ffffffffff','user2',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(436,1,33,'33333','			<tr><td colspan=\"3\" class=\"topictitle\">	<div class=\"puber\" style=\"\">话题: XXXXXXXXXXXX  	</div></td></tr>		\r\n			<tr><td  style=\"text-align: left; \"><div class=\"puber\" >発表者：XXX&nbsp;&nbsp;作成時間：XXXX/XX/XX XX:XX:XX</div></td>\r\n				<td style=\"text-align: right;\">#1</td>\r\n				</tr>\r\n			<tr class=\"article1\"><td style=\"\"  colspan=\"3\"><div class=\"postcontent\">XXXXXXXXXXXX</div></td></tr>	\r\n			<tr class=\"respbtn1\"><td  colspan=\"3\"><div class=\"rbtns\">\r\n				<input class=\"normalbtn\" type=\"button\" value=\"編集\"/>&nbsp;&nbsp;&nbsp;\r\n				<input class=\"normalbtn\" type=\"button\" value=\"返信\"/>	</div></td></tr>	\r\n			<tr class=\"sep1\"><td colspan=\"2\"></td></tr>\r\n			\r\n				\r\n			\r\n			<tr>\r\n				<td  style=\"text-align: left;\">\r\n					<div class=\"responser\" >返信者：XXX&nbsp;&nbsp;\r\n					返信時間：XXXX/XX/XX XX:XX:XX			</div>				</td>		<td style=\"text-align: right;\">	<span>\r\n						<input type=\"button\" class=\"headbtn\" value=\"删除回复\" />\r\n						</span></td>\r\n				<td style=\"text-align: right;\">	#2	</td>	\r\n			</tr>\r\n			<tr ><td  colspan=\"3\"><div class=\"respcontent\">XXXXXXXXXXXX	</div></td></tr>\r\n			<tr class=\"sep1\"><td colspan=\"3\"></td></tr>\r\n			\r\n			\r\n			\r\n			<tr>\r\n				<td  style=\"text-align: left;\">\r\n					<div class=\"responser\" >返信者：XXX&nbsp;&nbsp;返信時間：XXXX/XX/XX XX:XX:XX\r\n						&nbsp;&nbsp;<span>\r\n						\r\n						<input type=\"button\" class=\"headbtn\" value=\"删除回复\"/></span>\r\n					</div>\r\n				</td>\r\n				<td style=\"text-align: right;\">\r\n					#3\r\n				</td>\r\n			</tr>\r\n			<tr class=\"\">\r\n				<td style=\"\" colspan=\"2\">\r\n					<div class=\"respcontent\">XXXXXXXXXXXX				\r\n					\r\n					</div>\r\n				</td>\r\n			</tr>\r\n			<tr class=\"sep1\">\r\n				<td colspan=\"2\"></td>\r\n			</tr>\r\n\r\n\r\n			<tr>\r\n				<td  style=\"text-align: left;\">\r\n					<div class=\"responser\" >返信者：XXX&nbsp;&nbsp;返信時間：XXXX/XX/XX XX:XX:XX\r\n						&nbsp;&nbsp;<span><input type=\"button\" class=\"headbtn\" value=\"删除回复\"/></span>\r\n					</div>\r\n				</td>\r\n				<td style=\"text-align: right;\">\r\n					#4\r\n				</td>\r\n			</tr>\r\n			<tr class=\"\">\r\n				<td style=\"\"  colspan=\"2\">\r\n					<div class=\"respcontent\">XXXXXXXXXXXX				</div>\r\n				</td>\r\n			</tr>\r\n			<tr class=\"sep1\">\r\n				<td colspan=\"2\"></td>\r\n			</tr>\r\n			\r\n			<tr>\r\n				<td  style=\"text-align: left;\">\r\n					<div class=\"responser\" >返信者：XXX&nbsp;&nbsp;返信時間：XXXX/XX/XX XX:XX:XX\r\n						&nbsp;&nbsp;<span><input type=\"button\" class=\"headbtn\" value=\"删除回复\"/></span>\r\n					</div>\r\n				</td>\r\n				<td style=\"text-align: right;\">\r\n					#5\r\n				</td>\r\n			</tr>\r\n			<tr class=\"\">\r\n				<td style=\"\"  colspan=\"2\">\r\n					<div class=\"respcontent\">XXXXXXXXXXXX				</div>\r\n				</td>\r\n			</tr>\r\n			<tr class=\"sep1\" >\r\n				<td  colspan=\"2\"></td>\r\n			</tr>	','user2',5,1,'2017-02-03 13:15:39',3,0,0,NULL,'u5,admin,a'),(444,1,1486458239953,'a','a','admin',2,1,'2017-02-07 17:03:59',0,0,0,NULL,'u5,a'),(445,0,11,'I\'m administrator','管理员的回复','admin',0,0,'2017-02-07 17:17:43',0,0,0,NULL,''),(446,0,11,'I\'m administrator','管理员的回复2','admin',0,0,'2017-02-07 17:18:16',0,0,0,NULL,''),(447,0,11,'I\'m administrator','admin\'s 3','admin',0,0,'2017-02-08 08:36:00',0,0,0,NULL,''),(448,0,11,'I\'m administrator','admin 4','admin',0,0,'2017-02-08 08:36:12',0,0,0,NULL,''),(450,0,11,'I\'m administrator','admin 6','admin',0,0,'2017-02-08 08:36:35',0,0,0,NULL,''),(451,1,1486514213943,'ab','ab','admin',2,0,'2017-02-08 08:36:53',0,0,0,NULL,'u5,a'),(452,0,11,'I\'m administrator','??中文','admin',0,0,'2017-02-08 08:38:02',0,0,0,NULL,''),(453,0,11,'I\'m administrator','??中文','admin',0,0,'2017-02-08 08:42:44',0,0,0,NULL,''),(454,0,11,'I\'m administrator','??中文','admin',0,0,'2017-02-08 08:44:42',0,0,0,NULL,''),(455,0,11,'I\'m administrator','??中文','admin',0,0,'2017-02-08 08:45:20',0,0,0,NULL,''),(456,0,11,'I\'m administrator','u5','u5',0,0,'2017-02-08 09:12:45',0,0,0,NULL,''),(457,0,22,'22','1','u5',0,0,'2017-02-08 09:13:02',0,0,0,NULL,''),(458,0,22,'22','2','u5',0,0,'2017-02-08 09:15:06',0,0,0,NULL,''),(459,0,22,'22','3','u5',0,0,'2017-02-08 09:15:23',0,0,0,NULL,''),(460,0,22,'22','5','u5',0,0,'2017-02-08 09:15:32',0,0,0,NULL,''),(461,1,1486519475356,'newA','Ab','admin',1,3,'2017-02-08 10:04:35',0,0,0,NULL,'u5'),(462,0,1486519475356,'newA','1','admin',0,0,'2017-02-08 10:06:39',0,0,0,NULL,''),(463,0,1486519475356,'newA','2','admin',0,0,'2017-02-08 10:06:44',0,0,0,NULL,''),(464,0,1486458239953,'a','hi','a',0,0,'2017-02-08 10:17:06',0,0,0,NULL,''),(465,0,33,'33333','aaa','a',0,0,'2017-02-08 10:17:20',0,0,0,NULL,''),(467,1,1486521644899,'Ab','Ab','a',1,1,'2017-02-08 10:40:44',0,0,0,'2017-02-08 10:47:54','admin'),(468,0,1486521644899,'A','23','a',0,0,'2017-02-08 10:47:45',0,0,0,NULL,''),(469,0,11,'I\'m administrator','bbb','a',0,0,'2017-02-08 10:54:55',0,0,0,NULL,''),(470,1,1486531525428,'uuu1','uuuu1','u5',1,1,'2017-02-08 13:25:25',0,0,0,'2017-02-08 13:26:38','admin'),(471,0,1486531525428,'uuu1','bbbbb','u5',0,0,'2017-02-08 13:27:52',0,0,0,NULL,''),(472,0,9717,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(473,0,7037,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(474,0,6033,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(475,0,9054,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(476,0,7173,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(477,0,8700,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(478,0,1983,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(479,0,3813,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(480,0,3119,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(481,0,4156,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(482,0,1421,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(483,0,4636,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(484,0,8918,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(485,0,684,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(486,0,6665,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(487,0,1273,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(488,0,6368,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(489,0,8022,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(490,0,1005,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(491,0,959,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(492,0,1779,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(493,0,6021,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(494,0,4765,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(495,0,5763,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(496,0,4520,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(497,0,5313,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(498,0,3003,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(499,0,9077,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(500,0,6375,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(501,0,4645,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(502,0,4099,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(503,0,6559,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(504,0,498,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(505,0,2813,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(506,0,2570,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(507,0,4411,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(508,0,4347,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(509,0,8502,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(510,0,9468,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(511,0,1836,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(512,0,773,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(513,0,8358,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(514,0,9469,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(515,0,2273,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(516,0,2959,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(517,0,7977,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(518,0,1006,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(519,0,1101,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(520,0,2484,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(521,0,9119,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(522,0,8142,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(523,0,3352,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(524,0,2334,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(525,0,1616,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(526,0,1078,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(527,0,542,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(528,0,9473,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(529,0,5743,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(530,0,292,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(531,0,4235,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(532,0,296,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(533,0,8776,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(534,0,2994,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(535,0,8641,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(536,0,4222,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(537,0,5186,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(538,0,3263,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(539,0,760,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(540,0,4011,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(541,0,7772,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(542,0,6830,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(543,0,832,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(544,0,3670,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(545,0,5856,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(546,0,8268,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(547,0,3775,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(548,0,4068,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(549,0,9018,'111','ffffffffff','u5',0,0,'2017-02-04 12:36:55',3,0,0,NULL,''),(560,1,3702,'111','ffffffffff','u5',1,0,'2017-02-08 12:36:55',3,0,0,NULL,'admin'),(583,1,5667,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(584,1,8815,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(585,1,7076,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(586,1,8933,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(587,1,3439,'111','ffffffffff','u5',1,0,'2017-02-08 12:36:55',3,0,0,NULL,'admin'),(588,1,395,'111','ffffffffff','u5',1,0,'2017-02-08 12:36:55',3,0,0,NULL,'admin'),(589,1,1656,'111','ffffffffff','u5',1,0,'2017-02-08 12:36:55',3,0,0,NULL,'admin'),(590,1,7097,'111','ffffffffff','u5',1,0,'2017-02-08 12:36:55',3,0,0,NULL,'admin'),(591,1,516,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(613,1,264,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(629,1,2440,'1112','ffffffffff','u5',1,0,'2017-02-08 12:36:55',3,0,0,'2017-02-08 13:40:06','admin'),(630,1,1486606051780,'111','111','admin',1,0,'2017-02-09 10:07:31',0,0,0,NULL,'u5'),(631,1,8109,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(632,1,193,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(633,1,6636,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(634,1,2603,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(635,1,3108,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(636,1,7730,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(637,1,9325,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(638,1,3434,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(639,1,9198,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(640,1,5685,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(641,1,832,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(642,1,7105,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(643,1,3031,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(645,1,91,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(646,1,8947,'111','ffffffffff','u5',1,0,'2017-02-08 12:36:55',3,0,0,NULL,'admin'),(647,1,4462,'111','ffffffffff','u5',1,0,'2017-02-08 12:36:55',3,0,0,NULL,'admin'),(648,1,5469,'111','ffffffffff','u5',1,0,'2017-02-08 12:36:55',3,0,0,NULL,'admin'),(649,1,3959,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(650,1,3388,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(651,1,5062,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(652,1,5148,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(653,1,554,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(654,1,7327,'111','ffffffffff','u5',1,0,'2017-02-08 12:36:55',3,0,0,NULL,'admin'),(655,1,4973,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(656,1,2884,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(658,1,8848,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(659,1,5739,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(660,1,2152,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(661,1,3541,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(662,1,1251,'111','ffffffffff','u5',0,0,'2017-02-08 12:36:55',3,0,0,NULL,''),(668,1,1488249095583,'AAAAAAAaaaaaaaa','1','admin',0,0,'2017-02-28 10:31:35',0,0,0,NULL,''),(669,1,1488270660450,'aaaaaaaaaaaaaa','sssssssssssssssssssssss','u5',0,0,'2017-02-28 16:31:00',0,0,0,NULL,''),(678,1,1488271509059,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','assssssssssssssssssssssss','admin',0,0,'2017-02-28 16:45:09',0,0,0,NULL,''),(679,1,1488272523159,'fffffffffffffffffffffffffffffff','fffffffffffffffffffffffffffffffffffff0','admin',0,0,'2017-02-28 17:02:03',0,0,0,'2017-03-01 13:05:51',''),(680,1,1488272565498,'bbbbbbbbbbbbbbbbbbbbbbb','bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb','admin',1,0,'2017-02-28 17:02:45',0,0,0,NULL,'u5'),(681,1,1488272572749,'bbbbbbbbbbbbbbbbbbbbbb','bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbs','admin',1,0,'2017-02-28 17:02:52',0,0,0,NULL,'u5');
/*!40000 ALTER TABLE `bbspost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubact`
--

DROP TABLE IF EXISTS `clubact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubact`
--

LOCK TABLES `clubact` WRITE;
/*!40000 ALTER TABLE `clubact` DISABLE KEYS */;
INSERT INTO `clubact` VALUES (1,'2','hahala1','2017-01-09','running sport','1'),(2,'2','aaa','2017-01-10','xxxx','0'),(4,'1','sadf','2017-01-17','afa','1'),(6,'3','t111111111111','2017-01-10','111','1'),(8,'1','日系企业年底喝酒00000000000000000000000000000000000000000000000000000000000000000000000000000000000','2017-01-03','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊1','1'),(9,'3','2017','2016-03-31','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','0'),(10,'1','1','2017-01-02','1','1'),(11,'1','1','2017-01-02','1','1'),(12,'1','35','2017-01-04','51','0');
/*!40000 ALTER TABLE `clubact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailgroup`
--

DROP TABLE IF EXISTS `emailgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailgroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `mailaddrs` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailgroup`
--

LOCK TABLES `emailgroup` WRITE;
/*!40000 ALTER TABLE `emailgroup` DISABLE KEYS */;
INSERT INTO `emailgroup` VALUES (1,'oki1','a@b.c;b@d.e'),(4,'ccccc','cccc@cc.cc;ab@cc.cc'),(5,'merricksina','merrick80@sina.com'),(6,'lmoki','liu378@oki.com'),(7,'abcd','abcd@ab.cd');
/*!40000 ALTER TABLE `emailgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `govinfo`
--

DROP TABLE IF EXISTS `govinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `govinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type2` varchar(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pubday` date NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type2` (`type2`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `govinfo`
--

LOCK TABLES `govinfo` WRITE;
/*!40000 ALTER TABLE `govinfo` DISABLE KEYS */;
INSERT INTO `govinfo` VALUES (4,'1','v','2017-01-16','vvvvv'),(5,'3','bbbbbbbbbbbbbbbb','2017-01-24','bbbbbbbbbbb'),(6,'1','asf','2017-01-12','ff');
/*!40000 ALTER TABLE `govinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maildetail`
--

DROP TABLE IF EXISTS `maildetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `recvtime` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `sendtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maildetail`
--

LOCK TABLES `maildetail` WRITE;
/*!40000 ALTER TABLE `maildetail` DISABLE KEYS */;
INSERT INTO `maildetail` VALUES (2,0,'abc','1111','12','比尔盖茨书籍推荐',' 比尔盖茨2016好书推荐\r\n\r\n      土豪直接看视频，视频下方是对推荐书籍的详细文字介绍。假期快结束了，看看盖叔去年读了什么书（比尔盖茨2015年好书推荐请点击），顺便把前年想读去年还没读的书一起补上。新的一年，各位心想事成~\r\n\r\n1String Theory\r\n\r\n1\r\n\r\n      这是一本网球题材的书，作者（已故，原因自己查）为大卫·福斯特·华莱士（DavidFoster Wallace），纽约时报评价他为“有史以来，网球题材的最佳作者”。\r\n\r\n      本书摘选了他最优秀的五篇文章，形成了这本随笔集。在文中，作者以竞争对手或网球爱好者的视野，以他诙谐、讥嘲、繁复、热闹的笔调描述了网球这一挚爱运动，比如罗杰费德勒这样的世界级天才；对崔西·奥斯丁（前世界冠军）回忆录的深刻剖析；作为一个极为自律的运动员，迈克尔·乔伊（莎娃的教练）在命运面前的艺术性抉择；抵制美网的商业化侵蚀；回忆自己的网球职业，自认为自己差不多是一个伟大的初级网球手。\r\n\r\n      盖茨笑称“如果你在火车或飞机上读这本书，别人会觉得你超级聪明，实际上这本书跟物理没有半毛钱关系”。\r\n\r\n2Shoe Dog\r\n\r\n2\r\n\r\n      目前可以买到中文版，作者是Nike的创始人兼CEO菲尔·耐特（Phil Knight）。这是一本坦诚的，引人入胜的回忆录，耐特第一次和大家分享了公司早期那些不为人知的故事：一个无所畏惧的初创公司，如何通过自身的进化，成为全球最具标志性，颠覆性和盈利品牌之一。我们看一下美亚对本书简介：\r\n\r\n      1962年，菲尔·耐特刚刚从商学院毕业，揣着从父亲那借来的50美元创建了这家公司，当时想法很单纯：进口日本高品质，低成本的运动鞋。菲尔·耐特把鞋放在那辆石灰绿轿车的后备箱里兜售，以这样的方式，第一年赚了八千美元。现在，Nike每年的销售额是三百亿，俨然成为初创公司的标杆。勾号（swoosh）商标也无人不晓，成为当今世界最具革命性，最独一无二的标志之一。但商标背后的男人一直很神秘。现在，耐特首次以回忆录的形式，从那些关键时刻开始，坦白，谦虚，无畏，诙谐的讲述他的故事。当年，二十四岁的他完成徒步环游世界，决定选择一条不同寻常的道路来创建自己的商业。他和梦想之间，不只是成功的喜悦，还要承担很多风险和令人沮丧的挫折，耐特会在本书中细细道来。文中谈到他和早期搭档相识的过程，一群不合时宜的乌合之众最后亲如兄弟，在共同使命的感召下，凭借对体育精神的笃定，最终创造了Nike这个品牌。\r\n\r\n3The Myth of the Strong Leader\r\n\r\n3\r\n\r\n      作者是牛津大学著名政治学教授阿奇布朗（Archie Brown），本书主要讨论政治领导力。通常领导力会陷入到一个两难的极端分化：强弱之争。不过还是能找到很多卓有成效的办法来施展政治领导力，反之亦是如此。我们责备政客要为经济衰退买单时，又会称赞他推动了重要的社会改革。很少有人反思，究竟是什么特质让有些领导人一帆风顺，而其他领导人却举步维艰呢？作者调查百年来的浩瀚资料，完成了这部权威著作，反驳了一个常识：只有强有力的领导者能够支配幕僚，影响政策制定过程，因此更容易成功并受人尊重。\r\n\r\n      布朗广泛阐述了二十世纪政治家们的功过得失。比如像罗斯福，林登·约翰逊（第三十六任美国总统），撒切尔这类重新定义领导力的人物，或者像戴高乐，戈尔巴乔夫，曼德拉这类政权交替的领导者，文中描述了他们如何在任期内以政治方式达成可行性的极限，通过这些内容，布朗挑战了我们的对政权有效性和政治力量的常规看法。尽管我们认为学院风格过于懦弱，不待见这类领导力，但往往这类领袖更有协作能力，从而具有显著的影响力。布朗的总结新颖而富有启发，颠覆了很多传统观念，让我们重新评估那些塑造这个世界的领导者，并重新考虑和判断那些未来将要领导我们的人。\r\n\r\n4The Grid：The Fraying Wires Between American\r\n\r\n4\r\n\r\n      本书作者是人类文化学家格雷琴 巴克（Gretchen Bakke），电网作为二十世纪工程界的标志性成果，很难满足当今时代的需求。这不仅仅是电网老旧和基础设施维护的问题。随着我们对新能源（太阳能，风能等）的巨大期望，在通往能源未来的大道上，电网成了最大的阻碍。如果我们想要实现这个未来，我们需要根据二十一世界的价值观重新设计电网。这是一个浩瀚工程，需要多方面的努力，目前而言，这些努力并不显著，但革新已经有条不紊的开始了。\r\n\r\n      作者多方面的介绍了美国能源基础结构，电网高峰期和平稳时刻，以及它对个人和国家生活的重要作用。她认为电网是美国一项重要的人工产品，它伴随我们的成长，有一些天才科技和恒定的即兴创作，偶尔夹杂了一些异想天开的愿景，是粗放扩张下的产物。她阐述了当代美国改造电网的详情，有时需要进取心和伟大的梦想，有时是立法甚至武力示威。本文有趣而富有洞察力，将电网比喻为世界上最大的机器：它迷人的历史，如今的问题，以及光明的未来和潜在的作用。\r\n\r\n5The Gene：: An Intimate History\r\n\r\n5\r\n\r\n      本书作者是普利策奖得主，畅销书作家穆克吉（Siddhartha Mukherjee），本书介绍了基因的壮丽历史，对一个来自未来的问题给出了自己的答案：当我们掌握了读写（编辑）自己基因信息时，如何定义人类呢？\r\n\r\n      穆克吉认为基因是灵巧的，杰出的，富有启发性的，通过科学，社会历史以及个人叙述的穿插，告诉我们基因这个现代历史中最重要的概念突破之一。本书介绍了人类对遗传的探索，以及它对我们生活，个性，身份，命运，抉择的惊人影响。他描述了人类在上百年间对遗传的研究和实验，从亚里士多德，毕达哥拉斯到孟德尔，达尔文，从博韦里，摩根到克里克，沃森，富兰克林，全方位的展现了这些二十一世纪的创新者革命性的完成人类基因组的过程。一位纽约客评价，对一个普通读者而言，很难想象市面上会有如此多的科普读物，不仅能够涵盖现代科技的所有领域，而且浅显易懂又充满激情，这是一个了不起的成就。对任何人而言，基因知识都是必须要了解的，因为这牵扯到对未来人性的定义，是这个时代科学界最重要的部分。所以，不妨来听一听大师的观点。\r\n\r\n公众号\r\n好想被风刮走 刮遍整个地球的那种 在我爱的城市停 走 停 走','XXYYZZ.ico',0,'2017-02-01 17:18:14','IChat.ico',NULL),(3,0,'abc','1111','12','bigbig','注册用户登录后才能发表评论，请 登录 或 注册，访问网站首页。\r\n【推荐】50万行VC++源码: 大型组态工控、电力仿真CAD与GIS源码库\r\n【活动】一元专享1500元微软智能云Azure\r\n最新IT新闻:\r\n· 雷军：创业把自己当阿猫阿狗才能成功，2017年小目标是收入千亿\r\n· 打打杀杀的江湖做派，京东价值观是否偏航了？\r\n· 共享单车ofo融资1.5亿？请注意还未敲定，莫放烟雾弹！\r\n· 吞下这颗胶囊就可减肥10公斤，你要试吗？\r\n· 外媒梳理BAT的坎坷医疗梦 大佬们的日子也不好过\r\n» 更多新闻...\r\n最新知识库文章:\r\n· 「代码家」的学习过程和学习经验分享\r\n· 写给未来的程序媛\r\n· 高质量的工程代码为什么难写\r\n· 循序渐进地代码重构\r\n· 技术的正宗与野路子\r\n» 更多知识库文章...111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(4,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(5,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(6,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(7,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(8,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(9,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(10,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(11,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(12,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(13,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(14,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(15,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(16,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(17,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(18,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(19,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(20,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(21,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(22,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(23,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(24,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(25,0,'abc','1111','12','bnm,','111asfsadf',NULL,0,'2017-02-03 17:18:14',NULL,NULL),(26,0,'liu378@oki.com','liu378@oki.com','','本文为博主原创文章，未经博主允许不得转载','\r\n\r\n版权声明：本文为博主原创文章，未经博主允许不得转载。\r\n\r\n为了能够在页面上正常显示图片，我们需要把图片放在web项目目录中，那么在上传的路径可以这么来获取：\r\n\r\nString path = ServletActionContext.getServletContext().getRealPath(\"/\")+\"/upload/\";\r\n\r\n第一部分是为了获取项目的根目录，后面跟的是图片存放的目录。这样path = \"D:\\apache-tomcat-6.0.36\\webapps\\ylun/upload/xxx.jpg\";\r\n\r\n个人建议在数据库中存放的是这样的字符串../upload/xx.jpg；\r\n\r\n因为只有这样在页面用img标签给src赋值的时候，才能正常显示出来。\r\n','Butterflypink.ico',0,NULL,'bfc439f6-e1ab-4afc-81c2-2e54d8a114c5.ico',NULL),(27,1,'liu378@oki.com','liu378@oki.com','','struts2处理上传文件路径问题 ','\r\n\r\n版权声明：本文为博主原创文章，未经博主允许不得转载。\r\n\r\n为了能够在页面上正常显示图片，我们需要把图片放在web项目目录中，那么在上传的路径可以这么来获取：\r\n\r\nString path = ServletActionContext.getServletContext().getRealPath(\"/\")+\"/upload/\";\r\n\r\n第一部分是为了获取项目的根目录，后面跟的是图片存放的目录。这样path = \"D:\\apache-tomcat-6.0.36\\webapps\\ylun/upload/xxx.jpg\";\r\n\r\n个人建议在数据库中存放的是这样的字符串../upload/xx.jpg；\r\n\r\n因为只有这样在页面用img标签给src赋值的时候，才能正常显示出来。\r\n',NULL,0,NULL,NULL,NULL),(28,1,'liu378@oki.com','liu378@oki.com','','Struts2中的struts.multipart.saveDir的配置','Struts2中的struts.multipart.saveDir主要是用来设置上传文件的临时存放地址，而这个参数设置方法的不同对应的地址也不同。\r\n\r\n1、如果没有设置struts.multipart.saveDir，那么将默认使用javax.servlet.context.tempdir指定的地址，javax.servlet.context.tempdir的值是由服务器来确定的，例如：假如我的web工程的context是sencha，服务器使用Tomcat，那么savePath就应该是%TOMCAT_HOME%\\work\\Catalina\\localhost\\sencha，临时文件的名称类似于upload__1a156008_1373a8615dd__8000_00000001.tmp，每次上传的临时文件名可能不同，但是大致是这种样式。而且如果是使用Eclipse中的Servers里面配置Tomcat并启动的话，那么上面地址中的%TOMCAT_HOME%将不会是系统中的实际Tomcat根目录，而会是Eclipse给它指定的地址，例如我本地的地址是这样的：E:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\work\\Catalina\\localhost\\sencha\\upload__1a156008_1373a8615dd__8000_00000001.tmp。\r\n\r\n2、如果设置了struts.multipart.saveDir，例如在struts.xml中设置：\r\nXml代码  收藏代码\r\n\r\n    <constant name=\"struts.multipart.saveDir\" value=\"/repository\"/>  \r\n\r\n那么文件存放的地址不会是大家想当然的在web工程的repository目录下，网上有人说在D盘下也就是D:\\repository，但是我没有D盘，我本地的savePath是E:\\repository，所以应该是选取非C盘的第一个逻辑磁盘创建struts.multipart.saveDir指定的文件夹并存放临时文件。\r\n\r\n3、如果设置了struts.multipart.saveDir但是value中并没有\"/\"，就像这样：\r\nXml代码  收藏代码\r\n\r\n    <constant name=\"struts.multipart.saveDir\" value=\"repository\"/>  \r\n\r\n，那么repository文件夹会创建在user.dir位置下，使用Eclipse环境时，user.dir为我本地Eclipse的根目录E:\\Program Files\\Indigo，你可以通过System.getProperty(\"user.dir\")查看，所以savePath就是E:\\Program Files\\Indigo\\repository，在Tomcat下user.dir是Tomcat目录下的bin目录，所以应该是%TOMCAT_HOME%\\bin\\repository。\r\n\r\n4、干脆使用绝对路径，这样就不会有任何问题了，哈哈！ ','cat3.png',0,NULL,'62ed9fd9-bf33-4208-a248-9b718cffad79.png',NULL),(29,1,'liu378@oki.com','liu378@oki.com','','    <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>  ','    <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>      <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>      <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>  ',NULL,0,NULL,NULL,NULL),(30,1,'liu378@oki.com','liu378@oki.com','','    <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>  ','    <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>      <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>      <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>      <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>  ',NULL,0,NULL,NULL,NULL),(31,1,'liu378@oki.com','liu378@oki.com','','    <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>  ','    <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>      <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>  ',NULL,0,NULL,NULL,NULL),(32,1,'liu378@oki.com','liu378@oki.com','','    <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>  ','    <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>      <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>  ',NULL,0,NULL,NULL,NULL),(33,1,'liu378@oki.com','liu378@oki.com','','    <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>  ','    <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>      <constant name=\"struts.custom.i18n.resources\" value=\"fileUpload\"></constant>  ',NULL,0,NULL,NULL,NULL),(34,1,'liu378@oki.com','liu378@oki.com','','var oFalseObject = new Boolean(false);',' <!--定义了WEB应用的名字-->\r\n 4      <display-name></display-name>\r\n 5 \r\n 6      <!--声明WEB应用的描述信息-->\r\n 7      <description></description>\r\n 8 \r\n 9      <!--context-param元素声明应用范围内的初始化参数-->\r\n<context-param></context-param>\r\n\r\n   if (status) {\r\n\r\n    PrintWriter ut =servletresponse.getWriter();\r\n\r\n    out\r\n\r\n    .print(\"alert(\\\"对不起！您输入内容含有非法字符。如：\\\\\\\"\'\\\\\\\".等\\\");\"\r\n\r\n    // +servletrequest.getRequestURL()\r\n\r\n    +\"window.history.go(-1);\");\r\n\r\n    }else\r\n\r\n    arg2.doFilter(request,response);\r\n\r\n    }\r\n\r\n    public void init(FilterConfig config)throws ServletException {\r\n\r\n    if(config.getInitParameter(\"characterParams\").length()<1)\r\n\r\n    K=false;\r\n\r\n    else\r\n\r\n    this.characterParams = config.getInitParameter(\"characterParams\").split(\",\");\r\n\r\n    }\r\n\r\n    }\r\n\r\n\r\nvar oFalseObject = new Boolean(false);\r\nvar bResult = oFalseObject && true;	//输出 true\r\n\r\n',NULL,0,NULL,NULL,NULL),(35,1,'liu378@oki.com','liu378@oki.com','','aaasdfs','asggc\r\nasdf\r\nb\r\nd',NULL,0,NULL,NULL,NULL),(36,1,'liu378@oki.com','liu378@oki.com','','var oFalseObject = new Boolean(false);','public class StringEscapeUtilsTest {  \r\n  \r\n    public static void main(String args[]){  \r\n          \r\n        String sql=\"1\' or \'1\'=\'1\";  \r\n        System.out.println(\"防SQL注入:\"+StringEscapeUtils.escapeSql(sql)); //防SQL注入  \r\n          \r\n        System.out.println(\"转义HTML,注意汉字:\"+StringEscapeUtils.escapeHtml(\"<font>chen磊  xing</font>\"));    //转义HTML,注意汉字  \r\n        System.out.println(\"反转义HTML:\"+StringEscapeUtils.unescapeHtml(\"<font>chen磊  xing</font>\"));  //反转义HTML  \r\n          \r\n        System.out.println(\"转成Unicode编码：\"+StringEscapeUtils.escapeJava(\"陈磊兴\"));     //转义成Unicode编码  \r\n          \r\n        System.out.println(\"转义XML：\"+StringEscapeUtils.escapeXml(\"<name>陈磊兴</name>\"));   //转义xml  \r\n        System.out.println(\"反转义XML：\"+StringEscapeUtils.unescapeXml(\"<name>陈磊兴</name>\"));    //转义xml  \r\n          \r\n    }  \r\n}  \r\n你好啊\r\n',NULL,0,NULL,NULL,NULL),(37,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','[ADMIN-Liumiao-2017]<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<html><div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div></html>\r\n','',1,'2017-02-19 22:45:08','','2017-02-19 17:12:12'),(38,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','[ADMIN-Liumiao-2017]<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<html><div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div></html>\r\n','',1,'2017-02-19 22:45:09','','2017-02-19 17:44:16'),(39,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','[ADMIN-Liumiao-2017]<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<html><div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div></html>\r\n','',1,'2017-02-19 22:45:11','','2017-02-19 17:53:07'),(40,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','This is a email for email set sending test. (中国)\r\n','',1,'2017-02-19 22:45:16','','2017-02-19 22:19:16'),(41,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','[ADMIN-Liumiao-2017]<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<html><div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div></html>\r\n','',1,'2017-02-19 22:49:28','','2017-02-19 17:12:12'),(42,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','[ADMIN-Liumiao-2017]<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<html><div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div></html>\r\n','',1,'2017-02-19 22:49:30','','2017-02-19 17:44:16'),(43,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','[ADMIN-Liumiao-2017]<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<html><div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div></html>\r\n','',1,'2017-02-19 22:49:32','','2017-02-19 17:53:07'),(44,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','This is a email for email set sending test. (中国)\r\n','',1,'2017-02-19 22:49:33','','2017-02-19 22:19:16'),(45,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div>\r\n','20150405110811359_easyicon_net_16.2117202268.png',1,'2017-02-19 22:49:34','16e3c374-7be6-41a5-a6e9-58f8466decf0.png','2017-02-19 22:48:35'),(46,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','[ADMIN-Liumiao-2017]<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<html><div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div></html>\r\n','',1,'2017-02-19 22:52:20','','2017-02-19 17:12:12'),(47,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','[ADMIN-Liumiao-2017]<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<html><div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div></html>\r\n','',1,'2017-02-19 22:52:22','','2017-02-19 17:44:16'),(48,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','[ADMIN-Liumiao-2017]<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<html><div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div></html>\r\n','',1,'2017-02-19 22:52:24','','2017-02-19 17:53:07'),(49,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','This is a email for email set sending test. (中国)\r\n','',1,'2017-02-19 22:52:27','','2017-02-19 22:19:16'),(50,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div>\r\n','20150405110811359_easyicon_net_16.2117202268.png',1,'2017-02-19 22:52:29','9f97a5a6-8fc4-4651-b206-c35703709db5.png','2017-02-19 22:48:35'),(51,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div>\r\n','Picture_01_Shark.jpg',1,'2017-02-19 23:00:20','905f885a-1726-4b4d-b257-3bdf4fe19df8.jpg','2017-02-19 22:55:11'),(52,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','&lt;div style=\'color:red; font-weight:bold; font-size:30px;\'&gt;This is a email for email set sending test. (�й�)&lt;/div&gt;\r\n','Picture_04_Lake.jpg',1,'2017-02-19 23:03:58','3890f700-13db-473c-a8ed-8d78e9d08e95.jpg','2017-02-19 23:03:07'),(53,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (�й�)</div>\r\n','Picture_04_Lake.jpg',1,'2017-02-19 23:06:27','24863847-848c-4c2e-ab71-544442916fa6.jpg','2017-02-19 23:05:58'),(54,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (�й�)</div>\r\n','Picture_12_Leopard.jpg',1,'2017-02-19 23:06:33','4264ea8f-b5f1-4632-a722-17de26088ee0.jpg','2017-02-19 23:06:03'),(55,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (�й�)</div>\r\n','crystal2.png',1,'2017-02-19 23:07:26','458d95e7-39ca-4071-94e0-695494651ec6.png','2017-02-19 23:07:18'),(56,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div>\r\n','aurora1.jpg',1,'2017-02-19 23:08:31','b3f449f9-7392-4d2d-ab3c-889696c66b42.jpg','2017-02-19 23:08:19'),(57,0,'T1<ekinap@126.com>','<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div>\r\n','image324.gif',1,'2017-02-19 23:15:39','e0c338b5-4934-434f-9134-3eb29a81e85d.gif','2017-02-19 23:15:07'),(58,1,'merrick80@sina.com','merrick80@sina.com','','zheshiyige test mail','<strong>hello</strong>','Penguins.jpg',0,NULL,'12491925-c12b-47c4-adfa-434658c362dc.jpg',NULL),(59,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','merrick80@sina.com<merrick80@sina.com>','','zheshiyige test mail','&lt;strong&gt;hello&lt;\\/strong&gt;\r\n','Penguins.jpg',1,'2017-02-19 23:27:12','87d5f299-ddb9-4fe9-b067-1a59ddeb7a24.jpg','2017-02-19 23:26:34'),(60,1,'merrick80@sina.com','merrick80@sina.com','','测试一下HTML转义','&lt;div&nbsp;style=&quot;color:red;&quot;&gt;hava&nbsp;a&nbsp;good&nbsp;time,&nbsp;年轻人&lt;/div&gt;',NULL,0,NULL,NULL,NULL),(61,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','merrick80@sina.com<merrick80@sina.com>','','测试一下HTML转义','\\\"&amp;lt;div&amp;nbsp;style=&amp;quot;color:red;&amp;quot;&amp;gt;hava&amp;nbsp;a&amp;nbsp;good&amp;nbsp;time,&amp;nbsp;\\u5E74\\u8F7B\\u4EBA&amp;lt;\\/div&amp;gt;\\\"\r\n','',1,'2017-02-19 23:32:34','','2017-02-19 23:31:56'),(62,1,'merrick80@sina.com','merrick80@sina.com','','测试2','&lt;div&nbsp;style=&quot;color:red;&quot;&gt;测试颜色&lt;/div&gt;',NULL,0,NULL,NULL,NULL),(63,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','merrick80@sina.com<merrick80@sina.com>','','测试2','&lt;div&nbsp;style=&quot;color:red;&quot;&gt;测试颜色&lt;/div&gt;\r\n','',1,'2017-02-19 23:35:48','','2017-02-19 23:35:33'),(64,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','[ADMIN-Liumiao-2017]<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<html><div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div></html>\r\n','',1,'2017-02-24 10:23:18','','2017-02-24 10:23:07'),(65,1,'merrick80@sina.com','liu378@oki.com','','hava a rest','单线程JavaScript<br>最近在阅读《你不知道的JavaScript中卷》，当我看到第二部分介绍异步和回调函数的一些知识时，由于该书在第二部分1、2章对线程、事件循环的概念介绍的并非详细，因此引发了我的一系列思考。于是写下这篇小文章，记录自己对该知识点的学习和思考。<br><br>什么是线程<br><br>由于JavaScript是单线程语言，因此，在一个进程上，只能运行一个线程，而不能多个线程同时运行。也就是说JavaScript不允许多个线程共享内存空间。因此，如果有多个线程想同时运行，则需采取排队的方式，即只有当前一个线程执行完毕，后一个线程才开始执行。JavaScript中的线程包括函数调用、I/O设备（如向服务器发送请求获取响应等）、定时器、用户操作的事件（click、keyup、scroll等）。<br><br>由于每个线程需要排队执行，因此涉及堆（Heap）、栈（Stack）、队列（Queue）的概念。<br><br>Heap、Stack、Queue<br><br>在MDN上的一篇文章《并发模型与Event&nbsp;Loop》，介绍了关于这三个概念<br><br>堆（Heap）：对象被分配在一个堆中，一个用以表示一个内存中未被组织的区域。我们知道，函数是第一等对象，同时函数是“可调用的对象”。因此，当函数在被调用之前，JavaScript引擎会对函数进行编译（词法分析、语法分析、代码生成）的工作。当完成编译时会将函数（这里不限于函数，JavaScript所有皆为对象，除了undefined、null）放入堆中，分配内存空间，等待执行或调用。','cat3.png',0,NULL,'879d526d-45e9-4a3d-ad69-02899aae9cff.png',NULL),(66,0,'刘淼<liu378@oki.com>','\'[ADMIN-Liumiao-2017]\'<merrick80@sina.com>','','答复: hava a rest','received\r\n\r\n \r\n\r\n发件人: [ADMIN-Liumiao-2017] [mailto:merrick80@sina.com] \r\n发送时间: 2017年2月24日 10:25\r\n收件人: liu378@oki.com\r\n主题: hava a rest\r\n\r\n \r\n\r\n单线程JavaScript\r\n最近在阅读《你不知道的JavaScript中卷》，当我看到第二部分介绍异步和回调函数的一些知识时，由于该书在第二部分1、2章对线程、事件循环的概念介绍的并非详细，因此引发了我的一系列思考。于是写下这篇小文章，记录自己对该知识点的学习和思考。\r\n\r\n什么是线程\r\n\r\n由于JavaScript是单线程语言，因此，在一个进程上，只能运行一个线程，而不能多个线程同时运行。也就是说JavaScript不允许多个线程共享内存空间。因此，如果有多个线程想同时运行，则需采取排队的方式，即只有当前一个线程执行完毕，后一个线程才开始执行。JavaScript中的线程包括函数调用、I/O设备（如向服务器发送请求获取响应等）、定时器、用户操作的事件（click、keyup、scroll等）。\r\n\r\n由于每个线程需要排队执行，因此涉及堆（Heap）、栈（Stack）、队列（Queue）的概念。\r\n\r\nHeap、Stack、Queue\r\n\r\n在MDN上的一篇文章《并发模型与Event Loop》，介绍了关于这三个概念\r\n\r\n堆（Heap）：对象被分配在一个堆中，一个用以表示一个内存中未被组织的区域。我们知道，函数是第一等对象，同时函数是“可调用的对象”。因此，当函数在被调用之前，JavaScript引擎会对函数进行编译（词法分析、语法分析、代码生成）的工作。当完成编译时会将函数（这里不限于函数，JavaScript所有皆为对象，除了undefined、null）放入堆中，分配内存空间，等待执行或调用。\r\n<html xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" xmlns:m=\"http://schemas.microsoft.com/office/2004/12/omml\" xmlns=\"http://www.w3.org/TR/REC-html40\">\r\n\r\n<head>\r\n<meta http-equiv=Content-Type content=\"text/html; charset=utf-8\">\r\n<meta name=Generator content=\"Microsoft Word 12 (filtered medium)\">\r\n<style>\r\n<!--\r\n /* Font Definitions */\r\n @font-face\r\n	{font-family:宋体;\r\n	panose-1:2 1 6 0 3 1 1 1 1 1;}\r\n@font-face\r\n	{font-family:黑体;\r\n	panose-1:2 1 6 9 6 1 1 1 1 1;}\r\n@font-face\r\n	{font-family:\"Cambria Math\";\r\n	panose-1:2 4 5 3 5 4 6 3 2 4;}\r\n@font-face\r\n	{font-family:Calibri;\r\n	panose-1:2 15 5 2 2 2 4 3 2 4;}\r\n@font-face\r\n	{font-family:\"\\@宋体\";\r\n	panose-1:2 1 6 0 3 1 1 1 1 1;}\r\n@font-face\r\n	{font-family:\"\\@黑体\";\r\n	panose-1:2 1 6 9 6 1 1 1 1 1;}\r\n /* Style Definitions */\r\n p.MsoNormal, li.MsoNormal, div.MsoNormal\r\n	{margin:0cm;\r\n	margin-bottom:.0001pt;\r\n	font-size:12.0pt;\r\n	font-family:宋体;}\r\na:link, span.MsoHyperlink\r\n	{mso-style-priority:99;\r\n	color:blue;\r\n	text-decoration:underline;}\r\na:visited, span.MsoHyperlinkFollowed\r\n	{mso-style-priority:99;\r\n	color:purple;\r\n	text-decoration:underline;}\r\nspan.EmailStyle17\r\n	{mso-style-type:personal-reply;\r\n	font-family:\"Calibri\",\"sans-serif\";\r\n	color:#002060;}\r\n.MsoChpDefault\r\n	{mso-style-type:export-only;}\r\n@page Section1\r\n	{size:612.0pt 792.0pt;\r\n	margin:72.0pt 90.0pt 72.0pt 90.0pt;}\r\ndiv.Section1\r\n	{page:Section1;}\r\n-->\r\n</style>\r\n<!--[if gte mso 9]><xml>\r\n <o:shapedefaults v:ext=\"edit\" spidmax=\"1026\" />\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <o:shapelayout v:ext=\"edit\">\r\n  <o:idmap v:ext=\"edit\" data=\"1\" />\r\n </o:shapelayout></xml><![endif]-->\r\n</head>\r\n\r\n<body lang=ZH-CN link=blue vlink=purple>\r\n\r\n<div class=Section1>\r\n\r\n<p class=MsoNormal><span lang=EN-US style=\'font-size:10.5pt;font-family:\"Calibri\",\"sans-serif\";\r\ncolor:#002060\'>received<o:p></o:p></span></p>\r\n\r\n<p class=MsoNormal><span lang=EN-US style=\'font-size:10.5pt;font-family:\"Calibri\",\"sans-serif\";\r\ncolor:#002060\'><o:p>&nbsp;</o:p></span></p>\r\n\r\n<div style=\'border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm\'>\r\n\r\n<p class=MsoNormal><b><span style=\'font-size:10.0pt\'>发件人<span lang=EN-US>:</span></span></b><span\r\nlang=EN-US style=\'font-size:10.0pt\'> [ADMIN-Liumiao-2017]\r\n[mailto:merrick80@sina.com] <br>\r\n</span><b><span style=\'font-size:10.0pt\'>发送时间<span lang=EN-US>:</span></span></b><span\r\nlang=EN-US style=\'font-size:10.0pt\'> 2017</span><span style=\'font-size:10.0pt\'>年<span\r\nlang=EN-US>2</span>月<span lang=EN-US>24</span>日<span lang=EN-US> 10:25<br>\r\n</span><b>收件人<span lang=EN-US>:</span></b><span lang=EN-US> liu378@oki.com<br>\r\n</span><b>主题<span lang=EN-US>:</span></b><span lang=EN-US> hava a rest<o:p></o:p></span></span></p>\r\n\r\n</div>\r\n\r\n<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>\r\n\r\n<p class=MsoNormal>单线程<span lang=EN-US>JavaScript<br>\r\n</span>最近在阅读《你不知道的<span lang=EN-US>JavaScript</span>中卷》，当我看到第二部分介绍异步和回调函数的一些知识时，由于该书在第二部分<span\r\nlang=EN-US>1</span>、<span lang=EN-US>2</span>章对线程、事件循环的概念介绍的并非详细，因此引发了我的一系列思考。于是写下这篇小文章，记录自己对该知识点的学习和思考。<span\r\nlang=EN-US><br>\r\n<br>\r\n</span>什么是线程<span lang=EN-US><br>\r\n<br>\r\n</span>由于<span lang=EN-US>JavaScript</span>是单线程语言，因此，在一个进程上，只能运行一个线程，而不能多个线程同时运行。也就是说<span\r\nlang=EN-US>JavaScript</span>不允许多个线程共享内存空间。因此，如果有多个线程想同时运行，则需采取排队的方式，即只有当前一个线程执行完毕，后一个线程才开始执行。<span\r\nlang=EN-US>JavaScript</span>中的线程包括函数调用、<span lang=EN-US>I/O</span>设备（如向服务器发送请求获取响应等）、定时器、用户操作的事件（<span\r\nlang=EN-US>click</span>、<span lang=EN-US>keyup</span>、<span lang=EN-US>scroll</span>等）。<span\r\nlang=EN-US><br>\r\n<br>\r\n</span>由于每个线程需要排队执行，因此涉及堆（<span lang=EN-US>Heap</span>）、栈（<span lang=EN-US>Stack</span>）、队列（<span\r\nlang=EN-US>Queue</span>）的概念。<span lang=EN-US><br>\r\n<br>\r\nHeap</span>、<span lang=EN-US>Stack</span>、<span lang=EN-US>Queue<br>\r\n<br>\r\n</span>在<span lang=EN-US>MDN</span>上的一篇文章《并发模型与<span lang=EN-US>Event&nbsp;Loop</span>》，介绍了关于这三个概念<span\r\nlang=EN-US><br>\r\n<br>\r\n</span>堆（<span lang=EN-US>Heap</span>）：对象被分配在一个堆中，一个用以表示一个内存中未被组织的区域。我们知道，函数是第一等对象，同时函数是<span\r\nlang=EN-US>“</span>可调用的对象<span lang=EN-US>”</span>。因此，当函数在被调用之前，<span\r\nlang=EN-US>JavaScript</span>引擎会对函数进行编译（词法分析、语法分析、代码生成）的工作。当完成编译时会将函数（这里不限于函数，<span\r\nlang=EN-US>JavaScript</span>所有皆为对象，除了<span lang=EN-US>undefined</span>、<span\r\nlang=EN-US>null</span>）放入堆中，分配内存空间，等待执行或调用。<span lang=EN-US><o:p></o:p></span></p>\r\n\r\n</div>\r\n\r\n</body>\r\n\r\n</html>\r\n','',1,'2017-02-24 10:28:12','','2017-02-24 10:27:39'),(67,1,'merrick80@sina.com','liu378@oki.com','','hava a attach','同步任务取决于函数的调用位置，不同的调用位置，进入执行栈的位置就不同，主线程执行的顺序就不同<br><br>异步任务的执行与函数的调用位置无关，只取决于执行栈的任务数量，当同步任务执行完毕之后，才会开始执行异步任务，并且遵循先进入任务队列的事件先执行的原则。','Butterflypink.ico',0,NULL,'43d10e50-1a2b-4f58-9c50-c4ff3de7e7f8.ico',NULL),(68,1,'merrick80@sina.com','merrick80@sina.com','','hava tea','have&nbsp;te','coffee.jpg',0,NULL,'89068af8-57ce-4ee8-8d90-043d576dfc3c.jpg',NULL),(69,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','merrick80@sina.com<merrick80@sina.com>','','hava tea','have&nbsp;te\r\n','coffee.jpg',1,'2017-02-24 13:00:25','6dddf8fb-ccd2-49a2-bbbb-f67beeebd5b8.jpg','2017-02-24 12:59:20'),(70,1,'merrick80@sina.com','merrick80@sina.com','','hava a tea','hava&nbsp;a&nbsp;tea','cat3.png',0,NULL,'403fa97d-6845-4390-9e15-6d1c8a2fd8c3.png',NULL),(71,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','merrick80@sina.com<merrick80@sina.com>','','hava a tea','hava&nbsp;a&nbsp;tea\r\n','cat3.png',1,'2017-02-24 13:04:57','1e0ef62f-5c5c-43b0-9174-a1408265a729.png','2017-02-24 13:04:46'),(72,1,'merrick80@sina.com','merrick80@sina.com','merrick80@sina.com','butt','have&nbsp;butter','Butterflypink.ico',0,NULL,'35aea90b-96ab-401b-aa0f-80a2badffdb5.ico',NULL),(73,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','merrick80@sina.com<merrick80@sina.com>','merrick80@sina.com<merrick80@sina.com>','butt','have&nbsp;butter\r\n','Butterflypink.ico',1,'2017-02-24 13:51:55','d8f308b2-f7d5-40df-bd72-86223d6065ec.ico','2017-02-24 13:51:41'),(74,1,'merrick80@sina.com','merrick80@sina.com','','hava a com','eating','baozi2.png',0,NULL,'928a9994-81a5-4683-b6c6-eeb152a37a6e.png',NULL),(75,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','[ADMIN-Liumiao-2017]<merrick80@sina.com>','','CZJPCOMS EMAIL CLIENT TESTING','<html><div style=\'color:red; font-weight:bold; font-size:30px;\'>This is a email for email set sending test. (中国)</div></html>\r\n','',1,'2017-02-28 13:40:30','','2017-02-28 13:39:32'),(76,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','merrick80@sina.com<merrick80@sina.com>','','hava a com','eating\r\n','baozi2.png',1,'2017-02-28 13:40:31','3717b26a-e652-462d-8fc0-864360314abd.png','2017-02-28 13:40:18'),(77,1,'merrick80@sina.com','merrick80@sina.com','','aaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaa',NULL,0,NULL,NULL,NULL),(78,1,'merrick80@sina.com','merrick80@sina.com','merrick80@sina.com','aaaaaaaaaaaaa','aaaaaaaaaaaaa',NULL,0,NULL,NULL,NULL),(79,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','merrick80@sina.com<merrick80@sina.com>','','aaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaa\r\n','',1,'2017-02-28 14:16:49','','2017-02-28 14:16:20'),(80,0,'[ADMIN-Liumiao-2017]<merrick80@sina.com>','merrick80@sina.com<merrick80@sina.com>','merrick80@sina.com<merrick80@sina.com>','aaaaaaaaaaaaa','aaaaaaaaaaaaa\r\n','',1,'2017-02-28 14:16:49','','2017-02-28 14:16:43'),(81,1,'merrick80@sina.com','merrick80@sina.com','','aaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaa',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `maildetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `dtype` varchar(16) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`,`dtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('001','日系独資企業','COMFORM',NULL,NULL),('001','機械','COMPROFESS',NULL,NULL),('001','smtp','EMAILSET',NULL,NULL),('002','合弁企業','COMFORM',NULL,NULL),('002','機械部品','COMPROFESS',NULL,NULL),('002','smtp.sina.com','EMAILSET',NULL,NULL),('003','中華系企業','COMFORM',NULL,NULL),('003','電気','COMPROFESS',NULL,NULL),('003','25','EMAILSET',NULL,NULL),('004','常州以外','COMFORM',NULL,NULL),('004','電気部品','COMPROFESS',NULL,NULL),('004','1','EMAILSET',NULL,NULL),('005','その他','COMFORM',NULL,NULL),('005','製造その他','COMPROFESS',NULL,NULL),('005','0','EMAILSET',NULL,NULL),('006','服飾雑貨','COMPROFESS',NULL,NULL),('006','','EMAILSET',NULL,NULL),('007','貿易','COMPROFESS',NULL,NULL),('007','merrick80@sina.com','EMAILSET',NULL,NULL),('008','運輸','COMPROFESS',NULL,NULL),('008','merrick80@sina.com','EMAILSET',NULL,NULL),('009','飲食','COMPROFESS',NULL,NULL),('009','miao12345','EMAILSET',NULL,NULL),('010','サービス','COMPROFESS',NULL,NULL),('010','[ADMIN-Liumiao-2017]','EMAILSET',NULL,NULL),('011','pop3','EMAILSET',NULL,NULL),('012','0','EMAILSET',NULL,NULL),('013','pop.sina.com','EMAILSET',NULL,NULL),('014','110','EMAILSET',NULL,NULL),('015','0','EMAILSET',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteuser`
--

DROP TABLE IF EXISTS `siteuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteuser`
--

LOCK TABLES `siteuser` WRITE;
/*!40000 ALTER TABLE `siteuser` DISABLE KEYS */;
INSERT INTO `siteuser` VALUES ('a','老AAAAAAAAAAAAA','b1111',1,'1972-01-12','aaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',1,NULL,NULL),('abc','abc','abc',1,NULL,'','','',0,NULL,NULL),('admin','管理员','123',1,NULL,NULL,NULL,NULL,0,NULL,'2017-03-01 13:05:51'),('ax','ax','ax',1,NULL,'','','',1,NULL,NULL),('bx','bx','bx',1,'1972-02-24','','','',1,NULL,NULL),('u5','油五','u5',0,'1972-01-23','aaaa','111','112341',1,NULL,'2017-02-28 16:32:26'),('user1','Apache2','user1',0,'2007-01-19','a@A.A','1234567','hi',1,NULL,NULL),('user2','tom1111','user2',0,'2009-02-02','b@b.c111','1356662222','hello31',1,NULL,NULL),('xxx','x12112','',1,'1972-02-03','','','1',1,NULL,NULL);
/*!40000 ALTER TABLE `siteuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tonggao`
--

DROP TABLE IF EXISTS `tonggao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tonggao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type2` varchar(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pubday` date NOT NULL,
  `content` text NOT NULL,
  `ispub` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `type2` (`type2`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tonggao`
--

LOCK TABLES `tonggao` WRITE;
/*!40000 ALTER TABLE `tonggao` DISABLE KEYS */;
INSERT INTO `tonggao` VALUES (3,'2','OKI ABC','2017-01-24','oki','1'),(13,'1','2016年度セミナ・年末懇親会開催 ','2017-01-20','asdf','1'),(14,'1','上海領事館よりお知らせ','2017-01-12','asdf','1'),(15,'1','新規加入企業紹介','2017-02-01','xxxx','1'),(18,'1','日本料理　富士山冬の鍋祭りフェアー ','2017-02-01',' 比尔盖茨2016好书推荐\r\n\r\n      土豪直接看视频，视频下方是对推荐书籍的详细文字介绍。假期快结束了，看看盖叔去年读了什么书（比尔盖茨2015年好书推荐请点击），顺便把前年想读去年还没读的书一起补上。新的一年，各位心想事成~\r\n\r\n1String Theory\r\n\r\n1\r\n\r\n      这是一本网球题材的书，作者（已故，原因自己查）为大卫·福斯特·华莱士（DavidFoster Wallace），纽约时报评价他为“有史以来，网球题材的最佳作者”。\r\n\r\n      本书摘选了他最优秀的五篇文章，形成了这本随笔集。在文中，作者以竞争对手或网球爱好者的视野，以他诙谐、讥嘲、繁复、热闹的笔调描述了网球这一挚爱运动，比如罗杰费德勒这样的世界级天才；对崔西·奥斯丁（前世界冠军）回忆录的深刻剖析；作为一个极为自律的运动员，迈克尔·乔伊（莎娃的教练）在命运面前的艺术性抉择；抵制美网的商业化侵蚀；回忆自己的网球职业，自认为自己差不多是一个伟大的初级网球手。\r\n\r\n      盖茨笑称“如果你在火车或飞机上读这本书，别人会觉得你超级聪明，实际上这本书跟物理没有半毛钱关系”。\r\n\r\n2Shoe Dog\r\n\r\n2\r\n\r\n      目前可以买到中文版，作者是Nike的创始人兼CEO菲尔·耐特（Phil Knight）。这是一本坦诚的，引人入胜的回忆录，耐特第一次和大家分享了公司早期那些不为人知的故事：一个无所畏惧的初创公司，如何通过自身的进化，成为全球最具标志性，颠覆性和盈利品牌之一。我们看一下美亚对本书简介：\r\n\r\n      1962年，菲尔·耐特刚刚从商学院毕业，揣着从父亲那借来的50美元创建了这家公司，当时想法很单纯：进口日本高品质，低成本的运动鞋。菲尔·耐特把鞋放在那辆石灰绿轿车的后备箱里兜售，以这样的方式，第一年赚了八千美元。现在，Nike每年的销售额是三百亿，俨然成为初创公司的标杆。勾号（swoosh）商标也无人不晓，成为当今世界最具革命性，最独一无二的标志之一。但商标背后的男人一直很神秘。现在，耐特首次以回忆录的形式，从那些关键时刻开始，坦白，谦虚，无畏，诙谐的讲述他的故事。当年，二十四岁的他完成徒步环游世界，决定选择一条不同寻常的道路来创建自己的商业。他和梦想之间，不只是成功的喜悦，还要承担很多风险和令人沮丧的挫折，耐特会在本书中细细道来。文中谈到他和早期搭档相识的过程，一群不合时宜的乌合之众最后亲如兄弟，在共同使命的感召下，凭借对体育精神的笃定，最终创造了Nike这个品牌。\r\n\r\n3The Myth of the Strong Leader\r\n\r\n3\r\n\r\n      作者是牛津大学著名政治学教授阿奇布朗（Archie Brown），本书主要讨论政治领导力。通常领导力会陷入到一个两难的极端分化：强弱之争。不过还是能找到很多卓有成效的办法来施展政治领导力，反之亦是如此。我们责备政客要为经济衰退买单时，又会称赞他推动了重要的社会改革。很少有人反思，究竟是什么特质让有些领导人一帆风顺，而其他领导人却举步维艰呢？作者调查百年来的浩瀚资料，完成了这部权威著作，反驳了一个常识：只有强有力的领导者能够支配幕僚，影响政策制定过程，因此更容易成功并受人尊重。\r\n\r\n      布朗广泛阐述了二十世纪政治家们的功过得失。比如像罗斯福，林登·约翰逊（第三十六任美国总统），撒切尔这类重新定义领导力的人物，或者像戴高乐，戈尔巴乔夫，曼德拉这类政权交替的领导者，文中描述了他们如何在任期内以政治方式达成可行性的极限，通过这些内容，布朗挑战了我们的对政权有效性和政治力量的常规看法。尽管我们认为学院风格过于懦弱，不待见这类领导力，但往往这类领袖更有协作能力，从而具有显著的影响力。布朗的总结新颖而富有启发，颠覆了很多传统观念，让我们重新评估那些塑造这个世界的领导者，并重新考虑和判断那些未来将要领导我们的人。\r\n\r\n4The Grid：The Fraying Wires Between American\r\n\r\n4\r\n\r\n      本书作者是人类文化学家格雷琴 巴克（Gretchen Bakke），电网作为二十世纪工程界的标志性成果，很难满足当今时代的需求。这不仅仅是电网老旧和基础设施维护的问题。随着我们对新能源（太阳能，风能等）的巨大期望，在通往能源未来的大道上，电网成了最大的阻碍。如果我们想要实现这个未来，我们需要根据二十一世界的价值观重新设计电网。这是一个浩瀚工程，需要多方面的努力，目前而言，这些努力并不显著，但革新已经有条不紊的开始了。\r\n\r\n      作者多方面的介绍了美国能源基础结构，电网高峰期和平稳时刻，以及它对个人和国家生活的重要作用。她认为电网是美国一项重要的人工产品，它伴随我们的成长，有一些天才科技和恒定的即兴创作，偶尔夹杂了一些异想天开的愿景，是粗放扩张下的产物。她阐述了当代美国改造电网的详情，有时需要进取心和伟大的梦想，有时是立法甚至武力示威。本文有趣而富有洞察力，将电网比喻为世界上最大的机器：它迷人的历史，如今的问题，以及光明的未来和潜在的作用。\r\n\r\n5The Gene：: An Intimate History\r\n\r\n5\r\n\r\n      本书作者是普利策奖得主，畅销书作家穆克吉（Siddhartha Mukherjee），本书介绍了基因的壮丽历史，对一个来自未来的问题给出了自己的答案：当我们掌握了读写（编辑）自己基因信息时，如何定义人类呢？\r\n\r\n      穆克吉认为基因是灵巧的，杰出的，富有启发性的，通过科学，社会历史以及个人叙述的穿插，告诉我们基因这个现代历史中最重要的概念突破之一。本书介绍了人类对遗传的探索，以及它对我们生活，个性，身份，命运，抉择的惊人影响。他描述了人类在上百年间对遗传的研究和实验，从亚里士多德，毕达哥拉斯到孟德尔，达尔文，从博韦里，摩根到克里克，沃森，富兰克林，全方位的展现了这些二十一世纪的创新者革命性的完成人类基因组的过程。一位纽约客评价，对一个普通读者而言，很难想象市面上会有如此多的科普读物，不仅能够涵盖现代科技的所有领域，而且浅显易懂又充满激情，这是一个了不起的成就。对任何人而言，基因知识都是必须要了解的，因为这牵扯到对未来人性的定义，是这个时代科学界最重要的部分。所以，不妨来听一听大师的观点。\r\n\r\n公众号\r\n好想被风刮走 刮遍整个地球的那种 在我爱的城市停 走 停 走','1'),(19,'1','JETROセミナー参加','2017-02-01','yyyy','1');
/*!40000 ALTER TABLE `tonggao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vipcoms`
--

DROP TABLE IF EXISTS `vipcoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vipcoms`
--

LOCK TABLES `vipcoms` WRITE;
/*!40000 ALTER TABLE `vipcoms` DISABLE KEYS */;
INSERT INTO `vipcoms` VALUES ('0003','NN1','004','abc1','','','','','','111','','003',1488245131127,1,'6e890377-706a-4dd9-956f-7b2afc8f657b.ico','Calculator.ico'),('0005','好吃常来美食馆','009','快餐','','','','','','非常美味营养','','003',1488158445195,3,'fee95544-a9cd-492d-8f78-213c6a11b58f.png','xxxxxxxmilk1.png'),('aaa','某某公司','001','aaa','','常州市中吴大道1号','a','AA@BB.CC','https://www.baidu.com','a<p style=\"color:red;\">ABC</p>','a','003',1488350879479,3,'bed949c9-e0f3-456b-b6b4-9aaa960b71a0.ico','a call from a client.ico'),('ggg','ggg','001','gggf','','','','','','','','001',1488268000883,1,'6c37f3d5-c382-45d6-8e3e-2948e4c1ccf0.png','baozi2.png'),('S001','XXX公司','001','','','','','','','2<em>红色</em>','1','001',1488245234331,2,'ac0dd095-f94f-4209-a87b-fae60bd92e67.gif','input1.gif'),('X001','XXXYS','006','YUNS','0000001','CZ','','A@B','WWW.WWW.COM','1112343425		11231		<strong>***</strong>	','159','002',1488245058626,1,'ec3669f2-4dab-4303-9468-905ae3910baf.png','cat1.png');
/*!40000 ALTER TABLE `vipcoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vipcomstaff`
--

DROP TABLE IF EXISTS `vipcomstaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vipcomstaff`
--

LOCK TABLES `vipcomstaff` WRITE;
/*!40000 ALTER TABLE `vipcomstaff` DISABLE KEYS */;
INSERT INTO `vipcomstaff` VALUES (2,'木村 匡伸','嘎嘎嘎嘎',NULL,'S001',1,NULL,NULL,NULL,NULL),(3,'X2','X3','X4','S001',0,'X5','X6','X7','X8'),(5,'exxxxxxxxxxxxx aaaaaaaaaaaaaaaaa','e','e','X001',0,'e','e','e','e'),(7,'大厨12','','','0005',1,'','','',''),(8,'bbb','','','0003',1,'','','','');
/*!40000 ALTER TABLE `vipcomstaff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-02 11:19:06
