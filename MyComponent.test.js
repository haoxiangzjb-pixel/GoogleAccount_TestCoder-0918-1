import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyComponent from './MyComponent'; // Adjust the import path as needed

describe('MyComponent', () => {
  test('renders without crashing', () => {
    render(<MyComponent />);
    expect(screen.getByTestId('my-component')).toBeInTheDocument();
  });

  test('displays the correct title', () => {
    const title = 'Test Title';
    render(<MyComponent title={title} />);
    expect(screen.getByText(title)).toBeInTheDocument();
  });
});