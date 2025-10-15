import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer for binary classification
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
    
    def forward(self, x):
        # First hidden layer with ReLU activation and batch norm
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch norm
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        
        return x

def create_random_filename():
    """Generate a random filename for the model file."""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"binary_classifier_{random_string}.py"

# Example usage
if __name__ == "__main__":
    # Create a model instance (assuming input size of 10 features)
    model = BinaryClassifier(input_size=10)
    
    print("Binary Classifier Model:")
    print(model)
    
    # Example of how to use the model
    sample_input = torch.randn(5, 10)  # 5 samples, 10 features each
    output = model(sample_input)
    print(f"\nSample input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Sample output: {output.flatten()}")
    
    # Save the model's state dict
    torch.save(model.state_dict(), "binary_classifier_model.pth")
    print("\nModel state dictionary saved as 'binary_classifier_model.pth'")
    
    # Generate a random filename
    random_filename = create_random_filename()
    print(f"\nThis file would be saved with a random name like: {random_filename}")