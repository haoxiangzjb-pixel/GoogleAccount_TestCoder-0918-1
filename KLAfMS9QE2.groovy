// Groovy closure for filtering a list of numbers to get only even numbers
def filterEvenNumbers = { List numbers ->
    return numbers.findAll { it % 2 == 0 }
}

// Example usage
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterEvenNumbers(numbers)
println "Original list: $numbers"
println "Filtered list (even numbers): $evenNumbers"

// Another closure for filtering strings by length
def filterByLength = { List strings, int minLength ->
    return strings.findAll { it.length() >= minLength }
}

// Example usage
def words = ["apple", "bat", "cat", "elephant", "dog", "butterfly"]
def longWords = filterByLength(words, 4)
println "\nOriginal list: $words"
println "Filtered list (length >= 4): $longWords"