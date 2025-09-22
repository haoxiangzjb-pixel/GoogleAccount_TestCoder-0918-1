import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassificationModel(nn.Module):
    """
    A simple neural network for binary classification
    """
    def __init__(self, input_dim, hidden_dim1=64, hidden_dim2=32):
        super(BinaryClassificationModel, self).__init__()
        
        # Define layers
        self.fc1 = nn.Linear(input_dim, hidden_dim1)
        self.fc2 = nn.Linear(hidden_dim1, hidden_dim2)
        self.fc3 = nn.Linear(hidden_dim2, 1)  # Output layer for binary classification
        
        # Dropout layer for regularization
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
# model = BinaryClassificationModel(input_dim=10)
# input_data = torch.randn(32, 10)  # Batch of 32 samples with 10 features
# output = model(input_data)
# print(output.shape)  # Should be [32, 1]

if __name__ == "__main__":
    # Create a model instance for demonstration
    model = BinaryClassificationModel(input_dim=10)
    print(f"Model architecture:\n{model}")
    
    # Test with sample data
    sample_input = torch.randn(5, 10)  # 5 samples, 10 features
    output = model(sample_input)
    print(f"\nSample input shape: {sample_input.shape}")
    print(f"Sample output shape: {output.shape}")
    print(f"Sample output values: {output.detach().numpy().flatten()}")