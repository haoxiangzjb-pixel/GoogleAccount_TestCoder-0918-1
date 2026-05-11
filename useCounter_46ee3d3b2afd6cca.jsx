import { useState } from 'react';

/**
 * 自定义 Hook: useCounter
 * 提供一个计数器功能，包含当前值、递增、递减和重置方法
 * @param {number} initialValue - 初始值，默认为 0
 * @returns {{ count: number, increment: () => void, decrement: () => void, reset: () => void }}
 */
function useCounter(initialValue = 0) {
  const [count, setCount] = useState(initialValue);

  const increment = () => {
    setCount(prevCount => prevCount + 1);
  };

  const decrement = () => {
    setCount(prevCount => prevCount - 1);
  };

  const reset = () => {
    setCount(initialValue);
  };

  return {
    count,
    increment,
    decrement,
    reset
  };
}

export default useCounter;
