const express=require("express");
var router=express.Router();
var pool=require("../pool");


router.get("/",(req,res)=>{
  var sql="SELECT * FROM lol_info WHERE id!=0";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.write(JSON.stringify(result));
    res.end();
  })
});



module.exports=router;