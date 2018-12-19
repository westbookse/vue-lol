const express=require("express");
var router=express.Router();
var pool=require("../pool");


router.get("/",(req,res)=>{
  var sql =`select id,name,val from lol_result where id!=0`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  });
})









module.exports=router;