fun filterStringsByLength(strings: List<String>, minLength: Int): List<String> {
    return strings.filter { it.length >= minLength }
}

fun filterStringsContaining(strings: List<String>, substring: String): List<String> {
    return strings.filter { it.contains(substring, ignoreCase = true) }
}

fun filterStringsByPrefix(strings: List<String>, prefix: String): List<String> {
    return strings.filter { it.startsWith(prefix, ignoreCase = true) }
}

fun filterStringsBySuffix(strings: List<String>, suffix: String): List<String> {
    return strings.filter { it.endsWith(suffix, ignoreCase = true) }
}

// Пример использования
fun main() {
    val words = listOf("apple", "banana", "avocado", "cherry", "apricot", "blueberry")
    
    println("Слова длиной 6 символов и более:")
    println(filterStringsByLength(words, 6))
    
    println("\nСлова, содержащие 'ap':")
    println(filterStringsContaining(words, "ap"))
    
    println("\nСлова, начинающиеся на 'a':")
    println(filterStringsByPrefix(words, "a"))
    
    println("\nСлова, заканчивающиеся на 'berry':")
    println(filterStringsBySuffix(words, "berry"))
}