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
    std::uniform_int_distribution<> dis(10000, 99999);
    
    std::ostringstream oss;
    oss << "swap_output_" << dis(gen) << extension;
    return oss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void save_swap_to_file(T& a, T& b, const std::string& extension = ".txt") {
    // 交换值
    swap_values(a, b);
    
    // 生成随机文件名
    std::string filename = generate_random_filename(extension);
    
    // 将交换后的值写入文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "After swap:\n";
        file << "a = " << a << "\n";
        file << "b = " << b << "\n";
        file.close();
        std::cout << "Values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 非修改版本：交换值但不修改原始变量，只保存到文件
template<typename T>
void save_swap_to_file_no_modify(T a, T b, const std::string& extension = ".txt") {
    // 交换副本的值
    T temp = a;
    a = b;
    b = temp;
    
    // 生成随机文件名
    std::string filename = generate_random_filename(extension);
    
    // 将交换后的值写入文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "After swap:\n";
        file << "first value = " << a << "\n";
        file << "second value = " << b << "\n";
        file.close();
        std::cout << "Values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

int main() {
    // 示例1：使用整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    save_swap_to_file(x, y);
    std::cout << "After function call: x = " << x << ", y = " << y << std::endl << std::endl;
    
    // 示例2：使用浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    save_swap_to_file_no_modify(a, b, ".dat");
    std::cout << "Original values unchanged: a = " << a << ", b = " << b << std::endl << std::endl;
    
    // 示例3：使用字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    save_swap_to_file_no_modify(str1, str2, ".log");
    std::cout << "Original strings unchanged: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}