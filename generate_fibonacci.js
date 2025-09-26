const { v4: uuidv4 } = require('uuid');

function generateFibonacci(n) {
  if (n <= 0) {
    return [];
  } else if (n === 1) {
    return [0];
  } else if (n === 2) {
    return [0, 1];
  }

  const sequence = [0, 1];
  for (let i = 2; i < n; i++) {
    const next = sequence[i - 1] + sequence[i - 2];
    sequence.push(next);
  }
  return sequence;
}

// Example usage:
const numTerms = 10;
const fibonacciSequence = generateFibonacci(numTerms);
console.log(`Fibonacci sequence up to ${numTerms} terms:`, fibonacciSequence);

// Generate a random filename and save the function
const randomFileName = `/workspace/fibonacci_${uuidv4()}.js`;

// The function definition itself will be saved by another tool call
module.exports = { generateFibonacci, randomFileName };