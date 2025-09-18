import React, { useState } from 'react';

const TodoList = () => {
  const [todos, setTodos] = useState([
    { id: 1, text: 'Изучить React', completed: false },
    { id: 2, text: 'Создать компонент списка дел', completed: true },
    { id: 3, text: 'Добавить функциональность', completed: false }
  ]);
  
  const [inputValue, setInputValue] = useState('');

  const toggleTodo = (id) => {
    setTodos(todos.map(todo => 
      todo.id === id ? { ...todo, completed: !todo.completed } : todo
    ));
  };

  const addTodo = () => {
    if (inputValue.trim() !== '') {
      const newId = todos.length > 0 ? Math.max(...todos.map(t => t.id)) + 1 : 1;
      setTodos([...todos, { id: newId, text: inputValue, completed: false }]);
      setInputValue('');
    }
  };

  const deleteTodo = (id) => {
    setTodos(todos.filter(todo => todo.id !== id));
  };

  return (
    <div style={{ maxWidth: '400px', margin: '20px auto', padding: '20px', border: '1px solid #ccc', borderRadius: '5px' }}>
      <h2>Список дел</h2>
      <div style={{ display: 'flex', marginBottom: '10px' }}>
        <input 
          type="text" 
          value={inputValue} 
          onChange={(e) => setInputValue(e.target.value)}
          placeholder="Введите новое дело"
          style={{ flex: 1, padding: '5px' }}
        />
        <button onClick={addTodo} style={{ marginLeft: '5px', padding: '5px 10px' }}>Добавить</button>
      </div>
      <ul style={{ listStyleType: 'none', padding: 0 }}>
        {todos.map(todo => (
          <li 
            key={todo.id} 
            style={{ 
              display: 'flex', 
              justifyContent: 'space-between', 
              alignItems: 'center',
              padding: '5px 0',
              textDecoration: todo.completed ? 'line-through' : 'none'
            }}
          >
            <span onClick={() => toggleTodo(todo.id)} style={{ cursor: 'pointer', flex: 1 }}>
              {todo.text}
            </span>
            <button onClick={() => deleteTodo(todo.id)} style={{ padding: '2px 5px', backgroundColor: '#ff4444', color: 'white', border: 'none', borderRadius: '3px', cursor: 'pointer' }}>
              Удалить
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default TodoList;