// Groovy script with a closure for filtering a list
// This closure filters a list to include only even numbers

def filterEvenNumbers = { list ->
    return list.findAll { it % 2 == 0 }
}

// Example usage
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterEvenNumbers(numbers)

println "Original list: $numbers"
println "Filtered list (even numbers only): $evenNumbers"