# Method to calculate factorial of a number
def factorial(n)
  # Handle edge cases
  return 1 if n <= 1
  # Calculate factorial using reduce
  (1..n).reduce(1, :*)
end

# Example usage (commented out so the file can be required without executing)
# puts factorial(5)  # Output: 120
# puts factorial(0)  # Output: 1