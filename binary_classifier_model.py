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
    """Generate a random filename for the model script."""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"/workspace/{random_name}_binary_classifier.py"

if __name__ == "__main__":
    # Example usage:
    # Create a model with input size of 10 features
    model = BinaryClassifier(input_size=10)
    
    print("Binary Classifier Model Architecture:")
    print(model)
    
    # Create a random input tensor to test the model
    sample_input = torch.randn(5, 10)  # 5 samples, 10 features each
    output = model(sample_input)
    print(f"\nSample input shape: {sample_input.shape}")
    print(f"Model output shape: {output.shape}")
    print(f"Sample output: {output.flatten()}")
    
    # Save this script with a random name
    import os
    import shutil
    
    # Generate random filename
    random_filename = create_random_filename()
    
    # Copy this script to the random filename
    shutil.copy(__file__, random_filename)
    print(f"\nModel script saved as: {random_filename}")
    
    # Also create a standalone model file without the testing code
    standalone_model_content = '''import torch
import torch.nn as nn
import torch.nn.functional as F

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
'''
    
    # Generate another random filename for the standalone model
    import string
    import random
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    standalone_filename = f"/workspace/{random_name}_model.py"
    
    with open(standalone_filename, 'w') as f:
        f.write(standalone_model_content)
    
    print(f"Standalone model saved as: {standalone_filename}")