const express=require("express");
var router=express.Router();
var pool=require("../pool");
var query=require("./query");





router.get("/",(req,res)=>{
  var pid=req.query.pid;
  var output={};
  var sql="SELECT * FROM lol_shop WHERE pid=?";
  pool.query(sql,[pid],(err,result)=>{
    if(err) throw err;
    console.log(result);
    res.send(result);
  })
});




module.exports=router;
//http://localhost:3000/details?lid=3