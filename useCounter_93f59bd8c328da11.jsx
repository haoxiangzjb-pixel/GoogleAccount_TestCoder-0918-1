import { useState } from 'react';

/**
 * 自定义 Hook: useCounter
 * 用于管理计数器的状态
 * @param {number} initialValue - 初始值，默认为 0
 * @returns {Object} 包含 count, increment, decrement, reset 的对象
 */
export function useCounter(initialValue = 0) {
  const [count, setCount] = useState(initialValue);

  const increment = () => {
    setCount(prev => prev + 1);
  };

  const decrement = () => {
    setCount(prev => prev - 1);
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
