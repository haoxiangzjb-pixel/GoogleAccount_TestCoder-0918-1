import React from 'react';

const ExampleComponent = ({ title, children }) => {
  return (
    <div className="example-component">
      <h1>{title}</h1>
      <p>{children}</p>
    </div>
  );
};

export default ExampleComponent;