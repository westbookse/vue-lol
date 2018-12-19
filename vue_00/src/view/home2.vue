<template>
  <div>
    <router-view></router-view>
    <Bottom></Bottom>
  </div>
</template>

<script>

// @ is an alias to /src
import Bottom from '@/components/bottom.vue';
export default {
  components: {
    Bottom
  }
}
</script>
