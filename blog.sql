/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-28 23:32:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `admin_auth`;
CREATE TABLE `admin_auth` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_auth
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `sex` enum('0','1') DEFAULT NULL COMMENT '1男0女',
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role_id` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('66', 'yetong', '46f30cde848a4ada165205475015cf78', '1', '15175807379', 'furhacker@163.com', null);
INSERT INTO `admin_user` VALUES ('67', 'yetong', '46f30cde848a4ada165205475015cf78', null, null, null, null);
INSERT INTO `admin_user` VALUES ('68', 'yetong', '46f30cde848a4ada165205475015cf78', null, null, null, null);
INSERT INTO `admin_user` VALUES ('69', 'yetong', '46f30cde848a4ada165205475015cf78', '1', null, null, null);
INSERT INTO `admin_user` VALUES ('70', 'yetong', '46f30cde848a4ada165205475015cf78', '1', null, null, null);

-- ----------------------------
-- Table structure for auth_local
-- ----------------------------
DROP TABLE IF EXISTS `auth_local`;
CREATE TABLE `auth_local` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_local
-- ----------------------------

-- ----------------------------
-- Table structure for auth_qq
-- ----------------------------
DROP TABLE IF EXISTS `auth_qq`;
CREATE TABLE `auth_qq` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_qq
-- ----------------------------

-- ----------------------------
-- Table structure for auth_sina
-- ----------------------------
DROP TABLE IF EXISTS `auth_sina`;
CREATE TABLE `auth_sina` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_sina
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` tinyint(3) unsigned DEFAULT NULL COMMENT '文章分类id',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `desc` varchar(200) DEFAULT NULL COMMENT '文章简略描述',
  `img` varchar(200) DEFAULT NULL COMMENT '展示图',
  `content` text COMMENT '文章详情',
  `status` enum('1','-1','0') NOT NULL DEFAULT '0' COMMENT '文章状态(-1删除,0待审核,1发布中)',
  `recommend` enum('off','on') DEFAULT 'off' COMMENT '是否推荐/置顶',
  `author` varchar(20) NOT NULL DEFAULT 'Mr.Ye.' COMMENT '作者',
  `click` int(10) unsigned DEFAULT NULL COMMENT '浏览量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`,`gmt_create`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('1', '1', '第一篇', '第一篇概述', null, null, '1', 'on', 'Mr.Ye.', null, '2017-11-15 15:21:05', null);
