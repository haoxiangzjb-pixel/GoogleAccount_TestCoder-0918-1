const { v4: uuidv4 } = require('uuid');
const { filterEvenNumbers } = require('./filter_even.js'); // Import the function

// Example array
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Filter the even numbers
const evenNumbers = filterEvenNumbers(numbers);

// Generate a random filename using UUID
const randomFileName = `/workspace/output_${uuidv4()}.txt`;

// Convert the result to a string and write to the file
const fs = require('fs');
fs.writeFileSync(randomFileName, JSON.stringify(evenNumbers, null, 2));

console.log(`Filtered even numbers: ${JSON.stringify(evenNumbers)}`);
console.log(`Saved to file: ${randomFileName}`);
