import { createApp } from 'vue'
import App from './App.vue'
import focus from './directives/focus'

const app = createApp(App)
app.directive('focus', focus)
app.mount('#app')