INSERT INTO `blog_article` VALUES ('2', '2', '第二篇', '第二篇概述', null, null, '-1', 'off', 'Mr.Ye.', null, '2017-11-15 15:21:52', null);
INSERT INTO `blog_article` VALUES ('22', '1', '第3篇', '第3篇概述', null, null, '1', 'off', 'Mr.Ye.', null, '2017-11-22 21:08:16', null);
INSERT INTO `blog_article` VALUES ('24', '2', '第4篇', '第4篇概述', null, '<p>的反对非法的<br/></p>', '0', 'off', 'Mr.Ye.', null, '2017-11-25 16:23:31', null);
INSERT INTO `blog_article` VALUES ('25', '1', '第5篇', '第5篇概述', null, '<p><span style=\"background-color: rgb(255, 255, 0); font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">php中</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">取得当前的Unix时间戳</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">UNIX 时间戳（英文叫做：timestamp）是 PHP 中关于时间与日期的一个很重要的概念，它表示从 1970年1月1日 00:00:00 到当前时间的秒数之和。</span></p><p><span style=\"background-color: rgb(255, 255, 0); font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">PHP提供了内置函数 time() 来取得服务器当前时间的时间戳。</span><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">那么获取当前的UNIX时间戳就很简单了。</span></p><p><span style=\"background-color: rgb(255, 255, 0); font-size: 13px; font-family: Monaco; color: rgb(255, 0, 0);\">$time = </span><span style=\"background-color: rgb(255, 255, 0); font-size: 13px; font-family: Monaco; font-weight: bold;\">time()</span><span style=\"background-color: rgb(255, 255, 0); font-size: 13px; font-family: Monaco;\">;</span><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">echo $time;//1396193923，这个数字表示从1970年1月1日 00:00:00 到我输出这个脚本时经历了1396193923秒</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">取得当前的日期</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">php内置了date()函数，来取得当前的日期。</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">函数说明：date(时间戳的格式, 规定时间戳【默认是当前的日期和时间，可选】)</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">返回值：函数日期和时间</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: Monaco; color: rgb(20, 25, 30);\">//date函数，第二个参数取默认值的情况</span><span style=\"background-color: rgb(216, 216, 216); font-family: Monaco; color: rgb(20, 25, 30);\">echo date(&quot;Y-m-d&quot;);//2014-03-30</span><span style=\"background-color: rgb(255, 255, 255); font-family: Monaco; color: rgb(20, 25, 30);\">//date函数，第二个参数有值的情况</span><span style=\"background-color: rgb(216, 216, 216); font-family: Monaco; color: rgb(20, 25, 30);\">echo date(&quot;Y-m-d&quot;,&#39;1396193923&#39;);//2014-03-30,1396193923表示2014-03-30的unix时间戳</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">取得日期的Unix时间戳</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">UNIX 时间戳（英文叫做：timestamp）是 PHP 中关于时间与日期的一个很重要的概念，它表示从 1970年1月1日 00:00:00 到当前时间的秒数之和。</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">PHP提供了内置函数strtotime实现功能：获取某个日期的时间戳，或获取某个时间的时间戳。例如：</span></p><p><span style=\"background-color: rgb(191, 191, 191); font-family: Monaco; color: rgb(20, 25, 30);\">echo strtotime(</span><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">&#39;2014-04-29&#39;);//1398700800，</span><span style=\"background-color: rgb(191, 191, 191); font-family: Monaco; color: rgb(20, 25, 30);\">这个数字表示从1970年1月1日 00:00:00 到2014年4月29号经历了1398700800秒</span><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">echo strtotime(&#39;2014-04-29 00:00:01&#39;);//1398700801，这个数字表示从1970年1月1日 00:00:00 到</span><span style=\"background-color: rgb(191, 191, 191); font-family: Monaco; color: rgb(20, 25, 30);\">2014-04-29 00:00:01</span><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">时经历了1398700801秒</span><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\"></span><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: sans-serif; color: rgb(20, 25, 30);\">大家发现上面的规律了吗，其实strtotime(&#39;2014-04-29&#39;)相当于strtotime(&#39;2014-04-29 00:00:00&#39;)</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">将格式化的日期字符串转换为Unix时间戳</span></p><p><span style=\"font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38); font-weight: bold;\">strtotime </span><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">函数预期接受一个包含美国英语日期格式的字符串并尝试将其解析为 Unix 时间戳。</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">函数说明：strtotime(要解析的时间字符串, 计算返回值的时间戳【默认是当前的时间，可选】)</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">返回值：成功则返回时间戳，否则返回 FALSE</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">比如</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">echo strtotime(&quot;now&quot;);//相当于将英文单词now直接等于现在的日期和时间，并把这个日期时间转化为unix时间戳。这个效果跟echo time();一样。\necho strtotime(&quot;+1 seconds&quot;);//相当于将现在的日期和时间加上了1秒，并把这个日期时间转化为unix时间戳。这个效果跟echo time()+1;一样。</span><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">echo strtotime(&quot;+1 day&quot;); //相当于将现在的日期和时间加上了1天。\necho strtotime(&quot;+1 week&quot;);//相当于将现在的日期和时间加上了1周。\necho strtotime(&quot;</span><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">+1 week 3 days 7 hours 5 seconds</span><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">&quot;);//相当于将现在的日期和时间加上了1周3天7小时5秒。</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">格式化格林威治（GMT）标准时间</span></p><p><span style=\"font-size: 12px; font-family: Arial; color: rgb(50, 50, 50);\">gmdate 函数能格式化一个GMT的日期和时间，返回的是格林威治标准时（GMT）。</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">举个例子，我们现在所在的中国时区是东八区，领先格林威治时间8个小时，有时候也叫</span><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Arial; color: rgb(50, 50, 50);\">GMT</span><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">+8，那么服务器运行以下脚本返回的时间应该是这样的：\n当前时间假定是2014-05-01 15:15:22\necho date(&#39;Y-m-d H:i:s&#39;, time()); //输出为：2014-05-01 15:15:22 \necho gmdate(&#39;Y-m-d H:i:s&#39;, time()); //输出为：2014-05-01 07:15:22 因为格林威治时间是现在中国时区的时间减去8个小时，所以相对于现在时间要少8个小时</span></p><p>//返回2014-05-01 12:00:01的格林威治标准时间</p><p>echo gmdate(&#39;Y-m-d H:i:s&#39;,strtotime(&#39;2014-05-01 12:00:01&#39;));</p><hr/><p>{ <span style=\"color: rgb(0, 112, 192);\">$time</span> | date=&quot;Y-m-d H:i:s&quot;, <span style=\"color: rgb(0, 112, 192);\">### </span>}		<span style=\"background-color: rgb(255, 255, 0);\">(tp中)</span></p><hr/><p><span style=\"background-color: rgb(245, 245, 245); font-family: Helvetica; color: rgb(51, 51, 51);\">获取 “上个月第一天日期“ 及 ”上个月最后一天“的日期</span></p><p><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">echo</span><span style=\"background-color: rgb(255, 255, 255); font-family: Consolas; color: rgb(51, 51, 51);\"> </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">date</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;Y-m-01&#39;</span><span style=\"font-family: Consolas;\">, </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">strtotime</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;-1 month&#39;</span><span style=\"font-family: Consolas;\">));</span></p><p><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">echo</span><span style=\"background-color: rgb(255, 255, 255); font-family: Consolas; color: rgb(51, 51, 51);\"> </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">date</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;Y-m-t&#39;</span><span style=\"font-family: Consolas;\">, </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">strtotime</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;-1 month&#39;</span><span style=\"font-family: Consolas;\">));</span></p><p>echo date(&quot;Y-m-d H:i:s&quot;);echo &quot;&lt;br/&gt;&quot;;</p><p>echo &quot;今天:&quot;.date(&quot;Y-m-d&quot;).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;昨天:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;-1 day&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;昨天:&quot;.date(&quot;Y-m-d H:i:s&quot;,time()-24*3600). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;明天:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+1 day&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;一周后:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+1 week&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;一周前:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;-1 week&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;一周零两天四小时两秒后:&quot;.date(&quot;Y-m-d G:i:s&quot;,strtotime(&quot;+1 week 2 days 4 hours 2 seconds&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;下个星期四:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;next Thursday&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;上个周一:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;last week&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;一个月前:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;-1 month&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;一个月后:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+1 month&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;十年后:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+10 year&quot;)).&quot;&lt;br&gt;&quot;;</p><p>本月倒数第二天</p><p>$a = date(&#39;Y-m-01&#39;, strtotime(&quot;+1 month&quot;));</p><p>echo &nbsp;date(&#39;Y-m-d&#39;, strtotime(&quot;$a - 2 days&quot;));</p><hr/><p><span style=\"background-color: rgb(255, 255, 0); font-family: Helvetica; color: rgb(51, 51, 51); font-weight: bold;\">JS 中</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-weight: bold; text-decoration-line: underline;\">显示星期</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">var mydate = new Date();</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">var weekday = [&quot;星期日&quot;,&quot;星期一&quot;,&quot;星期二&quot;,&quot;星期三&quot;,&quot;星期四&quot;,&quot;星期五&quot;,&quot;星期六&quot;,];</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">var mynum = mydate.getDay();</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">document.write(mydate.getDay());</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">document.write(&quot;今天是: &quot;+ weekday[mynum]);</span></p><hr/><p><span style=\"font-size: 16px; font-family: Simsun; text-decoration-line: underline;\">时间日期函数：(以下t，t1，t2均表示一个时间/日期数据)</span></p><ul style=\"font-size: 14px; font-family: -apple-system, BlinkMacSystemFont, &quot;PingFang SC&quot;, Helvetica, Tahoma, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体, Heiti, 黑体, sans-serif; color: rgb(57, 57, 57); line-height: 1.75; white-space: normal;\" class=\" list-paddingleft-2\"><li><p><span style=\"font-size: 16px; font-family: Simsun;\">addtime(t1,t2)：将时间t2加到时间t1上</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">curdate(), current_date();</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">curtime(), current_time();</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">date(t): 取得t的日期部分(即年月日）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">day(t):取得t的日期数（1-31）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">dayname(t): 取得星期名(英文单词）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">dayofweek(t): 取得星期数（1-7）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">datediff(t1, t2): 取得t1和t2相差的天数，t1大则为正数</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">date_add(t, interval 数字n 单位u): 将时间t加上n个单位u（比如3个day，5个hour），实际上如果n为负数，就是减去。常用单位有：year, month, day, hour, minute, second, week</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">date_format(t, &#39;格式字符f&#39;)：格式字符f常用有：%Y, %y,%m, $d, %H, %h, %i, %s</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">extract(时间项u from t）：从t中取得时间的某项值，比如年份数，月份数；时间项u的常用词有：year, month, day, hour, minute, second, week</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">localtime(): 同now();</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">maketime(时，分，秒）：</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">month(t)：取得月份数（1-12）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">year(t)：取得年份数</span></p></li></ul><hr/><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">1、获取当前时间方法date()</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">很简单，这就是获取时间的方法，格式为：date($format, $timestamp)，format为格式、timestamp为时间戳–可填参数。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">2、获取时间戳方法time()、strtotime()</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">这两个方法，都可以获取php中unix时间戳，time()为直接获取得到，strtotime($time, $now)为将时间格式转为时间戳，$time为必填。清楚了这个，想了解更多，请继续往下看。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">3、 date($format)用法</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">比如：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d’) </span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-22</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo &nbsp;date(‘Y-m-d H:i:s’)</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-22 23:00:00</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo &nbsp;date(‘Y-m-d’, time())</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-22 23:00:00（结果同上，只是多了一个时间戳参数）（时间戳转换为日期格式的方法）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo &nbsp;date(‘Y’).’年’.date(‘m’).’月’.date(‘d’).’日’</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016年5月22日</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">举例就这几个，只是格式的变通而已，下面是格式中各个字母的含义：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(0, 209, 0);\">/**************格式中可使用字母的含义**************/</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">a – &quot;am&quot; 或是 &quot;pm&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">A – &quot;AM&quot; 或是 &quot;PM&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">d – 几日，二位数字，若不足二位则前面补零; 如: &quot;01&quot; 至 &quot;31&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">D – 星期几，三个英文字母; 如: &quot;Fri&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">F – 月份，英文全名; 如: &quot;January&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">h – 12 小时制的小时; 如: &quot;01&quot; 至 &quot;12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">H – 24 小时制的小时; 如: &quot;00&quot; 至 &quot;23&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">g – 12 小时制的小时，不足二位不补零; 如: &quot;1&quot; 至 12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">G – 24 小时制的小时，不足二位不补零; 如: &quot;0&quot; 至 &quot;23&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">i – 分钟; 如: &quot;00&quot; 至 &quot;59&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">j – 几日，二位数字，若不足二位不补零; 如: &quot;1&quot; 至 &quot;31&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">l – 星期几，英文全名; 如: &quot;Friday&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">m – 月份，二位数字，若不足二位则在前面补零; 如: &quot;01&quot; 至 &quot;12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">n – 月份，二位数字，若不足二位则不补零; 如: &quot;1&quot; 至 &quot;12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">M – 月份，三个英文字母; 如: &quot;Jan&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">s – 秒; 如: &quot;00&quot; 至 &quot;59&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">S – 字尾加英文序数，二个英文字母; 如: &quot;th&quot;，&quot;nd&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">t – 指定月份的天数; 如: &quot;28&quot; 至 &quot;31&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">U – 总秒数 </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">w – 数字型的星期几，如: &quot;0&quot; (星期日) 至 &quot;6&quot; (星期六) </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">Y – 年，四位数字; 如: &quot;1999&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">y – 年，二位数字; 如: &quot;99&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">z – 一年中的第几天; 如: &quot;0&quot; 至 &quot;365&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">4、strtotime($time)用法</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">比如：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo strtotime(’2016-05-22′)</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：1332427715（此处结果为随便写的，仅作说明使用）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo strtotime(date(‘Y-d-m’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：（结合date()，结果同上）（时间日期转换为时间戳）</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">strtotime()还有个很强大的用法，参数可加入对于数字的操作、年月日周英文字符，示例如下：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘+1 day’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-23 23:30:33（会发现输出明天此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘-1 day’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-21 23:30:33（昨天此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘+1 week’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-29 23:30:33（下个星期此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘next Thursday’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-29 00:00:00（下个星期四此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘last Thursday’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-15 00:00:00（上个星期四此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">等等，自己去变通研究吧，strtotime()方法可以通过英文文本的控制Unix时间戳的显示，而得到需要的时间日期格式。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">5、php获取当前时间的毫秒数</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">php本身没有提供返回毫秒数的函数，但提供了microtime()方法，它会返回一个Array，包含两个元素：一个是秒数、一个是小数表示的毫秒数，我们可以通过此方法获取返回毫秒数，方法如下：</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">function getMillisecond() {</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">list($s1, $s2) = explode(&#39; &#39;, microtime());</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">return (float)sprintf(&#39;%.0f&#39;, (floatval($s1) + floatval($s2)) * 1000);</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">}</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">6、获取当前时间相差6小时解决方法</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">有些朋友，获取的时间与当前系统时间相差6个小时，这是因为时区设置问题，只要将之设为上海时间即可。方法如下：</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">1.在php.ini中找到date.timezone，将它的值改成 Asia/Shanghai，即 date.timezone = Asia/Shanghai</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">2.在程序开始时添加 date_default_timezone_set(‘Asia/Shanghai’)即可。</span></p><p><br/></p>', '1', 'off', 'Mr.Ye.', null, '2017-11-25 16:54:31', null);
INSERT INTO `blog_article` VALUES ('26', '1', '杀杀杀', '顶顶顶顶', null, '<p><span style=\"background-color: rgb(255, 255, 0); font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">php中</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">取得当前的Unix时间戳</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">UNIX 时间戳（英文叫做：timestamp）是 PHP 中关于时间与日期的一个很重要的概念，它表示从 1970年1月1日 00:00:00 到当前时间的秒数之和。</span></p><p><span style=\"background-color: rgb(255, 255, 0); font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">PHP提供了内置函数 time() 来取得服务器当前时间的时间戳。</span><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">那么获取当前的UNIX时间戳就很简单了。</span></p><p><span style=\"background-color: rgb(255, 255, 0); font-size: 13px; font-family: Monaco; color: rgb(255, 0, 0);\">$time = </span><span style=\"background-color: rgb(255, 255, 0); font-size: 13px; font-family: Monaco; font-weight: bold;\">time()</span><span style=\"background-color: rgb(255, 255, 0); font-size: 13px; font-family: Monaco;\">;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">echo $time;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">//1396193923，这个数字表示从1970年1月1日 00:00:00 到我输出这个脚本时经历了1396193923秒</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">取得当前的日期</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">php内置了date()函数，来取得当前的日期。</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">函数说明：date(时间戳的格式, 规定时间戳【默认是当前的日期和时间，可选】)</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">返回值：函数日期和时间</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: Monaco; color: rgb(20, 25, 30);\">//date函数，第二个参数取默认值的情况</span></p><p><span style=\"background-color: rgb(216, 216, 216); font-family: Monaco; color: rgb(20, 25, 30);\">echo date(&quot;Y-m-d&quot;);</span></p><p><span style=\"background-color: rgb(216, 216, 216); font-family: Monaco; color: rgb(20, 25, 30);\">//2014-03-30</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: Monaco; color: rgb(20, 25, 30);\">//date函数，第二个参数有值的情况</span></p><p><span style=\"background-color: rgb(216, 216, 216); font-family: Monaco; color: rgb(20, 25, 30);\">echo date(&quot;Y-m-d&quot;,&#39;1396193923&#39;);</span></p><p><span style=\"background-color: rgb(216, 216, 216); font-family: Monaco; color: rgb(20, 25, 30);\">//2014-03-30,1396193923表示2014-03-30的unix时间戳</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">取得日期的Unix时间戳</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">UNIX 时间戳（英文叫做：timestamp）是 PHP 中关于时间与日期的一个很重要的概念，它表示从 1970年1月1日 00:00:00 到当前时间的秒数之和。</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">PHP提供了内置函数strtotime实现功能：获取某个日期的时间戳，或获取某个时间的时间戳。例如：</span></p><p><span style=\"background-color: rgb(191, 191, 191); font-family: Monaco; color: rgb(20, 25, 30);\">echo strtotime(</span><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">&#39;2014-04-29&#39;);</span></p><p><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">//1398700800，</span><span style=\"background-color: rgb(191, 191, 191); font-family: Monaco; color: rgb(20, 25, 30);\">这个数字表示从1970年1月1日 00:00:00 到2014年4月29号经历了1398700800秒</span></p><p><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">echo strtotime(&#39;2014-04-29 00:00:01&#39;);</span></p><p><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">//1398700801，这个数字表示从1970年1月1日 00:00:00 到</span><span style=\"background-color: rgb(191, 191, 191); font-family: Monaco; color: rgb(20, 25, 30);\">2014-04-29 00:00:01</span><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">时经历了1398700801秒</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\"></span><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: sans-serif; color: rgb(20, 25, 30);\">大家发现上面的规律了吗，其实strtotime(&#39;2014-04-29&#39;)相当于strtotime(&#39;2014-04-29 00:00:00&#39;)</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">将格式化的日期字符串转换为Unix时间戳</span></p><p><span style=\"font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38); font-weight: bold;\">strtotime </span><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">函数预期接受一个包含美国英语日期格式的字符串并尝试将其解析为 Unix 时间戳。</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">函数说明：strtotime(要解析的时间字符串, 计算返回值的时间戳【默认是当前的时间，可选】)</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">返回值：成功则返回时间戳，否则返回 FALSE</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">比如</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">echo strtotime(&quot;now&quot;);</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">//相当于将英文单词now直接等于现在的日期和时间，并把这个日期时间转化为unix时间戳。这个效果跟echo time();一样。&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">echo strtotime(&quot;+1 seconds&quot;);</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">//相当于将现在的日期和时间加上了1秒，并把这个日期时间转化为unix时间戳。这个效果跟echo time()+1;一样。</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">echo strtotime(&quot;+1 day&quot;);&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">//相当于将现在的日期和时间加上了1天。&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">echo strtotime(&quot;+1 week&quot;);</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">//相当于将现在的日期和时间加上了1周。&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">echo strtotime(&quot;</span><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">+1 week 3 days 7 hours 5 seconds</span><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">&quot;);</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">//相当于将现在的日期和时间加上了1周3天7小时5秒。</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">格式化格林威治（GMT）标准时间</span></p><p><span style=\"font-size: 12px; font-family: Arial; color: rgb(50, 50, 50);\">gmdate 函数能格式化一个GMT的日期和时间，返回的是格林威治标准时（GMT）。</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">举个例子，我们现在所在的中国时区是东八区，领先格林威治时间8个小时，有时候也叫</span><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Arial; color: rgb(50, 50, 50);\">GMT</span><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">+8，那么服务器运行以下脚本返回的时间应该是这样的：\n当前时间假定是2014-05-01 15:15:22&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">echo date(&#39;Y-m-d H:i:s&#39;, time());&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">//输出为：2014-05-01 15:15:22&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">&nbsp;echo gmdate(&#39;Y-m-d H:i:s&#39;, time());&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">//输出为：2014-05-01 07:15:22 因为格林威治时间是现在中国时区的时间减去8个小时，所以相对于现在时间要少8个小时</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">//返回2014-05-01 12:00:01的格林威治标准时间</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">echo gmdate(&#39;Y-m-d H:i:s&#39;,strtotime(&#39;2014-05-01 12:00:01&#39;));</span></p><hr/><p>{ <span style=\"color: rgb(0, 112, 192);\">$time</span> | date=&quot;Y-m-d H:i:s&quot;, <span style=\"color: rgb(0, 112, 192);\">### </span>}		<span style=\"background-color: rgb(255, 255, 0);\">(tp中)</span></p><hr/><p><span style=\"background-color: rgb(245, 245, 245); font-family: Helvetica; color: rgb(51, 51, 51);\">获取 “上个月第一天日期“ 及 ”上个月最后一天“的日期</span></p><p><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">echo</span><span style=\"background-color: rgb(255, 255, 255); font-family: Consolas; color: rgb(51, 51, 51);\"> </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">date</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;Y-m-01&#39;</span><span style=\"font-family: Consolas;\">, </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">strtotime</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;-1 month&#39;</span><span style=\"font-family: Consolas;\">));</span></p><p><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">echo</span><span style=\"background-color: rgb(255, 255, 255); font-family: Consolas; color: rgb(51, 51, 51);\"> </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">date</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;Y-m-t&#39;</span><span style=\"font-family: Consolas;\">, </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">strtotime</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;-1 month&#39;</span><span style=\"font-family: Consolas;\">));</span></p><p>echo date(&quot;Y-m-d H:i:s&quot;);echo &quot;&lt;br/&gt;&quot;;</p><p>echo &quot;今天:&quot;.date(&quot;Y-m-d&quot;).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;昨天:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;-1 day&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;昨天:&quot;.date(&quot;Y-m-d H:i:s&quot;,time()-24*3600). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;明天:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+1 day&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;一周后:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+1 week&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;一周前:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;-1 week&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;一周零两天四小时两秒后:&quot;.date(&quot;Y-m-d G:i:s&quot;,strtotime(&quot;+1 week 2 days 4 hours 2 seconds&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;下个星期四:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;next Thursday&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;上个周一:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;last week&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;一个月前:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;-1 month&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;一个月后:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+1 month&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;十年后:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+10 year&quot;)).&quot;&lt;br&gt;&quot;;</p><p>本月倒数第二天</p><p>$a = date(&#39;Y-m-01&#39;, strtotime(&quot;+1 month&quot;));</p><p>echo &nbsp;date(&#39;Y-m-d&#39;, strtotime(&quot;$a - 2 days&quot;));</p><hr/><p><span style=\"background-color: rgb(255, 255, 0); font-family: Helvetica; color: rgb(51, 51, 51); font-weight: bold;\">JS 中</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-weight: bold; text-decoration-line: underline;\">显示星期</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">var mydate = new Date();</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">var weekday = [&quot;星期日&quot;,&quot;星期一&quot;,&quot;星期二&quot;,&quot;星期三&quot;,&quot;星期四&quot;,&quot;星期五&quot;,&quot;星期六&quot;,];</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">var mynum = mydate.getDay();</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">document.write(mydate.getDay());</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">document.write(&quot;今天是: &quot;+ weekday[mynum]);</span></p><hr/><p><span style=\"font-size: 16px; font-family: Simsun; text-decoration-line: underline;\">时间日期函数：(以下t，t1，t2均表示一个时间/日期数据)</span></p><ul style=\"font-size: 14px; font-family: -apple-system, BlinkMacSystemFont, &quot;PingFang SC&quot;, Helvetica, Tahoma, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体, Heiti, 黑体, sans-serif; color: rgb(57, 57, 57); line-height: 1.75; white-space: normal;\" class=\" list-paddingleft-2\"><li><p><span style=\"font-size: 16px; font-family: Simsun;\">addtime(t1,t2)：将时间t2加到时间t1上</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">curdate(), current_date();</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">curtime(), current_time();</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">date(t): 取得t的日期部分(即年月日）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">day(t):取得t的日期数（1-31）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">dayname(t): 取得星期名(英文单词）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">dayofweek(t): 取得星期数（1-7）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">datediff(t1, t2): 取得t1和t2相差的天数，t1大则为正数</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">date_add(t, interval 数字n 单位u): 将时间t加上n个单位u（比如3个day，5个hour），实际上如果n为负数，就是减去。常用单位有：year, month, day, hour, minute, second, week</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">date_format(t, &#39;格式字符f&#39;)：格式字符f常用有：%Y, %y,%m, $d, %H, %h, %i, %s</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">extract(时间项u from t）：从t中取得时间的某项值，比如年份数，月份数；时间项u的常用词有：year, month, day, hour, minute, second, week</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">localtime(): 同now();</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">maketime(时，分，秒）：</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">month(t)：取得月份数（1-12）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">year(t)：取得年份数</span></p></li></ul><hr/><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">1、获取当前时间方法date()</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">很简单，这就是获取时间的方法，格式为：date($format, $timestamp)，format为格式、timestamp为时间戳–可填参数。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">2、获取时间戳方法time()、strtotime()</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">这两个方法，都可以获取php中unix时间戳，time()为直接获取得到，strtotime($time, $now)为将时间格式转为时间戳，$time为必填。清楚了这个，想了解更多，请继续往下看。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">3、 date($format)用法</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">比如：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d’) </span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-22</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo &nbsp;date(‘Y-m-d H:i:s’)</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-22 23:00:00</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo &nbsp;date(‘Y-m-d’, time())</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-22 23:00:00（结果同上，只是多了一个时间戳参数）（时间戳转换为日期格式的方法）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo &nbsp;date(‘Y’).’年’.date(‘m’).’月’.date(‘d’).’日’</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016年5月22日</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">举例就这几个，只是格式的变通而已，下面是格式中各个字母的含义：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(0, 209, 0);\">/**************格式中可使用字母的含义**************/</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">a – &quot;am&quot; 或是 &quot;pm&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">A – &quot;AM&quot; 或是 &quot;PM&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">d – 几日，二位数字，若不足二位则前面补零; 如: &quot;01&quot; 至 &quot;31&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">D – 星期几，三个英文字母; 如: &quot;Fri&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">F – 月份，英文全名; 如: &quot;January&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">h – 12 小时制的小时; 如: &quot;01&quot; 至 &quot;12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">H – 24 小时制的小时; 如: &quot;00&quot; 至 &quot;23&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">g – 12 小时制的小时，不足二位不补零; 如: &quot;1&quot; 至 12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">G – 24 小时制的小时，不足二位不补零; 如: &quot;0&quot; 至 &quot;23&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">i – 分钟; 如: &quot;00&quot; 至 &quot;59&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">j – 几日，二位数字，若不足二位不补零; 如: &quot;1&quot; 至 &quot;31&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">l – 星期几，英文全名; 如: &quot;Friday&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">m – 月份，二位数字，若不足二位则在前面补零; 如: &quot;01&quot; 至 &quot;12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">n – 月份，二位数字，若不足二位则不补零; 如: &quot;1&quot; 至 &quot;12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">M – 月份，三个英文字母; 如: &quot;Jan&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">s – 秒; 如: &quot;00&quot; 至 &quot;59&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">S – 字尾加英文序数，二个英文字母; 如: &quot;th&quot;，&quot;nd&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">t – 指定月份的天数; 如: &quot;28&quot; 至 &quot;31&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">U – 总秒数 </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">w – 数字型的星期几，如: &quot;0&quot; (星期日) 至 &quot;6&quot; (星期六) </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">Y – 年，四位数字; 如: &quot;1999&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">y – 年，二位数字; 如: &quot;99&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">z – 一年中的第几天; 如: &quot;0&quot; 至 &quot;365&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">4、strtotime($time)用法</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">比如：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo strtotime(’2016-05-22′)</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：1332427715（此处结果为随便写的，仅作说明使用）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo strtotime(date(‘Y-d-m’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：（结合date()，结果同上）（时间日期转换为时间戳）</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">strtotime()还有个很强大的用法，参数可加入对于数字的操作、年月日周英文字符，示例如下：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘+1 day’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-23 23:30:33（会发现输出明天此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘-1 day’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-21 23:30:33（昨天此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘+1 week’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-29 23:30:33（下个星期此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘next Thursday’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-29 00:00:00（下个星期四此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘last Thursday’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-15 00:00:00（上个星期四此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">等等，自己去变通研究吧，strtotime()方法可以通过英文文本的控制Unix时间戳的显示，而得到需要的时间日期格式。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">5、php获取当前时间的毫秒数</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">php本身没有提供返回毫秒数的函数，但提供了microtime()方法，它会返回一个Array，包含两个元素：一个是秒数、一个是小数表示的毫秒数，我们可以通过此方法获取返回毫秒数，方法如下：</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">function getMillisecond() {</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">list($s1, $s2) = explode(&#39; &#39;, microtime());</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">return (float)sprintf(&#39;%.0f&#39;, (floatval($s1) + floatval($s2)) * 1000);</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">}</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">6、获取当前时间相差6小时解决方法</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">有些朋友，获取的时间与当前系统时间相差6个小时，这是因为时区设置问题，只要将之设为上海时间即可。方法如下：</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">1.在php.ini中找到date.timezone，将它的值改成 Asia/Shanghai，即 date.timezone = Asia/Shanghai</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">2.在程序开始时添加 date_default_timezone_set(‘Asia/Shanghai’)即可。</span></p><p><br/></p>', '0', 'off', 'Mr.Ye.', null, '2017-11-25 22:22:50', null);
INSERT INTO `blog_article` VALUES ('27', '2', '开发中关于时间的转换+生成', '顶顶顶顶', null, '<p><span style=\"background-color: rgb(255, 255, 0); font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\"><img src=\"/uploads/article_img/1511621222249412.jpg\" title=\"1511621222249412.jpg\" alt=\"欧美范.jpg\" width=\"227\" height=\"416\"/>php中</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">取得当前的Unix时间戳</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">UNIX 时间戳（英文叫做：timestamp）是 PHP 中关于时间与日期的一个很重要的概念，它表示从 1970年1月1日 00:00:00 到当前时间的秒数之和。</span></p><p><span style=\"background-color: rgb(255, 255, 0); font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">PHP提供了内置函数 time() 来取得服务器当前时间的时间戳。</span><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">那么获取当前的UNIX时间戳就很简单了。</span></p><p><span style=\"background-color: rgb(255, 255, 0); font-size: 13px; font-family: Monaco; color: rgb(255, 0, 0);\">$time = </span><span style=\"background-color: rgb(255, 255, 0); font-size: 13px; font-family: Monaco; font-weight: bold;\">time()</span><span style=\"background-color: rgb(255, 255, 0); font-size: 13px; font-family: Monaco;\">;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">echo $time;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">//1396193923，这个数字表示从1970年1月1日 00:00:00 到我输出这个脚本时经历了1396193923秒</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">取得当前的日期</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">php内置了date()函数，来取得当前的日期。</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">函数说明：date(时间戳的格式, 规定时间戳【默认是当前的日期和时间，可选】)</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">返回值：函数日期和时间</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: Monaco; color: rgb(20, 25, 30);\">//date函数，第二个参数取默认值的情况</span></p><p><span style=\"background-color: rgb(216, 216, 216); font-family: Monaco; color: rgb(20, 25, 30);\">echo date(&quot;Y-m-d&quot;);</span></p><p><span style=\"background-color: rgb(216, 216, 216); font-family: Monaco; color: rgb(20, 25, 30);\">//2014-03-30</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: Monaco; color: rgb(20, 25, 30);\">//date函数，第二个参数有值的情况</span></p><p><span style=\"background-color: rgb(216, 216, 216); font-family: Monaco; color: rgb(20, 25, 30);\">echo date(&quot;Y-m-d&quot;,&#39;1396193923&#39;);</span></p><p><span style=\"background-color: rgb(216, 216, 216); font-family: Monaco; color: rgb(20, 25, 30);\">//2014-03-30,1396193923表示2014-03-30的unix时间戳</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">取得日期的Unix时间戳</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">UNIX 时间戳（英文叫做：timestamp）是 PHP 中关于时间与日期的一个很重要的概念，它表示从 1970年1月1日 00:00:00 到当前时间的秒数之和。</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">PHP提供了内置函数strtotime实现功能：获取某个日期的时间戳，或获取某个时间的时间戳。例如：</span></p><p><span style=\"background-color: rgb(191, 191, 191); font-family: Monaco; color: rgb(20, 25, 30);\">echo strtotime(</span><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">&#39;2014-04-29&#39;);</span></p><p><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">//1398700800，</span><span style=\"background-color: rgb(191, 191, 191); font-family: Monaco; color: rgb(20, 25, 30);\">这个数字表示从1970年1月1日 00:00:00 到2014年4月29号经历了1398700800秒</span></p><p><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">echo strtotime(&#39;2014-04-29 00:00:01&#39;);</span></p><p><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">//1398700801，这个数字表示从1970年1月1日 00:00:00 到</span><span style=\"background-color: rgb(191, 191, 191); font-family: Monaco; color: rgb(20, 25, 30);\">2014-04-29 00:00:01</span><span style=\"background-color: rgb(191, 191, 191); font-family: sans-serif; color: rgb(20, 25, 30);\">时经历了1398700801秒</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\"></span><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: sans-serif; color: rgb(20, 25, 30);\">大家发现上面的规律了吗，其实strtotime(&#39;2014-04-29&#39;)相当于strtotime(&#39;2014-04-29 00:00:00&#39;)</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">将格式化的日期字符串转换为Unix时间戳</span></p><p><span style=\"font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38); font-weight: bold;\">strtotime </span><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">函数预期接受一个包含美国英语日期格式的字符串并尝试将其解析为 Unix 时间戳。</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">函数说明：strtotime(要解析的时间字符串, 计算返回值的时间戳【默认是当前的时间，可选】)</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">返回值：成功则返回时间戳，否则返回 FALSE</span></p><p><span style=\"font-size: 12px; font-family: &quot;PingFang SC&quot;; color: rgb(31, 36, 38);\">比如</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">echo strtotime(&quot;now&quot;);</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">//相当于将英文单词now直接等于现在的日期和时间，并把这个日期时间转化为unix时间戳。这个效果跟echo time();一样。&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">echo strtotime(&quot;+1 seconds&quot;);</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">//相当于将现在的日期和时间加上了1秒，并把这个日期时间转化为unix时间戳。这个效果跟echo time()+1;一样。</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">echo strtotime(&quot;+1 day&quot;);&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">//相当于将现在的日期和时间加上了1天。&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">echo strtotime(&quot;+1 week&quot;);</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">//相当于将现在的日期和时间加上了1周。&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">echo strtotime(&quot;</span><span style=\"background-color: rgb(238, 238, 238); font-family: Monaco; color: rgb(20, 25, 30);\">+1 week 3 days 7 hours 5 seconds</span><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">&quot;);</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-family: sans-serif; color: rgb(20, 25, 30);\">//相当于将现在的日期和时间加上了1周3天7小时5秒。</span></p><hr/><p><span style=\"font-size: 16px; font-family: 微软雅黑; color: rgb(20, 25, 30); font-weight: bold;\">格式化格林威治（GMT）标准时间</span></p><p><span style=\"font-size: 12px; font-family: Arial; color: rgb(50, 50, 50);\">gmdate 函数能格式化一个GMT的日期和时间，返回的是格林威治标准时（GMT）。</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">举个例子，我们现在所在的中国时区是东八区，领先格林威治时间8个小时，有时候也叫</span><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Arial; color: rgb(50, 50, 50);\">GMT</span><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">+8，那么服务器运行以下脚本返回的时间应该是这样的：\n当前时间假定是2014-05-01 15:15:22&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">echo date(&#39;Y-m-d H:i:s&#39;, time());&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">//输出为：2014-05-01 15:15:22&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">&nbsp;echo gmdate(&#39;Y-m-d H:i:s&#39;, time());&nbsp;</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">//输出为：2014-05-01 07:15:22 因为格林威治时间是现在中国时区的时间减去8个小时，所以相对于现在时间要少8个小时</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">//返回2014-05-01 12:00:01的格林威治标准时间</span></p><p><span style=\"background-color: rgb(238, 238, 238); font-size: 13px; font-family: Monaco; color: rgb(20, 25, 30);\">echo gmdate(&#39;Y-m-d H:i:s&#39;,strtotime(&#39;2014-05-01 12:00:01&#39;));</span></p><hr/><p>{ <span style=\"color: rgb(0, 112, 192);\">$time</span> | date=&quot;Y-m-d H:i:s&quot;, <span style=\"color: rgb(0, 112, 192);\">### </span>}		<span style=\"background-color: rgb(255, 255, 0);\">(tp中)</span></p><hr/><p><span style=\"background-color: rgb(245, 245, 245); font-family: Helvetica; color: rgb(51, 51, 51);\">获取 “上个月第一天日期“ 及 ”上个月最后一天“的日期</span></p><p><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">echo</span><span style=\"background-color: rgb(255, 255, 255); font-family: Consolas; color: rgb(51, 51, 51);\"> </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">date</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;Y-m-01&#39;</span><span style=\"font-family: Consolas;\">, </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">strtotime</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;-1 month&#39;</span><span style=\"font-family: Consolas;\">));</span></p><p><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">echo</span><span style=\"background-color: rgb(255, 255, 255); font-family: Consolas; color: rgb(51, 51, 51);\"> </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">date</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;Y-m-t&#39;</span><span style=\"font-family: Consolas;\">, </span><span style=\"font-family: Consolas; color: rgb(255, 20, 147);\">strtotime</span><span style=\"font-family: Consolas;\">(</span><span style=\"font-family: Consolas; color: rgb(0, 0, 255);\">&#39;-1 month&#39;</span><span style=\"font-family: Consolas;\">));</span></p><p>echo date(&quot;Y-m-d H:i:s&quot;);echo &quot;&lt;br/&gt;&quot;;</p><p>echo &quot;今天:&quot;.date(&quot;Y-m-d&quot;).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;昨天:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;-1 day&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;昨天:&quot;.date(&quot;Y-m-d H:i:s&quot;,time()-24*3600). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;明天:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+1 day&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;一周后:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+1 week&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;一周前:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;-1 week&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;一周零两天四小时两秒后:&quot;.date(&quot;Y-m-d G:i:s&quot;,strtotime(&quot;+1 week 2 days 4 hours 2 seconds&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;下个星期四:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;next Thursday&quot;)). &quot;&lt;br&gt;&quot;;</p><p>echo &quot;上个周一:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;last week&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;一个月前:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;-1 month&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;一个月后:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+1 month&quot;)).&quot;&lt;br&gt;&quot;;</p><p>echo &quot;十年后:&quot;.date(&quot;Y-m-d&quot;,strtotime(&quot;+10 year&quot;)).&quot;&lt;br&gt;&quot;;</p><p>本月倒数第二天</p><p>$a = date(&#39;Y-m-01&#39;, strtotime(&quot;+1 month&quot;));</p><p>echo &nbsp;date(&#39;Y-m-d&#39;, strtotime(&quot;$a - 2 days&quot;));</p><hr/><p><span style=\"background-color: rgb(255, 255, 0); font-family: Helvetica; color: rgb(51, 51, 51); font-weight: bold;\">JS 中</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(51, 51, 51); font-weight: bold; text-decoration-line: underline;\">显示星期</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">var mydate = new Date();</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">var weekday = [&quot;星期日&quot;,&quot;星期一&quot;,&quot;星期二&quot;,&quot;星期三&quot;,&quot;星期四&quot;,&quot;星期五&quot;,&quot;星期六&quot;,];</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">var mynum = mydate.getDay();</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">document.write(mydate.getDay());</span></p><p><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51);\">document.write(&quot;今天是: &quot;+ weekday[mynum]);</span></p><hr/><p><span style=\"font-size: 16px; font-family: Simsun; text-decoration-line: underline;\">时间日期函数：(以下t，t1，t2均表示一个时间/日期数据)</span></p><ul style=\"font-size: 14px; font-family: -apple-system, BlinkMacSystemFont, &quot;PingFang SC&quot;, Helvetica, Tahoma, Arial, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, 微软雅黑, SimSun, 宋体, Heiti, 黑体, sans-serif; color: rgb(57, 57, 57); line-height: 1.75; white-space: normal;\" class=\" list-paddingleft-2\"><li><p><span style=\"font-size: 16px; font-family: Simsun;\">addtime(t1,t2)：将时间t2加到时间t1上</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">curdate(), current_date();</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">curtime(), current_time();</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">date(t): 取得t的日期部分(即年月日）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">day(t):取得t的日期数（1-31）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">dayname(t): 取得星期名(英文单词）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">dayofweek(t): 取得星期数（1-7）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">datediff(t1, t2): 取得t1和t2相差的天数，t1大则为正数</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">date_add(t, interval 数字n 单位u): 将时间t加上n个单位u（比如3个day，5个hour），实际上如果n为负数，就是减去。常用单位有：year, month, day, hour, minute, second, week</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">date_format(t, &#39;格式字符f&#39;)：格式字符f常用有：%Y, %y,%m, $d, %H, %h, %i, %s</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">extract(时间项u from t）：从t中取得时间的某项值，比如年份数，月份数；时间项u的常用词有：year, month, day, hour, minute, second, week</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">localtime(): 同now();</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">maketime(时，分，秒）：</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">month(t)：取得月份数（1-12）</span></p></li><li><p><span style=\"font-size: 16px; font-family: Simsun;\">year(t)：取得年份数</span></p></li></ul><hr/><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">1、获取当前时间方法date()</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">很简单，这就是获取时间的方法，格式为：date($format, $timestamp)，format为格式、timestamp为时间戳–可填参数。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">2、获取时间戳方法time()、strtotime()</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">这两个方法，都可以获取php中unix时间戳，time()为直接获取得到，strtotime($time, $now)为将时间格式转为时间戳，$time为必填。清楚了这个，想了解更多，请继续往下看。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">3、 date($format)用法</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">比如：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d’) </span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-22</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo &nbsp;date(‘Y-m-d H:i:s’)</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-22 23:00:00</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo &nbsp;date(‘Y-m-d’, time())</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-22 23:00:00（结果同上，只是多了一个时间戳参数）（时间戳转换为日期格式的方法）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo &nbsp;date(‘Y’).’年’.date(‘m’).’月’.date(‘d’).’日’</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016年5月22日</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">举例就这几个，只是格式的变通而已，下面是格式中各个字母的含义：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(0, 209, 0);\">/**************格式中可使用字母的含义**************/</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">a – &quot;am&quot; 或是 &quot;pm&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">A – &quot;AM&quot; 或是 &quot;PM&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">d – 几日，二位数字，若不足二位则前面补零; 如: &quot;01&quot; 至 &quot;31&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">D – 星期几，三个英文字母; 如: &quot;Fri&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">F – 月份，英文全名; 如: &quot;January&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">h – 12 小时制的小时; 如: &quot;01&quot; 至 &quot;12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">H – 24 小时制的小时; 如: &quot;00&quot; 至 &quot;23&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">g – 12 小时制的小时，不足二位不补零; 如: &quot;1&quot; 至 12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">G – 24 小时制的小时，不足二位不补零; 如: &quot;0&quot; 至 &quot;23&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">i – 分钟; 如: &quot;00&quot; 至 &quot;59&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">j – 几日，二位数字，若不足二位不补零; 如: &quot;1&quot; 至 &quot;31&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">l – 星期几，英文全名; 如: &quot;Friday&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">m – 月份，二位数字，若不足二位则在前面补零; 如: &quot;01&quot; 至 &quot;12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">n – 月份，二位数字，若不足二位则不补零; 如: &quot;1&quot; 至 &quot;12&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">M – 月份，三个英文字母; 如: &quot;Jan&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">s – 秒; 如: &quot;00&quot; 至 &quot;59&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">S – 字尾加英文序数，二个英文字母; 如: &quot;th&quot;，&quot;nd&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">t – 指定月份的天数; 如: &quot;28&quot; 至 &quot;31&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">U – 总秒数 </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">w – 数字型的星期几，如: &quot;0&quot; (星期日) 至 &quot;6&quot; (星期六) </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">Y – 年，四位数字; 如: &quot;1999&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">y – 年，二位数字; 如: &quot;99&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255);\">z – 一年中的第几天; 如: &quot;0&quot; 至 &quot;365&quot; </span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">4、strtotime($time)用法</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">比如：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo strtotime(’2016-05-22′)</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：1332427715（此处结果为随便写的，仅作说明使用）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo strtotime(date(‘Y-d-m’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：（结合date()，结果同上）（时间日期转换为时间戳）</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">strtotime()还有个很强大的用法，参数可加入对于数字的操作、年月日周英文字符，示例如下：</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘+1 day’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-23 23:30:33（会发现输出明天此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘-1 day’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-21 23:30:33（昨天此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘+1 week’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-29 23:30:33（下个星期此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘next Thursday’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-29 00:00:00（下个星期四此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgb(255, 0, 0);\">echo date(‘Y-m-d H:i:s’,strtotime(‘last Thursday’))</span><span style=\"background-color: rgb(255, 255, 255);\">，输出结果：2016-05-15 00:00:00（上个星期四此时的时间）</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">等等，自己去变通研究吧，strtotime()方法可以通过英文文本的控制Unix时间戳的显示，而得到需要的时间日期格式。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">5、php获取当前时间的毫秒数</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">php本身没有提供返回毫秒数的函数，但提供了microtime()方法，它会返回一个Array，包含两个元素：一个是秒数、一个是小数表示的毫秒数，我们可以通过此方法获取返回毫秒数，方法如下：</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">function getMillisecond() {</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">list($s1, $s2) = explode(&#39; &#39;, microtime());</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">return (float)sprintf(&#39;%.0f&#39;, (floatval($s1) + floatval($s2)) * 1000);</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">}</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-weight: bold;\">6、获取当前时间相差6小时解决方法</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">有些朋友，获取的时间与当前系统时间相差6个小时，这是因为时区设置问题，只要将之设为上海时间即可。方法如下：</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">1.在php.ini中找到date.timezone，将它的值改成 Asia/Shanghai，即 date.timezone = Asia/Shanghai</span></p><p><span style=\"background-color: rgb(255, 255, 255);\">2.在程序开始时添加 date_default_timezone_set(‘Asia/Shanghai’)即可。</span></p><p><br/></p>', '1', 'off', 'Mr.Ye.', null, '2017-11-25 22:47:59', null);

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES ('1', '公众号\n');
INSERT INTO `blog_category` VALUES ('2', '\n即时通信');
INSERT INTO `blog_category` VALUES ('3', '加密技术');
INSERT INTO `blog_category` VALUES ('4', '数据库设计');
INSERT INTO `blog_category` VALUES ('5', 'ThinkPHP');
INSERT INTO `blog_category` VALUES ('6', '第三方');
INSERT INTO `blog_category` VALUES ('7', '网络协议');
INSERT INTO `blog_category` VALUES ('8', 'Web安全');
INSERT INTO `blog_category` VALUES ('9', '算法\n');
INSERT INTO `blog_category` VALUES ('10', '数据结构');
INSERT INTO `blog_category` VALUES ('11', '前端特效');
INSERT INTO `blog_category` VALUES ('12', '网站开发各种插件');
INSERT INTO `blog_category` VALUES ('13', 'PHP扩展');
INSERT INTO `blog_category` VALUES ('14', 'PHP消息队列\r\n\n');
INSERT INTO `blog_category` VALUES ('15', 'Node');
INSERT INTO `blog_category` VALUES ('16', 'Vue');
INSERT INTO `blog_category` VALUES ('17', 'Yii2');
INSERT INTO `blog_category` VALUES ('18', '\n各种类库');
INSERT INTO `blog_category` VALUES ('19', '站长工具');
INSERT INTO `blog_category` VALUES ('20', 'SVN');
INSERT INTO `blog_category` VALUES ('21', 'Git');

