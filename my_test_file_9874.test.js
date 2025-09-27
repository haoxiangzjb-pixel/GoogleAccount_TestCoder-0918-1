import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

test('renders name prop', () => {
  render(<MyComponent name="Alice" />);
  const headingElement = screen.getByText(/Hello, Alice!/i);
  expect(headingElement).toBeInTheDocument();
});

test('renders list items', () => {
  const items = ['Apple', 'Banana', 'Cherry'];
  render(<MyComponent name="Bob" items={items} />);
  items.forEach(item => {
    const listItemElement = screen.getByText(item);
    expect(listItemElement).toBeInTheDocument();
  });
});