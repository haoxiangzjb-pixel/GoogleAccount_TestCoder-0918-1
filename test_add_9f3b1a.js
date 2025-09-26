const add = require('./add');
const assert = require('assert');

describe('Add Function', function() {
  it('should add two positive numbers correctly', function() {
    assert.strictEqual(add(2, 3), 5);
  });

  it('should add a positive and a negative number correctly', function() {
    assert.strictEqual(add(5, -2), 3);
  });

  it('should add two negative numbers correctly', function() {
    assert.strictEqual(add(-1, -1), -2);
  });
});