<template>
  <div>
    <input type="text" v-focus placeholder="This input should be focused on mount">
    <p>Try clicking away and then refreshing the page to see the focus effect.</p>
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
input {
  padding: 10px;
  font-size: 16px;
}
</style>