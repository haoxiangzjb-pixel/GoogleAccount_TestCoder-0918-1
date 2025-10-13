const { add } = require('./src/mathFunctions');
const { expect } = require('chai');

describe('Math Functions', function() {
  describe('add', function() {
    it('should correctly add two positive numbers', function() {
      const result = add(2, 3);
      expect(result).to.equal(5);
    });

    it('should correctly add a positive and a negative number', function() {
      const result = add(5, -2);
      expect(result).to.equal(3);
    });

    it('should throw an error if the first argument is not a number', function() {
      expect(() => add('2', 3)).to.throw('Both arguments must be numbers');
    });

    it('should throw an error if the second argument is not a number', function() {
      expect(() => add(2, '3')).to.throw('Both arguments must be numbers');
    });
  });
});