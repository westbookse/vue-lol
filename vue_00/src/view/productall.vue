<template>
  <div class="allproduct-container">
    <mt-header title="最新上架" fixed>
      <router-link to="/product" slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
    <div class="mui-card-content">
      <div v-for="item in list" :key="item.pid" @click="getDetail(item.pid)">
        <img :src="item.img_url">
        <span>{{item.title}}</span>
        <span>售价{{item.price}}点券</span>
      </div>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
      return{
        list:"",
      }
    },
    mounted() {
      this.axios.get(
        "http://localhost:3000/product/shopall"
      ).then(res=>{
        this.list=res.data;
      });
    },
  }
</script>
<style scoped>
.mui-card-content{
  margin-top:50px;
}
.mui-card-content:after{
  content:"";
  display:block;
  clear:both;
}
.mui-card-content>div{
  display:flex;        /*弹性布局*/ 
  flex-direction:column;      /*垂直布局*/ 
  width:49%;         
  float:left;
  position:relative;
  padding-left:5px;
  padding-bottom:5px;
}
.mui-card-content>div>img{
  width:100%;
}
.mui-card-content>div>span:nth-child(2){
  position:absolute;
  bottom:50px;
  color:#fff;
  left:10px;
}
.mui-card-content>div>span:nth-child(3){
  position:absolute;
  bottom:20px;
  color:#D7A144;
  left:10px;
}
</style>