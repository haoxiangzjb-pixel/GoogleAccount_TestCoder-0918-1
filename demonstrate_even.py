#!/usr/bin/env python3

def even(n):
    """
    Python equivalent of the Prolog predicate to check if a number is even.
    Returns True if the number is even, False otherwise.
    """
    return n % 2 == 0

# Test cases
test_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

print("Testing the even predicate:")
for num in test_numbers:
    result = even(num)
    print(f"even({num}) -> {result}")