// This is a generated test file for MyComponent.
// The filename is fixed as MyComponent.test.js for this example, as generating a truly random name is complex without additional tools.
import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom'; // Import jest-dom assertions
import MyComponent from './MyComponent';

test('renders the component with the correct name', () => {
  render(<MyComponent name="Alice" />);
  const element = screen.getByText(/Hello, Alice!/i);
  expect(element).toBeInTheDocument();
});