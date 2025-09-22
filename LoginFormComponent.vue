<template>
  <div class="login-form">
    <h2>Login</h2>
    <form @submit.prevent="handleSubmit">
      <div class="form-group">
        <label for="username">Username:</label>
        <input 
          type="text" 
          id="username" 
          v-model="form.username" 
          required 
        />
      </div>
      
      <div class="form-group">
        <label for="password">Password:</label>
        <input 
          type="password" 
          id="password" 
          v-model="form.password" 
          required 
        />
      </div>
      
      <button type="submit" :disabled="isLoading">
        {{ isLoading ? 'Logging in...' : 'Login' }}
      </button>
      
      <div v-if="error" class="error">
        {{ error }}
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'LoginForm',
  data() {
    return {
      form: {
        username: '',
        password: ''
      },
      isLoading: false,
      error: ''
    }
  },
  methods: {
    handleSubmit() {
      this.isLoading = true
      this.error = ''
      
      // Simulate API call
      setTimeout(() => {
        if (this.form.username === 'admin' && this.form.password === 'password') {
          this.$emit('login-success', this.form.username)
        } else {
          this.error = 'Invalid username or password'
        }
        this.isLoading = false
      }, 1000)
    }
  }
}
</script>

<style scoped>
.login-form {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

input {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

.error {
  margin-top: 15px;
  padding: 10px;
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
  border-radius: 4px;
}
</style>