-- ----------------------------
-- Table structure for blog_content
-- ----------------------------
DROP TABLE IF EXISTS `blog_content`;
CREATE TABLE `blog_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `a_id` int(11) unsigned NOT NULL COMMENT '文章id',
  `content` text COMMENT '文章正文',
  PRIMARY KEY (`id`,`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_content
-- ----------------------------

-- ----------------------------
-- Table structure for blog_debris
-- ----------------------------
DROP TABLE IF EXISTS `blog_debris`;
CREATE TABLE `blog_debris` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL COMMENT '详情',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_debris
-- ----------------------------
INSERT INTO `blog_debris` VALUES ('66', '做个安静的人；不争抢；是我的跑不掉；不是我的抢不来；不大喜；亦不大悲；能倾听他人想法；能思考自己生活；欣赏别人；君有大世界，我有小生活；此地甚好；从容而行；', '2017-06-03 23:06:05');
INSERT INTO `blog_debris` VALUES ('67', '只有真正努力过；才知道时间永远不够用；', '2016-09-21 22:12:23');
INSERT INTO `blog_debris` VALUES ('68', '遨游在编程的世界里；喜欢1和0的纯粹；不会有外界那么多的不确定；', '2016-09-11 17:44:34');
INSERT INTO `blog_debris` VALUES ('69', '被一杯睡前的浓咖啡从睡梦中唤醒来完成一个每年一天的特殊日子中的一篇博客；', '2016-09-04 04:15:52');

