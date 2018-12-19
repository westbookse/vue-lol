<template>
  <div>
    <div id="myChart" :style="{width: '300px', height: '300px'}"></div>
    <div class="my-use">
      <div class="use-header"></div>
      <div class="use-middle"></div>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
      return {}
    },
    mounted(){
    this.drawLine();
   },
   methods: {
    drawLine(){
      // 基于准备好的dom，初始化echarts实例
      var  myChart = this.$echarts.init(document.getElementById('myChart'))
      // 绘制图表
      this.axios.get("http://localhost:3000/echarts").then(result=>{
        var res=result.data;
      var option={
      tooltip: {
          trigger: 'item',
          formatter: "{a} <br/>{b}: {c} ({d}%)"
      },
      legend: {
          orient: 'vertical',
          x: 'left',
          data:(function(){
                    var reset = [];
                    var len = res.length;
                        for(var i=0,size=len;i<size;i++) {
                         reset.push({
                             name: res[i].name,
                         });
                        }
                        return reset;
                })()
      },
      series: [
        {
          name:'您的各项能力',
          type:'pie',
          radius: ['50%', '70%'],
          avoidLabelOverlap: false,
          label: {
            normal: {
              show: false,
              position: 'center'
            },
            emphasis: {
              show: true,
              textStyle: {
                fontSize: '30',
                fontWeight: 'bold'
              }
            }
          },
          labelLine: {
            normal: {
              show: false
            }
          },
          data:(function(){
            var reset = [];
            var len = res.length;
              for(var i=0,size=len;i<size;i++) {
                reset.push({
                  //通过把result进行遍历循环来获取数据并放入Echarts中
                  name: res[i].name,
                  value: res[i].val
                });
              }
              return reset;
          })()
        }
      ]
      };
      myChart.setOption(option);
    });
    },
  }
  
  }

</script>
<style scoped>
#myChart{margin-top:40px;margin-left:40px;}
</style>