import React from 'react';
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import MyButton from './MyButton'; // Adjust the import path as needed

describe('MyButton Component', () => {
  test('renders the button with correct text', () => {
    const buttonText = 'Click Me';
    render(<MyButton text={buttonText} />);
    expect(screen.getByText(buttonText)).toBeInTheDocument();
  });

  test('calls the onClick handler when clicked', async () => {
    const user = userEvent.setup();
    const mockOnClick = jest.fn();
    render(<MyButton text="Test Button" onClick={mockOnClick} />);
    const buttonElement = screen.getByRole('button', { name: /test button/i });
    await user.click(buttonElement);
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('is disabled when the disabled prop is true', () => {
    render(<MyButton text="Disabled Button" disabled={true} />);
    const buttonElement = screen.getByRole('button', { name: /disabled button/i });
    expect(buttonElement).toBeDisabled();
  });

  test('is enabled by default', () => {
    render(<MyButton text="Enabled Button" />);
    const buttonElement = screen.getByRole('button', { name: /enabled button/i });
    expect(buttonElement).not.toBeDisabled();
  });
});