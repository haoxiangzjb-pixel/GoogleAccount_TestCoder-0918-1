// Function to filter even numbers from an array
function filterEvens(numbers) {
    return numbers.filter(num => num % 2 === 0);
}

// Example usage
const originalArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const evensArray = filterEvens(originalArray);

console.log("Original array:", originalArray);
console.log("Filtered evens:", evensArray);

// Export the function for potential reuse
module.exports = { filterEvens };