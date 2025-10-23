fun filterStrings(stringList: List<String>, filterCondition: (String) -> Boolean): List<String> {
    return stringList.filter(filterCondition)
}

// Example usage:
fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry")
    val filtered = filterStrings(strings) { it.length > 5 }
    println("Filtered strings: $filtered")
    
    val startsWithA = filterStrings(strings) { it.startsWith("a", ignoreCase = true) }
    println("Strings starting with 'a': $startsWithA")
}