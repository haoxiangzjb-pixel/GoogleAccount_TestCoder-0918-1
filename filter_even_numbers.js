const { v4: uuidv4 } = require('uuid');

function filterEvenNumbers(arr) {
  return arr.filter(num => num % 2 === 0);
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);

const fileName = `/workspace/${uuidv4()}.txt`;

const fs = require('fs');
fs.writeFileSync(fileName, evenNumbers.join(', '));

console.log(`Filtered even numbers: ${evenNumbers}`);
console.log(`Saved to file: ${fileName}`);