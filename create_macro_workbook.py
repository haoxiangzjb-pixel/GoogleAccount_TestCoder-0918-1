import openpyxl
from openpyxl import Workbook
import os
import random
import string

# Create a new workbook and select the active sheet
wb = Workbook()
ws = wb.active
ws.title = "Sample Data"

# Add sample data
headers = ["Name", "Age", "City", "Occupation"]
data = [
    ["Alice", 30, "New York", "Engineer"],
    ["Bob", 25, "Los Angeles", "Designer"],
    ["Charlie", 35, "Chicago", "Manager"],
    ["David", 28, "Houston", "Analyst"],
    ["Eve", 32, "Phoenix", "Developer"],
    ["Frank", 40, "Philadelphia", "Director"],
    ["Grace", 27, "San Antonio", "Specialist"],
    ["Heidi", 31, "San Diego", "Coordinator"]
]

# Populate the worksheet with data
ws.append(headers)
for row in data:
    ws.append(row)

# Save the workbook temporarily without macros
temp_file = "/workspace/temp_sample_data.xlsx"
wb.save(temp_file)

# Re-open the workbook
wb_with_data = openpyxl.load_workbook(temp_file)

# Generate a random filename for the workbook
random_suffix = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
workbook_filename = f"/workspace/sample_data_formatted_{random_suffix}.xlsx"

# Save the workbook
wb_with_data.save(workbook_filename)

# Clean up the temporary file
os.remove(temp_file)

print(f"Workbook saved as: {workbook_filename}")