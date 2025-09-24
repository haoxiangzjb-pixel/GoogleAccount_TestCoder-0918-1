// Function to filter even numbers from an array
function filterEvenNumbers(inputArray) {
  if (!Array.isArray(inputArray)) {
    throw new Error("Input must be an array.");
  }
  return inputArray.filter(num => typeof num === 'number' && num % 2 === 0);
}

// Example usage and file saving
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);

console.log("Original array:", numbers);
console.log("Filtered even numbers:", evenNumbers);

// Save to a random-named file using Node.js built-in modules
const fs = require('fs');
const path = require('path');

// Generate a random filename
const randomFileName = `even_numbers_output_${Math.floor(Math.random() * 1000000)}.json`;

// Write the result to the file
fs.writeFileSync(randomFileName, JSON.stringify(evenNumbers, null, 2));

console.log(`Filtered even numbers saved to: ${randomFileName}`);