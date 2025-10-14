import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import { focusDirective } from './focusDirective'

const app = createApp(App);

// Register the custom directive globally
app.directive('focus', focusDirective);

app.mount('#app')
