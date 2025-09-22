#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <ctime>

int main() {
    // Create a vector with some sample data
    std::vector<int> numbers = {3, 7, 2, 9, 1, 8, 4, 6, 5};
    
    // Print the array
    std::cout << "Array elements: ";
    for (const auto& num : numbers) {
        std::cout << num << " ";
    }
    std::cout << std::endl;
    
    // Find maximum element using std::max_element
    auto maxElement = std::max_element(numbers.begin(), numbers.end());
    
    // Print the maximum element
    if (maxElement != numbers.end()) {
        std::cout << "Maximum element: " << *maxElement << std::endl;
    } else {
        std::cout << "Array is empty" << std::endl;
    }
    
    return 0;
}