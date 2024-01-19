<template>
  <div class="app">{{ msg }}</div>
</template>

<script>
export default {
  name: 'App',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>
<style scoped>
.app {
  color: red;
  transform: scale(1.5);
}
</style>
