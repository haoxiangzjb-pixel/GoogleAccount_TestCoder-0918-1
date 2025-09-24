import { render, screen, fireEvent } from '@testing-library/react';
import SimpleButton from './SimpleButton';

describe('SimpleButton', () => {
  test('renders the button with the correct label', () => {
    const label = 'Click Me';
    render(<SimpleButton label={label} />);
    expect(screen.getByText(label)).toBeInTheDocument();
  });

  test('calls the onClick handler when clicked', () => {
    const onClick = jest.fn();
    render(<SimpleButton label="Test Button" onClick={onClick} />);
    fireEvent.click(screen.getByText('Test Button'));
    expect(onClick).toHaveBeenCalledTimes(1);
  });

  test('is disabled when the disabled prop is true', () => {
    render(<SimpleButton label="Disabled Button" disabled={true} />);
    expect(screen.getByText('Disabled Button')).toBeDisabled();
  });

  test('is enabled when the disabled prop is false', () => {
    render(<SimpleButton label="Enabled Button" disabled={false} />);
    expect(screen.getByText('Enabled Button')).toBeEnabled();
  });
});