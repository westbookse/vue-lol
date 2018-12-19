<template>
  <div class="header-container">
    <div class="header">
      <span><img src="../../static/img/default.png"></span>
      <span>推荐</span>
      <span>专栏</span>
      <span>赛事</span>
      <span>视频</span>
      <span>热点</span>
      <span>版本</span>
      <span>官方</span>
      <span>英雄</span>
    </div>
  </div>
</template>
<script>
export default{
  data:function(){
    return{

    }
  },
}
</script>
<style scoped>




.header-container{width:100%;}
.header>span{display:inline-block;width:11%;text-align:center;margin-left:-8px;}
.header>span>img{width:30px;}


/*导航栏*/ 
li{list-style: none;padding-left:5px;}
li:hover{list-style: none;padding-left:5px;border:1px solid #fff}
.top-list{
  display:flex;
  flex-wrap:wrap;
  justify-content:space-around;
  margin-top:0px;
  padding:0px 10px;
  padding-bottom:5px;
  position:absolute;
  top:80px;
  z-index:100;
}
.top-list>li>a{
  color:#fff;
  line-height:30px;
}
.top-list>li>img{
  margin-left:10px;
  width:40%;
}

</style>