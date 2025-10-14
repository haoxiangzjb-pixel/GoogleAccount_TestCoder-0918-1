/**
 * Фильтрует список строк, возвращая только те, длина которых больше 5 символов.
 * @param inputList Список строк для фильтрации.
 * @return Новый список, содержащий строки с длиной больше 5 символов.
 */
fun filterStrings(inputList: List<String>): List<String> {
    return inputList.filter { it.length > 5 }
}

// Пример использования
fun main() {
    val originalList = listOf("cat", "elephant", "dog", "hippopotamus", "ant", "kangaroo")
    val filteredList = filterStrings(originalList)
    println("Оригинальный список: $originalList")
    println("Отфильтрованный список: $filteredList")
}