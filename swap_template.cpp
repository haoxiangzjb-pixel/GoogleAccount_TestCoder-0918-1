#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
#include <ctime>

// 模板函数：交换两个变量的值
template<typename T>
void mySwap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // 生成随机文件名
    std::srand(std::time(0)); // 初始化随机数种子
    int random_num = std::rand() % 10000; // 生成0-9999的随机数
    std::string filename = "swap_output_" + std::to_string(random_num) + ".txt";

    // 创建文件流对象
    std::ofstream outFile(filename);

    if (!outFile.is_open()) {
        std::cerr << "Error: Could not open file " << filename << std::endl;
        return 1;
    }

    // 测试交换整数
    int x = 5, y = 10;
    outFile << "Before swap (int): x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    outFile << "After swap (int): x = " << x << ", y = " << y << std::endl;

    // 测试交换字符串
    std::string str1 = "Hello", str2 = "World";
    outFile << "Before swap (string): str1 = " << str1 << ", str2 = " << str2 << std::endl;
    mySwap(str1, str2);
    outFile << "After swap (string): str1 = " << str1 << ", str2 = " << str2 << std::endl;

    // 测试交换浮点数
    double a = 3.14, b = 2.71;
    outFile << "Before swap (double): a = " << a << ", b = " << b << std::endl;
    mySwap(a, b);
    outFile << "After swap (double): a = " << a << ", b = " << b << std::endl;

    // 关闭文件
    outFile.close();

    std::cout << "Swap operations completed. Results saved to " << filename << std::endl;

    return 0;
}