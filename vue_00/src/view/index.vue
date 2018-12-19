<template>
  <div class="index-container">
    <div class="nav">
      <span><img :src="this.$store.state.avatar"></span>
      <mt-button class="mysize" @click.native.prevent="active = 'tab-container1'">推荐 </mt-button>
      <mt-button class="mysize" @click.native.prevent="active = 'tab-container2'">专栏 </mt-button>
      <mt-button class="mysize" @click.native.prevent="active = 'tab-container3'">赛事 </mt-button>
      <mt-button class="mysize" @click.native.prevent="active = 'tab-container4'">视频 </mt-button>
      <mt-button class="mysize" @click.native.prevent="active = 'tab-container5'">热点 </mt-button>
      <mt-button class="mysize" @click.native.prevent="active = 'tab-container6'">版本 </mt-button>
      <mt-button class="mysize" @click.native.prevent="active = 'tab-container7'">官方 </mt-button>
      <mt-button class="mysize" @click.native.prevent="active = 'tab-container8'">英雄 </mt-button>                        
    </div>
    <mt-tab-container v-model="active" swipeable>
      <mt-tab-container-item id="tab-container1">
        <index1></index1>
      </mt-tab-container-item>
      <mt-tab-container-item id="tab-container2">
22
      </mt-tab-container-item>
      <mt-tab-container-item id="tab-container3">
33
      </mt-tab-container-item>
      <mt-tab-container-item id="tab-container4">
33
      </mt-tab-container-item>
      <mt-tab-container-item id="tab-container5">
33
      </mt-tab-container-item>
      <mt-tab-container-item id="tab-container6">
33
      </mt-tab-container-item>
      <mt-tab-container-item id="tab-container7">
33
      </mt-tab-container-item>
      <mt-tab-container-item id="tab-container8">
33
      </mt-tab-container-item>                              
    </mt-tab-container>


 
  </div>
</template>
<script>
import index1 from '@/components/index1.vue';
  export default{
    data:function(){
      return {
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
      this.axios.get("http://localhost:3000/users/islogin").then(res=>{
      if(res.data.ok==1){
        this.$store.commit("signin",res.data.avatar);
      }else{
        this.$store.commit("signout");
      }
    })

    },
    components:{index1},
  }
</script>
<style scoped>
.index-container{margin-bottom:60px;margin-top:20px;}

.mysize{padding:0px;height:28px;}
/*顶部导航栏*/ 
.nav>span{display:inline-block;width:11%;text-align:center;margin-left:-8px;}
.nav>span>img{width:30px;}
/*搜索框*/ 
.search{margin-top:10px;position:relative;}
.search>input{background:#ddd;border:0px;font-size:12px;text-align:center;}
.search>i{position:absolute;left:30%;top:10px;}

/*图片轮播设置高度*/
.index-container .mint-swipe{height:200px;margin-top:0px;}
.index-container .mint-swipe img{width:100%;height:200px;}

.mui-media-body{overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}














</style>