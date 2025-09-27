<template>
  <div id="app">
    <h1>Vue 自定义指令示例</h1>
    <input v-focus type="text" placeholder="这个输入框应该自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个不会自动获得焦点" />
  </div>
</template>

<script>
export default {
  name: 'FocusDirectiveDemo',
  directives: {
    // 定义一个名为 'focus' 的自定义指令
    focus: {
      // 在绑定元素的父组件被挂载后调用
      mounted(el) {
        // 聚焦元素
        el.focus();
      }
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  padding: 20px;
}

input {
  padding: 10px;
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>