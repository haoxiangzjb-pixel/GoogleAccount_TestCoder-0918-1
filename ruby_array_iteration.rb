# Ruby script to iterate through an array using blocks and print elements
arr = [1, 2, 3, 4, 5]

puts "Iterating through array using each block:"
arr.each do |element|
  puts element
end

puts "\nIterating through array using each block with curly braces:"
arr.each { |element| puts element }