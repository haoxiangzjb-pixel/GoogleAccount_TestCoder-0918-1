#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <fstream> // for std::ofstream
#include <cstdlib> // for rand()

int main() {
    // Example array, in a real scenario this could be populated differently
    std::vector<int> numbers = {3, 7, 2, 9, 1};

    if (numbers.empty()) {
        std::cout << "The array is empty." << std::endl;
        return 1;
    }

    int max_num = *std::max_element(numbers.begin(), numbers.end());

    std::cout << "The maximum number in the array is: " << max_num << std::endl;

    // Generate a random filename
    std::string filename = "max_result_" + std::to_string(rand()) + ".txt";

    // Write the result to the file
    std::ofstream outfile(filename);
    if (outfile.is_open()) {
        outfile << max_num;
        outfile.close();
        std::cout << "Result saved to " << filename << std::endl;
    } else {
        std::cout << "Could not open file for writing." << std::endl;
        return 1; // Exit with error code
    }

    return 0;
}