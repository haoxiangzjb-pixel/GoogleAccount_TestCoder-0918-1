/**
 * Filters a list of strings based on a predicate function
 * @param stringList The input list of strings to filter
 * @param filterPredicate A function that determines if a string should be included in the result
 * @return A new list containing only the strings that match the predicate
 */
fun filterStrings(stringList: List<String>, filterPredicate: (String) -> Boolean): List<String> {
    return stringList.filter(filterPredicate)
}

// Additional utility functions for common filtering operations

/**
 * Filters strings by minimum length
 */
fun filterByMinLength(stringList: List<String>, minLength: Int): List<String> {
    return filterStrings(stringList) { it.length >= minLength }
}

/**
 * Filters strings that start with a specific prefix
 */
fun filterByPrefix(stringList: List<String>, prefix: String): List<String> {
    return filterStrings(stringList) { it.startsWith(prefix) }
}

/**
 * Filters strings that contain a specific substring
 */
fun filterByContains(stringList: List<String>, substring: String): List<String> {
    return filterStrings(stringList) { it.contains(substring) }
}

// Example usage:
fun main() {
    val sampleStrings = listOf("kotlin", "java", "python", "javascript", "go", "rust", "swift")
    
    println("Original list: $sampleStrings")
    
    // Filter strings with length >= 5
    val longStrings = filterByMinLength(sampleStrings, 5)
    println("Strings with length >= 5: $longStrings")
    
    // Filter strings starting with 'j'
    val jStrings = filterByPrefix(sampleStrings, "j")
    println("Strings starting with 'j': $jStrings")
    
    // Filter strings containing 's'
    val sStrings = filterByContains(sampleStrings, "s")
    println("Strings containing 's': $sStrings")
    
    // Using the main filter function with a custom predicate
    val customFilter = filterStrings(sampleStrings) { 
        it.length > 4 && it.startsWith("p") 
    }
    println("Strings starting with 'p' and length > 4: $customFilter")
}