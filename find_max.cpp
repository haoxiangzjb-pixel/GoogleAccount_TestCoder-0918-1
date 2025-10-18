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
    std::string filename = "result_";
    
    // Use time as seed for random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    // Generate 10 random characters for the filename
    for (int i = 0; i < 10; ++i) {
        filename += charset[dis(gen)];
    }
    
    filename += ".txt"; // Add file extension
    return filename;
}

int main() {
    // Example array - you can modify this array as needed
    std::vector<int> arr = {3, 7, 2, 9, 1, 8, 5, 12, 4, 6};
    
    if (arr.empty()) {
        std::cout << "Array is empty!" << std::endl;
        return 1;
    }
    
    // Find the maximum element
    int max_element = *std::max_element(arr.begin(), arr.end());
    
    // Generate a random filename
    std::string filename = generateRandomFilename();
    
    // Write the maximum element to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum element in the array: " << max_element << std::endl;
        
        // Also write the original array for reference
        file << "Array elements: ";
        for (size_t i = 0; i < arr.size(); ++i) {
            file << arr[i];
            if (i < arr.size() - 1) file << ", ";
        }
        file << std::endl;
        
        file.close();
        std::cout << "Maximum element " << max_element << " found and saved to " << filename << std::endl;
    } else {
        std::cout << "Unable to open file " << filename << std::endl;
        return 1;
    }
    
    return 0;
}