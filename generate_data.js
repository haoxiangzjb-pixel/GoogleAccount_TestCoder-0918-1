// generate_data.js
// This script generates a JSON object with a random UUID and writes it to a file.

// Using the built-in crypto module for generating a UUID (requires Node.js 14.17+)
const { randomUUID } = require('crypto');
const fs = require('fs');
const path = require('path');

// Generate the data object
const dataObject = {
  id: randomUUID(),
  name: 'Example Item',
  value: 42
};

// Convert to JSON string
const jsonString = JSON.stringify(dataObject, null, 2);

// Generate a random filename using the first 8 characters of a UUID
const fileName = `data_${randomUUID().substring(0, 8)}.json`;

// Define the full file path
const filePath = path.join('/workspace', fileName);

// Write the JSON string to the file
fs.writeFileSync(filePath, jsonString);

console.log(`Data written to ${filePath}`);