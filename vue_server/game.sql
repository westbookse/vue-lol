SET NAMES UTF8;
DROP DATABASE IF EXISTS lol;
CREATE DATABASE	lol CHARSET=UTF8;
#1:进入lol库中
USE lol;
CREATE TABLE lol_slider(
 pid  INT PRIMARY KEY AUTO_INCREMENT, 
 img_url VARCHAR(255)
);
INSERT INTO lol_slider VALUES(null,"http://127.0.0.1:3000/img/slider1.jpg");
INSERT INTO lol_slider VALUES(null,"http://127.0.0.1:3000/img/slider2.jpg");
INSERT INTO lol_slider VALUES(null,"http://127.0.0.1:3000/img/slider3.jpg");
INSERT INTO lol_slider VALUES(null,"http://127.0.0.1:3000/img/slider4.jpg");
INSERT INTO lol_slider VALUES(null,"http://127.0.0.1:3000/img/slider5.jpg");

CREATE TABLE lol_pslider(
 pid  INT PRIMARY KEY AUTO_INCREMENT, 
 img_url VARCHAR(255),
 img_url2	VARCHAR(255)
);
INSERT INTO lol_pslider VALUES(null,"http://127.0.0.1:3000/img/product1.jpg","http://127.0.0.1:3000/img/product1-small.jpg");
INSERT INTO lol_pslider VALUES(null,"http://127.0.0.1:3000/img/product2.jpg","http://127.0.0.1:3000/img/product2-small.jpg");
INSERT INTO lol_pslider VALUES(null,"http://127.0.0.1:3000/img/product3.jpg","http://127.0.0.1:3000/img/product3-small.jpg");
INSERT INTO lol_pslider VALUES(null,"http://127.0.0.1:3000/img/product4.jpg","http://127.0.0.1:3000/img/product4-small.jpg");
INSERT INTO lol_pslider VALUES(null,"http://127.0.0.1:3000/img/product5.jpg","http://127.0.0.1:3000/img/product5-small.jpg");

CREATE TABLE lol_shop(
 pid  INT PRIMARY KEY AUTO_INCREMENT, 
 img_url VARCHAR(255),
 title VARCHAR(255),
 price INT,
 aprice INT,
 ctime DATETIME
);
INSERT INTO lol_shop VALUES(null,"http://127.0.0.1:3000/img/shop1.jpg","冬境仙灵 妮蔻 炫彩皮肤礼包",15604,19519,now());
INSERT INTO lol_shop VALUES(null,"http://127.0.0.1:3000/img/shop2.jpg","持胡萝卜的雪人 易 炫彩皮肤礼包",12721,13221,now());
INSERT INTO lol_shop VALUES(null,"http://127.0.0.1:3000/img/shop3.jpg","冬境仙灵 索拉卡 炫彩皮肤礼包",12721,13221,now());

CREATE TABLE lol_shopall(
 pid  INT PRIMARY KEY AUTO_INCREMENT, 
 img_url VARCHAR(255),
 title VARCHAR(255),
 price INT
);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all1.jpg","冬境仙灵 妮蔻",69);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all2.jpg","持胡萝卜的雪人  易",79);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all3.jpg","冬境仙灵 索拉卡",79);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all4.jpg","冰封王子 蒙多",79);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all5.jpg","狂心冰王 图奇",79);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all6.jpg","圣诞老人 德莱文",129);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all7.jpg","圣诞捣蛋鬼 金克斯",129);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all8.jpg","冰雪驯鹿 波比",129);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all9.jpg","冰雪节 格雷福斯",79);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all10.jpg","圣诞老人 布隆",79);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all11.jpg","冬季仙境 卡尔玛",79);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all12.jpg","冰雪游神 巴德",69);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all13.jpg","雪兽 纳尔",79);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all14.jpg","冰雪女神 辛德拉",79);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all15.jpg","魄罗骑士 瑟庄妮",99);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all16.jpg","冰雪节 马尔扎哈",99);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all17.jpg","冬季仙境 奥利安娜",99);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all18.jpg","寒冬精灵 露露",99);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all19.jpg","冰雪风暴 希维尔",99);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all20.jpg","冰雪节 辛吉德",99);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all21.jpg","幸福女神 乐芙兰",89);
INSERT INTO lol_shopall VALUES(null,"http://127.0.0.1:3000/img/shop-all22.jpg","平安夜女神 娑娜",99);



