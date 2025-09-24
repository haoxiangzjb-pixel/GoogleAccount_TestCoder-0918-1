<template>
  <div>
    <button @click="incrementCounter">
      Clicked {{ counter }} times
    </button>
  </div>
</template>

<script>
export default {
  name: 'MyButtonComponent',
  data() {
    return {
      counter: 0
    }
  },
  methods: {
    incrementCounter() {
      this.counter++
    }
  }
}
</script>

<style scoped>
button {
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
}
</style>