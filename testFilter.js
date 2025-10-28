// Test script for the filterEvenNumbers function
const { filterEvenNumbers, saveFilteredArrayToFile } = require('./filterEvenNumbers');

// Test data
const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

console.log('Original array:', testArray);

// Filter even numbers
const evenNumbers = filterEvenNumbers(testArray);
console.log('Filtered even numbers:', evenNumbers);

// Save to randomly named file
const fileName = saveFilteredArrayToFile(testArray);
console.log('Data saved to file:', fileName);