fun filterStrings(list: List<String>, predicate: (String) -> Boolean): List<String> {
    return list.filter { predicate(it) }
}

fun main() {
    val strings = listOf("apple", "banana", "cherry", "date", "elderberry")

    // Example 1: Filter strings that start with 'a'
    val startsWithA = filterStrings(strings) { it.startsWith('a') }
    println("Strings starting with 'a': $startsWithA")

    // Example 2: Filter strings with length greater than 5
    val longStrings = filterStrings(strings) { it.length > 5 }
    println("Strings with length > 5: $longStrings")
}