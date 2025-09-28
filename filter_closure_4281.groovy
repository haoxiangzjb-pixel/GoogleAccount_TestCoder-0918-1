// Замыкание для фильтрации списка
def filterNumbers = { list ->
    list.findAll { it % 2 == 0 } // Фильтруем только четные числа
}

// Пример использования
def numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def evenNumbers = filterNumbers(numbers)
println "Оригинальный список: $numbers"
println "Отфильтрованный список (четные): $evenNumbers"
