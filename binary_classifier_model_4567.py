import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    It takes a 10-dimensional input and outputs a single value (logit).
    """
    def __init__(self):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(10, 16)
        self.fc2 = nn.Linear(16, 8)
        self.fc3 = nn.Linear(8, 1)
        self.dropout = nn.Dropout(0.2)

    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self .fc2(x))
        x = self.dropout(x)
        x = self.fc3(x)  # Output logit, use nn.BCEWithLogitsLoss
        return x

if __name__ == "__main__":
    # Example usage
    model = BinaryClassifier()
    print(model)
    
    # Simulate a batch of 5 samples with 10 features each
    sample_input = torch.randn(5, 10)
    output = model(sample_input)
    print(f"Input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Output (logits): {output.squeeze()}")