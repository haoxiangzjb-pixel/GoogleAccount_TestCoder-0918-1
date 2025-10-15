import { useState } from 'react';

// 自定义Hook：useInput
const useInput = (initialValue = '') => {
  const [value, setValue] = useState(initialValue);

  const handleChange = (event) => {
    setValue(event.target.value);
  };

  const reset = () => {
    setValue(initialValue);
  };

  const update = (newValue) => {
    setValue(newValue);
  };

  return {
    value,
    onChange: handleChange,
    reset,
    update
  };
};

export default useInput;