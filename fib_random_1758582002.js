// Function to generate Fibonacci sequence up to n terms
function fibonacci(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer");
    return;
  }
  
  let fibSequence = [];
  
  if (n >= 1) {
    fibSequence.push(0);
  }
  
  if (n >= 2) {
    fibSequence.push(1);
  }
  
  for (let i = 2; i < n; i++) {
    fibSequence[i] = fibSequence[i - 1] + fibSequence[i - 2];
  }
  
  return fibSequence;
}

// Example usage
const n = 10;
console.log(`Fibonacci sequence up to ${n} terms:`);
console.log(fibonacci(n));