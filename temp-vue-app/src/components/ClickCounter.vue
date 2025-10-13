<template>
  <div>
    <h2>Click Counter</h2>
    <p>Button clicked {{ count }} times.</p>
    <button @click="increment">Click me!</button>
  </div>
</template>

<script>
export default {
  name: 'ClickCounter',
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
div {
  padding: 2rem;
}
button {
  padding: 0.5rem 1rem;
  font-size: 1rem;
}
</style>