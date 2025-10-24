//
//  dr29joa13hz5.swift
//  String Extension for Reverse Method
//

extension String {
    /// Reverses the string and returns a new string
    func reversed() -> String {
        return String(self.reversed())
    }
    
    /// Reverses the string in place
    mutating func reverse() {
        self = String(self.reversed())
    }
}

// Example usage:
/*
let originalString = "Hello, World!"
let reversedString = originalString.reversed()
print("Original: \(originalString)")
print("Reversed: \(reversedString)")

var mutableString = "Swift"
mutableString.reverse()
print("After reverse: \(mutableString)")
*/