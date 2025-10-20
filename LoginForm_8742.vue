<template>
  <div class="login-form-container">
    <form @submit.prevent="handleSubmit" class="login-form">
      <h2>Вход в систему</h2>
      
      <div class="form-group">
        <label for="email">Email:</label>
        <input 
          type="email" 
          id="email" 
          v-model="email" 
          required 
          placeholder="Введите ваш email"
        />
      </div>
      
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input 
          type="password" 
          id="password" 
          v-model="password" 
          required 
          placeholder="Введите ваш пароль"
        />
      </div>
      
      <div class="form-group">
        <button type="submit" :disabled="isSubmitting" class="submit-btn">
          {{ isSubmitting ? 'Вход...' : 'Войти' }}
        </button>
      </div>
      
      <div class="form-footer">
        <a href="#" @click.prevent="handleForgotPassword">Забыли пароль?</a>
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
      isSubmitting: false
    }
  },
  methods: {
    async handleSubmit() {
      if (!this.email || !this.password) {
        alert('Пожалуйста, заполните все поля');
        return;
      }
      
      this.isSubmitting = true;
      
      try {
        // Here you would typically make an API call to authenticate the user
        console.log('Attempting login with:', { email: this.email, password: this.password });
        
        // Simulate API call delay
        await new Promise(resolve => setTimeout(resolve, 1000));
        
        // Example of successful login (replace with actual authentication logic)
        alert('Успешный вход! (это пример)');
        
        // Reset form
        this.email = '';
        this.password = '';
      } catch (error) {
        console.error('Login error:', error);
        alert('Ошибка входа. Пожалуйста, проверьте данные и попробуйте снова.');
      } finally {
        this.isSubmitting = false;
      }
    },
    handleForgotPassword() {
      // Handle forgot password logic
      alert('Функция восстановления пароля (реализуйте по необходимости)');
    }
  }
}
</script>

<style scoped>
.login-form-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
  padding: 20px;
}

.login-form {
  background: white;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}

.login-form h2 {
  text-align: center;
  margin-bottom: 24px;
  color: #333;
}

.form-group {
  margin-bottom: 16px;
}

.form-group label {
  display: block;
  margin-bottom: 6px;
  font-weight: bold;
  color: #555;
}

.form-group input {
  width: 100%;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
  box-sizing: border-box;
}

.form-group input:focus {
  outline: none;
  border-color: #42b983;
  box-shadow: 0 0 0 2px rgba(66, 185, 131, 0.2);
}

.submit-btn {
  width: 100%;
  padding: 12px;
  background-color: #42b983;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.submit-btn:hover:not(:disabled) {
  background-color: #359c6d;
}

.submit-btn:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

.form-footer {
  text-align: center;
  margin-top: 16px;
}

.form-footer a {
  color: #42b983;
  text-decoration: none;
  font-size: 14px;
}

.form-footer a:hover {
  text-decoration: underline;
}
</style>