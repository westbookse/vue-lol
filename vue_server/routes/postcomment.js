const express=require("express");
var router=express.Router();
var pool=require("../pool");


const qs=require("querystring");//将查询字符串转换为js对象
router.post("/",(req,res)=>{
  //为req对象绑定事件data 客户数据发送成功
  //触发事件
  req.on("data",(buf)=>{
    var str=buf.toString();  //1.将参数转换为字符串
    var obj=JSON.parse(str);    //2.将字符串转为js对象
    var msg=obj.msg;          //3.msg为评论内容
    var nid=parseInt(obj.nid);      //4.nid 新闻编号
    var uid=req.session.uid;
    var sql="INSERT INTO lol_comment(content,user_name,ctime,nid) VALUES(?,?,now(),?)";
    pool.query(sql,[msg,uid,nid],(err,result)=>{
      if(err) throw err;
      res.send({code:1,msg:"添加成功"});
    });
  })
})

//用户获取指定新闻编号所有评论
router.get("/getcomment",(req,res)=>{
  //获取指定新闻编号
  var nid=parseInt(req.query.id);
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  var sql= " select count(id) as c FROM lol_comment";
      sql+= " where nid=?";
  var obj={};
  var progress=0;
  pool.query(sql,[nid],(err,result)=>{
    if(err) throw err;
    var c=Math.ceil(result[0].c/pageSize);
    obj.pageCount=c;
    progress+=50;
    if(progress==100){
      res.send(obj);
    }
  });
  var sql=" select id,content,ctime,user_name";
  sql+=" FROM lol_comment";
  sql+=" WHERE nid=?";
  sql+=" ORDER BY id DESC";
  sql+=" LIMIT ?,?";
  var offset=parseInt((pno-1)*pageSize);
  pageSize=parseInt(pageSize)
  pool.query(sql,[nid,offset,pageSize],(err,result)=>{
    if(err) throw err;
    obj.data=result;
    progress+=50;
    if(progress==100){
      res.send(obj);
    }
  })
})


module.exports=router;