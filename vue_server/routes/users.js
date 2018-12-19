const express=require("express")
const router=express.Router()
const pool=require("../pool")


router.get("/bg",(req,res)=>{
  var sql="SELECT img_url FROM lol_loginbg WHERE bid=1";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.write(JSON.stringify(result));
    res.end();
  })
});

router.post("/signin",(req,res)=>{
  var uname=req.body.uname;
  var upwd=req.body.upwd;
  console.log(uname,upwd);
  pool.query(
    "select * from lol_user where uname=? and upwd=md5(?)",
    [uname,upwd],
    (err,result)=>{
      if(err) throw err;
      if(result.length>0){
        res.writeHead(200,{
          "Content-Type":"application/json;charset=utf-8",
        });
        var user=result[0];
        req.session.uid=user.uid;
        console.log(req.session.uid);
        res.write(JSON.stringify({
          ok:1,
          msg:"用户登录成功！",
          uid:req.session.uid
        }))
      }else{
        res.write(JSON.stringify({
          ok:0,
          msg:"用户名或密码错误！"
        }))
      }
      res.end();
    } 
  )
})
router.get("/islogin",(req,res)=>{

  if(req.session.uid===undefined){
    res.write(JSON.stringify({ok:0}))
    res.end()
  }else{
    var uid=req.session.uid;
    var sql="select * from lol_user where uid=?"
    pool.query(sql,[uid],(err,result)=>{
      if(err) console.log(err);
      var user=result[0];
      res.write(JSON.stringify({
        ok:1,uname:user.uname,avatar:user.avatar
      }))
      res.end()
    })
  }
})

router.get("/signout",(req,res)=>{
  req.session["uid"]=undefined;
  res.end();
})

















module.exports=router;