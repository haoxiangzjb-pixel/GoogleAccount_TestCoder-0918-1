#include <iostream>
#include "calculator.h"

int main() {
    Calculator calc;
    
    // Test addition
    int result_add = calc.add(2, 3);
    if (result_add == 5) {
        std::cout << "PASS: 2 + 3 = " << result_add << std::endl;
    } else {
        std::cout << "FAIL: 2 + 3 = " << result_add << ", expected 5" << std::endl;
        return 1;
    }
    
    // Test multiplication
    int result_mult = calc.multiply(4, 5);
    if (result_mult == 20) {
        std::cout << "PASS: 4 * 5 = " << result_mult << std::endl;
    } else {
        std::cout << "FAIL: 4 * 5 = " << result_mult << ", expected 20" << std::endl;
        return 1;
    }
    
    return 0;
}