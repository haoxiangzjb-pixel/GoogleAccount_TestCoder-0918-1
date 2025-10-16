<template>
  <div class="focus-input-demo">
    <h2>Vue 自定义聚焦指令示例</h2>
    <input 
      v-focus 
      type="text" 
      placeholder="这个输入框会自动获得焦点" 
      class="focus-input"
    />
    <br><br>
    <input 
      type="text" 
      placeholder="这个输入框没有聚焦指令" 
      class="normal-input"
    />
    <br><br>
    <input 
      v-focus.lazy 
      type="text" 
      placeholder="这个输入框延迟聚焦" 
      class="delayed-focus-input"
    />
  </div>
</template>

<script>
export default {
  name: 'FocusInputDemo',
  directives: {
    // 自定义聚焦指令
    focus: {
      // 指令的定义
      mounted(el, binding) {
        // 获取参数，默认为0毫秒延迟
        const delay = binding.arg ? parseInt(binding.arg) : 0;
        
        // 如果有修饰符.lazy，则延迟聚焦
        const isLazy = binding.modifiers.lazy;
        const actualDelay = isLazy ? 500 : delay;
        
        setTimeout(() => {
          el.focus();
          
          // 添加视觉反馈以显示元素已聚焦
          el.style.outline = '2px solid #42b983';
          setTimeout(() => {
            if (el.style.outline) {
              el.style.outline = '';
            }
          }, 2000);
        }, actualDelay);
      },
      
      // 更新时如果绑定值变化则重新聚焦
      updated(el, binding) {
        if (binding.value !== binding.oldValue) {
          setTimeout(() => {
            el.focus();
          }, 0);
        }
      }
    }
  },
  
  // 组件的其他选项
  data() {
    return {
      inputValue: ''
    };
  }
};
</script>

<style scoped>
.focus-input-demo {
  padding: 20px;
  font-family: Arial, sans-serif;
}

.focus-input, .normal-input, .delayed-focus-input {
  padding: 10px;
  margin: 10px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 300px;
}

.focus-input:focus, .delayed-focus-input:focus {
  border-color: #42b983;
  box-shadow: 0 0 5px rgba(66, 185, 131, 0.3);
}
</style>