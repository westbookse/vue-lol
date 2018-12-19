<template>
  <div class="result3-container">
    <div class="mui-card">
      <!--页眉，放置标题-->
      <div class="mui-card-header">您设置了资产内容不可见，仅自己可见</div>
      <div class="mui-card-header">余额 <span>点券0</span><span>蓝色精粹5400</span></div>
      <!--内容区-->
      <div class="mui-card-content">
        <ul class="mui-table-view"> 
          <li class="mui-table-view-cell mui-collapse click1"@click="myClick1">
            <a class="mui-navigate-right" href="#">拥有的英雄 <span><span>{{mycount1}}</span>/{{count1}}</span></a> 
            <div class="mui-collapse-content">
              <div v-for="item in hlist" :key="item.id">
                <img :src="item.img_url">     
              </div>
            </div>
          </li>
        </ul>                          
      </div>
      <!--页脚，放置补充信息或支持的操作-->
      <div class="mui-card-content">
        <ul class="mui-table-view"> 
          <li class="mui-table-view-cell mui-collapse click2" @click="myClick2">
            <a class="mui-navigate-right" href="#">拥有的皮肤 <span><span>{{mycount2}}</span>/{{count2}}</span></a> 
            <div class="mui-collapse-content">
              <div v-for="item in list" :key="item.id">
                <img :src="item.img_url">     
              </div>
            </div>
          </li>
        </ul>                          
      </div>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
      return {mycount1:"",mycount2:"",list:[],hlist:[],count1:141,count2:899}
    },
    methods: {
      myClick1(){
        $(".mui-collapse.click1").toggleClass("mui-active")
      },
      myClick2(){
        $(".mui-collapse.click2").toggleClass("mui-active")
      },
    },
    mounted(){
      this.axios.get("http://localhost:3000/hero").then(res=>{
        this.hlist=res.data;
      });
      this.axios.get("http://localhost:3000/hero/count1").then(res=>{
        this.mycount1=res.data[0].c;
      });
      this.axios.get("http://localhost:3000/pifu").then(res=>{
        this.list=res.data;
      });
      this.axios.get("http://localhost:3000/pifu/count1").then(res=>{
        this.mycount2=res.data[0].c;
      });
    },
  }
</script>
<style scoped>
.result3-container{margin-bottom:50px;}
.mui-card-header>span{color:#D7AB4A;}
.mui-collapse-content>div{width:20%;display:inline-block}
.mui-collapse-content>div>img{width:100%;}


.mui-navigate-right>span{margin-left:50px;}
.mui-navigate-right>span>span{color:#D7AB4A;}
</style>