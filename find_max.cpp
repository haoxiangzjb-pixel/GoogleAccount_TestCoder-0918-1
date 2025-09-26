#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <fstream>

int main() {
    // Пример массива целых чисел
    std::vector<int> arr = {3, 7, 2, 9, 1, 8, 4};

    // Нахождение максимального элемента
    int max_element = *std::max_element(arr.begin(), arr.end());

    std::cout << "Максимальное число в массиве: " << max_element << std::endl;

    // Генерация случайного имени файла
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999);
    std::string filename = "output_" + std::to_string(dis(gen)) + ".txt";

    // Сохранение результата в файл
    std::ofstream file(filename);
    if (file.is_open()) {
        file << max_element;
        file.close();
        std::cout << "Результат сохранен в файл: " << filename << std::endl;
    } else {
        std::cerr << "Не удалось создать файл: " << filename << std::endl;
        return 1;
    }

    return 0;
}