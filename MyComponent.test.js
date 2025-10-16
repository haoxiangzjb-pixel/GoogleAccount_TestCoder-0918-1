import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders name prop correctly', () => {
    render(<MyComponent name="John" />);
    expect(screen.getByText(/Hello, John!/i)).toBeInTheDocument();
  });

  test('renders list items when items prop is provided', () => {
    const items = ['apple', 'banana', 'cherry'];
    render(<MyComponent name="Jane" items={items} />);
    items.forEach(item => {
      expect(screen.getByText(item)).toBeInTheDocument();
    });
  });

  test('renders empty list when no items prop is provided', () => {
    render(<MyComponent name="Jane" />);
    const listElement = screen.getByRole('list');
    expect(listElement.children.length).toBe(0);
  });
});