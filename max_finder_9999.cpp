#include <iostream>
#include <vector>
#include <algorithm>
#include <climits>

int main() {
    // Пример массива целых чисел
    std::vector<int> numbers = {3, 7, 2, 9, 1};

    // Проверка на пустой массив
    if (numbers.empty()) {
        std::cout << "Массив пуст." << std::endl;
        return 1;
    }

    // Инициализация максимального значения первым элементом
    int max_val = numbers[0];

    // Проход по всем элементам массива
    for (int num : numbers) {
        if (num > max_val) {
            max_val = num;
        }
    }

    // Вывод максимального значения
    std::cout << "Максимальное число в массиве: " << max_val << std::endl;

    return 0;
}