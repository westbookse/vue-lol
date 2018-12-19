const express=require("express");
var router=express.Router();
var pool=require("../pool");

router.get("/",(req,res)=>{
  var sql="SELECT img_url FROM lol_slider WHERE pid!=0";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.write(JSON.stringify(result));
    res.end();
  })
});

router.get("/pic",(req,res)=>{
  var sql="SELECT img_url FROM lol_pics WHERE pid!=0";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.write(JSON.stringify(result));
    res.end();
  })
});


router.get("/news",(req,res)=>{
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  var sql="select count(nid) as c from lol_news";
  var obj={}; //保存发送客户端数据
  var progress=0; //进度
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    var c=Math.ceil(result[0].c/pageSize);
    obj.pageCount=c;
    progress+=50;
    if(progress==100){
      res.send(obj);
      return;
    }
  })
  var sql=" select nid,title,img_url,comment,poster";
  sql+=" from lol_news";
  sql+=" limit ?,?"; 
  var offset=parseInt((pno-1)*pageSize);
  pageSize=parseInt(pageSize);
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err) throw err;
    //console.log(result);
    obj.data=result;
    progress+=50;
    if(progress==100){
      res.send(obj);
      return;
    }
  })
});















module.exports=router;