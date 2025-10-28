// Function to filter even numbers from an array
function filterEvenNumbers(arr) {
    if (!Array.isArray(arr)) {
        throw new Error('Input must be an array');
    }
    
    return arr.filter(num => {
        // Check if the element is a number and is even
        return typeof num === 'number' && Number.isInteger(num) && num % 2 === 0;
    });
}

// Function to save the filtered array to a randomly named file
function saveFilteredArrayToFile(originalArray, fs = require('fs'), path = require('path')) {
    const filteredArray = filterEvenNumbers(originalArray);
    
    // Generate a random filename
    const randomName = Math.random().toString(36).substring(2, 10);
    const fileName = `${randomName}.json`;
    
    // Convert the array to JSON string
    const data = JSON.stringify(filteredArray, null, 2);
    
    // Write to file
    fs.writeFileSync(fileName, data);
    
    console.log(`Filtered even numbers saved to ${fileName}`);
    console.log('Filtered array:', filteredArray);
    
    return fileName;
}

// Example usage:
// const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
// const savedFileName = saveFilteredArrayToFile(numbers);

module.exports = { filterEvenNumbers, saveFilteredArrayToFile };