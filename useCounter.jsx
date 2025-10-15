import { useState } from 'react';

// 自定义Hook：useCounter
const useCounter = (initialValue = 0) => {
  const [count, setCount] = useState(initialValue);

  const increment = () => {
    setCount(count + 1);
  };

  const decrement = () => {
    setCount(count - 1);
  };

  const reset = () => {
    setCount(initialValue);
  };

  const update = (newValue) => {
    setCount(newValue);
  };

  return {
    count,
    increment,
    decrement,
    reset,
    update
  };
};

export default useCounter;