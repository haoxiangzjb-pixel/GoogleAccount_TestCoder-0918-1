import pandas as pd
import random
import string

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def create_and_filter_dataframe():
    """Creates a sample DataFrame, filters it, and saves the script to a random .py file."""
    # Sample data
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
        'Age': [25, 35, 45, 30, 29],
        'City': ['New York', 'Los Angeles', 'New York', 'Chicago', 'Chicago'],
        'Salary': [50000, 60000, 70000, 65000, 55000]
    }
    
    df = pd.DataFrame(data)
    
    # Filter: People older than 30
    filtered_df = df[df['Age'] > 30]
    
    print("Filtered DataFrame (Age > 30):")
    print(filtered_df)
    
    # Generate a random filename
    filename = generate_random_filename()
    
    # The script content to save
    script_content = f'''import pandas as pd

# Generated DataFrame filtering script
data = {data}
df = pd.DataFrame(data)
filtered_df = df[df['Age'] > 30]

print("Filtered DataFrame (Age > 30):")
print(filtered_df)

# Save the filtered DataFrame to a CSV file (optional)
# filtered_df.to_csv('filtered_output.csv', index=False)
'''
    
    # Write the script to the randomly named file
    with open(filename, 'w') as f:
        f.write(script_content)
    
    print(f"\nScript saved to {filename}")

if __name__ == "__main__":
    create_and_filter_dataframe()
