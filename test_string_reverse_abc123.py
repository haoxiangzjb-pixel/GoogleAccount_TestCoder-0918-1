import pytest

def reverse_string(s):
    """Function to reverse a string."""
    return s[::-1]

def test_string_reversal():
    """Test function to verify string reversal works correctly."""
    # Test with a simple string
    assert reverse_string("hello") == "olleh"
    
    # Test with an empty string
    assert reverse_string("") == ""
    
    # Test with a single character
    assert reverse_string("a") == "a"
    
    # Test with a palindrome
    assert reverse_string("racecar") == "racecar"
    
    # Test with a string containing spaces
    assert reverse_string("hello world") == "dlrow olleh"
    
    # Test with numbers as string
    assert reverse_string("12345") == "54321"
    
    # Test with special characters
    assert reverse_string("!@#$%") == "%$#@!"