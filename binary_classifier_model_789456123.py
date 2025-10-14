import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size=10):
        super(BinaryClassifier, self).__init__()
        # Define the layers
        self.fc1 = nn.Linear(input_size, 64)
        self.fc2 = nn.Linear(64, 32)
        self.fc3 = nn.Linear(32, 1)  # Single output for binary classification
        self.dropout = nn.Dropout(0.5)

    def forward(self, x):
        # Forward pass through the network
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))  # Sigmoid activation for binary output (0 to 1)
        return x

# Example usage:
# model = BinaryClassifier(input_size=10)
# print(model)
# sample_input = torch.randn(1, 10)  # Batch size of 1, 10 features
# output = model(sample_input)
# print(f"Model output (probability): {output.item():.4f}")