//app.js
//1:加载模块
const express = require("express");
const session=require("express-session");
var pool=require("./pool");
const bodyParser=require('body-parser');



/*引入路由模块*/
var index=require("./routes/index");
var users=require("./routes/users");
var product=require("./routes/product");
var echarts=require("./routes/echarts");
var hero=require("./routes/hero");
var pifu=require("./routes/pifu");
var postcomment=require("./routes/postcomment");
var newsinfo=require("./routes/newsinfo");
var pics=require("./routes/pics");
var details=require("./routes/details");
var cart=require("./routes/cart");
var register=require("./routes/register");
//2:创建express对象
var app = express();
//服务器node.js 允许跨域访问配置项
//2.1:引入跨域模块   
const cors = require("cors");



//2.2:配置允许哪个程序跨域访问 脚手架   11:16
app.use(cors({
  origin:[
    "http://127.0.0.1:8080","http://localhost:8080"],
  credentials:true
}))

//3:指定静态目录
//服务器指定目录 绝对路径 出错
app.use(express.static(__dirname+"/public"));

//4:绑定监听端口
app.listen(3000);

app.use(bodyParser.urlencoded({extended:false}));
app.use(session({
  secret:'随机字符串',
  cookie:{maxAge:60*1000*30},//过期时间ms
  resave:false,
  saveUninitialized:true
}));//将服务器的session，放在req.session中

/*使用路由器来管理路由*/

app.use("/index",index);
app.use("/users",users);
app.use("/product",product);
app.use("/echarts",echarts);
app.use("/hero",hero);
app.use("/pifu",pifu);
app.use("/postcomment",postcomment);
app.use("/newsinfo",newsinfo);
app.use("/pics",pics);
app.use("/details",details);
app.use("/cart",cart);
app.use("/register",register);




















