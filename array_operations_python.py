# Basic Array Operations in Python
# This script demonstrates sum and mean calculations on arrays

import numpy as np

# Create sample arrays
array1 = [1, 2, 3, 4, 5]
array2 = [10, 20, 30, 40, 50]
array3 = [2.5, 3.7, 1.2, 8.9, 5.1]

print("Array Operations Example")
print("========================")

# Display the arrays
print("Array 1:", array1)
print("Array 2:", array2)
print("Array 3:", array3)

# Calculate and display sums
sum1 = sum(array1)
sum2 = sum(array2)
sum3 = sum(array3)

print("\nSum Operations:")
print("Sum of Array 1:", sum1)
print("Sum of Array 2:", sum2)
print("Sum of Array 3:", sum3)

# Calculate and display means
mean1 = sum1 / len(array1)
mean2 = sum2 / len(array2)
mean3 = sum3 / len(array3)

print("\nMean Operations:")
print("Mean of Array 1:", mean1)
print("Mean of Array 2:", mean2)
print("Mean of Array 3:", mean3)

# Perform operations on concatenated arrays
combined_array = array1 + array2 + array3
print("\nCombined Array:", combined_array)
print("Sum of Combined Array:", sum(combined_array))
print("Mean of Combined Array:", sum(combined_array) / len(combined_array))

# Using NumPy for more advanced operations
np_array1 = np.array(array1)
np_array2 = np.array(array2)

print("\nNumPy Operations:")
print("Sum using NumPy:", np.sum(np_array1))
print("Mean using NumPy:", np.mean(np_array1))
print("Element-wise sum (Array1 + Array2[:5]):", np_array1 + np_array2[:5])