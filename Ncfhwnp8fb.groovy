#!/usr/bin/env groovy

// Define a list of items
def items = ["apple", "banana", "cherry", "date", "elderberry"]

// Iterate over the list and print each item
items.each { item ->
    println "Item: ${item}"
}

// Using traditional for loop as an alternative
println "\nUsing traditional for loop:"
for (int i = 0; i < items.size(); i++) {
    println "Item ${i + 1}: ${items[i]}"
}