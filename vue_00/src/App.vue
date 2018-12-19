<template>
  <div id="app">

    <router-view/>


  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
@charset "utf-8";
/* CSS Document */
body{font-family: "微软雅黑", "宋体", Arial;color: #333;}
body,p,ul,li,h1,h2,h3{margin:0px;padding:0px;}
/*div,p,ul,li,h1,h2,h3{box-sizing: border-box;}/*元素尺寸包括边框内边距*/
ul,li,ol{list-style: none;}
a{text-decoration: none;cursor: pointer;}
a img{border: 0px;}
img,input{vertical-align: middle;}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}


.app-container{
  padding-top:40px;
  padding-bottom:50px;
  overflow-x:hidden;
}

 .mui-bar-tab .mui-tab-item-tao.mui-active {
    color: #007aff;
 }
.mui-bar-tab .mui-tab-item-tao {
    display: table-cell;
    overflow: hidden;
    width: 1%;
    height: 50px;
    text-align: center;
    vertical-align: middle;
    white-space: nowrap;
    text-overflow: ellipsis;
    color: #929292;
}
.mui-bar-tab .mui-tab-item-tao .mui-icon {
    top: 3px;
    width: 24px;
    height: 24px;
    padding-top: 0;
    padding-bottom: 0;
}

.mui-bar-tab .mui-tab-item-tao .mui-icon~.mui-tab-label {
   font-size:11px;
   display:block;
   overflow:hidden;
   text-overflow:ellipsis;
}

</style>
