#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

// Function to generate a random filename
std::string generateRandomFilename() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    std::string filename = "result_";
    for (int i = 0; i < 10; ++i) {
        filename += charset[dis(gen)];
    }
    filename += ".txt";
    
    return filename;
}

int main() {
    // Example array - you can modify this as needed
    std::vector<int> arr = {3, 7, 2, 9, 1, 8, 4, 6, 5};
    
    // Find the maximum element
    if (arr.empty()) {
        std::cout << "Array is empty!" << std::endl;
        return 1;
    }
    
    int max_element = *std::max_element(arr.begin(), arr.end());
    
    // Generate a random filename
    std::string filename = generateRandomFilename();
    
    // Write the maximum element to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum element in the array: " << max_element << std::endl;
        file.close();
        std::cout << "Maximum element " << max_element << " saved to file: " << filename << std::endl;
    } else {
        std::cout << "Unable to open file for writing." << std::endl;
        return 1;
    }
    
    return 0;
}