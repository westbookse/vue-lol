<template>
  <div class="product-nav">
    <span><img :src="this.$store.state.avatar"></span>
    <div class="search">
      <input type="text" placeholder="搜索你想要的商品" v-model="kw"><i class="mint-toast-icon mintui mintui-search"></i>
    </div>
    <span class="mui-icon mui-icon-extra mui-icon-extra-cart" @click="mycart">
      <span class="mui-badge">
        {{this.$store.state.count}}
      </span>
    </span>
  </div>
</template>
<script>

  export default{
    data:function(){
      return {
      kw:""
      }
    },
    methods:{
      mycart(){
        this.$router.push("/cart");
      }
    },
    mounted(){
      this.axios.get("http://localhost:3000/users/islogin").then(res=>{
      if(res.data.ok==1){
        this.$store.commit("signin",res.data.avatar);
      }else{
        this.$store.commit("signout");
      }
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
.product-nav{

}
.product-nav>span>img{width:30px;}
.product-nav>span:nth-child(3){float:right;margin-top:20px;margin-right:10px;color:#CB842C;
position:relative;}
.mui-badge{
  position:absolute;
}
.product-nav:after{content:"";display:block;clear:both}


/*搜索框*/ 
.search{margin-top:20px;position:relative;display:inline-block;}
.search>input{background:#ddd;border:0px;font-size:12px;text-align:center;margin-bottom:0px;width:170%;height:31px;}
.search>i{position:absolute;left:10%;top:8px;}
</style>