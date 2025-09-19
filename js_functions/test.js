const filterEvenNumbers = require('./filterEvenNumbers');

// Test case 1: Mixed even and odd numbers
const testArray1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const result1 = filterEvenNumbers(testArray1);
console.log('Test 1 - Input:', testArray1);
console.log('Test 1 - Output:', result1); // Expected: [2, 4, 6, 8, 10]

// Test case 2: All odd numbers
const testArray2 = [1, 3, 5, 7];
const result2 = filterEvenNumbers(testArray2);
console.log('\nTest 2 - Input:', testArray2);
console.log('Test 2 - Output:', result2); // Expected: []

// Test case 3: All even numbers
const testArray3 = [2, 4, 6, 8];
const result3 = filterEvenNumbers(testArray3);
console.log('\nTest 3 - Input:', testArray3);
console.log('Test 3 - Output:', result3); // Expected: [2, 4, 6, 8]

// Test case 4: Empty array
const testArray4 = [];
const result4 = filterEvenNumbers(testArray4);
console.log('\nTest 4 - Input:', testArray4);
console.log('Test 4 - Output:', result4); // Expected: []