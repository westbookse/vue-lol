<template>
  <div class="result1-container">
    <div class="search">
      <input type="text" placeholder="搜索你想了解的资讯"><i class="mint-toast-icon mintui mintui-search"></i>
    </div>      
    <!--轮播图-->
    <mt-swipe :auto="4000">
      <mt-swipe-item v-for="item in list" :key="item.id">
        <img :src="item.img_url" >
      </mt-swipe-item>
    </mt-swipe>
    <!-- new games -->
    <ul class="mui-table-view">
      <li class="mui-table-view-cell mui-media" v-for="item in news" :key="item.nid">
        <router-link :to="'/newsinfo?id='+item.nid">
          <img class="mui-media-object mui-pull-right" :src="item.img_url">
          <div class="mui-media-body">
            {{item.title}}
            <p class='mui-ellipsis'>
              <span>{{item.poster}}</span>
              <span>{{item.comment}}次评论</span>
            </p>
          </div>
        </router-link>
      </li>
    </ul>
    <mt-button type="primary" size="large" @click="getMore">加载更多</mt-button>
  </div>
</template>
<script>
   export default{
    data:function(){
      return {list:[],
      news:[],
      pageIndex:0,//属性显示当前页
      pageSize:8,//页大小
      pageCount:3, //总页数
      hasMore:true,
      active:'tab-container1',
      }
    },
    methods:{
      getMore() {
        this.pageIndex++;
        //判断是否有下一页的数据
        this.hasMore=this.pageIndex<=this.pageCount;
        //如果没有下一页数据 停止函数的执行
        if(!this.hasMore){return }
        var url="http://127.0.0.1:3000/index/news";
        url+="?pno="+this.pageIndex+"&pageSize="+this.pageSize;
        this.axios.get(url).then(result=>{
          //console.log(result);
          //concat 拼接数组 将两个数组拼接新数组
          var rows=this.news.concat(result.data.data);
          this.news=rows;
          //保存总页数
          this.pageCount=result.data.pageCount;
        })
      },
    },
    mounted(){
      this.axios.get(
        "http://localhost:3000/index"

      ).then(res=>{
        this.list=res.data;

      });
      this.axios.get("http://localhost:3000/users/islogin").then(res=>{
      if(res.data.ok==1){
        this.$store.commit("signin");
      }else{
        this.$store.commit("signout");
      }
    })

    },
    created(){
      this.getMore();
    }
  }
</script>
<style scoped>

/*搜索框*/ 
.search{margin-top:10px;position:relative;}
.search>input{background:#ddd;border:0px;font-size:12px;text-align:center;height:31px;}
.search>i{position:absolute;left:30%;top:7px;}

/*图片轮播设置高度*/
.index-container .mint-swipe{height:200px;margin-top:0px;}
.index-container .mint-swipe img{width:100%;height:200px;}

.mui-media-body{overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
</style>