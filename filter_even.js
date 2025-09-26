// Function to filter even numbers from an array
function filterEvenNumbers(arr) {
  if (!Array.isArray(arr)) {
    throw new Error("Input must be an array");
  }
  return arr.filter(num => typeof num === 'number' && num % 2 === 0);
}

// Function to save data to a file with a random name
function saveDataToRandomFile(data, extension = '.txt') {
  const { v4: uuidv4 } = require('uuid');
  const fs = require('fs');
  const randomFileName = uuidv4() + extension;
  fs.writeFileSync(randomFileName, JSON.stringify(data, null, 2));
  console.log(`Data saved to file: ${randomFileName}`);
  return randomFileName;
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);
console.log("Original array:", numbers);
console.log("Filtered even numbers:", evenNumbers);

saveDataToRandomFile(evenNumbers, '.json');
