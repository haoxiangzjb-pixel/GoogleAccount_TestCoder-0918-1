import random
import os

# Create a dictionary to store student grades (equivalent to Lua table)
student_grades = {
    "Alice": 85,
    "Bob": 92,
    "Charlie": 78,
    "Diana": 96,
    "Eve": 88
}

# Function to calculate average grade
def calculate_average(grades):
    if len(grades) > 0:
        return sum(grades.values()) / len(grades)
    else:
        return 0

# Calculate the average
average_grade = calculate_average(student_grades)

# Print the grades and average
print("Student Grades:")
for name, grade in student_grades.items():
    print(f"{name}: {grade}")

print(f"\nAverage Grade: {average_grade:.2f}")

# Generate a random filename
random_name = f"student_grades_{random.randint(10000, 99999)}.lua"

# Write the table and average to the random-named file in Lua format
with open(random_name, "w") as file:
    file.write("-- Student grades table and average\n")
    file.write("local student_grades = {\n")
    for name, grade in student_grades.items():
        file.write(f'    ["{name}"] = {grade},\n')
    file.write("}\n\n")
    file.write(f"local average_grade = {average_grade}\n\n")
    file.write("return {grades = student_grades, average = average_grade}\n")
    
    print(f"\nData saved to: {random_name}")