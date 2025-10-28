import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    This model consists of an input layer, two hidden layers, and an output layer.
    """
    
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        """
        Initialize the neural network layers.
        
        Args:
            input_size (int): Number of input features
            hidden_size1 (int): Size of the first hidden layer
            hidden_size2 (int): Size of the second hidden layer
            dropout_rate (float): Dropout rate for regularization
        """
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
        """
        Forward pass through the network.
        
        Args:
            x (torch.Tensor): Input tensor
            
        Returns:
            torch.Tensor: Output tensor (logits)
        """
        # First hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        
        return x

def create_model(input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
    """
    Helper function to create the binary classifier model.
    
    Args:
        input_size (int): Number of input features
        hidden_size1 (int): Size of the first hidden layer
        hidden_size2 (int): Size of the second hidden layer
        dropout_rate (float): Dropout rate for regularization
        
    Returns:
        BinaryClassifier: The created model
    """
    model = BinaryClassifier(
        input_size=input_size,
        hidden_size1=hidden_size1,
        hidden_size2=hidden_size2,
        dropout_rate=dropout_rate
    )
    return model

# Example usage
if __name__ == "__main__":
    # Create a model for binary classification with 10 input features
    model = create_model(input_size=10)
    
    # Print the model architecture
    print("Model Architecture:")
    print(model)
    
    # Example forward pass with random input
    sample_input = torch.randn(5, 10)  # Batch of 5 samples with 10 features each
    output = model(sample_input)
    print(f"\nInput shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Output (probabilities): {output.flatten()}")
    
    # Calculate total number of parameters
    total_params = sum(p.numel() for p in model.parameters())
    trainable_params = sum(p.numel() for p in model.parameters() if p.requires_grad)
    print(f"\nTotal parameters: {total_params}")
    print(f"Trainable parameters: {trainable_params}")