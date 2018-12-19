const express=require("express");
var router=express.Router();
var pool=require("../pool");


router.get("/bg",(req,res)=>{
  var sql="SELECT img_url FROM lol_loginbg WHERE bid=1";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.write(JSON.stringify(result));
    res.end();
  })
});

//登录功能
router.get("/signin",(req,res)=>{
  //1:参数
  var uname=req.query.uname;
  var upwd=req.query.upwd;
  //2:正则表达式
  //3:sql
  var sql=" SELECT count(id) as c from lol_user";
  sql+=" WHERE uname=? AND upwd=md5(?)";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err) throw err;
    if(result[0].c==0){
      res.send({code:-1,msg:"用户名或密码错误"});
    }else{
      res.send({code:1,msg:"登录成功"})
    }
  }) 
  //4:json
})


module.exports=router;