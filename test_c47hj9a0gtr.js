const assert = require('assert');
const capitalize = require('./capitalize');

describe('capitalize', function() {
  it('should capitalize the first letter of a string', function() {
    const result = capitalize('hello');
    assert.strictEqual(result, 'Hello');
  });

  it('should throw an error if the input is not a string', function() {
    assert.throws(() => capitalize(123), Error);
    assert.throws(() => capitalize(null), Error);
    assert.throws(() => capitalize(undefined), Error);
  });
});