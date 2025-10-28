import pandas as pd
import random
import string
import os

def create_sample_dataframe():
    """Create a sample DataFrame for demonstration"""
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank', 'Grace', 'Henry'],
        'Age': [25, 30, 35, 28, 22, 40, 33, 27],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
        'Salary': [50000, 60000, 70000, 55000, 45000, 80000, 65000, 58000]
    }
    return pd.DataFrame(data)

def filter_dataframe(df):
    """Filter the DataFrame based on some criteria"""
    # Filter for people older than 25 and with salary greater than 50000
    filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 50000)]
    return filtered_df

def generate_random_filename(extension='.py'):
    """Generate a random filename with the specified extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def main():
    # Create sample DataFrame
    original_df = create_sample_dataframe()
    print("Original DataFrame:")
    print(original_df)
    print("\n" + "="*50 + "\n")
    
    # Filter the DataFrame
    filtered_df = filter_dataframe(original_df)
    print("Filtered DataFrame (Age > 25 and Salary > 50000):")
    print(filtered_df)
    print("\n" + "="*50 + "\n")
    
    # Generate random filename
    random_filename = generate_random_filename('.py')
    print(f"Saving filtered DataFrame to: {random_filename}")
    
    # Create the content to save
    script_content = f'''# Generated script with filtered DataFrame
import pandas as pd

# Filtered DataFrame saved as a dictionary
filtered_data = {filtered_df.to_dict('records')}

# Convert back to DataFrame
filtered_df = pd.DataFrame(filtered_data)

print("Filtered DataFrame loaded from saved file:")
print(filtered_df)
'''
    
    # Write the content to the random filename
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"Successfully saved filtered DataFrame to {random_filename}")
    
    # Verify the file was created
    if os.path.exists(random_filename):
        print(f"File {random_filename} exists and contains the filtered data.")
    else:
        print("Error: File was not created.")

if __name__ == "__main__":
    main()