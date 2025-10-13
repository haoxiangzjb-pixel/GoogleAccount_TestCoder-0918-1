#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string>

int main() {
    // Пример массива
    std::vector<int> arr = {3, 7, 2, 9, 1};

    // Найти максимальное число
    int max_num = *std::max_element(arr.begin(), arr.end());

    // Сгенерировать случайное имя файла (в данном случае используем простое имя)
    std::string filename = "random_output_12345.txt";

    // Открыть файл для записи
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Максимальное число в массиве: " << max_num << std::endl;
        file.close();
        std::cout << "Максимальное число " << max_num << " записано в файл " << filename << std::endl;
    } else {
        std::cout << "Не удалось открыть файл для записи." << std::endl;
    }

    return 0;
}