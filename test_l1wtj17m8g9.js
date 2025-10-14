const { add } = require('./test_function');

describe('Test Suite for add function', function() {
  it('should add two positive numbers correctly', function() {
    const result = add(2, 3);
    if (result !== 5) {
      throw new Error(`Expected 5, but got ${result}`);
    }
  });

  it('should add two negative numbers correctly', function() {
    const result = add(-2, -3);
    if (result !== -5) {
      throw new Error(`Expected -5, but got ${result}`);
    }
  });

  it('should add a positive and a negative number correctly', function() {
    const result = add(5, -3);
    if (result !== 2) {
      throw new Error(`Expected 2, but got ${result}`);
    }
  });

  it('should throw an error if the first argument is not a number', function() {
    try {
      add('2', 3);
      // If no error is thrown, the test fails
      throw new Error('Expected function to throw an error');
    } catch (error) {
      if (error.message !== 'Both arguments must be numbers') {
        throw new Error(`Expected specific error message, but got: ${error.message}`);
      }
    }
  });

  it('should throw an error if the second argument is not a number', function() {
    try {
      add(2, null);
      // If no error is thrown, the test fails
      throw new Error('Expected function to throw an error');
    } catch (error) {
      if (error.message !== 'Both arguments must be numbers') {
        throw new Error(`Expected specific error message, but got: ${error.message}`);
      }
    }
  });
});