fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length > 5 }
}

fun main() {
    val originalList = listOf("a", "hello", "world!", "Kotlin", "programming", "fun")
    val filteredList = filterStrings(originalList)
    println("Original: $originalList")
    println("Filtered (>5 chars): $filteredList")
}