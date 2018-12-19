<template>
  <div class="pic-container">
    <searchPic></searchPic>
    <div v-for="item in info" :key="item.id" class="gallery">
      <img v-lazy="item.img_url">
    </div>
  </div>
</template>
<script>
import searchPic from '@/components/search-pic.vue';
  export default{
    data:function(){
      return{
        info:[],
      }
    },
    mounted(){
      this.axios.get(
        "http://localhost:3000/index/pic"
      ).then(res=>{
        this.info=res.data;
      });

    },
    methods:{

    },
    components:{
      searchPic
    }
  }
</script>
<style scoped>
.pic-container{margin-bottom:50px;}
.pic-container .gallery>img{width:50%;height:50%;float:left;}
.pic-container:after{content:"";display:block;clear:both;}
/*lazyload 组件专用样式*/ 
.pic-container .gallery>img[lazy=loading]{width:50%;}



</style>