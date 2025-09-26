// A custom React Hook that manages a boolean state.
// It returns the current state value and functions to toggle, set true, and set false.

import { useState } from 'react';

export const useBoolean = (initialValue = false) => {
  const [value, setValue] = useState(initialValue);

  const setTrue = () => setValue(true);
  const setFalse = () => setValue(false);
  const toggle = () => setValue(prev => !prev);

  return { value, setTrue, setFalse, toggle };
};