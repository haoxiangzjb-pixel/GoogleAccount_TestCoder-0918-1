fun filterStrings(list: List<String>): List<String> {
    return list.filter { it.length > 3 }
}

fun main() {
    val strings = listOf("hi", "hello", "world", "a", "test", "of", "Kotlin")
    val filtered = filterStrings(strings)
    println("Original: $strings")
    println("Filtered (length > 3): $filtered")
}