const assert = require('assert');
const addNumbers = require('./addNumbers');

describe('addNumbers Function', function() {
    describe('Basic functionality', function() {
        it('should add two positive numbers correctly', function() {
            const result = addNumbers(2, 3);
            assert.strictEqual(result, 5);
        });

        it('should add two negative numbers correctly', function() {
            const result = addNumbers(-2, -3);
            assert.strictEqual(result, -5);
        });

        it('should add a positive and negative number correctly', function() {
            const result = addNumbers(5, -3);
            assert.strictEqual(result, 2);
        });

        it('should handle decimal numbers correctly', function() {
            const result = addNumbers(2.5, 3.7);
            assert.strictEqual(result, 6.2);
        });

        it('should return 0 when adding zero to zero', function() {
            const result = addNumbers(0, 0);
            assert.strictEqual(result, 0);
        });
    });
});