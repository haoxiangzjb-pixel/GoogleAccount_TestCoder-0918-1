// Groovy script with a closure for filtering a list
// Define a list of numbers
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// Define a closure that filters even numbers
def filterEven = { it % 2 == 0 }

// Apply the closure to filter the list
def evenNumbers = numbers.findAll(filterEven)

// Print the results
println "Original list: ${numbers}"
println "Filtered list (even numbers): ${evenNumbers}"

// Another example with strings
def words = ["apple", "banana", "cherry", "date", "elderberry"]

// Define a closure that filters words longer than 5 characters
def filterLongWords = { it.length() > 5 }

// Apply the closure to filter the list of words
def longWords = words.findAll(filterLongWords)

// Print the results
println "Original words: ${words}"
println "Filtered words (longer than 5 chars): ${longWords}"