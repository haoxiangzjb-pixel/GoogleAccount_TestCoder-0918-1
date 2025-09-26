const assert = require('assert');

// The function to be tested
function add(a, b) {
  return a + b;
}

// Mocha test suite
describe('Addition Function', function() {
  it('should return the sum of two positive numbers', function() {
    assert.strictEqual(add(2, 3), 5);
  });

  it('should return the sum of two negative numbers', function() {
    assert.strictEqual(add(-2, -3), -5);
  });

  it('should return the sum of a positive and a negative number', function() {
    assert.strictEqual(add(5, -3), 2);
  });

  it('should return the correct sum when one number is zero', function() {
    assert.strictEqual(add(0, 5), 5);
    assert.strictEqual(add(5, 0), 5);
  });
});