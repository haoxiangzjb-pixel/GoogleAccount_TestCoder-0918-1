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
    std::string filename = "output_";
    
    // Use time as seed for random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    // Generate 10 random characters for the filename
    for (int i = 0; i < 10; ++i) {
        filename += charset[dis(gen)];
    }
    
    filename += ".txt";
    return filename;
}

int main() {
    // Define an array of numbers
    std::vector<int> numbers = {3, 7, 2, 9, 1, 15, 4, 11, 6, 8};
    
    // Find the maximum element in the array
    int max_value = *std::max_element(numbers.begin(), numbers.end());
    
    // Generate a random filename
    std::string filename = generateRandomFilename();
    
    // Write the maximum value to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum value in the array: " << max_value << std::endl;
        file.close();
        std::cout << "Maximum value " << max_value << " found and saved to " << filename << std::endl;
    } else {
        std::cerr << "Could not open file for writing." << std::endl;
        return 1;
    }
    
    // Print the array for verification
    std::cout << "Array: ";
    for (size_t i = 0; i < numbers.size(); ++i) {
        std::cout << numbers[i] << " ";
    }
    std::cout << std::endl;
    
    return 0;
}