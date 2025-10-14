#include <iostream>
#include <utility> // Required for std::swap (if needed) or std::exchange

// Template function to swap two variables
template<typename T>
void my_swap(T& a, T& b) {
    T temp = std::move(a); // Move 'a' into 'temp'
    a = std::move(b);      // Move 'b' into 'a'
    b = std::move(temp);   // Move 'temp' (original 'a') into 'b'
}

int main() {
    // Example usage with integers
    int x = 5, y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    my_swap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    // Example usage with strings
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    my_swap(str1, str2);
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;

    return 0;
}