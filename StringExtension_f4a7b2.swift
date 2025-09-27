//
//  StringExtension.swift
//  Created by AI Assistant on 2023-10-27
//

extension String {
    /// Reverses the string and returns a new reversed string.
    /// - Returns: A new string with the characters in reverse order.
    func reversed() -> String {
        return String(self.reversed())
    }
}

// Example usage:
// let originalString = "hello"
// let reversedString = originalString.reversed()
// print(reversedString) // Output: "olleh"