/**
 * Функция для фильтрации списка строк
 * @param strings Список строк для фильтрации
 * @param filterCondition Условие фильтрации (лямбда-выражение)
 * @return Отфильтрованный список строк
 */
fun filterStrings(strings: List<String>, filterCondition: (String) -> Boolean): List<String> {
    return strings.filter(filterCondition)
}

// Пример использования
fun main() {
    val stringList = listOf("apple", "banana", "cherry", "date", "elderberry")
    
    // Фильтр: строки длиной больше 5 символов
    val filteredByLength = filterStrings(stringList) { it.length > 5 }
    println("Строки длиной больше 5 символов: $filteredByLength")
    
    // Фильтр: строки, начинающиеся с буквы 'a'
    val filteredByStart = filterStrings(stringList) { it.startsWith('a') }
    println("Строки, начинающиеся с 'a': $filteredByStart")
    
    // Фильтр: строки, содержащие букву 'e'
    val filteredByContains = filterStrings(stringList) { it.contains('e') }
    println("Строки, содержащие 'e': $filteredByContains")
}