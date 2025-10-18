<template>
  <div class="counter-component">
    <h2>Click Counter</h2>
    <p>Count: {{ count }}</p>
    <button @click="increment">Click Me!</button>
  </div>
</template>

<script>
export default {
  name: 'CounterComponent',
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
  border: 1px solid #ccc;
  border-radius: 8px;
  text-align: center;
  max-width: 300px;
  margin: 20px auto;
}

button {
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
}

button:hover {
  background-color: #359c6d;
}
</style>