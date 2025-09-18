#include <iostream>
#include <string>

// C++模板函数用于交换两个变量的值
template<typename T>
void swapValues(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 示例使用
int main() {
    // 交换整数
    int x = 5, y = 10;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    swapValues(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;

    // 交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "交换前: a = " << a << ", b = " << b << std::endl;
    swapValues(a, b);
    std::cout << "交换后: a = " << a << ", b = " << b << std::endl;

    // 交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "交换前: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    swapValues(str1, str2);
    std::cout << "交换后: str1 = " << str1 << ", str2 = " << str2 << std::endl;

    return 0;
}