import React from 'react';

const TodoList = () => {
  const todos = [
    { id: 1, text: 'Купить продукты', completed: false },
    { id: 2, text: 'Заправить машину', completed: true },
    { id: 3, text: 'Отправить отчет', completed: false },
  ];

  return (
    <div>
      <h2>Список дел</h2>
      <ul>
        {todos.map(todo => (
          <li key={todo.id} style={{ textDecoration: todo.completed ? 'line-through' : 'none' }}>
            {todo.text}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default TodoList;