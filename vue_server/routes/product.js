const express=require("express");
var router=express.Router();
var pool=require("../pool");


router.get("/slider",(req,res)=>{
  var sql="SELECT img_url,img_url2 FROM lol_pslider WHERE pid!=0";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.write(JSON.stringify(result));
    res.end();
  })
});

router.get("/shop",(req,res)=>{
  var sql="SELECT pid,img_url,title,price,aprice FROM lol_shop WHERE pid!=0";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.write(JSON.stringify(result));
    res.end();
  })
});

router.get("/shopall",(req,res)=>{
  var sql="SELECT pid,img_url,title,price FROM lol_shopall WHERE pid!=0";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.write(JSON.stringify(result));
    res.end();
  })
});



module.exports=router;