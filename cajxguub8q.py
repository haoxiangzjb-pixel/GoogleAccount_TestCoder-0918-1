import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)  # First hidden layer
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)  # Second hidden layer
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer (1 output for binary classification)
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
    
    def forward(self, x):
        # Forward pass through the network
        x = F.relu(self.bn1(self.fc1(x)))  # Apply ReLU activation after first layer
        x = self.dropout(x)  # Apply dropout
        
        x = F.relu(self.bn2(self.fc2(x)))  # Apply ReLU activation after second layer
        x = self.dropout(x)  # Apply dropout
        
        x = torch.sigmoid(self.fc3(x))  # Sigmoid activation for binary classification
        return x

# Example usage:
if __name__ == "__main__":
    # Create a model with input size of 10 features
    input_size = 10
    model = BinaryClassifier(input_size)
    
    # Print model architecture
    print("Model Architecture:")
    print(model)
    
    # Example of how to use the model
    sample_input = torch.randn(5, input_size)  # 5 samples, 10 features each
    output = model(sample_input)
    print(f"\nInput shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Sample output: {output.flatten()}")
    
    # Save the model
    model_filename = "binary_classifier.pth"
    torch.save(model.state_dict(), model_filename)
    print(f"\nModel saved as {model_filename}")