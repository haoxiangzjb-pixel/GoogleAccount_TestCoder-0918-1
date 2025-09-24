#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <cstdlib>
#include <ctime>
#include <fstream>

int main() {
    // Example array
    std::vector<int> arr = {3, 7, 2, 9, 1};

    if (arr.empty()) {
        std::cout << "Array is empty." << std::endl;
        return 1;
    }

    int max_val = *std::max_element(arr.begin(), arr.end());
    std::cout << "Maximum value in the array is: " << max_val << std::endl;

    // Generate a random filename
    std::srand(std::time(0));
    std::string filename = "max_value_" + std::to_string(std::rand() % 10000) + ".txt";

    // Write the result to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << max_val;
        file.close();
        std::cout << "Result saved to " << filename << std::endl;
    } else {
        std::cout << "Could not open file for writing." << std::endl;
        return 1;
    }

    return 0;
}