// Groovy closure for filtering a list
def createFilter = { predicate ->
    return { list ->
        list.findAll { item -> predicate(item) }
    }
}

// Alternative implementation as a simple closure
def simpleFilter = { list, condition ->
    list.findAll(condition)
}

// Example usage:
// def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// def evenFilter = createFilter { it % 2 == 0 }
// def evenNumbers = evenFilter(numbers)
// println evenNumbers  // Output: [2, 4, 6, 8, 10]

// Using simple filter:
// def greaterThanFive = simpleFilter(numbers) { it > 5 }
// println greaterThanFive  // Output: [6, 7, 8, 9, 10]