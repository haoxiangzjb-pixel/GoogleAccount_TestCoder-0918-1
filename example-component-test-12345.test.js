import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import ExampleComponent from './ExampleComponent';

describe('ExampleComponent', () => {
  test('renders title and children correctly', () => {
    const title = 'Test Title';
    const children = 'Test Children';

    render(<ExampleComponent title={title}>{children}</ExampleComponent>);

    expect(screen.getByText(title)).toBeInTheDocument();
    expect(screen.getByText(children)).toBeInTheDocument();
  });

  test('has the correct CSS class', () => {
    const title = 'Another Title';
    const children = 'More children content';

    render(<ExampleComponent title={title}>{children}</ExampleComponent>);

    const component = screen.getByRole('generic', { hidden: true }); // div element
    expect(component).toHaveClass('example-component');
  });
});