#ifndef SWAP_TEMPLATE_H
#define SWAP_TEMPLATE_H

// C++模板函数用于交换两个变量的值
template<typename T>
void swapValues(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

#endif // SWAP_TEMPLATE_H