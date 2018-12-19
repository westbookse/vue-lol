<template>
  <div class="details-container">
    <mt-header :title="list.title" fixed>
      <router-link to="/product" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <mt-button class="mui-icon mui-icon-extra mui-icon-extra-cart" slot="right" @click="comecart">
        <span class="mycount">
          {{this.$store.state.count}}
        </span>    
      </mt-button>
    </mt-header>
    <div class="details-all">
      <img class="details-img" :src="list.img_url">
      <div>{{list.title}}</div>
      <div>点券{{list.price}} &nbsp; ￥{{list.price/100}}</div>
      <div>上架时间{{list.ctime | datetimeFilter}}</div>
      <div>
        购买数量：
        <div class="mui-numbox" data-numbox-min='1' data-numbox-max='9'>
          <button class="mui-btn mui-btn-numbox-minus" type="button" @click="goodSub">-</button>
          <input id="test" class="mui-input-numbox" type="number" value="1" v-model="val" />
          <button class="mui-btn mui-btn-numbox-plus" type="button" @click="goodAdd">+</button>
        </div>
      </div>  
    </div>
    <div class="details-bottom">
      <mt-button size="small">赠送</mt-button>
      <mt-button type="danger" size="small" @click="addCartTo()">加入购物车</mt-button>
      <mt-button type="primary" size="small">立即购买</mt-button>
    </div>  
  </div>
</template>
<script>
  import {Toast} from "mint-ui";
  export default{
    data(){
      return {
        list:[],val:1,
      }
    },
    methods:{
      goodAdd(){
        if(this.val<999){
          this.val++;
        }
      },
      goodSub(){
        if(this.val>1){
          this.val--;
        }
      },
      comecart(){
        this.$router.push("/cart");
      },
      addCartTo(){
        //console.log("添加至购物车");
        //console.log(this.$route.params.pid);
        //1.将商品编号和数量和保存服务器
        //1.1获取商品编号
        var pid=this.$route.params.pid;
        //1.2获取商品数量
        var count=this.val;
        //console.log(pid,count);
        //1.3发送请求
        this.axios.get("http://localhost:3000/cart/add?pid="+this.pid,{params:{count:this.val}}).then(result=>{
          console.log(result);
          if(result.data.code==1){
            this.$store.commit("increment",count);
            Toast(result.data.msg);
          }else{
            Toast(result.data.msg);
          }
        });
        //2.更新购物车组件数量
        location.reload();
      }
    },
    props:["pid"],
    mounted(){
      this.axios.get("http://localhost:3000/details",{params:{pid:this.pid}}).then(res=>{
        //console.log(res);
        this.list=res.data[0];
      });
      this.axios.get("http://localhost:3000/cart/items").then(res=>{
        this.cartlist=res.data;
        var count=0;
        for(var i=0; i<this.cartlist.length;i++){
          count+=this.cartlist[i].count;
        }
        console.log(this.cartlist);
        console.log(count);
        this.$store.commit("increment",count);
      });
    },
  }
</script>
<style scoped>
.details-container{
  width:100%;
}
.mint-button{
  font-size:20px;
  position:relative;
  width:50px;
  color:#CB842C;
  font-weight:bold;
}
.mycount{
    font-size: 10px;
    background: red;
    display:block;
    height:18px;
    width:18px;
    border-radius:50%;
    line-height:18px;
    position:absolute;
    top:2px;
    left:24px;
    color:#fff;
    font-weight:normal;
}

.details-all{
  margin-top:50px;
  width:100%;
  background:#111;
}
.details-img{
  width:100%;
  height:400px;
}
.details-all>div{
  color:#fff;
  text-align:center;
}
.details-all>div:nth-child(4){
  font-size:12px;
  color:#ccc;
}
#test{color:#000;}

.details-bottom{
  width:100%;
  position:fixed;
  bottom:0px;
  display:flex;
}
.details-bottom>.mint-button{
  flex:1;
}
/*pc*/ 
@media screen and (min-width:992px){
  .details-img{
    width:100%;
    height:600px;
  }
}
/*pad*/
@media screen and (max-width:991px) and (min-width:768px){

}   

/*phone*/
@media screen and (max-width:767px){

}

</style>