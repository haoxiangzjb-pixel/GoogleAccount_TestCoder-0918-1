import { useState } from 'react';

// A custom hook that manages a boolean state value
export const useToggle = (initialValue = false) => {
  const [value, setValue] = useState(initialValue);

  const toggleValue = () => {
    setValue(prevValue => !prevValue);
  };

  return [value, toggleValue];
};
