<template>
  <div class="container">
    <h2>Vue 自定义聚焦指令示例</h2>
    <input v-focus type="text" placeholder="这个输入框会自动获得焦点" />
    <br><br>
    <input type="text" placeholder="这个输入框没有自动聚焦" />
    <br><br>
    <input v-focus="{ delay: 2000 }" type="text" placeholder="这个输入框会在2秒后获得焦点" />
  </div>
</template>

<script>
export default {
  name: 'FocusInputDirective',
  directives: {
    // 定义自定义聚焦指令
    focus: {
      // 当被绑定的元素挂载到DOM中时...
      mounted(el, binding) {
        // 聚焦元素
        if (binding.value && binding.value.delay) {
          // 如果提供了延迟选项，则延迟聚焦
          setTimeout(() => {
            el.focus();
          }, binding.value.delay);
        } else {
          // 默认立即聚焦
          el.focus();
        }
      },
      // 当指令绑定的元素更新时
      updated(el, binding) {
        // 如果指令的值发生变化，并且新值为true，则重新聚焦
        if (binding.value !== binding.oldValue && binding.value === true) {
          el.focus();
        }
      }
    }
  }
}
</script>

<style scoped>
.container {
  padding: 20px;
}

input {
  padding: 8px;
  margin: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

input:focus {
  outline: 2px solid #409eff;
}
</style>