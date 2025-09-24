const fs = require('fs');

// Function to filter even numbers from an array
function filterEvenNumbers(inputArray) {
  return inputArray.filter(num => num % 2 === 0);
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log("Original array:", numbers);
console.log("Filtered even numbers:", evenNumbers);

// Save the result to a randomly named file
const randomFileName = `even_numbers_output_${Math.floor(Math.random() * 10000)}.json`;
fs.writeFileSync(randomFileName, JSON.stringify(evenNumbers, null, 2));
console.log(`Filtered numbers saved to ${randomFileName}`);

// Export the function for potential reuse
module.exports = { filterEvenNumbers };