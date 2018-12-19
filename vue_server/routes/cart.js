const express=require("express");
const router=express.Router();
const pool=require("../pool");


router.get("/add",(req,res)=>{
  var pid=req.query.pid;
  var count=req.query.count;
  var uid=req.session.uid;
  if(uid!==undefined){
    var sql="select * from lol_cart where user_id=? and product_id=?";
    pool.query(sql,[uid,pid],(err,result)=>{
      if(err) console.log(err);
      if(result.length==0){
        var sql="insert into lol_cart values(null,?,?,?)";
        pool.query(sql,[uid,pid,count],(err,result)=>{
          if(err) console.log(err);
          res.send({ok:1,msg:"加入购物车成功!"})
        })
      }else{
        var sql="update lol_cart set count=count+? where user_id=? and product_id=?";
        pool.query(sql,[count,uid,pid],(err,result)=>{
          if(err) console.log(err);
          res.send({ok:1,msg:"更新购物车成功"})
        })
      }
    })
  }else{
    res.send({ok:0,msg:"亲，您还没有登录呢!"})
  }

})

router.get("/items",(req,res)=>{
  var uid=req.session.uid;
  var sql=`select * from lol_cart inner join lol_shop on product_id=pid where user_id=?`;
  pool.query(sql,[uid],(err,result)=>{
    if(err) console.log(err);
    res.writeHead(200);
    res.write(JSON.stringify(result));
    res.end();
  }) 
})

router.get("/update",(req,res)=>{
  var iid=req.query.iid;
  var count=req.query.count;
  if(count>0){
  pool.query("update lol_cart set count=? where iid=?",[count,iid],(err,result)=>{
    if(err) console.log(err);
    res.send(result);
    res.end();
  })
  }else{
    pool.query("delete from lol_cart where iid=?",[iid],(err,result)=>{
      if(err) console.log(err);
      res.send(result);
      res.end();
    })
  }
})

module.exports=router;