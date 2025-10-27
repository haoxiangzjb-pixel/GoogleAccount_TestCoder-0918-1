#!/usr/bin/env ruby

# Create an example array
array = [1, 2, 3, 4, 5, 'hello', 'world', 10.5]

puts "Original array: #{array}"

puts "\nUsing .each block to print elements:"
array.each do |element|
  puts element
end

puts "\nUsing .each_with_index block to print elements with their index:"
array.each_with_index do |element, index|
  puts "Index #{index}: #{element}"
end

puts "\nUsing block with array transformation (doubling numbers):"
numbers = [1, 2, 3, 4, 5]
doubled = numbers.map { |num| num * 2 }
puts "Original: #{numbers}"
puts "Doubled: #{doubled}"

puts "\nUsing select block to filter elements:"
even_numbers = numbers.select { |num| num.even? }
puts "Even numbers from #{numbers}: #{even_numbers}"