import React, { useState } from 'react';

const Counter = () => {
  const [count, setCount] = useState(0);

  const increment = () => {
    setCount(count + 1);
  };

  const decrement = () => {
    setCount(count - 1);
  };

  const reset = () => {
    setCount(0);
  };

  return (
    <div style={{ textAlign: 'center', padding: '20px' }}>
      <h1>Contador</h1>
      <p style={{ fontSize: '48px', fontWeight: 'bold' }}>{count}</p>
      <div style={{ display: 'flex', gap: '10px', justifyContent: 'center' }}>
        <button onClick={decrement} style={{ padding: '10px 20px', fontSize: '16px' }}>
          Diminuir
        </button>
        <button onClick={reset} style={{ padding: '10px 20px', fontSize: '16px' }}>
          Resetar
        </button>
        <button onClick={increment} style={{ padding: '10px 20px', fontSize: '16px' }}>
          Aumentar
        </button>
      </div>
    </div>
  );
};

export default Counter;
