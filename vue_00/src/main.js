// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import 'mint-ui/lib/style.css'


import MintUI from "mint-ui";
Vue.use(MintUI);


// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'

//引入echarts
import echarts from 'echarts'
Vue.prototype.$echarts=echarts;


Vue.filter("datetimeFilter",function(val){
  var data=new Date(val);
  var data=new Date(val);    //创建日期对象
  var y=data.getFullYear();   //获取年份
  var m=data.getMonth()+1;    //获取月份
  var d=data.getDate();       //获取日期
  var h=data.getHours();
  var mi=data.getMinutes();
  var s=data.getSeconds();
  m<10&&(m="0"+m);            //如果月份小于10前缀加0
  d<10&&(d="0"+d);            //如果日小于10前缀加0
  return `${y}-${m}-${d} ${h}:${mi}:${s}`;          
});







//4.创建vuex实例对象
  //4.1：下载安装 vuex npm i vuex -D
  //4.2: 引入vuex
  import Vuex from "vuex";
  //4.3:注册vuex实例
  Vue.use(Vuex);
  //4.4:创建vuex实例对象
  var store=new Vuex.Store({
    state:{count:0,islogin:false,avatar:""},     //购物车中商品的数量
    mutations:{
      increment(state,c){this.islogin=true,state.count=parseInt(c)},//修改共享数据的两个方法
      substract(state){this.islogin=true,state.count--},     //参数就是共享的数据属性
      signin(state,avatar){this.state.islogin=true,state.avatar=avatar},
      signout(){this.state.islogin=false}
    },
    getters:{
      optCount:function(state){
        return state.count; //返回共享数据
      }
    },
  });


axios.defaults.withCredentials=true;


Vue.config.productionTip = false


//引入axios
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.prototype.$http=axios
Vue.use(VueAxios, axios)

import VueResource from "vue-resource";
//将所有组件注册
Vue.use(VueResource);



/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  store,
  template: '<App/>'
})
