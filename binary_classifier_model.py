import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size=64):
        super(BinaryClassifier, self).__init__()
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)
        self.fc3 = nn.Linear(hidden_size // 2, 1)  # Output layer for binary classification
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        # Forward pass through the network
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))  # Sigmoid for binary classification
        return x

def create_random_filename():
    """Generate a random filename with .py extension."""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}.py"

def save_model_to_random_file(input_size, hidden_size=64):
    """Create and save the model to a randomly named file."""
    # Create the model
    model = BinaryClassifier(input_size, hidden_size)
    
    # Generate random filename
    random_filename = create_random_filename()
    
    # Write the model code to the random file
    with open(random_filename, 'w') as f:
        f.write(f'''import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size={hidden_size}):
        super(BinaryClassifier, self).__init__()
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)
        self.fc3 = nn.Linear(hidden_size // 2, 1)  # Output layer for binary classification
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        # Forward pass through the network
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))  # Sigmoid for binary classification
        return x

# Example usage:
# model = BinaryClassifier(input_size={input_size}, hidden_size={hidden_size})
# sample_input = torch.randn(1, {input_size})
# output = model(sample_input)
# print(f"Model output: {{output.item():.4f}}")
''')
    
    print(f"Model saved to: {random_filename}")
    return random_filename

# Example usage of the model
if __name__ == "__main__":
    # Create a model for binary classification with 10 input features
    input_size = 10
    model = BinaryClassifier(input_size=input_size)
    
    # Test with a random input
    sample_input = torch.randn(1, input_size)
    output = model(sample_input)
    print(f"Sample input shape: {sample_input.shape}")
    print(f"Model output: {output.item():.4f}")
    
    # Save the model definition to a randomly named file
    random_file = save_model_to_random_file(input_size)
    print(f"Model definition saved to: {random_file}")