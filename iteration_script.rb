# Ruby script to iterate through an array using blocks and print elements

# Define an example array
array = [1, 2, 3, 4, 5, 'hello', 'world', 10]

# Method 1: Using .each block to iterate and print elements
puts "Using .each block:"
array.each do |element|
  puts element
end

puts "\nUsing .each with a block (alternative syntax):"
# Method 2: Using .each with curly braces block
array.each { |element| puts element }

puts "\nUsing .map with a block (for transformation):"
# Method 3: Using .map with a block (though here we just print)
array.map { |element| puts "Element: #{element}" }

puts "\nUsing custom block with index:"
# Method 4: Using .each_with_index to get both index and element
array.each_with_index do |element, index|
  puts "Index #{index}: #{element}"
end