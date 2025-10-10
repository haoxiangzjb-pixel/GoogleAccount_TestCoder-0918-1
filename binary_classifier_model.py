import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size: int, hidden_size: int = 64):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)
        self.fc3 = nn.Linear(hidden_size // 2, 1)
        self.dropout = nn.Dropout(0.2)
        self.sigmoid = nn.Sigmoid()

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = self.fc3(x)
        x = self.sigmoid(x)
        return x

if __name__ == "__main__":
    # Example usage:
    # Define model with input size of 10 features
    model = BinaryClassifier(input_size=10)

    # Create a dummy batch of data (batch_size=32, input_size=10)
    dummy_input = torch.randn(32, 10)

    # Get model predictions (probabilities between 0 and 1)
    outputs = model(dummy_input)
    print(f"Model output shape: {outputs.shape}")
    print(f"Sample output (first 5): {outputs[:5].squeeze().tolist()}")