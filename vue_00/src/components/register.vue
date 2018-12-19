<template>
  <div class="register-container">
    <div><img :src="bg.img_url"></div>
    <form action="#">
      用户名:<input type="text" id="uname" v-model="unameval"><br>
      密码:<input type="password" id="upwd" v-model="upwdval"><br>
      <input type="button" class="primary"  id="btn" value="注册" @click.prevent="btnSubmit"><br>
    </form>
  </div>
</template>
<script>
  import {Toast} from "mint-ui";
  export default{
    data(){
      return {
        unameval:"",
        upwdval:"",
        bg:"",
        exuname:"",
      }
    },
    methods:{
      btnSubmit(){
        var u=this.unameval;
        var p=this.upwdval;
        this.axios.post(
          "http://localhost:3000/register/test"
        ).then(res=>{
          for(var i=0;i<res.data.length;i++){
            this.exuname=res.data[i].uname;
            if(this.unameval==this.exuname){
              Toast("该用户名已存在！");
              return;
            }
          }
          if(this.unameval.length>=6 && this.unameval.length<=16){
            if(this.upwdval.length>=6 && this.upwdval.length<=16){
              this.axios.post("http://localhost:3000/register",Qs.stringify({
                uname:u,
                upwd:p,
              })).then(result=>{
              //console.log(result);
                Toast(result.data.msg);
                this.$router.push({path:"/login",query:{uid:result.data.uid}});
              });       
            }else{
              Toast("密码长度不可超过6-16");
              return;
            }
          }else{
            Toast("用户名长度不可超过6-16");
            return;
          }
    
        });  
      },
    },
    mounted() {
    this.axios.get(
      "http://localhost:3000/register/bg"
    ).then(res=>{
      this.bg=res.data[0];
    });  
    },
  }
</script>
<style scoped>
.register-container>div>img{position:relative;width:100%;height:667px;}
.register-container>form{position:absolute;top:170px;left:50px;z-index:10 !important;}
.register-container>form{color:#fff;font-weight:bold;}
.register-container>form>input{color:#000;font-weight:normal;}
</style>