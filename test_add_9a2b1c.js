const { add } = require('../add.js'); // Adjust path as needed
const assert = require('assert');

describe('Add Function', function() {
  it('should add two positive numbers', function() {
    const result = add(2, 3);
    assert.strictEqual(result, 5);
  });

  it('should add a positive and a negative number', function() {
    const result = add(5, -2);
    assert.strictEqual(result, 3);
  });

  it('should add two negative numbers', function() {
    const result = add(-1, -1);
    assert.strictEqual(result, -2);
  });

  it('should add zero to a number', function() {
    const result = add(42, 0);
    assert.strictEqual(result, 42);
  });
});