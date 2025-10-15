import { useState } from 'react';

// Custom hook that manages a counter state
const useCounter = (initialValue = 0) => {
  const [count, setCount] = useState(initialValue);

  const increment = () => setCount(prevCount => prevCount + 1);
  const decrement = () => setCount(prevCount => prevCount - 1);
  const reset = () => setCount(initialValue);
  const setValue = (value) => setCount(value);

  return {
    count,
    increment,
    decrement,
    reset,
    setValue
  };
};

export default useCounter;