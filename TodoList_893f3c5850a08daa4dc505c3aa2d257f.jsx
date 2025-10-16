import React, { useState } from 'react';

const TodoList = () => {
  const [todos, setTodos] = useState([]);
  const [inputValue, setInputValue] = useState('');

  const handleInputChange = (e) => {
    setInputValue(e.target.value);
  };

  const handleAddTodo = () => {
    if (inputValue.trim() !== '') {
      setTodos([
        ...todos,
        {
          id: Date.now(), // Простой способ генерации уникального ID
          text: inputValue,
          completed: false
        }
      ]);
      setInputValue('');
    }
  };

  const handleToggleComplete = (id) => {
    setTodos(
      todos.map(todo =>
        todo.id === id ? { ...todo, completed: !todo.completed } : todo
      )
    );
  };

  const handleDeleteTodo = (id) => {
    setTodos(todos.filter(todo => todo.id !== id));
  };

  const handleKeyPress = (e) => {
    if (e.key === 'Enter') {
      handleAddTodo();
    }
  };

  return (
    <div>
      <h1>Список дел</h1>
      <div>
        <input
          type="text"
          value={inputValue}
          onChange={handleInputChange}
          onKeyPress={handleKeyPress}
          placeholder="Добавить новую задачу..."
        />
        <button onClick={handleAddTodo}>Добавить</button>
      </div>
      <ul>
        {todos.map(todo => (
          <li key={todo.id} style={{ textDecoration: todo.completed ? 'line-through' : 'none' }}>
            <span onClick={() => handleToggleComplete(todo.id)} style={{ cursor: 'pointer' }}>
              {todo.text}
            </span>
            <button onClick={() => handleDeleteTodo(todo.id)} style={{ marginLeft: '10px' }}>
              Удалить
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default TodoList;