<template>
  <div>
    <p>Count: {{ count }}</p>
    <button @click="increment">Click me!</button>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const count = ref(0)

const increment = () => {
  count.value++
}
</script>

<style scoped>
div {
  padding: 20px;
  text-align: center;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin: 10px;
}
</style>