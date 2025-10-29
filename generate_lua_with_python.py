import random
import string

def generate_random_string(length):
    """Generate a random string of specified length"""
    return ''.join(random.choices(string.ascii_lowercase, k=length))

# Student grades table
student_grades = {
    "Alice": 85,
    "Bob": 92,
    "Charlie": 78,
    "Diana": 96,
    "Eve": 88
}

# Calculate average
def calculate_average(grades):
    if len(grades) == 0:
        return 0
    return sum(grades.values()) / len(grades)

average = calculate_average(student_grades)

# Generate random filename
random_name = f"student_data_{generate_random_string(8)}.lua"
print(f"Saving to file: {random_name}")

# Create and write to the random-named file
with open(random_name, 'w') as file:
    file.write("-- Student grades data\n")
    file.write("local studentGrades = {\n")
    
    for name, grade in student_grades.items():
        file.write(f'    ["{name}"] = {grade},\n')
    
    file.write("}\n\n")
    file.write(f"local average = {average:.2f}\n\n")
    
    file.write('print("Student Grades:")\n')
    file.write("for name, grade in pairs(studentGrades) do\n")
    file.write('    print(name .. ": " .. grade)\n')
    file.write("end\n\n")
    
    file.write('print("\\nAverage Grade: " .. average)\n\n')
    file.write("return { grades = studentGrades, average = average }\n")

print(f"Data successfully saved to {random_name}")

# Also print the content to verify
print("\nContent of the generated file:")
with open(random_name, 'r') as file:
    print(file.read())