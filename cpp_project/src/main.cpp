#include <iostream>
#include "utils.h"

int main() {
    int a = 5;
    int b = 3;
    
    std::cout << "Adding " << a << " and " << b << " gives " << add(a, b) << std::endl;
    std::cout << "Multiplying " << a << " and " << b << " gives " << multiply(a, b) << std::endl;
    
    return 0;
}