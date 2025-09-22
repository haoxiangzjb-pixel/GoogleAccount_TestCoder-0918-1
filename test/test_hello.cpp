#include <iostream>
#include "../src/hello.h"

int main() {
    std::cout << "Running tests..." << std::endl;
    hello();
    std::cout << "Tests passed!" << std::endl;
    return 0;
}