-- ----------------------------
-- Table structure for blog_relation
-- ----------------------------
DROP TABLE IF EXISTS `blog_relation`;
CREATE TABLE `blog_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `a_id` int(10) unsigned NOT NULL COMMENT '文章id',
  `t_id` tinyint(3) unsigned NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`,`a_id`,`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_relation
-- ----------------------------
INSERT INTO `blog_relation` VALUES ('1', '1', '61');
INSERT INTO `blog_relation` VALUES ('2', '1', '68');
INSERT INTO `blog_relation` VALUES ('3', '2', '66');
INSERT INTO `blog_relation` VALUES ('4', '2', '69');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('61', 'JavaScript');
INSERT INTO `blog_tag` VALUES ('66', 'PHP');
INSERT INTO `blog_tag` VALUES ('67', 'CSS');
INSERT INTO `blog_tag` VALUES ('68', 'HTML');
INSERT INTO `blog_tag` VALUES ('69', 'Vue');
INSERT INTO `blog_tag` VALUES ('70', 'WebApp');
INSERT INTO `blog_tag` VALUES ('71', 'MySQL');
INSERT INTO `blog_tag` VALUES ('72', 'Linux');
INSERT INTO `blog_tag` VALUES ('73', 'Python');

-- ----------------------------
-- Table structure for xcx_banner
-- ----------------------------
DROP TABLE IF EXISTS `xcx_banner`;
CREATE TABLE `xcx_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表';

