<template>
  <div class="result-container">
    <div class="yourpic"></div>
    <mt-navbar v-model="selected">
      <mt-tab-item id="1"><span>战绩</span></mt-tab-item>
      <mt-tab-item id="2"><span>能力</span></mt-tab-item>
      <mt-tab-item id="3"><span>资产</span></mt-tab-item>
    </mt-navbar>

    <!-- tab-container -->
    <mt-tab-container v-model="selected">
      <mt-tab-container-item id="1">
        <result1></result1>
      </mt-tab-container-item>
      <mt-tab-container-item id="2">
        <result2></result2>
      </mt-tab-container-item>
      <mt-tab-container-item id="3">
        <result3></result3>
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>
<script>
import result1 from '@/components/result1.vue';
import result2 from '@/components/result2.vue';
import result3 from '@/components/result3.vue';
export default{
  components:{result1,result2,result3},
  data(){return{selected:"1",}},
  mounted(){

  },

}
</script>
<style scoped>
.result-container{
  
}
.mint-navbar{
  margin-top:80px;
}
.mint-tab-item-label>span{color:#000 !important;}


</style>