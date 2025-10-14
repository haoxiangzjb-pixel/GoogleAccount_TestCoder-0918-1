import { useState } from 'react';

// A custom hook that manages a toggleable state
export const useToggle = (initialValue = false) => {
  const [value, setValue] = useState(initialValue);

  const toggle = () => {
    setValue(prevValue => !prevValue);
  };

  const setTrue = () => {
    setValue(true);
  };

  const setFalse = () => {
    setValue(false);
  };

  return [value, { toggle, setTrue, setFalse }];
};