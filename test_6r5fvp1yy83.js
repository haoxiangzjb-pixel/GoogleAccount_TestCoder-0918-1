import { add } from './src/utils.js';
import { describe, it } from 'mocha';
import { strict as assert } from 'assert';

describe('Utils', function() {
  describe('#add()', function() {
    it('should return the sum of two numbers', function() {
      const result = add(1, 2);
      assert.strictEqual(result, 3);
    });

    it('should handle negative numbers', function() {
      const result = add(-1, -2);
      assert.strictEqual(result, -3);
    });

    it('should handle decimals', function() {
      const result = add(1.5, 2.5);
      assert.strictEqual(result, 4);
    });
  });
});