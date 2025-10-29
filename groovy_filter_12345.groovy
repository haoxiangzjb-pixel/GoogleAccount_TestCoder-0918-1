// Groovy closure for filtering a list with different implementation
def createFilter = { predicate ->
    return { list ->
        list.findAll(predicate)
    }
}

// Example usage:
// def isEven = { number -> number % 2 == 0 }
// def filterEven = createFilter(isEven)
// def result = filterEven([1, 2, 3, 4, 5, 6])
// println result  // Output: [2, 4, 6]

// Another example with strings
// def isLong = { word -> word.length() > 4 }
// def filterLongWords = createFilter(isLong)
// def result2 = filterLongWords(["cat", "elephant", "dog", "giraffe"])
// println result2  // Output: [elephant, giraffe]