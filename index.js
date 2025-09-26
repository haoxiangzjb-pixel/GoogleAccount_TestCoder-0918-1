const filterAndSaveEvenNumbers = require('./filter_even');

const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const savedFileName = filterAndSaveEvenNumbers(numbers);
console.log(`Data saved to generated file: ${savedFileName}`);

// Test with a custom filename
filterAndSaveEvenNumbers([10, 15, 20, 25, 30], 'custom_evens.json');
console.log('Data saved to custom file: custom_evens.json');