-- ----------------------------
-- Records of xcx_banner
-- ----------------------------
INSERT INTO `xcx_banner` VALUES ('1', '首页置顶', '首页轮播图', null, null);

-- ----------------------------
-- Table structure for xcx_banner_item
-- ----------------------------
DROP TABLE IF EXISTS `xcx_banner_item`;
CREATE TABLE `xcx_banner_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联image表',
  `key_word` varchar(100) NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '跳转类型，可能导向商品，可能导向专题，可能导向其他。0，无导向；1：导向商品;2:导向专题',
  `delete_time` int(11) DEFAULT NULL,
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表';

-- ----------------------------
-- Records of xcx_banner_item
-- ----------------------------
INSERT INTO `xcx_banner_item` VALUES ('1', '65', '6', '1', null, '1', null);
INSERT INTO `xcx_banner_item` VALUES ('2', '2', '25', '1', null, '1', null);
INSERT INTO `xcx_banner_item` VALUES ('3', '3', '11', '1', null, '1', null);
INSERT INTO `xcx_banner_item` VALUES ('5', '1', '10', '1', null, '1', null);

-- ----------------------------
-- Table structure for xcx_category
-- ----------------------------
DROP TABLE IF EXISTS `xcx_category`;
CREATE TABLE `xcx_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `topic_img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `delete_time` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

-- ----------------------------
-- Records of xcx_category
-- ----------------------------
INSERT INTO `xcx_category` VALUES ('2', '果味', '6', null, null, null);
INSERT INTO `xcx_category` VALUES ('3', '蔬菜', '5', null, null, null);
INSERT INTO `xcx_category` VALUES ('4', '炒货', '7', null, null, null);
INSERT INTO `xcx_category` VALUES ('5', '点心', '4', null, null, null);
INSERT INTO `xcx_category` VALUES ('6', '粗茶', '8', null, null, null);
INSERT INTO `xcx_category` VALUES ('7', '淡饭', '9', null, null, null);

-- ----------------------------
-- Table structure for xcx_image
-- ----------------------------
DROP TABLE IF EXISTS `xcx_image`;
CREATE TABLE `xcx_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='图片总表';

