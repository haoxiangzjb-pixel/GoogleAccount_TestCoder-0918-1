fun filterStrings(stringList: List<String>, filterPredicate: (String) -> Boolean): List<String> {
    return stringList.filter(filterPredicate)
}

// Example usage:
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry")
    
    // Filter strings that have length greater than 5
    val filtered = filterStrings(strings) { it.length > 5 }
    println("Strings with length > 5: $filtered")
    
    // Filter strings that start with 'a'
    val startsWithA = filterStrings(strings) { it.startsWith('a') }
    println("Strings starting with 'a': $startsWithA")
    
    // Filter strings containing 'e'
    val containsE = filterStrings(strings) { it.contains('e') }
    println("Strings containing 'e': $containsE")
}