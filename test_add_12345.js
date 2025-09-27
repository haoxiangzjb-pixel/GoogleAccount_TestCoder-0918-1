const { add } = require('../add.js');

describe('Add Function', function() {
  it('should add two positive numbers correctly', function() {
    const result = add(2, 3);
    expect(result).to.equal(5);
  });

  it('should add a positive and a negative number correctly', function() {
    const result = add(5, -2);
    expect(result).to.equal(3);
  });
});