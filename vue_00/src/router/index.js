import Vue from 'vue'
import Router from 'vue-router'



//引入自定义组件
import index from "../view/index.vue"
import bottom from "../components/bottom.vue"
import home from "../view/home.vue"
import pic from '../view/pic.vue'
import login from '../components/login.vue'
import result from '../view/result.vue'
import product from '../view/product.vue'
import result1 from '../components/result1.vue'
import result2 from '../components/result2.vue'
import result3 from '../components/result3.vue'
import comment from '../components/comment.vue'
import newsinfo from '../components/newsinfo.vue'
import index1 from '../components/index1.vue'
import pic1 from '../view/pic1.vue'
import product1 from '../components/product1.vue'
import details from '../view/details.vue'
import productall from '../view/productall.vue'
import cart from '../view/cart.vue'
import register from '../components/register.vue'
Vue.use(Router);

export default new Router({
  routes: [
    {path:'/',component:home,children:[
      {path:"",component:index},
      {path:'/pic',component:pic},
      {path:'/product',component:product},
      {path:'/result',component:result},
      {path:'/pic/:kw',component:pic1,props:true},
    ]},
    {path:'/bottom',component:bottom},
    {path:'/login',component:login},
    {path:'/result1',component:result1},
    {path:'/result2',component:result2},
    {path:'/result3',component:result3},
    {path:'/comment',component:comment},
    {path:'/newsinfo',component:newsinfo},
    {path:'/index1',components:index1},
    {path:'/product1',component:product1},
    {path:'/details/:pid',component:details,props:true},
    {path:'/productall',component:productall},
    {path:'/cart',component:cart},
    {path:'/register',component:register},
  ],linkActiveClass:"mui-active" 
})
