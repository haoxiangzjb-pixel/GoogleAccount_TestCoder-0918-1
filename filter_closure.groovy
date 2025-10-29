// Groovy closure for filtering a list
def filterClosure = { list, condition ->
    return list.findAll(condition)
}

// Example usage:
// def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// def evenNumbers = filterClosure(numbers) { it % 2 == 0 }
// println evenNumbers  // Output: [2, 4, 6, 8, 10]

// Another example:
// def words = ["apple", "banana", "cherry", "date"]
// def longWords = filterClosure(words) { it.length() > 5 }
// println longWords  // Output: [banana, cherry]