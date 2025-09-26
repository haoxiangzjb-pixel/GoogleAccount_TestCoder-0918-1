const { expect } = require('chai');
const { add, subtract, isEven } = require('../math_functions.js');

describe('Math Functions', function() {
  describe('add', function() {
    it('should return the sum of two numbers', function() {
      const result = add(2, 3);
      expect(result).to.equal(5);
    });

    it('should handle negative numbers', function() {
      const result = add(-1, 1);
      expect(result).to.equal(0);
    });
  });

  describe('subtract', function() {
    it('should return the difference of two numbers', function() {
      const result = subtract(5, 3);
      expect(result).to.equal(2);
    });
  });

  describe('isEven', function() {
    it('should return true for an even number', function() {
      const result = isEven(4);
      expect(result).to.be.true;
    });

    it('should return false for an odd number', function() {
      const result = isEven(5);
      expect(result).to.be.false;
    });
  });
});