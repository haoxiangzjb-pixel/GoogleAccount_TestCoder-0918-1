// Groovy closure for filtering a list
def filterEvenNumbers = { list ->
    return list.findAll { it % 2 == 0 }
}

// Example usage
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterEvenNumbers(numbers)
println "Original list: ${numbers}"
println "Filtered (even numbers only): ${evenNumbers}"

// More generic filter closure that accepts a predicate
def genericFilter = { list, predicate ->
    return list.findAll(predicate)
}

// Example with custom predicate
def greaterThanFive = genericFilter(numbers) { it > 5 }
println "Numbers greater than 5: ${greaterThanFive}"