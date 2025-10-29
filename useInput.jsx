import { useState } from 'react';

/**
 * A custom React hook that manages input state
 * @param {string} initialValue - The initial value for the input (default is empty string)
 * @returns {object} An object containing the value, setValue, reset, bind functions
 */
const useInput = (initialValue = '') => {
  const [value, setValue] = useState(initialValue);

  const reset = () => {
    setValue(initialValue);
  };

  // bind function to be used directly on input elements
  const bind = {
    value,
    onChange: event => setValue(event.target.value)
  };

  return {
    value,
    setValue,
    reset,
    bind
  };
};

export default useInput;