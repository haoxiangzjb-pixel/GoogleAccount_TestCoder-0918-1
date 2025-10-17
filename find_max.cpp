#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>

int main() {
    // Example array - you can modify this as needed
    std::vector<int> arr = {3, 7, 2, 9, 1, 5, 8, 6, 4};
    
    // Find the maximum element
    int max_val = *std::max_element(arr.begin(), arr.end());
    
    // Generate a random filename
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1000, 9999);
    int random_num = dis(gen);
    
    std::string filename = "max_result_" + std::to_string(random_num) + ".txt";
    
    // Write the maximum value to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum value in the array: " << max_val << std::endl;
        file.close();
        std::cout << "Maximum value " << max_val << " saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Unable to open file for writing." << std::endl;
        return 1;
    }
    
    return 0;
}