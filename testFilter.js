// Test file to demonstrate the filterAndSaveEvenNumbers function

// Import the function from the other file
const fs = require('fs');
const path = require('path');

// Read and execute the function from the file
const functionCode = fs.readFileSync(path.join(__dirname, 'filterEvenNumbers.js'), 'utf8');
eval(functionCode);

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
console.log('Original array:', numbers);

const result = filterAndSaveEvenNumbers(numbers);

console.log('\nFunction returned:', result);