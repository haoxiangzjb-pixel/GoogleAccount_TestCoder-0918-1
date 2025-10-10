#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <ctime>

int main() {
    // Инициализация генератора случайных чисел
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1, 1000); // Диапазон случайных чисел от 1 до 1000

    const int array_size = 20; // Размер массива
    std::vector<int> numbers(array_size);

    // Заполнение массива случайными числами
    std::cout << "Массив: ";
    for (int& num : numbers) {
        num = dis(gen);
        std::cout << num << " ";
    }
    std::cout << std::endl;

    // Нахождение максимального элемента
    int max_num = *std::max_element(numbers.begin(), numbers.end());

    std::cout << "Максимальное число в массиве: " << max_num << std::endl;

    return 0;
}