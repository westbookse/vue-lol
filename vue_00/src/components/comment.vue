<template>
  <div class="comment-container">
    <hr>
    <!--显示评论的区域-->
    <div class="cmt-list">
      <div class="cmt-item" v-for="(item,i) in list" :key="item.id">
        <div class="cmt-info">第{{i+1}}楼 用户:{{loginstate}} <span>{{item.ctime |  datetimeFilter}}</span></div>
        <div class="cmt-body">{{item.content}}</div>
      </div>
    </div>
    <div style=""class="button-more">
      <mt-button size="normal" type="primary" @click="getMore">更多评论</mt-button>
    </div>
    <div class="cmt-bottom"></div>
    <!--发表评论区域-->
    <div class="comment-bottom">
      <textarea placeholder="请吐槽最多120个字" maxlength="120" v-model="msg" class="show-comment"></textarea>
      <div class="comment-fixed">
        <input type="text" placeholder="我也来说两句" @click="showit">
        <mt-button size="small" type="primary" @click="postComment">发表评论</mt-button>
      </div>
    </div>
  </div>
</template>
<script>
  import {Toast} from "mint-ui"
    export default{
    data(){
      return {
        msg:"",   //双向绑定的用户评论
        pageIndex:0, //当前页码
        pageSize:5,   //页大小
        list:[],       //分页数据
        loginstate:"",
      }
    },
    created(){
      this.getMore();
    },
     methods:{
      showit(){
        $(".comment-fixed>input").toggleClass("show-input");
        $(".comment-bottom>textarea").toggleClass("show-comment1");
      },
      getMore(){
        this.pageIndex++;
        var p=this.pageIndex;
        var s=this.pageSize;
        var id=this.id;
        var url="http://127.0.0.1:3000/postcomment/getcomment?id="+id+"&pno="+p+"&pageSize="+s;
        console.log(p+":"+s+":"+id);
        this.axios.get(url).then(result=>{
         // console.log(result);
          var row=this.list.concat(result.data.data);
          this.list=row;
        });
        $(".comment-fixed>input").toggleClass("show-input");
        $(".comment-bottom>textarea").toggleClass("show-comment1");
      },
      postComment(){
        //1：获取新闻的编号
        var nid=this.id;
        //2：获取评论内容
        var pmsg=this.msg;
        //3：判断新闻评论内容不能为空
        if(pmsg.trim().length==0){
          Toast("评论内容不能为空");
          return;
        }
        //4：发送post请求
        var url="http://127.0.0.1:3000/postcomment";
        this.axios.post(url,Qs.parse({nid:nid,msg:pmsg})).then(result=>{
          console.log(result);
        //5：获取服务器程序返回        
        //6：提示用户"评论成功"
        Toast("发表成功");
        this.msg="";
        //考虑当前页码？
        //清空pageIndex
        this.pageIndex=0;
        this.list=[];
        //考虑list:[]
        this.getMore();
        })
      },
    },
    props:["id"],
    mounted(){
      this.axios.get("http://localhost:3000/users/islogin").then(res=>{
        this.loginstate=res.data.uname;
      })
    }
  }
</script>
<style scoped>
.comment-container{width:100%;}
.comment-container h1{font-size:18px;/*评论组件 h1*/ }
.comment-container textarea{/*评论组件多行文本框*/font-size:14px;/*文字跳小一些*/height:85px;/*高度*/ margin:0;} 
.comment-container .cmt-list{/*评论列表*/margin:5px 0;/*顶部和前面元素间距*/}
.comment-container .cmt-list .cmt-info{line-height:30px;background:#eee;border-bottom:1px solid #ccc;font-size:14px;}
.comment-container .cmt-list .cmt-info>span{float:right;font-size:12px;}
.comment-container .cmt-list .cmt-info:after{content:"";display:block;clear:both;}
.comment-container .cmt-list .cmt-body{line-height:35px;text-indent:2em; }
.cmt-bottom{height:50px;}
.button-more{width:100%;text-align:center;}
.comment-bottom{width:100%;position:fixed;bottom:0px;background:#FFF;}
.show-comment{display:none;}
.show-comment1{display:block !important;}
.show-input{display:none;}
.comment-fixed{padding:10px;}
.comment-fixed>input{width:70%;background:#aae;height:30px;margin-bottom:0px;}.comment-fixed>.mint-button{margin-left:10px;float:right;}
.comment-fixed:after{content:"";display:block;clear:both;}
</style>