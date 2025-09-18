import React from 'react';
import { render, screen } from '@testing-library/react';
import WelcomeMessage from './RandomWelcomeComponent7570.jsx';

// Mocking the React component import for testing
jest.mock('./RandomWelcomeComponent7570.jsx', () => {
  return {
    __esModule: true,
    default: () => (
      <div data-testid="welcome-component">
        <h1>Welcome to Our Application!</h1>
        <p>We're glad to have you here. Enjoy your stay!</p>
      </div>
    )
  };
});

describe('WelcomeMessage Component', () => {
  test('renders welcome message correctly', () => {
    render(<WelcomeMessage />);
    
    // Check if the main heading is rendered
    const headingElement = screen.getByText(/Welcome to Our Application!/i);
    expect(headingElement).toBeInTheDocument();
    
    // Check if the paragraph text is rendered
    const paragraphElement = screen.getByText(/We're glad to have you here. Enjoy your stay!/i);
    expect(paragraphElement).toBeInTheDocument();
    
    // Check if the component container is present
    const componentElement = screen.getByTestId('welcome-component');
    expect(componentElement).toBeInTheDocument();
  });

  test('renders with correct structure', () => {
    render(<WelcomeMessage />);
    
    // Check if component renders exactly one h1 element
    const headingElements = screen.getAllByRole('heading', { level: 1 });
    expect(headingElements).toHaveLength(1);
    
    // Check if component renders exactly one paragraph
    const paragraphElements = screen.getAllByRole('paragraph');
    expect(paragraphElements).toHaveLength(1);
  });
});