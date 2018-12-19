<template>
  <div class="login-container">
    <div><img :src="bg.img_url"></div>
    <form action="#">
      用户名:<input type="text" id="uname" v-model="unameval"><br>
      密码:<input type="password" id="upwd" v-model="upwdval"><br>
      <input type="button" class="primary"  id="btn" value="登录" @click.prevent="btnSubmit"><br>
    </form>
    <div class="other-login">
      <span class="mui-icon mui-icon-weibo"></span>
      <span class="mui-icon mui-icon-weixin"></span>
      <span class="mui-icon mui-icon-qq"></span>
    </div>  
  </div>
</template>

<script>
  import {Toast} from "mint-ui";
  export default{
    data(){return {
      unameval:"",
      upwdval:"",
      bg:"",
    }},
    mounted(){
    this.axios.get(
      "http://localhost:3000/users/bg"
    ).then(res=>{
      this.bg=res.data[0];
    });
    },
    methods:{
      btnSubmit(){
        var u=this.unameval;
        var p=this.upwdval;
        if(this.unameval.length>=6 ||this.unameval.length<=16){
          if(this.upwdval.length>=6 || this.upwdval.length<=16){
            this.axios.post("http://localhost:3000/users/signin",Qs.stringify({
              uname:u,
              upwd:p,
            })).then(result=>{
              //console.log(result);
              if(result.data.ok==1){
                Toast(result.data.msg);
                this.$router.push({path:"/",query:{uid:result.data.uid}});
              }else{
                Toast("用户名不存在或密码错误");
              }
            });
          }else{
            Toast("密码长度不可超过6-16");
          }
        }else{
          Toast("用户名长度不可超过6-16");
        }

      },
    }
  }
</script>
<style scoped>
.login-container{background:#FCEB8F;}
.login-container>div>img{position:relative;width:100%;height:667px;}
.login-container>form{position:absolute;top:170px;left:50px;z-index:10 !important;}
.login-container>form{color:#fff;font-weight:bold;}
.login-container>form>input{color:#000;font-weight:normal;}
.login-container>.other-login{position:absolute;z-index:1;top:400px;left:100px;}
.login-container>.other-login>span{padding:30px 20px;color:#ccc;font-size:30px;}
.primary{width:80%;text-align:center;margin:auto;background:#397EFB;border:1px solid #397EFB;}
</style>