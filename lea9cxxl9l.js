function fibonacciSequence(n) {
    if (n <= 0) {
        console.log("Please enter a positive number for the number of terms.");
        return [];
    } else if (n === 1) {
        console.log("Fibonacci sequence up to 1 term:");
        console.log(0);
        return [0];
    } else if (n === 2) {
        console.log("Fibonacci sequence up to 2 terms:");
        console.log(0);
        console.log(1);
        return [0, 1];
    }

    const sequence = [0, 1];
    console.log("Fibonacci sequence up to " + n + " terms:");
    console.log(0);
    console.log(1);

    for (let i = 2; i < n; i++) {
        const nextTerm = sequence[i - 1] + sequence[i - 2];
        sequence.push(nextTerm);
        console.log(nextTerm);
    }

    return sequence;
}

// Example usage:
// fibonacciSequence(10);