<template>
  <div>
    <h1>Custom Directive Example</h1>
    <input type="text" v-focus placeholder="This input should be focused on mount">
    <input type="text" placeholder="This input is not focused">
  </div>
</template>

<script setup>
// Define the custom directive
const vFocus = {
  mounted: (el) => el.focus()
}
</script>

<style scoped>
div {
  padding: 20px;
}
input {
  display: block;
  margin: 10px 0;
  padding: 8px;
}
</style>