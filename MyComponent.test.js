import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  it('renders correctly with the given name', () => {
    const testName = 'John Doe';
    render(<MyComponent name={testName} />);
    expect(screen.getByText(`Hello, ${testName}!`)).toBeInTheDocument();
  });
});