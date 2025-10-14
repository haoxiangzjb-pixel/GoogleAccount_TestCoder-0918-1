<template>
  <div class="counter-container">
    <h1>Click Counter</h1>
    <p>You clicked the button <strong>{{ count }}</strong> times.</p>
    <button @click="increment">Click me!</button>
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
.counter-container {
  text-align: center;
  margin-top: 2rem;
}
h1 {
  color: #2c3e50;
}
p {
  font-size: 1.2rem;
}
button {
  padding: 0.5rem 1rem;
  font-size: 1rem;
  background-color: #42b883;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
button:hover {
  background-color: #359c6d;
}
</style>