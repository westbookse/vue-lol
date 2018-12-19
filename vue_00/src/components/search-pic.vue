<template>
  <div class="pic-search">
    <div class="search">
      <input type="text" placeholder="搜索你想要的图片" v-model="kw" @keyup.13="search"><i class="mint-toast-icon mintui mintui-search" @click="search"></i>
    </div>
  </div> 
</template>
<script>
  export default{
    data(){
      return{
        kw:"",
      }
    },
    methods:{
      search(){
        this.$router.push("/pic/"+this.kw);
        location.reload();
      }
    }
  }
</script>
<style scoped>
.pic-search{margin-top:20px;}
/*搜索框*/ 
.search{margin-top:10px;position:relative;}
.search>input{background:#ddd;border:0px;font-size:12px;text-align:center;height:31px;}
.search>i{position:absolute;left:30%;top:7px;}
</style>