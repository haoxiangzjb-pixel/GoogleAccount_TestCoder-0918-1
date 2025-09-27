function fibonacci(n) {
  if (n <= 0) {
    console.log("Please enter a positive integer.");
    return;
  } else if (n === 1) {
    console.log(0);
    return;
  }

  let a = 0, b = 1;
  console.log(a);
  console.log(b);

  for (let i = 2; i < n; i++) {
    let next = a + b;
    console.log(next);
    a = b;
    b = next;
  }
}

// Example usage:
// fibonacci(10);
