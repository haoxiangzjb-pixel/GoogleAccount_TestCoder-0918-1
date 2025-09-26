# An example of using a Ruby block to iterate over an array and print its elements.
# This demonstrates the use of the `each` method with a block.

# Define an array of fruits
fruits = ['apple', 'banana', 'cherry', 'date']

# Use the `each` method with a block to iterate over the array
# The block takes one parameter, `fruit`, which represents the current element
fruits.each do |fruit|
  # Print the current fruit
  puts fruit
end
