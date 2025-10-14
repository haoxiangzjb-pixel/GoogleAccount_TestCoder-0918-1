<template>
  <div class="login-form-container">
    <form @submit.prevent="onSubmit" class="login-form">
      <h2>Вход</h2>
      <div class="form-group">
        <label for="username">Имя пользователя:</label>
        <input
          id="username"
          v-model="username"
          type="text"
          name="username"
          required
          :class="{ 'error': v$.username.$error }"
        />
        <span v-if="v$.username.$error" class="error-message">
          {{ v$.username.$error ? v$.username.$errors[0].$message : '' }}
        </span>
      </div>
      <div class="form-group">
        <label for="password">Пароль:</label>
        <input
          id="password"
          v-model="password"
          type="password"
          name="password"
          required
          :class="{ 'error': v$.password.$error }"
        />
        <span v-if="v$.password.$error" class="error-message">
          {{ v$.password.$error ? v$.password.$errors[0].$message : '' }}
        </span>
      </div>
      <button type="submit" :disabled="v$.$invalid">Войти</button>
      <p v-if="loginError" class="error-message">{{ loginError }}</p>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useVuelidate } from '@vuelidate/core';
import { required, minLength } from '@vuelidate/validators';

// Данные формы
const username = ref('');
const password = ref('');
const loginError = ref('');

// Валидация
const rules = {
  username: { required },
  password: { required, minLength: minLength(6) }
};

const v$ = useVuelidate(rules, { username, password });

// Обработчик отправки формы
const onSubmit = async () => {
  // Убираем предыдущую ошибку
  loginError.value = '';

  // Проверяем валидацию
  const isValid = await v$.value.$validate();
  if (!isValid) return;

  // Здесь должна быть логика аутентификации
  console.log('Отправка данных:', { username: username.value, password: password.value });

  // Пример обработки ошибки
  if (username.value !== 'admin' || password.value !== 'password') {
    loginError.value = 'Неверное имя пользователя или пароль.';
    return;
  }

  // Успешный вход
  alert('Успешный вход!');
};
</script>

<style scoped>
.login-form-container {
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
  border-color: #ff0000;
}

.error-message {
  color: #ff0000;
  font-size: 0.875rem;
  margin-top: 0.25rem;
  display: block;
}

button {
  width: 100%;
  padding: 0.75rem;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
}

button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}
</style>