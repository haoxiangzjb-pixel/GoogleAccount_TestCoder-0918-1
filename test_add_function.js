const assert = require('assert');

// The function to be tested
function add(a, b) {
  return a + b;
}

// Mocha test suite
describe('add', function() {
  it('should correctly add two positive numbers', function() {
    assert.strictEqual(add(2, 3), 5);
  });

  it('should correctly add a positive and a negative number', function() {
    assert.strictEqual(add(5, -2), 3);
  });

  it('should correctly add two negative numbers', function() {
    assert.strictEqual(add(-1, -1), -2);
  });

  it('should correctly add zero to a number', function() {
    assert.strictEqual(add(42, 0), 42);
  });
});