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

def save_model_to_random_file(model_class, input_size):
    """
    Creates an instance of the model and saves the class definition to a randomly named file.
    """
    # Create a random filename
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # Model definition code
    model_code = f'''import torch
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

# Example usage:
# model = BinaryClassifier(input_size={input_size})
'''
    
    with open(random_name, 'w') as f:
        f.write(model_code)
    
    print(f"Model saved to {random_name}")
    return random_name

# Example usage
if __name__ == "__main__":
    # Create a model instance for a dataset with 10 features
    input_size = 10
    model = BinaryClassifier(input_size=input_size)
    
    # Print model architecture
    print("Model Architecture:")
    print(model)
    
    # Test the model with a random input
    test_input = torch.randn(5, input_size)  # 5 samples, input_size features each
    output = model(test_input)
    print(f"\\nInput shape: {test_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Output (first 5): {output.flatten()[:5]}")
    
    # Save the model class definition to a randomly named file
    random_filename = save_model_to_random_file(BinaryClassifier, input_size)
    print(f"\\nModel class definition saved to: {random_filename}")