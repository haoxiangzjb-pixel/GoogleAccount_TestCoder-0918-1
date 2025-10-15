const { expect } = require('chai');
const { addNumbers, multiplyNumbers } = require('./utils');

describe('Utility Functions', () => {
  describe('addNumbers', () => {
    it('should add two positive numbers correctly', () => {
      const result = addNumbers(2, 3);
      expect(result).to.equal(5);
    });

    it('should add two negative numbers correctly', () => {
      const result = addNumbers(-2, -3);
      expect(result).to.equal(-5);
    });

    it('should add a positive and negative number correctly', () => {
      const result = addNumbers(5, -3);
      expect(result).to.equal(2);
    });

    it('should throw an error when first argument is not a number', () => {
      expect(() => addNumbers('2', 3)).to.throw('Both arguments must be numbers');
    });

    it('should throw an error when second argument is not a number', () => {
      expect(() => addNumbers(2, '3')).to.throw('Both arguments must be numbers');
    });
  });

  describe('multiplyNumbers', () => {
    it('should multiply two positive numbers correctly', () => {
      const result = multiplyNumbers(3, 4);
      expect(result).to.equal(12);
    });

    it('should multiply two negative numbers correctly', () => {
      const result = multiplyNumbers(-3, -4);
      expect(result).to.equal(12);
    });

    it('should multiply a positive and negative number correctly', () => {
      const result = multiplyNumbers(5, -3);
      expect(result).to.equal(-15);
    });

    it('should throw an error when one of the arguments is not a number', () => {
      expect(() => multiplyNumbers(2, '3')).to.throw('Both arguments must be numbers');
    });
  });
});