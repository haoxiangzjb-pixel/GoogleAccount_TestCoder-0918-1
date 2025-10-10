const { filterEvenNumbers } = require('./filter_even.js');
const { v4: uuidv4 } = require('uuid');
const fs = require('fs');

// Example array
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);

// Generate a random filename using UUID
const fileName = `/workspace/even_numbers_${uuidv4()}.json`;

// Save the even numbers array to the file
fs.writeFileSync(fileName, JSON.stringify(evenNumbers, null, 2));

console.log(`Even numbers have been saved to ${fileName}`);
