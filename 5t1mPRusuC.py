import pandas as pd
import random
import string
import sys

def generate_random_filename():
    """Generate a random filename with .csv extension"""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return random_name + ".csv"

def load_and_analyze_csv(filename):
    """Load a CSV file and print summary statistics"""
    try:
        # Load the CSV file
        data = pd.read_csv(filename)
        
        # Print summary statistics
        print("Summary Statistics:")
        print(data.describe())
        print("\n")
        
        # Print structure of the data
        print("Data Structure:")
        print(data.info())
        print("\n")
        
        # Print first few rows
        print("First 6 rows of data:")
        print(data.head())
        
    except FileNotFoundError:
        print(f"File {filename} not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    # For demonstration, we'll use the sample_data.csv file
    csv_file = "sample_data.csv"
    
    # Load and analyze the CSV file
    load_and_analyze_csv(csv_file)