-- ----------------------------
-- Records of xcx_image
-- ----------------------------
INSERT INTO `xcx_image` VALUES ('1', '/banner-1a.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('2', '/banner-2a.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('3', '/banner-3a.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('4', '/category-cake.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('5', '/category-vg.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('6', '/category-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('7', '/category-fry-a.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('8', '/category-tea.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('9', '/category-rice.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('10', '/product-dryfruit@1.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('13', '/product-vg@1.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('14', '/product-rice@6.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('16', '/1@theme.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('17', '/2@theme.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('18', '/3@theme.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('19', '/detail-1@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('20', '/detail-2@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('21', '/detail-3@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('22', '/detail-4@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('23', '/detail-5@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('24', '/detail-6@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('25', '/detail-7@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('26', '/detail-8@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('27', '/detail-9@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('28', '/detail-11@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('29', '/detail-10@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('31', '/product-rice@1.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('32', '/product-tea@1.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('33', '/product-dryfruit@2.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('36', '/product-dryfruit@3.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('37', '/product-dryfruit@4.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('38', '/product-dryfruit@5.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('39', '/product-dryfruit-a@6.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('40', '/product-dryfruit@7.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('41', '/product-rice@2.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('42', '/product-rice@3.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('43', '/product-rice@4.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('44', '/product-fry@1.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('45', '/product-fry@2.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('46', '/product-fry@3.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('47', '/product-tea@2.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('48', '/product-tea@3.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('49', '/1@theme-head.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('50', '/2@theme-head.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('51', '/3@theme-head.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('52', '/product-cake@1.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('53', '/product-cake@2.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('54', '/product-cake-a@3.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('55', '/product-cake-a@4.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('56', '/product-dryfruit@8.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('57', '/product-fry@4.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('58', '/product-fry@5.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('59', '/product-rice@5.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('60', '/product-rice@7.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('62', '/detail-12@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('63', '/detail-13@1-dryfruit.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('65', '/banner-4a.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('66', '/product-vg@4.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('67', '/product-vg@5.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('68', '/product-vg@2.png', '1', null, null);
INSERT INTO `xcx_image` VALUES ('69', '/product-vg@3.png', '1', null, null);

-- ----------------------------
-- Table structure for xcx_order
-- ----------------------------
DROP TABLE IF EXISTS `xcx_order`;
CREATE TABLE `xcx_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
  `snap_img` varchar(255) DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) DEFAULT NULL COMMENT '订单快照名称',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `snap_items` text COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xcx_order
-- ----------------------------

-- ----------------------------
-- Table structure for xcx_order_product
-- ----------------------------
DROP TABLE IF EXISTS `xcx_order_product`;
CREATE TABLE `xcx_order_product` (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xcx_order_product
-- ----------------------------

-- ----------------------------
-- Table structure for xcx_product
-- ----------------------------
DROP TABLE IF EXISTS `xcx_product`;
CREATE TABLE `xcx_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT '商品名称',
  `price` decimal(6,2) NOT NULL COMMENT '价格,单位：分',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `delete_time` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `main_img_url` varchar(255) DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '图片来自 1 本地 ，2公网',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  `img_id` int(11) DEFAULT NULL COMMENT '图片外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xcx_product
-- ----------------------------
INSERT INTO `xcx_product` VALUES ('1', '芹菜 半斤', '0.01', '998', null, '3', '/product-vg@1.png', '1', null, null, null, '13');
INSERT INTO `xcx_product` VALUES ('2', '梨花带雨 3个', '0.01', '984', null, '2', '/product-dryfruit@1.png', '1', null, null, null, '10');
INSERT INTO `xcx_product` VALUES ('3', '素米 327克', '0.01', '996', null, '7', '/product-rice@1.png', '1', null, null, null, '31');
INSERT INTO `xcx_product` VALUES ('4', '红袖枸杞 6克*3袋', '0.01', '998', null, '6', '/product-tea@1.png', '1', null, null, null, '32');
INSERT INTO `xcx_product` VALUES ('5', '春生龙眼 500克', '0.01', '995', null, '2', '/product-dryfruit@2.png', '1', null, null, null, '33');
INSERT INTO `xcx_product` VALUES ('6', '小红的猪耳朵 120克', '0.01', '997', null, '5', '/product-cake@2.png', '1', null, null, null, '53');
INSERT INTO `xcx_product` VALUES ('7', '泥蒿 半斤', '0.01', '998', null, '3', '/product-vg@2.png', '1', null, null, null, '68');
INSERT INTO `xcx_product` VALUES ('8', '夏日芒果 3个', '0.01', '995', null, '2', '/product-dryfruit@3.png', '1', null, null, null, '36');
INSERT INTO `xcx_product` VALUES ('9', '冬木红枣 500克', '0.01', '996', null, '2', '/product-dryfruit@4.png', '1', null, null, null, '37');
INSERT INTO `xcx_product` VALUES ('10', '万紫千凤梨 300克', '0.01', '996', null, '2', '/product-dryfruit@5.png', '1', null, null, null, '38');
INSERT INTO `xcx_product` VALUES ('11', '贵妃笑 100克', '0.01', '994', null, '2', '/product-dryfruit-a@6.png', '1', null, null, null, '39');
INSERT INTO `xcx_product` VALUES ('12', '珍奇异果 3个', '0.01', '999', null, '2', '/product-dryfruit@7.png', '1', null, null, null, '40');
INSERT INTO `xcx_product` VALUES ('13', '绿豆 125克', '0.01', '999', null, '7', '/product-rice@2.png', '1', null, null, null, '41');
INSERT INTO `xcx_product` VALUES ('14', '芝麻 50克', '0.01', '999', null, '7', '/product-rice@3.png', '1', null, null, null, '42');
INSERT INTO `xcx_product` VALUES ('15', '猴头菇 370克', '0.01', '999', null, '7', '/product-rice@4.png', '1', null, null, null, '43');
INSERT INTO `xcx_product` VALUES ('16', '西红柿 1斤', '0.01', '999', null, '3', '/product-vg@3.png', '1', null, null, null, '69');
INSERT INTO `xcx_product` VALUES ('17', '油炸花生 300克', '0.01', '999', null, '4', '/product-fry@1.png', '1', null, null, null, '44');
INSERT INTO `xcx_product` VALUES ('18', '春泥西瓜子 128克', '0.01', '997', null, '4', '/product-fry@2.png', '1', null, null, null, '45');
INSERT INTO `xcx_product` VALUES ('19', '碧水葵花籽 128克', '0.01', '999', null, '4', '/product-fry@3.png', '1', null, null, null, '46');
INSERT INTO `xcx_product` VALUES ('20', '碧螺春 12克*3袋', '0.01', '999', null, '6', '/product-tea@2.png', '1', null, null, null, '47');
INSERT INTO `xcx_product` VALUES ('21', '西湖龙井 8克*3袋', '0.01', '998', null, '6', '/product-tea@3.png', '1', null, null, null, '48');
INSERT INTO `xcx_product` VALUES ('22', '梅兰清花糕 1个', '0.01', '997', null, '5', '/product-cake-a@3.png', '1', null, null, null, '54');
INSERT INTO `xcx_product` VALUES ('23', '清凉薄荷糕 1个', '0.01', '998', null, '5', '/product-cake-a@4.png', '1', null, null, null, '55');
INSERT INTO `xcx_product` VALUES ('25', '小明的妙脆角 120克', '0.01', '999', null, '5', '/product-cake@1.png', '1', null, null, null, '52');
INSERT INTO `xcx_product` VALUES ('26', '红衣青瓜 混搭160克', '0.01', '999', null, '2', '/product-dryfruit@8.png', '1', null, null, null, '56');
INSERT INTO `xcx_product` VALUES ('27', '锈色瓜子 100克', '0.01', '998', null, '4', '/product-fry@4.png', '1', null, null, null, '57');
INSERT INTO `xcx_product` VALUES ('28', '春泥花生 200克', '0.01', '999', null, '4', '/product-fry@5.png', '1', null, null, null, '58');
INSERT INTO `xcx_product` VALUES ('29', '冰心鸡蛋 2个', '0.01', '999', null, '7', '/product-rice@5.png', '1', null, null, null, '59');
INSERT INTO `xcx_product` VALUES ('30', '八宝莲子 200克', '0.01', '999', null, '7', '/product-rice@6.png', '1', null, null, null, '14');
INSERT INTO `xcx_product` VALUES ('31', '深涧木耳 78克', '0.01', '999', null, '7', '/product-rice@7.png', '1', null, null, null, '60');
INSERT INTO `xcx_product` VALUES ('32', '土豆 半斤', '0.01', '999', null, '3', '/product-vg@4.png', '1', null, null, null, '66');
INSERT INTO `xcx_product` VALUES ('33', '青椒 半斤', '0.01', '999', null, '3', '/product-vg@5.png', '1', null, null, null, '67');

-- ----------------------------
-- Table structure for xcx_product_image
-- ----------------------------
DROP TABLE IF EXISTS `xcx_product_image`;
CREATE TABLE `xcx_product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联图片表',
  `delete_time` int(11) DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xcx_product_image
-- ----------------------------
INSERT INTO `xcx_product_image` VALUES ('4', '19', null, '1', '11');
INSERT INTO `xcx_product_image` VALUES ('5', '20', null, '2', '11');
INSERT INTO `xcx_product_image` VALUES ('6', '21', null, '3', '11');
INSERT INTO `xcx_product_image` VALUES ('7', '22', null, '4', '11');
INSERT INTO `xcx_product_image` VALUES ('8', '23', null, '5', '11');
INSERT INTO `xcx_product_image` VALUES ('9', '24', null, '6', '11');
INSERT INTO `xcx_product_image` VALUES ('10', '25', null, '7', '11');
INSERT INTO `xcx_product_image` VALUES ('11', '26', null, '8', '11');
INSERT INTO `xcx_product_image` VALUES ('12', '27', null, '9', '11');
INSERT INTO `xcx_product_image` VALUES ('13', '28', null, '11', '11');
INSERT INTO `xcx_product_image` VALUES ('14', '29', null, '10', '11');
INSERT INTO `xcx_product_image` VALUES ('18', '62', null, '12', '11');
INSERT INTO `xcx_product_image` VALUES ('19', '63', null, '13', '11');

-- ----------------------------
-- Table structure for xcx_product_property
-- ----------------------------
DROP TABLE IF EXISTS `xcx_product_property`;
CREATE TABLE `xcx_product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '详情属性名称',
  `detail` varchar(255) NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xcx_product_property
-- ----------------------------
INSERT INTO `xcx_product_property` VALUES ('1', '品名', '杨梅', '11', null, null);
INSERT INTO `xcx_product_property` VALUES ('2', '口味', '青梅味 雪梨味 黄桃味 菠萝味', '11', null, null);
INSERT INTO `xcx_product_property` VALUES ('3', '产地', '火星', '11', null, null);
INSERT INTO `xcx_product_property` VALUES ('4', '保质期', '180天', '11', null, null);
INSERT INTO `xcx_product_property` VALUES ('5', '品名', '梨子', '2', null, null);
INSERT INTO `xcx_product_property` VALUES ('6', '产地', '金星', '2', null, null);
INSERT INTO `xcx_product_property` VALUES ('7', '净含量', '100g', '2', null, null);
INSERT INTO `xcx_product_property` VALUES ('8', '保质期', '10天', '2', null, null);

-- ----------------------------
-- Table structure for xcx_theme
-- ----------------------------
DROP TABLE IF EXISTS `xcx_theme`;
CREATE TABLE `xcx_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '专题名称',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `topic_img_id` int(11) NOT NULL COMMENT '主题图，外键',
  `delete_time` int(11) DEFAULT NULL,
  `head_img_id` int(11) NOT NULL COMMENT '专题列表页，头图',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='主题信息表';

-- ----------------------------
-- Records of xcx_theme
-- ----------------------------
INSERT INTO `xcx_theme` VALUES ('1', '专题栏位一', '美味水果世界', '16', null, '49', null);
INSERT INTO `xcx_theme` VALUES ('2', '专题栏位二', '新品推荐', '17', null, '50', null);
INSERT INTO `xcx_theme` VALUES ('3', '专题栏位三', '做个干物女', '18', null, '18', null);

-- ----------------------------
-- Table structure for xcx_theme_product
-- ----------------------------
DROP TABLE IF EXISTS `xcx_theme_product`;
CREATE TABLE `xcx_theme_product` (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题所包含的商品';

-- ----------------------------
-- Records of xcx_theme_product
-- ----------------------------
INSERT INTO `xcx_theme_product` VALUES ('1', '2');
INSERT INTO `xcx_theme_product` VALUES ('1', '5');
INSERT INTO `xcx_theme_product` VALUES ('1', '8');
INSERT INTO `xcx_theme_product` VALUES ('1', '10');
INSERT INTO `xcx_theme_product` VALUES ('1', '12');
INSERT INTO `xcx_theme_product` VALUES ('2', '1');
INSERT INTO `xcx_theme_product` VALUES ('2', '2');
INSERT INTO `xcx_theme_product` VALUES ('2', '3');
INSERT INTO `xcx_theme_product` VALUES ('2', '5');
INSERT INTO `xcx_theme_product` VALUES ('2', '6');
INSERT INTO `xcx_theme_product` VALUES ('2', '16');
INSERT INTO `xcx_theme_product` VALUES ('2', '33');
INSERT INTO `xcx_theme_product` VALUES ('3', '15');
INSERT INTO `xcx_theme_product` VALUES ('3', '18');
INSERT INTO `xcx_theme_product` VALUES ('3', '19');
INSERT INTO `xcx_theme_product` VALUES ('3', '27');
INSERT INTO `xcx_theme_product` VALUES ('3', '30');
INSERT INTO `xcx_theme_product` VALUES ('3', '31');

-- ----------------------------
-- Table structure for xcx_third_app
-- ----------------------------
DROP TABLE IF EXISTS `xcx_third_app`;
CREATE TABLE `xcx_third_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='访问API的各应用账号密码表';

-- ----------------------------
-- Records of xcx_third_app
-- ----------------------------
INSERT INTO `xcx_third_app` VALUES ('1', 'starcraft', '777*777', 'CMS', '32', 'Super', null, null);

-- ----------------------------
-- Table structure for xcx_user
-- ----------------------------
DROP TABLE IF EXISTS `xcx_user`;
CREATE TABLE `xcx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xcx_user
-- ----------------------------

-- ----------------------------
-- Table structure for xcx_user_address
-- ----------------------------
DROP TABLE IF EXISTS `xcx_user_address`;
CREATE TABLE `xcx_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xcx_user_address
-- ----------------------------