#2:创建新闻表
CREATE TABLE lol_news(
 nid  INT PRIMARY KEY AUTO_INCREMENT, 
 title VARCHAR(128),
 comment	INT,
 img_url VARCHAR(255),
 poster VARCHAR(20)
);
#now() 当前数据库时间 年月日时分秒
INSERT INTO lol_news VALUES(null,'2分钟视频带你看2019季前赛',40000,
"http://127.0.0.1:3000/img/news1.jpg","官方");
INSERT INTO lol_news VALUES(null,"英雄预告：万花通灵-妮寇看到一样的英雄？",42020,
"http://127.0.0.1:3000/img/news2.jpg","官方");
INSERT INTO lol_news VALUES(null,"迎接日蚀之光 | 日蚀骑士蕾欧娜皮肤预告",4100,
"http://127.0.0.1:3000/img/news3.jpg","官方");
INSERT INTO lol_news VALUES(null,"全球总决赛纪录片：《英雄，登峰造极境》",54200,
"http://127.0.0.1:3000/img/news4.jpg","官方赛事中心");
INSERT INTO lol_news VALUES(null,"不怕神一样的对手 就怕连猪都不如的队友",7200,
"http://127.0.0.1:3000/img/news5.jpg","大电竞");
INSERT INTO lol_news VALUES(null,"版本实验室01：黑暗收割vs电刑谁能赢 揭秘新版本最强符文",4200,
"http://127.0.0.1:3000/img/news6.jpg","英雄联盟实验室");
INSERT INTO lol_news VALUES(null,"高分局上分必用的中单英雄，克制一切花里胡哨！亚索完全滑不动",41200,
"http://127.0.0.1:3000/img/news7.jpg","官方");
INSERT INTO lol_news VALUES(null,"新英雄预告：那是什么？眨眼就可能会错过它哦",5500,
"http://127.0.0.1:3000/img/news8.jpg","官方");
INSERT INTO lol_news VALUES(null,"K/DA 阿卡丽免费追加夜光涂鸦效果展示",7700,
"http://127.0.0.1:3000/img/news9.jpg","官方");
INSERT INTO lol_news VALUES(null,"全球总决赛纪录片《英雄，登峰造极境》预告",11500,
"http://127.0.0.1:3000/img/news10.jpg","大咖");
INSERT INTO lol_news VALUES(null,"2019季前赛新符文碎片搭配指南",35700,
"http://127.0.0.1:3000/img/news11.jpg","大神中心");
INSERT INTO lol_news VALUES(null,"今日神操作：阿狸极限走位独领风骚  轻松反杀拿下四杀",9200,
"http://127.0.0.1:3000/img/news12.jpg","电竞虎");
INSERT INTO lol_news VALUES(null,"主播神操作：烬精准预判下路两人  完美完成双杀",4200,
"http://127.0.0.1:3000/img/news13.jpg","暴龙电竞");
INSERT INTO lol_news VALUES(null,"联盟赛事之击杀一刻：EDGiboy闪现躲掉EZ大招，反杀佐伊",36400,
"http://127.0.0.1:3000/img/news14.jpg","官方");
INSERT INTO lol_news VALUES(null,"璐璐-睡衣守护者-暂译皮肤效果展示",4200,
"http://127.0.0.1:3000/img/news15.jpg","官方");
INSERT INTO lol_news VALUES(null,"英雄预告：万花通灵-妮寇看到一样的英雄？",4200,
"http://127.0.0.1:3000/img/news1.jpg","官方");
INSERT INTO lol_news VALUES(null,"英雄预告：万花通灵-妮寇看到一样的英雄？",4200,
"http://127.0.0.1:3000/img/news2.jpg","官方");
INSERT INTO lol_news VALUES(null,"英雄预告：万花通灵-妮寇看到一样的英雄？",4200,
"http://127.0.0.1:3000/img/news3.jpg","官方");
INSERT INTO lol_news VALUES(null,"英雄预告：万花通灵-妮寇看到一样的英雄？",4200,
"http://127.0.0.1:3000/img/news4.jpg","官方");
INSERT INTO lol_news VALUES(null,"英雄预告：万花通灵-妮寇看到一样的英雄？",4200,
"http://127.0.0.1:3000/img/news5.jpg","官方");

