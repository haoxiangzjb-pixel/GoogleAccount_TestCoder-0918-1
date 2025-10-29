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
    
    <div v-if="errorMessage" class="error-message">
      {{ errorMessage }}
    </div>
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
      isSubmitting: false,
      errorMessage: ''
    }
  },
  methods: {
    async handleSubmit() {
      this.isSubmitting = true
      this.errorMessage = ''
      
      try {
        // Валидация ввода
        if (!this.email || !this.password) {
          this.errorMessage = 'Пожалуйста, заполните все поля'
          return
        }
        
        // Здесь будет логика аутентификации
        // Например, вызов API для проверки учетных данных
        console.log('Попытка входа с:', { email: this.email, password: this.password, rememberMe: this.rememberMe })
        
        // Имитация асинхронного запроса
        await new Promise(resolve => setTimeout(resolve, 1000))
        
        // Здесь вы можете добавить реальную логику аутентификации
        // Например: const response = await authService.login(this.email, this.password)
        
        console.log('Успешный вход!')
        // После успешного входа вы можете:
        // - Сохранить токен аутентификации
        // - Перенаправить пользователя на другую страницу
        // - Установить состояние аутентификации в хранилище
        
      } catch (error) {
        this.errorMessage = error.message || 'Ошибка при входе. Пожалуйста, попробуйте снова.'
      } finally {
        this.isSubmitting = false
      }
    },
    handleForgotPassword() {
      // Логика восстановления пароля
      console.log('Запрос восстановления пароля')
      // Здесь можно открыть модальное окно или перенаправить на страницу восстановления пароля
    }
  }
}
</script>

<style scoped>
.login-form-container {
  max-width: 400px;
  margin: 50px auto;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  background-color: #fff;
}

.login-form h2 {
  text-align: center;
  margin-bottom: 20px;
  color: #333;
}

.form-group {
  margin-bottom: 15px;
}

.form-group label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #555;
}

.form-input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 16px;
  box-sizing: border-box;
}

.form-input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
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
  background-color: #0056b3;
}

.submit-btn:disabled {
  background-color: #6c757d;
  cursor: not-allowed;
}

.form-footer {
  text-align: center;
  margin-top: 15px;
}

.form-footer a {
  color: #007bff;
  text-decoration: none;
  font-size: 14px;
}

.form-footer a:hover {
  text-decoration: underline;
}

.error-message {
  margin-top: 15px;
  padding: 10px;
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
  border-radius: 4px;
  text-align: center;
}
</style>