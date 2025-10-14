import { render, screen } from '@testing-library/react';
import SimpleComponent from './SimpleComponent';

describe('SimpleComponent', () => {
  test('renders correctly with a name', () => {
    render(<SimpleComponent name="Alice" />);
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
  });

  test('renders correctly with an empty name', () => {
    render(<SimpleComponent name="" />);
    expect(screen.getByText(/Hello,/i)).toBeInTheDocument();
    expect(screen.getByText(/!/i)).toBeInTheDocument();
  });
});