CREATE TABLE lol_info(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(55),
	ctime DATETIME,
	img_url1 VARCHAR(255),
	img_url2 VARCHAR(255),
	img_url3 VARCHAR(255),
	img_url4 VARCHAR(255),
	img_url5 VARCHAR(255),
	section1 VARCHAR(255),
	section2 VARCHAR(255),
	section3 VARCHAR(255),
	section4 VARCHAR(255),
	section5 VARCHAR(255),
	section6 VARCHAR(255),
	section7 VARCHAR(255),
	section8 VARCHAR(255),
	section9 VARCHAR(255),
	section10 VARCHAR(255)
);
INSERT INTO lol_info VALUES(null,"中路三大后起之秀 蛇女成版本中期黑马",now(),
"http://127.0.0.1:3000/img/info1-1.jpg","http://127.0.0.1:3000/img/info1-2.jpg",
"http://127.0.0.1:3000/img/info1-3.jpg","http://127.0.0.1:3000/img/info1-4.jpg",
"http://127.0.0.1:3000/img/info1-5.jpg","8.23版本即将迎来尾声!随着版本的进行，各种英雄的胜率也是此起彼伏。
今天小编就来为各位盘点一下","8.23版本三大后起之秀!新版本的最大黑马赢家!","魔蛇之拥","新版本最大黑马绝对非魔蛇之拥卡
西奥佩娅莫属!</span>版本初期默默无闻的她在版本中期一举冲到T1级别的最顶端!对版本热门英雄无与伦比的压制力让蛇女在新版本
几乎没有天敌!团战与对线都毫无缺陷的她绝对是各位上分玩家们的最好选择!","技能升级顺序推荐：","主Q副W，有R点R。","符文推荐：",
"主系巫术系：奥术彗星：蛇女对线期可以轻松触发奥术彗星进而大幅度提升对线消耗能力。法力流系带：给予蛇女额外的回蓝能力。绝对专注：
给予蛇女在高血量时更高的伤害。焦灼：消耗型英雄必备。副系主宰系：恶意中伤：蛇女繁多的减速技能可以轻松触发特效。贪欲猎手：给予蛇女额外的吸血能力。
属性碎片：2法强+1血量","装备推荐：","蛇女的第一个大件可以选择卢登的回声，也可以选择大天使之杖。前者有着着更强的前中期作战能力，后者则可以给予蛇女
中后期源源不断的法力值，自行斟酌即可。蛇女属于持续伤害型英雄，因此冰杖面具绝对是卡西奥佩娅必不可少的。最后做出金身和帽子等功能型装备即可。");
INSERT INTO lol_info VALUES(null,"中路三大后起之秀 蛇女成版本中期黑马",now(),
"http://127.0.0.1:3000/img/info1-1.jpg","http://127.0.0.1:3000/img/info1-2.jpg",
"http://127.0.0.1:3000/img/info1-3.jpg","http://127.0.0.1:3000/img/info1-4.jpg",
"http://127.0.0.1:3000/img/info1-5.jpg","8.23版本即将迎来尾声!随着版本的进行，各种英雄的胜率也是此起彼伏。
今天小编就来为各位盘点一下","8.23版本三大后起之秀!新版本的最大黑马赢家!","魔蛇之拥","新版本最大黑马绝对非魔蛇之拥卡
西奥佩娅莫属!</span>版本初期默默无闻的她在版本中期一举冲到T1级别的最顶端!对版本热门英雄无与伦比的压制力让蛇女在新版本
几乎没有天敌!团战与对线都毫无缺陷的她绝对是各位上分玩家们的最好选择!","技能升级顺序推荐：","主Q副W，有R点R。","符文推荐：",
"主系巫术系：奥术彗星：蛇女对线期可以轻松触发奥术彗星进而大幅度提升对线消耗能力。法力流系带：给予蛇女额外的回蓝能力。绝对专注：
给予蛇女在高血量时更高的伤害。焦灼：消耗型英雄必备。副系主宰系：恶意中伤：蛇女繁多的减速技能可以轻松触发特效。贪欲猎手：给予蛇女额外的吸血能力。
属性碎片：2法强+1血量","装备推荐：","蛇女的第一个大件可以选择卢登的回声，也可以选择大天使之杖。前者有着着更强的前中期作战能力，后者则可以给予蛇女
中后期源源不断的法力值，自行斟酌即可。蛇女属于持续伤害型英雄，因此冰杖面具绝对是卡西奥佩娅必不可少的。最后做出金身和帽子等功能型装备即可。");
INSERT INTO lol_info VALUES(null,"中路三大后起之秀 蛇女成版本中期黑马",now(),
"http://127.0.0.1:3000/img/info1-1.jpg","http://127.0.0.1:3000/img/info1-2.jpg",
"http://127.0.0.1:3000/img/info1-3.jpg","http://127.0.0.1:3000/img/info1-4.jpg",
"http://127.0.0.1:3000/img/info1-5.jpg","8.23版本即将迎来尾声!随着版本的进行，各种英雄的胜率也是此起彼伏。
今天小编就来为各位盘点一下","8.23版本三大后起之秀!新版本的最大黑马赢家!","魔蛇之拥","新版本最大黑马绝对非魔蛇之拥卡
西奥佩娅莫属!</span>版本初期默默无闻的她在版本中期一举冲到T1级别的最顶端!对版本热门英雄无与伦比的压制力让蛇女在新版本
几乎没有天敌!团战与对线都毫无缺陷的她绝对是各位上分玩家们的最好选择!","技能升级顺序推荐：","主Q副W，有R点R。","符文推荐：",
"主系巫术系：奥术彗星：蛇女对线期可以轻松触发奥术彗星进而大幅度提升对线消耗能力。法力流系带：给予蛇女额外的回蓝能力。绝对专注：
给予蛇女在高血量时更高的伤害。焦灼：消耗型英雄必备。副系主宰系：恶意中伤：蛇女繁多的减速技能可以轻松触发特效。贪欲猎手：给予蛇女额外的吸血能力。
属性碎片：2法强+1血量","装备推荐：","蛇女的第一个大件可以选择卢登的回声，也可以选择大天使之杖。前者有着着更强的前中期作战能力，后者则可以给予蛇女
中后期源源不断的法力值，自行斟酌即可。蛇女属于持续伤害型英雄，因此冰杖面具绝对是卡西奥佩娅必不可少的。最后做出金身和帽子等功能型装备即可。");


CREATE TABLE lol_pics(
 pid  INT PRIMARY KEY AUTO_INCREMENT, 
 img_url VARCHAR(255),
 title VARCHAR(255)
);
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery1.jpg","女生 女");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery2.jpg","千珏 永猎双子 打野 男");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery3.jpg","狐狸 阿狸 中单 女");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery4.jpg","女生 女");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery5.jpg","探险家 ADC 中单 男");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery6.jpg","阿卡丽 中单 上单 女");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery7.jpg","寒冰 ADC 女");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery8.jpg","剑姬 上单 女");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery9.jpg","霞洛 下路");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery10.jpg","锤石 辅助 男");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery11.jpg","众星之子 辅助 女");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery12.jpg","女 中单 ADC 妮寇");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery13.jpg","赏金猎人 ADC 女");
INSERT INTO lol_pics VALUES(null,"http://127.0.0.1:3000/img/gallery14.jpg","纳尔 上单 男 可爱");
#用户登录表
CREATE TABLE lol_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25),
  upwd  VARCHAR(32),
	user_name VARCHAR(128),
	avatar VARCHAR(255)
);
#通用加密算法md5 对称加密算法 散列算法
#单向加密
#多次循环加密
#通行解决方案:
#强制用户密码超过12位,
#大写字母小写字母数字特殊字符 
INSERT INTO lol_user VALUES(null,'dingding',md5('123456'),'丁春秋',"http://127.0.0.1:3000/img/avatar1.jpg");
INSERT INTO lol_user VALUES(null,'dangdang',md5('123456'),'当当喵',"http://127.0.0.1:3000/img/avatar2.jpg");
INSERT INTO lol_user VALUES(null,'yaya',md5('123456'),'秦小雅',"http://127.0.0.1:3000/img/avatar3.jpg");

