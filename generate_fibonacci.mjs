import { v4 as uuidv4 } from 'uuid';
import fs from 'fs';

function fibonacci(n) {
  if (n <= 0) return [];
  if (n === 1) return [0];
  if (n === 2) return [0, 1];

  const sequence = [0, 1];
  for (let i = 2; i < n; i++) {
    sequence[i] = sequence[i - 1] + sequence[i - 2];
  }
  return sequence;
}

const n = 10; // Example: number of terms
const fibSequence = fibonacci(n);
console.log(`Fibonacci sequence up to ${n} terms:`, fibSequence);

// Generate a random filename
const randomFileName = `/workspace/fibonacci_output_${uuidv4()}.js`;

// Write the function and output to the new file

const fileContent = `
// Generated Fibonacci function and output
function fibonacci(n) {
  if (n <= 0) return [];
  if (n === 1) return [0];
  if (n === 2) return [0, 1];

  const sequence = [0, 1];
  for (let i = 2; i < n; i++) {
    sequence[i] = sequence[i - 1] + sequence[i - 2];
  }
  return sequence;
}

const n = ${n};
const fibSequence = fibonacci(n);
console.log('Fibonacci sequence:', fibSequence);

module.exports = fibonacci;
`;

fs.writeFileSync(randomFileName, fileContent);
console.log(`Function saved to ${randomFileName}`);