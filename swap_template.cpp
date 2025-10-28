#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <chrono>

// 模板函数：交换两个变量的值
template<typename T>
void swap_values(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generate_random_filename(const std::string& extension = ".txt") {
    // 使用当前时间作为随机种子
    auto seed = std::chrono::high_resolution_clock::now().time_since_epoch().count();
    std::mt19937 generator(seed);
    std::uniform_int_distribution<int> distribution(100000, 999999); // 生成6位随机数
    
    int random_num = distribution(generator);
    return "swap_output_" + std::to_string(random_num) + extension;
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void save_to_random_file(const T& a, const T& b, const std::string& variable_name_a = "a", const std::string& variable_name_b = "b") {
    std::string filename = generate_random_filename(".txt");
    
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Variable " << variable_name_a << ": " << a << std::endl;
        file << "Variable " << variable_name_b << ": " << b << std::endl;
        file.close();
        std::cout << "Values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

int main() {
    // 示例：使用整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    swap_values(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;
    save_to_random_file(x, y, "x", "y");
    
    std::cout << std::endl;
    
    // 示例：使用浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    swap_values(a, b);
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;
    save_to_random_file(a, b, "a", "b");
    
    std::cout << std::endl;
    
    // 示例：使用字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    swap_values(str1, str2);
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    save_to_random_file(str1, str2, "str1", "str2");
    
    return 0;
}