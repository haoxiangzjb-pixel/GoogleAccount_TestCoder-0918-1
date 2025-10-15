<template>
  <div>
    <h2>Vue自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框会自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个输入框不会自动获得焦点" />
    <br><br>
    <input v-focus-on-demand type="text" placeholder="点击按钮聚焦此输入框" ref="dynamicInput" />
    <br><br>
    <button @click="focusInput">聚焦输入框</button>
  </div>
</template>

<script>
export default {
  name: 'FocusInputDirective',
  directives: {
    // 自定义聚焦指令
    focus: {
      mounted(el) {
        el.focus();
      }
    },
    // 条件聚焦指令
    focusOnDemand: {
      mounted(el, binding) {
        if (binding.value) {
          el.focus();
        }
      },
      updated(el, binding) {
        if (binding.value) {
          el.focus();
        }
      }
    }
  },
  methods: {
    focusInput() {
      // 使用条件聚焦指令来聚焦特定输入框
      this.$refs.dynamicInput.focus();
    }
  }
}
</script>

<style scoped>
div {
  padding: 20px;
  font-family: Arial, sans-serif;
}
input {
  padding: 8px;
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
button {
  padding: 8px 16px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>