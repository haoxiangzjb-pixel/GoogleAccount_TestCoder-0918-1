#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <fstream>
#include <cstdlib>
#include <ctime>

int main() {
    // Инициализация генератора случайных чисел
    std::srand(std::time(0));

    // Пример массива целых чисел
    std::vector<int> arr = {3, 7, 2, 9, 1};

    // Нахождение максимального элемента
    int max_val = *std::max_element(arr.begin(), arr.end());

    // Генерация случайного имени файла
    std::string filename = "max_result_" + std::to_string(std::rand()) + ".txt";

    // Открытие файла для записи
    std::ofstream file(filename);
    if (file.is_open()) {
        file << max_val << std::endl;
        file.close();
        std::cout << "Максимальное значение " << max_val << " записано в файл " << filename << std::endl;
    } else {
        std::cerr << "Не удалось открыть файл для записи." << std::endl;
        return 1;
    }

    return 0;
}