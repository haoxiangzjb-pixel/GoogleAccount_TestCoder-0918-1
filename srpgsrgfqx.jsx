import { useState } from 'react';

/**
 * A custom React hook that manages a counter state.
 * @param {number} initialValue - The initial value for the counter. Defaults to 0.
 * @returns {object} An object containing the current count and functions to increment, decrement, and reset the counter.
 */
const useCounter = (initialValue = 0) => {
  const [count, setCount] = useState(initialValue);

  const increment = () => setCount((prevCount) => prevCount + 1);
  const decrement = () => setCount((prevCount) => prevCount - 1);
  const reset = () => setCount(initialValue);

  return { count, increment, decrement, reset };
};

export default useCounter;