CREATE TABLE lol_loginbg(
  bid INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255)
);
INSERT INTO lol_loginbg VALUES(null,"http://127.0.0.1:3000/img/login-bg.jpg");

CREATE TABLE lol_regbg(
  rid INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255)
);
INSERT INTO lol_regbg VALUES(null,"http://127.0.0.1:3000/img/hero-cover2.png");



CREATE TABLE lol_result(
  id  INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(25),
	val INT
);
INSERT INTO lol_result VALUES(null,"击杀",70);
INSERT INTO lol_result VALUES(null,"生存",60);
INSERT INTO lol_result VALUES(null,"助攻",80);
INSERT INTO lol_result VALUES(null,"物理",40);
INSERT INTO lol_result VALUES(null,"魔法",90);
INSERT INTO lol_result VALUES(null,"金钱",80);
INSERT INTO lol_result VALUES(null,"防御",60);


CREATE TABLE lol_hero(
  id  INT PRIMARY KEY AUTO_INCREMENT,
	img_url VARCHAR(255)
);
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero1.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero2.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero3.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero4.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero5.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero6.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero7.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero8.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero9.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero10.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero11.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero12.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero13.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero14.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero15.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero16.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero17.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero18.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero19.png");
INSERT INTO lol_hero VALUES(null,"http://127.0.0.1:3000/img/hero20.png");

