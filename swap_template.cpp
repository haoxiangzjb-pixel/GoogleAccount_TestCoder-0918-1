#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <sstream>

// 模板函数：交换两个变量的值
template<typename T>
void swap_values(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generate_random_filename(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 9);
    
    std::stringstream ss;
    ss << "output_";
    
    // 生成10位随机数字作为文件名
    for(int i = 0; i < 10; ++i) {
        ss << dis(gen);
    }
    ss << extension;
    
    return ss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void save_to_random_file(const T& a, const T& b, const std::string& description = "") {
    std::string filename = generate_random_filename(".txt");
    
    std::ofstream file(filename);
    if (file.is_open()) {
        if (!description.empty()) {
            file << description << std::endl;
        }
        file << "Value A: " << a << std::endl;
        file << "Value B: " << b << std::endl;
        file.close();
        std::cout << "Data saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Unable to open file: " << filename << std::endl;
    }
}

int main() {
    // 示例：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap - x: " << x << ", y: " << y << std::endl;
    swap_values(x, y);
    std::cout << "After swap - x: " << x << ", y: " << y << std::endl;
    save_to_random_file(x, y, "Integer swap result:");
    
    // 示例：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "\nBefore swap - a: " << a << ", b: " << b << std::endl;
    swap_values(a, b);
    std::cout << "After swap - a: " << a << ", b: " << b << std::endl;
    save_to_random_file(a, b, "Double swap result:");
    
    // 示例：交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "\nBefore swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    swap_values(str1, str2);
    std::cout << "After swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    save_to_random_file(str1, str2, "String swap result:");
    
    return 0;
}