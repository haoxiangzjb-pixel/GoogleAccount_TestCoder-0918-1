fun filterStrings(stringList: List<String>): List<String> {
    return stringList.filter { it.startsWith('A') }
}

fun main() {
    val inputList = listOf("Apple", "banana", "Avocado", "cherry", "Apricot")
    val filteredList = filterStrings(inputList)
    println(filteredList) // Выведет [Apple, Avocado, Apricot]
}