CREATE TABLE lol_pifu(
	id  INT PRIMARY KEY AUTO_INCREMENT,
	img_url VARCHAR(255)
);
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu1.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu2.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu3.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu4.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu5.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu6.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu7.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu8.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu9.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu10.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu11.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu12.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu13.jpg");
INSERT INTO lol_pifu VALUES(null,"http://127.0.0.1:3000/img/pifu14.jpg");


#创建评论信息表
CREATE TABLE lol_comment(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nid INT,
	ctime DATETIME,
	content VARCHAR(100),
	user_name VARCHAR(25)
);
INSERT INTO lol_comment VALUES(null,1,now(),'111','dingding');
INSERT INTO lol_comment VALUES(null,1,now(),'112','dingding');
INSERT INTO lol_comment VALUES(null,1,now(),'113','dingding');
INSERT INTO lol_comment VALUES(null,1,now(),'114','dingding');
INSERT INTO lol_comment VALUES(null,1,now(),'115','dingding');
INSERT INTO lol_comment VALUES(null,1,now(),'116','dingding');
INSERT INTO lol_comment VALUES(null,1,now(),'117','dingding');
INSERT INTO lol_comment VALUES(null,1,now(),'118','dingding');
INSERT INTO lol_comment VALUES(null,1,now(),'119','dingding');

INSERT INTO lol_comment VALUES(null,2,now(),'211','dangdang');
INSERT INTO lol_comment VALUES(null,2,now(),'212','dangdang');
INSERT INTO lol_comment VALUES(null,2,now(),'213','dangdang');
INSERT INTO lol_comment VALUES(null,2,now(),'214','dangdang');
INSERT INTO lol_comment VALUES(null,2,now(),'215','dangdang');
INSERT INTO lol_comment VALUES(null,2,now(),'216','dangdang');
INSERT INTO lol_comment VALUES(null,2,now(),'217','dangdang');
INSERT INTO lol_comment VALUES(null,2,now(),'218','dangdang');
INSERT INTO lol_comment VALUES(null,2,now(),'219','dangdang');


CREATE TABLE lol_cart(
	iid  INT PRIMARY KEY AUTO_INCREMENT, 
	user_id		INT,
	product_id INT,
	count INT
);
INSERT INTO lol_cart VALUES(null,1,1,2);

