#!/usr/bin/env ruby

# Create an array of sample elements
array = ['apple', 'banana', 'cherry', 'date', 'elderberry']

puts "Iterating through array using a block:"
array.each do |element|
  puts element
end

puts "\nUsing block with index:"
array.each_with_index do |element, index|
  puts "#{index}: #{element}"
end