#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <ctime>

// 模板函数：交换两个变量的值
template<typename T>
void swapValues(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generateRandomFileName(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 999999);
    
    // 使用时间作为种子的一部分，确保文件名的唯一性
    auto time_now = std::time(nullptr);
    std::string filename = "swap_data_" + std::to_string(time_now) + "_" + std::to_string(dis(gen)) + extension;
    
    return filename;
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
std::string saveSwapResult(T& a, T& b, const std::string& description = "") {
    // 交换值
    swapValues(a, b);
    
    // 生成随机文件名
    std::string filename = generateRandomFileName(".txt");
    
    // 将结果保存到文件
    std::ofstream file(filename);
    if (file.is_open()) {
        if (!description.empty()) {
            file << "Description: " << description << std::endl;
        }
        file << "After swap:" << std::endl;
        file << "First value: " << a << std::endl;
        file << "Second value: " << b << std::endl;
        file.close();
        std::cout << "Swap result saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Could not open file for writing: " << filename << std::endl;
        return "";
    }
    
    return filename;
}

// 示例用法
int main() {
    // 示例1：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap - x: " << x << ", y: " << y << std::endl;
    std::string file1 = saveSwapResult(x, y, "Integer swap example");
    std::cout << "After swap - x: " << x << ", y: " << y << std::endl << std::endl;
    
    // 示例2：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap - a: " << a << ", b: " << b << std::endl;
    std::string file2 = saveSwapResult(a, b, "Double swap example");
    std::cout << "After swap - a: " << a << ", b: " << b << std::endl << std::endl;
    
    // 示例3：交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    std::string file3 = saveSwapResult(str1, str2, "String swap example");
    std::cout << "After swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    
    return 0;
}