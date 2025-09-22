// Groovy script defining a closure for filtering a list
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// Closure to filter even numbers
def filterEven = { it % 2 == 0 }

// Apply the filter
def evenNumbers = numbers.findAll(filterEven)

println "Original list: $numbers"
println "Filtered list (even numbers): $evenNumbers"

// Another example with strings
def words = ["apple", "banana", "cherry", "date", "elderberry"]

// Closure to filter words longer than 5 characters
def filterLongWords = { it.length() > 5 }

// Apply the filter
def longWords = words.findAll(filterLongWords)

println "Original words: $words"
println "Filtered words (longer than 5): $longWords"