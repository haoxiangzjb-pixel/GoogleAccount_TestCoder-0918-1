import React from 'react';
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import '@testing-library/jest-dom';
import TodoList from './todo1760544580578';

describe('TodoList Component', () => {
  test('renders TodoList component', () => {
    render(<TodoList />);
    expect(screen.getByText(/Список дел/i)).toBeInTheDocument();
    expect(screen.getByPlaceholderText(/Введите задачу/i)).toBeInTheDocument();
    expect(screen.getByText(/Добавить/i)).toBeInTheDocument();
  });

  test('allows adding a new todo', async () => {
    render(<TodoList />);
    const input = screen.getByPlaceholderText(/Введите задачу/i);
    const addButton = screen.getByText(/Добавить/i);

    fireEvent.change(input, { target: { value: 'Test todo' } });
    fireEvent.click(addButton);

    await waitFor(() => {
      expect(screen.getByText(/Test todo/i)).toBeInTheDocument();
    });
  });

  test('allows adding a todo by pressing Enter', async () => {
    render(<TodoList />);
    const input = screen.getByPlaceholderText(/Введите задачу/i);

    fireEvent.change(input, { target: { value: 'Test todo via enter' } });
    fireEvent.keyPress(input, { key: 'Enter', code: 'Enter' });

    await waitFor(() => {
      expect(screen.getByText(/Test todo via enter/i)).toBeInTheDocument();
    });
  });

  test('allows deleting a todo', async () => {
    render(<TodoList />);
    const input = screen.getByPlaceholderText(/Введите задачу/i);
    const addButton = screen.getByText(/Добавить/i);

    // Add a todo
    fireEvent.change(input, { target: { value: 'Todo to delete' } });
    fireEvent.click(addButton);

    await waitFor(() => {
      expect(screen.getByText(/Todo to delete/i)).toBeInTheDocument();
    });

    // Delete the todo
    const deleteButton = screen.getByText(/Удалить/i);
    fireEvent.click(deleteButton);

    await waitFor(() => {
      expect(screen.queryByText(/Todo to delete/i)).not.toBeInTheDocument();
    });
  });

  test('does not add empty todos', async () => {
    render(<TodoList />);
    const input = screen.getByPlaceholderText(/Введите задачу/i);
    const addButton = screen.getByText(/Добавить/i);

    fireEvent.change(input, { target: { value: '   ' } }); // Only whitespace
    fireEvent.click(addButton);

    // Wait a bit and check that no todo was added
    await waitFor(() => {
      expect(screen.queryByText(/   /i)).not.toBeInTheDocument();
    }, { timeout: 100 });
  });
});