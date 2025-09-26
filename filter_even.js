/**
 * Filters even numbers from an array and saves them to a file.
 * @param {number[]} array - The input array of numbers.
 * @param {string} [filename] - Optional filename. If not provided, a random name is generated.
 * @returns {string} The name of the file where the even numbers were saved.
 */
function filterAndSaveEvenNumbers(array, filename) {
    // Filter even numbers
    const evenNumbers = array.filter(num => num % 2 === 0);

    // Generate a random filename if none is provided
    if (!filename) {
        const randomName = `even_numbers_${Math.floor(Math.random() * 1000000)}.json`;
        filename = randomName;
    }

    // Convert the array to a JSON string
    const dataToWrite = JSON.stringify(evenNumbers);

    // Write the data to the file
    const fs = require('fs');
    fs.writeFileSync(filename, dataToWrite);

    console.log(`Even numbers [${evenNumbers}] have been written to ${filename}`);
    return filename;
}

// Example usage:
// const numbers = [1, 2, 3, 4, 5, 6];
// filterAndSaveEvenNumbers(numbers);

module.exports = filterAndSaveEvenNumbers;
