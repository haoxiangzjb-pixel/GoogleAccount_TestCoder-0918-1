#include <iostream>
#include <utility> // Required for std::swap (though we are implementing our own)

// Template function to swap two variables of any type
template<typename T>
void my_swap(T& a, T& b) {
    T temp = std::move(a); // Use move semantics if available, otherwise copy
    a = std::move(b);
    b = temp;
}

int main() {
    int x = 5;
    int y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    my_swap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    double p = 3.14;
    double q = 2.71;
    std::cout << "Before swap: p = " << p << ", q = " << q << std::endl;
    my_swap(p, q);
    std::cout << "After swap: p = " << p << ", q = " << q << std::endl;

    std::string s1 = "Hello";
    std::string s2 = "World";
    std::cout << "Before swap: s1 = " << s1 << ", s2 = " << s2 << std::endl;
    my_swap(s1, s2);
    std::cout << "After swap: s1 = " << s1 << ", s2 = " << s2 << std::endl;

    return 0;
}