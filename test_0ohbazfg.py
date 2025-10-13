def reverse_string(s):
    return s[::-1]

def test_reverse_string():
    assert reverse_string('hello') == 'olleh'
    assert reverse_string('') == ''
    assert reverse_string('a') == 'a'
    assert reverse_string('racecar') == 'racecar'  # Palindrome check
