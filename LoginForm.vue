<template>
  <div class="login-form">
    <form @submit.prevent="handleSubmit">
      <h2>Login</h2>
      
      <div class="form-group">
        <label for="email">Email:</label>
        <input
          type="email"
          id="email"
          v-model="email"
          required
          placeholder="Enter your email"
        />
      </div>
      
      <div class="form-group">
        <label for="password">Password:</label>
        <input
          type="password"
          id="password"
          v-model="password"
          required
          placeholder="Enter your password"
        />
      </div>
      
      <button type="submit" :disabled="!isValid">
        Login
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
      email: '',
      password: '',
      error: ''
    }
  },
  computed: {
    isValid() {
      // Simple validation: both fields must be filled
      return this.email.trim() !== '' && this.password.trim() !== ''
    }
  },
  methods: {
    handleSubmit() {
      // In a real application, you would send the credentials to your authentication API
      console.log('Login attempt with:', { email: this.email, password: this.password })
      
      // Example validation - in a real app you would call an API
      if (this.email === 'user@example.com' && this.password === 'password') {
        alert('Login successful!')
        // Here you would typically redirect or update the app state
      } else {
        this.error = 'Invalid email or password'
      }
    }
  }
}
</script>

<style scoped>
.login-form {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
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
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  width: 100%;
  padding: 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

button:hover:not(:disabled) {
  background-color: #0056b3;
}

.error {
  color: red;
  margin-top: 10px;
  text-align: center;
}
</style>