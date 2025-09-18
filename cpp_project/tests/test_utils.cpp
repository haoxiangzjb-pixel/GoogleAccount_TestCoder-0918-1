#include <cassert>
#include <iostream>
#include "utils.h"

int main() {
    assert(factorial(0) == 1);
    assert(factorial(1) == 1);
    assert(factorial(5) == 120);
    std::cout << "All tests passed!" << std::endl;
    return 0;
}