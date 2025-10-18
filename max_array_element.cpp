#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <fstream>

int main() {
    // Create a sample array for demonstration
    std::vector<int> arr = {3, 7, 2, 9, 1, 5, 8};
    
    // Find the maximum element
    int max_element = *std::max_element(arr.begin(), arr.end());
    
    std::cout << "Maximum element in the array: " << max_element << std::endl;
    
    // Generate a random filename
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999);
    
    int random_num = dis(gen);
    std::string filename = "result_" + std::to_string(random_num) + ".txt";
    
    // Write the maximum element to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum element in the array: " << max_element << std::endl;
        file.close();
        std::cout << "Result saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Unable to open file for writing." << std::endl;
        return 1;
    }
    
    return 0;
}