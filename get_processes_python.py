import psutil
import random
import string

def generate_random_filename():
    """Generate a random filename with .txt extension"""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}.txt"

def get_processes_and_save():
    """Get list of processes and save to a file with random name"""
    processes = []
    for proc in psutil.process_iter(['pid', 'name', 'username']):
        try:
            processes.append(proc.info)
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            # Handle cases where process has terminated or access is denied
            pass
    
    # Generate random filename
    filename = generate_random_filename()
    
    # Save processes to file
    with open(filename, 'w', encoding='utf-8') as f:
        for proc in processes:
            f.write(f"PID: {proc['pid']}, Name: {proc['name']}, User: {proc.get('username', 'N/A')}\n")
    
    print(f"Process list saved to {filename}")
    return filename

if __name__ == "__main__":
    get_processes_and_save()