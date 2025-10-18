#include <iostream>
#include <fstream>
#include <algorithm>
#include <random>
#include <chrono>
#include <string>

int main() {
    // Define an array of integers
    int arr[] = {12, 45, 67, 23, 89, 34, 56, 78, 90, 21};
    int size = sizeof(arr) / sizeof(arr[0]);
    
    // Find the maximum element in the array
    int max_element = *std::max_element(arr, arr + size);
    
    // Generate a random filename using current time and a random number
    auto now = std::chrono::high_resolution_clock::now();
    auto duration = now.time_since_epoch();
    auto seed = duration.count();
    
    std::mt19937 gen(seed);
    std::uniform_int_distribution<int> dis(1000, 9999);
    int random_num = dis(gen);
    
    // Create filename with timestamp and random number
    std::string filename = "max_result_" + std::to_string(random_num) + ".txt";
    
    // Write the maximum element to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum element in the array: " << max_element << std::endl;
        file.close();
        std::cout << "Maximum element " << max_element << " saved to file: " << filename << std::endl;
    } else {
        std::cout << "Error: Could not open file for writing." << std::endl;
        return 1;
    }
    
    // Print the array for verification
    std::cout << "Array elements: ";
    for (int i = 0; i < size; i++) {
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;
    
    return 0;
}