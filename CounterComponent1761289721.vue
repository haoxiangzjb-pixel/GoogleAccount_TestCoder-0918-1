<template>
  <div class="counter-component">
    <h2>Click Counter</h2>
    <button @click="increment">Clicked {{ count }} times</button>
  </div>
</template>

<script>
export default {
  name: 'CounterComponent1761289721',
  data() {
    return {
      count: 0
    }
  },
  methods: {
    increment() {
      this.count++
    }
  }
}
</script>

<style scoped>
.counter-component {
  padding: 20px;
  text-align: center;
  font-family: Arial, sans-serif;
}

button {
  padding: 10px 20px;
  font-size: 16px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #359c6d;
}
</style>
