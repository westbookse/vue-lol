<template>
  <div class="product-container">
    <product1></product1>
    <!--轮播图 2:-->
    <mt-swipe :auto="4000">
      <mt-swipe-item v-for="item in list" :key="item.pid">
        <img :src="item.img_url">
        <img :src="item.img_url2" class="my-slider">
      </mt-swipe-item>
    </mt-swipe>
    <div class="mui-card">
      <!--页眉，放置标题-->
      <div class="mui-card-header">
        <span>最新上架</span>
        <span @click="getall">全部<i class="mui-icon mui-icon-forward"></i></span>
      </div>
      <!--内容区-->
      <div class="mui-card-content">
        <div v-for="item in list2" :key="item.pid" @click="getDetail(item.pid)">
          <img :src="item.img_url">
          <span>{{item.title}}</span>
          <span>售价{{item.price}}点券</span>
          <span>(含英雄价{{item.aprice}}点券)</span>
        </div>

      </div>

    </div>

  </div>
</template>
<script>
import product1 from '@/components/product1.vue';
  export default{
    data(){return{
      list:[],
      list2:[]
    }},
    mounted(){
      this.axios.get(
        "http://localhost:3000/product/slider"
      ).then(res=>{
        this.list=res.data;
      });
      this.axios.get(
        "http://localhost:3000/product/shop"
      ).then(res=>{
        this.list2=res.data;
      });
    },
    methods:{
      getDetail(pid){
        //参数： 商品id
        console.log(pid);
        this.$router.push("/details/"+pid);
      },
      getall(){
        this.$router.push("/productall");
      }
    },
    components:{product1},
  }
</script>
<style scoped>
.product-container{
  background: url(../../static/img/product_bg.jpg) no-repeat 50% 0;
  position:relative;
}
.my-slider{
  width:50% !important;
  position:absolute;
  top:10px;
  right:0px;
}
/*图片轮播设置高度*/ 
.product-container .mint-swipe{height:150px;}
.product-container .mint-swipe img{width:100%;}

.mui-card-header>span:nth-child(2){
  color:#aaa;
}
.mui-card-content{
  display:flex;                   /*弹性布局*/ 
}
.mui-card-content>div{
  display:flex;                   /*弹性布局*/ 
  flex-direction:column;          /*垂直布局*/ 
}
.mui-card-content>div>img{
  width:100%;
}
.mui-card-content>div>span{
  text-align:center;
  font-size:12px;
}
.mui-card-content>div>span:nth-child(2){
  color:#20315E;
}
.mui-card-content>div>span:nth-child(3){
  color:#D7A144;
}



/*pc*/
@media screen and (min-width:992px){
  .product-container .mint-swipe{height:400px;}
}
/*pad*/
@media screen and (max-width:991px) and (min-width:768px){
  .product-container .mint-swipe{height:300px;}
}   

/*phone*/
@media screen and (max-width:767px){

}

</style>