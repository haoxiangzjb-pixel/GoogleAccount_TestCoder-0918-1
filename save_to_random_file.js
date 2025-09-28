const { filterEvenNumbers } = require('./filter_even');
const { v4: uuidv4 } = require('uuid');

// Function to save data to a file with a random name
function saveToRandomFile(data, extension = '.txt') {
  const fileName = `${uuidv4()}${extension}`;
  const filePath = `/workspace/${fileName}`;

  // Convert data to string, handling potential non-array data
  const dataString = Array.isArray(data) ? data.join(', ') : String(data);

  // Write the data to the file
  require('fs').writeFileSync(filePath, dataString);
  console.log(`Data saved to file: ${filePath}`);
  return filePath;
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evenNumbers = filterEvenNumbers(numbers);

// Save the filtered even numbers to a random file
saveToRandomFile(evenNumbers, '.json'); // Saving as .json for structure
