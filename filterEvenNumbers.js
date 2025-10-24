// Function to filter even numbers from an array
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

// Function to generate a random filename
function generateRandomFilename(extension = '.txt') {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    for (let i = 0; i < 10; i++) {
        result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result + extension;
}

// Function to save filtered even numbers to a randomly named file
function filterEvenAndSaveToFile(arr, fileExtension = '.json') {
    const evenNumbers = filterEvenNumbers(arr);
    const randomFilename = generateRandomFilename(fileExtension);
    
    // Using Node.js file system to write the file
    const fs = require('fs');
    
    // Convert the array to JSON string for saving
    const dataToSave = JSON.stringify(evenNumbers, null, 2);
    
    fs.writeFileSync(randomFilename, dataToSave);
    
    console.log(`Filtered even numbers saved to: ${randomFilename}`);
    console.log('Even numbers:', evenNumbers);
    
    return randomFilename;
}

// Example usage:
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
filterEvenAndSaveToFile(numbers);

// Export functions for use in other modules
module.exports = {
    filterEvenNumbers,
    filterEvenAndSaveToFile,
    generateRandomFilename
};