import { useState } from 'react';

// 自定义Hook: useCounter
// 接收一个初始值，默认为0
function useCounter(initialValue = 0) {
  // 使用useState来管理计数器状态
  const [count, setCount] = useState(initialValue);

  // 定义操作状态的方法
  const increment = () => setCount(prevCount => prevCount + 1);
  const decrement = () => setCount(prevCount => prevCount - 1);
  const reset = () => setCount(initialValue);

  // 返回状态和操作方法
  return { count, increment, decrement, reset };
}

export default useCounter;