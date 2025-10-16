import pandas as pd
import random
import string
import os

def generate_random_filename(extension=".csv"):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def main():
    # Create sample data
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank'],
        'Age': [25, 32, 18, 47, 22, 35],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin'],
        'Salary': [50000, 60000, 45000, 80000, 55000, 70000]
    }
    
    # Create DataFrame
    df = pd.DataFrame(data)
    print("Original DataFrame:")
    print(df)
    print()
    
    # Filter the DataFrame (e.g., people with age < 30)
    filtered_df = df[df['Age'] < 30]
    print("Filtered DataFrame (Age < 30):")
    print(filtered_df)
    print()
    
    # Generate a random filename
    random_filename = generate_random_filename(".csv")
    
    # Save the filtered DataFrame to the randomly named file
    filtered_df.to_csv(random_filename, index=False)
    print(f"Filtered DataFrame saved to: {random_filename}")
    
    # Also save as .py file as requested (though this is unusual for data)
    # Creating a Python file with the data as a variable
    py_filename = generate_random_filename(".py")
    with open(py_filename, 'w') as f:
        f.write("# Filtered DataFrame saved as Python file\n")
        f.write("import pandas as pd\n\n")
        f.write("filtered_data = ")
        f.write(filtered_df.to_string())
        f.write("\n")
    
    print(f"Filtered DataFrame also saved as Python code to: {py_filename}")

if __name__ == "__main__":
    main()