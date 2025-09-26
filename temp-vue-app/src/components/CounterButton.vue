<template>
  <div class="counter">
    <p>Button clicked {{ count }} times.</p>
    <button @click="increment">Click me!</button>
  </div>
</template>

<script>
export default {
  name: 'CounterButton',
  data() {
    return {
      count: 0
    }
  },
  methods: {
    increment() {
      this.count++;
    }
  }
}
</script>

<style scoped>
.counter {
  text-align: center;
  margin-top: 2rem;
}

button {
  padding: 0.5rem 1rem;
  font-size: 1rem;
}
</style>