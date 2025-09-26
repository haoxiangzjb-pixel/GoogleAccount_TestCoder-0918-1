fun filterStrings(inputList: List<String>): List<String> {
    // Пример фильтрации: оставить только строки с длиной больше 3 символов
    return inputList.filter { it.length > 3 }
}

// Пример использования
fun main() {
    val strings = listOf("a", "hello", "hi", "world", "Kotlin", "fun")
    val filteredStrings = filterStrings(strings)
    println("Оригинальный список: $strings")
    println("Отфильтрованный список: $filteredStrings")
}