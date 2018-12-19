<template>
  <div class="bottom-container">
    <!--3.底部导航栏-->
    <nav class="mui-bar mui-bar-tab">
      <router-link to="/" class="mui-tab-item">
          <span class="mui-icon mui-icon-home"></span>
          <span class="mui-tab-label">资讯</span>
      </router-link>          
      <router-link to="/pic" class="mui-tab-item">
        <span class="mui-icon mui-icon-image"></span>
        <span class="mui-tab-label">图片</span>
      </router-link>
      <router-link to="/product" class="mui-tab-item">
        <span class="mui-icon mui-icon-extra mui-icon-extra-cart">
          <span class="mui-badge">
            {{this.$store.state.count}}
          </span>
        </span>
        <span class="mui-tab-label">购物车</span>
      </router-link>
      <router-link to="/login" class="mui-tab-item">
        <span class="mui-icon mui-icon-search"></span>
        <span class="mui-tab-label">会员</span>
      </router-link>
      <router-link to="/result" class="mui-tab-item">
        <span class="mui-icon-extra mui-icon-extra-grech">
        </span>
        <span class="mui-tab-label">战绩</span>
      </router-link>
    </nav>
  </div>
</template>
<script>
  export default{
    data:function(){
      return{}
    },
    mounted(){
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
    }
  }
</script>
<style scoped>

</style>