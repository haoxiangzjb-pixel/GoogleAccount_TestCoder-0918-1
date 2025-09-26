#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string>
#include <cstdlib>
#include <ctime>

int main() {
    // Пример массива целых чисел
    std::vector<int> arr = {3, 7, 2, 9, 1};

    // Проверка на пустой массив
    if (arr.empty()) {
        std::cout << "Массив пуст." << std::endl;
        return 1;
    }

    // Нахождение максимального элемента
    int max_val = *std::max_element(arr.begin(), arr.end());

    // Генерация случайного имени файла
    std::srand(std::time(0));
    int random_num = std::rand();
    std::string filename = "max_result_" + std::to_string(random_num) + ".txt";

    // Сохранение результата в файл
    std::ofstream outfile(filename);
    if (outfile.is_open()) {
        outfile << max_val << std::endl;
        outfile.close();
        std::cout << "Максимальное значение " << max_val << " сохранено в файл " << filename << std::endl;
    } else {
        std::cout << "Ошибка при открытии файла для записи." << std::endl;
        return 1;
    }

    return 0;
}