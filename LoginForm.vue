<template>
  <div class="login-container">
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
          class="form-input"
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
          class="form-input"
        />
      </div>
      
      <div class="form-group checkbox-group">
        <label for="remember">
          <input
            type="checkbox"
            id="remember"
            v-model="rememberMe"
            class="form-checkbox"
          />
          Запомнить меня
        </label>
      </div>
      
      <button type="submit" class="submit-btn" :disabled="isSubmitting">
        {{ isSubmitting ? 'Вход...' : 'Войти' }}
      </button>
      
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
      rememberMe: false,
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
        // Simulate API call
        await new Promise(resolve => setTimeout(resolve, 1000));
        
        // Here you would typically make an API call to authenticate the user
        console.log('Login attempt with:', {
          email: this.email,
          password: this.password,
          rememberMe: this.rememberMe
        });
        
        // For demonstration purposes, we'll just show a success message
        alert('Вход успешно выполнен (демонстрация)');
        
        // Reset form
        this.email = '';
        this.password = '';
      } catch (error) {
        console.error('Login error:', error);
        alert('Ошибка при входе. Пожалуйста, проверьте данные и попробуйте снова.');
      } finally {
        this.isSubmitting = false;
      }
    },
    handleForgotPassword() {
      // Handle forgot password logic
      alert('Функция восстановления пароля (демонстрация)');
    }
  }
}
</script>

<style scoped>
.login-container {
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
  font-weight: 500;
  color: #555;
}

.form-input {
  width: 100%;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
  box-sizing: border-box;
}

.form-input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

.checkbox-group {
  display: flex;
  align-items: center;
}

.checkbox-group input {
  margin-right: 8px;
}

.submit-btn {
  width: 100%;
  padding: 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.submit-btn:hover:not(:disabled) {
  background-color: #0069d9;
}

.submit-btn:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
}

.form-footer {
  text-align: center;
  margin-top: 16px;
}

.form-footer a {
  color: #007bff;
  text-decoration: none;
  font-size: 14px;
}

.form-footer a:hover {
  text-decoration: underline;
}
</style>