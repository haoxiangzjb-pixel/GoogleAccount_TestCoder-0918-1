# Filter Even Numbers Function

This project contains a JavaScript function that filters even numbers from an array and saves them to a randomly named JSON file.

## Function: `filterAndSaveEvenNumbers(inputArray)`

- Takes an array of numbers as input
- Filters out the even numbers (numbers divisible by 2)
- Saves the filtered even numbers to a randomly named JSON file
- Returns an object containing the filtered array and the filename

## Files

- `filterEvenNumbers.js`: Contains the main function
- `testFilter.js`: Demonstrates how to use the function
- Randomly named JSON files: Generated when the function is executed

## Usage

```javascript
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
filterAndSaveEvenNumbers(numbers);
```

This will create a file named something like `even_numbers_123456.json` containing the even numbers from the input array.