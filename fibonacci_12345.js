/**
 * Generates and outputs the Fibonacci sequence up to n terms
 * @param {number} n - The number of terms in the Fibonacci sequence
 */
function fibonacciSequence(n) {
    if (n <= 0) {
        console.log("Please enter a positive number");
        return [];
    } else if (n === 1) {
        console.log("Fibonacci sequence:");
        console.log(0);
        return [0];
    } else if (n === 2) {
        console.log("Fibonacci sequence:");
        console.log(0);
        console.log(1);
        return [0, 1];
    }

    // Initialize the sequence with the first two numbers
    let sequence = [0, 1];
    console.log("Fibonacci sequence:");
    console.log(0);
    console.log(1);

    // Generate the remaining numbers in the sequence
    for (let i = 2; i < n; i++) {
        let nextNumber = sequence[i - 1] + sequence[i - 2];
        sequence.push(nextNumber);
        console.log(nextNumber);
    }

    return sequence;
}

// Example usage:
// fibonacciSequence(10);