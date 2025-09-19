#include <iostream>
#include "calculator.h"

int main() {
    Calculator calc;
    
    int sum = calc.add(5, 3);
    int product = calc.multiply(4, 6);
    
    std::cout << "5 + 3 = " << sum << std::endl;
    std::cout << "4 * 6 = " << product << std::endl;
    
    return 0;
}