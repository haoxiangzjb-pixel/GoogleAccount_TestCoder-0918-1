const { expect } = require('chai');
const { add } = require('../src/mathFunctions');

describe('Add Function', () => {
  it('should add two positive numbers correctly', () => {
    const result = add(2, 3);
    expect(result).to.equal(5);
  });

  it('should add a positive and a negative number correctly', () => {
    const result = add(5, -2);
    expect(result).to.equal(3);
  });

  it('should add two negative numbers correctly', () => {
    const result = add(-1, -1);
    expect(result).to.equal(-2);
  });

  it('should throw an error if the first argument is not a number', () => {
    expect(() => add('a', 2)).to.throw('Both arguments must be numbers');
  });

  it('should throw an error if the second argument is not a number', () => {
    expect(() => add(2, null)).to.throw('Both arguments must be numbers');
  });
});