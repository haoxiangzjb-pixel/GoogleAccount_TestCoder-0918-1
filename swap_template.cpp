#include <iostream>
#include <fstream>
#include <string>
#include <random>

// 模板函数：交换两个变量的值
template<typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // 创建随机数生成器用于生成文件名
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1, 100000);

    // 生成随机文件名
    std::string filename = "swap_result_" + std::to_string(dis(gen)) + ".txt";
    std::cout << "Generated filename: " << filename << std::endl;

    // 示例：交换两个整数
    int x = 5, y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    swap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    // 将结果写入随机命名的文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Before swap: x = " << 5 << ", y = " << 10 << std::endl;
        file << "After swap: x = " << x << ", y = " << y << std::endl;
        file.close();
        std::cout << "Results written to " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
        return 1;
    }

    return 0;
}