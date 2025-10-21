<template>
  <div class="login-container">
    <form @submit.prevent="handleLogin" class="login-form">
      <h2>Вход в систему</h2>
      
      <div class="form-group">
        <label for="username">Имя пользователя</label>
        <input 
          id="username"
          v-model="username" 
          type="text" 
          placeholder="Введите имя пользователя"
          required
          class="form-input"
        />
      </div>
      
      <div class="form-group">
        <label for="password">Пароль</label>
        <input 
          id="password"
          v-model="password" 
          type="password" 
          placeholder="Введите пароль"
          required
          class="form-input"
        />
      </div>
      
      <div class="form-group">
        <button type="submit" class="login-button">Войти</button>
      </div>
      
      <div v-if="error" class="error-message">
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
      username: '',
      password: '',
      error: ''
    }
  },
  methods: {
    handleLogin() {
      // Простая проверка - в реальном приложении здесь будет запрос к API
      if (this.username && this.password) {
        console.log('Попытка входа:', { username: this.username, password: this.password })
        // Здесь можно добавить логику аутентификации
        this.error = ''
        // Пример: this.$emit('login', { username: this.username, password: this.password })
      } else {
        this.error = 'Пожалуйста, заполните все поля'
      }
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
}

.login-form {
  background: white;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 400px;
}

.form-group {
  margin-bottom: 1rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
  color: #333;
}

.form-input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  box-sizing: border-box;
}

.form-input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.25);
}

.login-button {
  width: 100%;
  padding: 0.75rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
}

.login-button:hover {
  background-color: #0069d9;
}

.error-message {
  color: #dc3545;
  text-align: center;
  margin-top: 1rem;
}
</style>