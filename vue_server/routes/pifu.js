const express=require("express");
var router=express.Router();
var pool=require("../pool");


router.get("/",(req,res)=>{
  var sql="SELECT img_url FROM lol_pifu WHERE id!=0";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.write(JSON.stringify(result));
    res.end();
  })
});

router.get("/count1",(req,res)=>{
  var sql =`select count(id) as c from lol_pifu`;
  pool.query(sql,(err,result)=>{
    if (err) throw err;
    res.send(result);
  })
})


module.exports=router;