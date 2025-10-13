<template>
  <div>
    <input type="text" v-focus placeholder="This input should be focused on mount">
    <p>Try typing here: <input type="text" placeholder="Normal input"></p>
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    focus: {
      mounted(el) {
        el.focus();
      }
    }
  }
}
</script>

<style scoped>
div {
  padding: 20px;
}
input {
  padding: 8px;
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>