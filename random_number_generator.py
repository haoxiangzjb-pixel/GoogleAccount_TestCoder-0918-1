import random

def generate_random_number():
    """Generate a random number and save it to a file."""
    # Generate a random number (let's use a random float between 1 and 100 with 2 decimal places)
    random_num = round(random.uniform(1, 100), 2)
    
    # Save the random number to a file
    with open('random_number.txt', 'w') as file:
        file.write(str(random_num))
    
    print(f"Random number {random_num} generated and saved to random_number.txt")
    return random_num

if __name__ == "__main__":
    generate_random_number()