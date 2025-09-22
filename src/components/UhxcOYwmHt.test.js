import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import Button from './Button';

describe('Button Component', () => {
  test('renders button with correct text', () => {
    const buttonText = 'Click me';
    render(<Button>{buttonText}</Button>);
    
    const buttonElement = screen.getByText(buttonText);
    expect(buttonElement).toBeInTheDocument();
  });

  test('calls onClick handler when clicked', () => {
    const handleClick = jest.fn();
    const buttonText = 'Click me';
    
    render(<Button onClick={handleClick}>{buttonText}</Button>);
    
    const buttonElement = screen.getByText(buttonText);
    fireEvent.click(buttonElement);
    
    expect(handleClick).toHaveBeenCalledTimes(1);
  });

  test('does not call onClick handler when disabled', () => {
    const handleClick = jest.fn();
    const buttonText = 'Click me';
    
    render(
      <Button onClick={handleClick} disabled>
        {buttonText}
      </Button>
    );
    
    const buttonElement = screen.getByText(buttonText);
    fireEvent.click(buttonElement);
    
    expect(handleClick).toHaveBeenCalledTimes(0);
  });
});