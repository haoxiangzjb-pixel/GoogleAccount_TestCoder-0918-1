<template>
  <div>
    <input type="text" v-focus placeholder="This input should be focused on mount" />
    <p>Try clicking outside the input and see it get focused again.</p>
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveExample',
  directives: {
    focus: {
      mounted(el) {
        el.focus();
      },
      updated(el) {
        // Optional: Re-focus if the directive's argument or value changes
        // In this simple case, we just ensure it's focused on any update.
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
