#include <iostream>
#include <cassert>
#include "calculator.h"

int main() {
    Calculator calc;
    
    // Test add function
    assert(calc.add(2, 3) == 5);
    assert(calc.add(-1, 1) == 0);
    assert(calc.add(0, 0) == 0);
    
    // Test multiply function
    assert(calc.multiply(3, 4) == 12);
    assert(calc.multiply(-2, 3) == -6);
    assert(calc.multiply(0, 5) == 0);
    
    std::cout << "All tests passed!" << std::endl;
    
    return 0;
}