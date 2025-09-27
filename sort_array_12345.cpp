#include <iostream>
#include <vector>
#include <algorithm>

void printArray(const std::vector<int>& arr) {
    for (int num : arr) {
        std::cout << num << " ";
    }
    std::cout << std::endl;
}

int main() {
    // Example array
    std::vector<int> array = {64, 34, 25, 12, 22, 11, 90};

    std::cout << "Original array: ";
    printArray(array);

    // Sort the array in ascending order
    std::sort(array.begin(), array.end());

    std::cout << "Sorted array (ascending): ";
    printArray(array);

    return 0;
}