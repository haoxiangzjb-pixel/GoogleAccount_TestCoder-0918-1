import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A neural network for binary classification.
    """
    def __init__(self, input_size=10, hidden_size=64):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)
        self.fc3 = nn.Linear(hidden_size // 2, 1)
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))
        return x

# Example usage:
if __name__ == "__main__":
    # Create model instance
    model = BinaryClassifier(input_size=10, hidden_size=64)
    
    # Example input tensor
    example_input = torch.randn(1, 10)
    output = model(example_input)
    print(f"Model output: {output.item():.4f}")
    print("Model created successfully!")