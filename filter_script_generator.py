import pandas as pd
import random
import string
import os

def generate_random_filename(extension='.py'):
    """Generate a random filename with the specified extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def create_and_filter_dataframe():
    """Create a sample DataFrame and filter it."""
    # Create a sample DataFrame
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Henry'],
        'Age': [25, 30, 35, 28, 32, 27, 31, 29],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
        'Salary': [50000, 60000, 70000, 55000, 65000, 52000, 68000, 58000]
    }
    
    df = pd.DataFrame(data)
    print("Original DataFrame:")
    print(df)
    print("\n")
    
    # Filter the DataFrame: People older than 29
    filtered_df = df[df['Age'] > 29]
    print("Filtered DataFrame (Age > 29):")
    print(filtered_df)
    print("\n")
    
    return df, filtered_df

def save_filtered_data_to_random_file(filtered_df):
    """Save the filtered DataFrame to a randomly named .py file."""
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Create the content for the Python file
    file_content = f'''# This file was generated with filtered data
import pandas as pd

# Filtered DataFrame (Age > 29)
filtered_data = {filtered_df.to_dict()}

# Convert back to DataFrame
filtered_df = pd.DataFrame(filtered_data)

print("Filtered DataFrame loaded from {random_filename}:")
print(filtered_df)
'''
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(file_content)
    
    print(f"Filtered data saved to: {random_filename}")
    return random_filename

def main():
    """Main function to execute the script."""
    print("Creating and filtering DataFrame...")
    original_df, filtered_df = create_and_filter_dataframe()
    
    print("Saving filtered data to a randomly named .py file...")
    random_file = save_filtered_data_to_random_file(filtered_df)
    
    print(f"\nProcess completed! Check the file: {random_file}")

if __name__ == "__main__":
    main()