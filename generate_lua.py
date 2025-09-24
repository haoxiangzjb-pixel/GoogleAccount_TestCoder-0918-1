import random
import json

# Define the student grades table
student_grades = {
    "Alice": 85,
    "Bob": 92,
    "Charlie": 78,
    "David": 96,
    "Eve": 88
}

# Calculate the average
total = sum(student_grades.values())
count = len(student_grades)
average = total / count

# Generate a random filename
filename = f"grades_{random.randint(10000, 99999)}.lua"

# Write the Lua table and average to the file
with open(filename, 'w') as lua_file:
    # Writing the table. Using json.dumps for a simple representation.
    # Note: This creates valid Lua, but uses JSON string format for the table.
    # A more robust solution might use a dedicated Lua code generator.
    lua_file.write(f"local studentGrades = {json.dumps(student_grades, indent=4)}\n")
    lua_file.write(f"local averageScore = {average:.2f}\n")
    lua_file.write('print("Average Score: " .. averageScore)\n')

print(f'Lua table and average score saved to {filename}')