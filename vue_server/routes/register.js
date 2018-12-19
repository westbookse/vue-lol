const express=require("express")
const router=express.Router()
const pool=require("../pool")

router.get("/bg",(req,res)=>{
  var sql="SELECT img_url FROM lol_regbg WHERE rid=1";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.write(JSON.stringify(result));
    res.end();
  })
});

router.post("/test",(req,res)=>{
  var sql="select uname from lol_user where uid!=0";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})


router.post("/",(req,res)=>{
  var uname=req.body.uname;
  var upwd=req.body.upwd;
    var sql="insert into lol_user VALUES(null,?,md5(?),null,'http://127.0.0.1:3000/img/default.png')";
    pool.query(sql,[uname,upwd],(err,result)=>{
      if(err) throw err;
      res.writeHead(200,{
        "Content-Type":"application/json;charset=utf-8",
      });
      res.write(JSON.stringify({
        ok:1,
        msg:"用户注册成功",
      }));      
      res.end();
    })
})









module.exports=router;