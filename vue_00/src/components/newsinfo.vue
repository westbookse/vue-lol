<template>
  <div class="newsinfo-container">
    <mt-header title="资讯详情" fixed>
      <router-link to="/" slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
    <div class="newsinfo-title">{{list.title}}</div>
    <div class="newsinfo-time">{{list.ctime |datetimeFilter}}</div>
    <img :src="list.img_url1">
    <img :src="list.img_url2">
    <div class="newsinfo-size">{{list.section1}}</div>
    <div class="newsinfo-size">{{list.section2}}</div>
    <div class="newsinfo-head">{{list.section3}}</div>
    <img :src="list.img_url3">
    <div class="newsinfo-size">{{list.section4}}</div>
    <div class="newsinfo-color newsinfo-size">{{list.section5}}</div>
    <img :src="list.img_url4">
    <div class="newsinfo-size">{{list.section6}}</div>
    <div class="newsinfo-color newsinfo-size">{{list.section7}}</div>
    <div class="newsinfo-size">{{list.section8}}</div>
    <div class="newsinfo-size newsinfo-color">{{list.section9}}</div>
    <img :src="list.img_url5">
    <div class="newsinfo-size">{{list.section10}}</div>
    <comment-box :id="this.id"></comment-box>
  </div>
</template>
<script>
//1:引入子组件
import comment from "../components/comment.vue"
  export default{
    data(){
      return {list:{},id:this.$route.query.id}
    },
    created(){
      this.getNewsInfo();
    },
    methods:{
      getNewsInfo(){
        var url="http://127.0.0.1:3000/newsinfo";
        this.axios.get(url).then(result=>{
          this.list=result.data[0];
        })
      }
    },
    components:{
      "comment-box":comment
    }
  }
</script>
<style scoped>
.newsinfo-container{width:100%;margin-top:50px;margin-bottom:50px;}
.newsinfo-container:after{content:"";display:block;clear:both;}
.newsinfo-container>img{width:100%;}
.newsinfo-title{font-size:18px;font-weight:bold;text-align:center;}
.newsinfo-time{float:right;font-size:14px;color:#ccc;}
.newsinfo-head{font-size:14px;font-weight:bold;}
.newsinfo-size{font-size:14px;}
.newsinfo-color{color:#ff0000;}
</style>