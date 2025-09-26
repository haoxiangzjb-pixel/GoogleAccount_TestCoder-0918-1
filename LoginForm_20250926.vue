<template>
  <div class="login-container">
    <h2>Вход</h2>
    <form @submit.prevent="handleSubmit">
      <div class="form-group">
        <label for="username">Имя пользователя:</label>
        <input
          type="text"
          id="username"
          v-model="username"
          required
          :disabled="loading"
        />
      </div>
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input
          type="password"
          id="password"
          v-model="password"
          required
          :disabled="loading"
        />
      </div>
      <button type="submit" :disabled="loading">
        {{ loading ? 'Вход...' : 'Войти' }}
      </button>
      <p v-if="error" class="error">{{ error }}</p>
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
      loading: false,
      error: ''
    }
  },
  methods: {
    handleSubmit() {
      // Простая проверка на пустые поля
      if (!this.username || !this.password) {
        this.error = 'Пожалуйста, заполните все поля.';
        return;
      }

      this.error = '';
      this.loading = true;

      // Имитация асинхронного запроса
      setTimeout(() => {
        console.log('Отправка данных:', { username: this.username, password: this.password });
        // Здесь обычно будет запрос к API
        // this.performLogin({ username: this.username, password: this.password });

        // Для демонстрации, сразу "успешный" логин
        this.onLoginSuccess();
      }, 1500);
    },
    onLoginSuccess() {
      this.loading = false;
      alert(`Добро пожаловать, ${this.username}!`);
      // Здесь можно перенаправить пользователя или обновить состояние приложения
    }
  }
}
</script>

<style scoped>
.login-container {
  max-width: 400px;
  margin: 50px auto;
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
}

input {
  width: 100%;
  padding: 8px;
  box-sizing: border-box;
  border: 1px solid #ccc;
  border-radius: 4px;
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
  color: red;
  margin-top: 10px;
}
</style>