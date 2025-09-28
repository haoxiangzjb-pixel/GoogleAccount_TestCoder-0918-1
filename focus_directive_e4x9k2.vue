<template>
  <div>
    <h1>Vue Custom Directive Example</h1>
    <input type="text" v-focus placeholder="This input should be focused on mount">
    <p>When the component mounts, the input above should automatically receive focus.</p>
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    // Define the custom 'focus' directive
    focus: {
      // Called after the element is inserted into the DOM
      mounted(el) {
        // Focus the element
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
h1 {
  color: #2c3e50;
}
input {
  padding: 8px;
  font-size: 16px;
  margin-bottom: 10px;
}
</style>