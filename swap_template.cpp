#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <sstream>

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
    std::uniform_int_distribution<> dis(100000, 999999); // 生成6位随机数
    
    std::ostringstream oss;
    oss << "swap_output_" << dis(gen) << extension;
    return oss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void saveSwapToFile(T& a, T& b, const std::string& filename) {
    // 首先交换值
    swapValues(a, b);
    
    // 将结果保存到文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "After swap:\n";
        file << "First value: " << a << "\n";
        file << "Second value: " << b << "\n";
        file.close();
        std::cout << "Values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 重载版本：如果不想在保存前交换，只保存到文件
template<typename T>
void saveValuesToFile(const T& a, const T& b, const std::string& filename) {
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Original values:\n";
        file << "First value: " << a << "\n";
        file << "Second value: " << b << "\n";
        file.close();
        std::cout << "Original values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

int main() {
    // 示例1：整数交换
    int x = 10, y = 20;
    std::cout << "Original values: x = " << x << ", y = " << y << std::endl;
    
    std::string filename1 = generateRandomFileName(".txt");
    saveSwapToFile(x, y, filename1);
    
    std::cout << "After swap in main: x = " << x << ", y = " << y << std::endl;
    std::cout << std::endl;
    
    // 示例2：浮点数交换
    double a = 3.14, b = 2.71;
    std::cout << "Original values: a = " << a << ", b = " << b << std::endl;
    
    std::string filename2 = generateRandomFileName(".txt");
    saveSwapToFile(a, b, filename2);
    
    std::cout << "After swap in main: a = " << a << ", b = " << b << std::endl;
    std::cout << std::endl;
    
    // 示例3：字符串交换
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Original values: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    std::string filename3 = generateRandomFileName(".txt");
    saveSwapToFile(str1, str2, filename3);
    
    std::cout << "After swap in main: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}