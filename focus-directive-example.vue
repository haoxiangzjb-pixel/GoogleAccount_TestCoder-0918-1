<template>
  <div>
    <input type="text" v-focus placeholder="This input should be focused on mount" />
  </div>
</template>

<script>
export default {
  name: 'FocusInputExample',
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