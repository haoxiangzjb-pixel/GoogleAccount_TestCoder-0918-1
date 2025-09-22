import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassificationNet(nn.Module):
    """
    A simple feedforward neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size1, hidden_size2):
        """
        Initialize the network layers.
        
        Args:
            input_size (int): Number of input features
            hidden_size1 (int): Number of neurons in the first hidden layer
            hidden_size2 (int): Number of neurons in the second hidden layer
        """
        super(BinaryClassificationNet, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer for binary classification
        
        # Dropout layer for regularization
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        """
        Forward pass through the network.
        
        Args:
            x (Tensor): Input tensor of shape (batch_size, input_size)
            
        Returns:
            Tensor: Output tensor of shape (batch_size, 1)
        """
        # Pass through first hidden layer with ReLU activation
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        
        # Pass through second hidden layer with ReLU activation
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        
        return x

# Example usage:
if __name__ == "__main__":
    # Create a model instance
    model = BinaryClassificationNet(input_size=20, hidden_size1=64, hidden_size2=32)
    
    # Create a sample input batch (batch_size=5, input_size=20)
    sample_input = torch.randn(5, 20)
    
    # Forward pass
    output = model(sample_input)
    
    print(f"Input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Sample output: {output}")