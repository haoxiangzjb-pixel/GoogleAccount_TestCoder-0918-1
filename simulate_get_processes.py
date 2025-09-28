import csv
import random
import string

# Generate a random filename
random_filename = "processes_" + ''.join(random.choices(string.ascii_letters + string.digits, k=8)) + ".csv"

# Simulated list of processes with some common properties
processes = [
    {"Name": "System Idle Process", "Id": 0, "CPU": 0.0},
    {"Name": "System", "Id": 4, "CPU": 0.1},
    {"Name": "explorer", "Id": 1234, "CPU": 2.5},
    {"Name": "chrome", "Id": 5678, "CPU": 15.2},
    {"Name": "pwsh", "Id": 9101, "CPU": 0.5},
]

# Write the simulated process list to the randomly named CSV file
with open(random_filename, 'w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['Name', 'Id', 'CPU']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    writer.writeheader()
    for process in processes:
        writer.writerow(process)

print(f"Simulated process list saved to {random_filename}")