<template>
  <div class="login-container">
    <form @submit.prevent="handleSubmit" class="login-form">
      <h2>Вход</h2>
      <div class="form-group">
        <label for="email">Email:</label>
        <input
          type="email"
          id="email"
          v-model="email"
          required
          :class="{ 'error': errors.email }"
        />
        <span v-if="errors.email" class="error-message">{{ errors.email }}</span>
      </div>
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input
          type="password"
          id="password"
          v-model="password"
          required
          :class="{ 'error': errors.password }"
        />
        <span v-if="errors.password" class="error-message">{{ errors.password }}</span>
      </div>
      <button type="submit" :disabled="loading">
        {{ loading ? 'Вход...' : 'Войти' }}
      </button>
      <p v-if="message" :class="`message ${messageType}`">{{ message }}</p>
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
      loading: false,
      message: '',
      messageType: '', // 'success' or 'error'
      errors: {
        email: '',
        password: ''
      }
    };
  },
  methods: {
    validateForm() {
      let isValid = true;
      this.errors.email = '';
      this.errors.password = '';

      if (!this.email) {
        this.errors.email = 'Email обязателен.';
        isValid = false;
      } else if (!/\S+@\S+\.\S+/.test(this.email)) {
        this.errors.email = 'Email адрес недействителен.';
        isValid = false;
      }

      if (!this.password) {
        this.errors.password = 'Пароль обязателен.';
        isValid = false;
      } else if (this.password.length < 6) {
        this.errors.password = 'Пароль должен содержать не менее 6 символов.';
        isValid = false;
      }

      return isValid;
    },
    handleSubmit() {
      this.message = '';
      this.messageType = '';
      if (this.validateForm()) {
        this.loading = true;
        // Симуляция асинхронного запроса
        setTimeout(() => {
          console.log('Отправлено:', { email: this.email, password: this.password });
          this.loading = false;
          this.message = 'Вход успешно выполнен!';
          this.messageType = 'success';
          // Сброс формы после успешного входа
          this.email = '';
          this.password = '';
        }, 1500);
      }
    }
  }
};
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f0f2f5;
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

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

input {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input.error {
  border-color: #e74c3c;
}

.error-message {
  color: #e74c3c;
  font-size: 0.875rem;
  margin-top: 0.25rem;
  display: block;
}

button {
  width: 100%;
  padding: 0.75rem;
  background-color: #3498db;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
}

button:disabled {
  background-color: #bdc3c7;
  cursor: not-allowed;
}

.message {
  margin-top: 1rem;
  padding: 0.5rem;
  border-radius: 4px;
  text-align: center;
}

.message.success {
  background-color: #d4edda;
  color: #155724;
  border: 1px solid #c3e6cb;
}

.message.error {
  background-color: #f8d7da;
  color: #721c24;
  border: 1px solid #f5c6cb;
}
</style>