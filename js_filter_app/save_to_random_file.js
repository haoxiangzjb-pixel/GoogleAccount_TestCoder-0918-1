const fs = require('fs');
const { filterEvens } = require('./filter_evens');

// Function to generate a random filename
function generateRandomFileName() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let name = '';
    for (let i = 0; i < 10; i++) {
        name += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return name + '.json';
}

// Example array
const originalArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Filter the evens
const evensArray = filterEvens(originalArray);

// Generate a random filename
const fileName = generateRandomFileName();

// Save the filtered array to the random file
fs.writeFileSync(fileName, JSON.stringify(evensArray, null, 2));

console.log(`Filtered evens saved to ${fileName}`);