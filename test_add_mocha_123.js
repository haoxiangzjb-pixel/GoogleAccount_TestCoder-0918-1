const { expect } = require('chai');
const { add } = require('./add.js');

describe('The add function', function() {
  it('should add two positive numbers correctly', function() {
    const result = add(2, 3);
    expect(result).to.equal(5);
  });

  it('should add two negative numbers correctly', function() {
    const result = add(-2, -3);
    expect(result).to.equal(-5);
  });

  it('should add a positive and a negative number correctly', function() {
    const result = add(5, -3);
    expect(result).to.equal(2);
  });
});