import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    This model has an input layer, two hidden layers, and an output layer.
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
        x = F.relu(self.fc1(x))  # Apply ReLU activation after first layer
        x = self.bn1(x)  # Apply batch normalization
        x = self.dropout(x)  # Apply dropout
        
        x = F.relu(self.fc2(x))  # Apply ReLU activation after second layer
        x = self.bn2(x)  # Apply batch normalization
        x = self.dropout(x)  # Apply dropout
        
        x = torch.sigmoid(self.fc3(x))  # Output layer with sigmoid for binary classification
        return x

def create_model(input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
    """
    Function to create and return a binary classifier model
    """
    model = BinaryClassifier(
        input_size=input_size,
        hidden_size1=hidden_size1,
        hidden_size2=hidden_size2,
        dropout_rate=dropout_rate
    )
    return model

# Example usage:
if __name__ == "__main__":
    # Create a model for binary classification with 10 input features
    model = create_model(input_size=10)
    
    # Print the model architecture
    print("Model Architecture:")
    print(model)
    
    # Create a sample input tensor
    sample_input = torch.randn(1, 10)  # Batch size of 1, 10 features
    
    # Forward pass
    output = model(sample_input)
    print(f"\nSample input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Output (probability): {output.item():.4f}")
    
    # Save the model
    model_save_path = "binary_classifier_model.pth"
    torch.save(model.state_dict(), model_save_path)
    print(f"\nModel saved to {model_save_path}")