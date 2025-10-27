#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string>
#include <random>
#include <ctime>

int findMax(const std::vector<int>& arr) {
    if (arr.empty()) {
        throw std::runtime_error("Array is empty");
    }
    
    int max = arr[0];
    for (size_t i = 1; i < arr.size(); ++i) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    return max;
}

std::string generateRandomFileName() {
    // Create random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999);
    
    // Generate a random number to use in filename
    int randomNum = dis(gen);
    std::string fileName = "max_result_" + std::to_string(randomNum) + ".txt";
    
    return fileName;
}

int main() {
    // Example array - in a real scenario you might read from user input or file
    std::vector<int> numbers = {3, 7, 2, 9, 1, 5, 6, 12, 4, 8};
    
    try {
        int maxNumber = findMax(numbers);
        
        // Generate a random filename
        std::string fileName = generateRandomFileName();
        
        // Write the result to the file
        std::ofstream outFile(fileName);
        if (!outFile) {
            std::cerr << "Error: Could not open file " << fileName << " for writing." << std::endl;
            return 1;
        }
        
        outFile << "Array: ";
        for (size_t i = 0; i < numbers.size(); ++i) {
            outFile << numbers[i];
            if (i < numbers.size() - 1) {
                outFile << ", ";
            }
        }
        outFile << std::endl;
        outFile << "Maximum number in the array: " << maxNumber << std::endl;
        
        outFile.close();
        
        std::cout << "Maximum number found: " << maxNumber << std::endl;
        std::cout << "Result saved to file: " << fileName << std::endl;
        
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
    
    return 0;
}