<template>
  <div class="cart-container">
    <mt-header title="购物车" fixed>
      <router-link  to="" slot="left">
        <mt-button icon="back" @click="myback"></mt-button>
      </router-link>
      <mt-button slot="right">清空</mt-button>
    </mt-header>
    <div class="mui-card">
      <div class="mui-card-header">商品列表</div>
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <!--2.1mui 左侧图片 右侧文字-->
        <ul class="mui-table-view">
          <li class="mui-table-view-cell mui-media" v-for="item in cartlist" :key="item.iid">
            <a href="javascript:;">
              <img class="mui-media-object mui-pull-left mypic" :src="item.img_url">
              <div class="mui-media-body">
                {{item.title}}
                <p class='mui-ellipsis'>
                    <span>点券{{item.price}}</span>
                    <span class="count">
                      <!--2.2mui 数字按钮-->             
                    <div class="mui-numbox" data-numbox-min='0' data-numbox-max='9'>
                      <button class="mui-btn mui-btn-numbox-minus" type="button" @click="cartSub(item.pid)">-</button>
                      <input id="test" class="mui-input-numbox" type="number" :value="item.count" />
                      <button class="mui-btn mui-btn-numbox-plus" type="button" @click="cartAdd(item.pid)">+</button>
                    </div>
                    </span>
                </p>
              </div>
            </a>
          </li>
        </ul>
          <!--2.3mui 数字按钮-->
          <div>合计：点券{{getSubTotal}}</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
      return {
        cartlist:[]  //购物车列表
      }
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
      });
    },
    methods:{
      cartSub(pid){
        for(var item of this.cartlist){
          if(item.pid==pid){
            if(item.count==0){
              return;
            }
            item.count--;
            break;
          }
        }
      },
      cartAdd(pid){
        for(var item of this.cartlist){
          if(item.pid==pid){
            item.count++;
            break;
          }
        }
      },
      myback(){
        history.go(-1);
      }
    },
    created(){

    },
    props:["pid"],
    computed:{
      getSubTotal:function(){
        var sum=0;
        var all=0;
        for(var item of this.cartlist){
          sum+=item.price*item.count;
        }
        return sum;
      }
    }
  }
</script>
<style scoped>
  .mui-card{
    margin-top:50px;
  }


  .mypic{
    width:100%; 
  }
</style>