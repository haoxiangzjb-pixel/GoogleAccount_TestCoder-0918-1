// This function generates the Fibonacci sequence up to n terms
function fibonacci(n) {
  if (n <= 0) {
    return [];
  } else if (n === 1) {
    return [0];
  } else if (n === 2) {
    return [0, 1];
  }

  let sequence = [0, 1];
  for (let i = 2; i < n; i++) {
    sequence[i] = sequence[i - 1] + sequence[i - 2];
  }
  return sequence;
}

// Example usage:
const n = 10; // Change this number to generate more or fewer terms
console.log(`Fibonacci sequence up to ${n} terms:`, fibonacci(n));
