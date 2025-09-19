// Function to generate Fibonacci sequence up to n terms
function fibonacci(n) {
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
console.log(fibonacci(10)); // Outputs first 10 Fibonacci numbers