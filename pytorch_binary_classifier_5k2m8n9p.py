import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    This model consists of an input layer, two hidden layers, and an output layer.
    """
    def __init__(self, input_size):
        super(BinaryClassifier, self).__init__()
        # Input layer to first hidden layer
        self.fc1 = nn.Linear(input_size, 64)
        # First hidden layer to second hidden layer
        self.fc2 = nn.Linear(64, 32)
        # Second hidden layer to output
        self.fc3 = nn.Linear(32, 1)
        # Dropout for regularization
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        # Apply ReLU activation to first layer
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        
        # Apply ReLU activation to second layer
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        return x

def train_model(model, train_loader, epochs=10):
    """
    Train the binary classifier model.
    
    Args:
        model: The BinaryClassifier model to train
        train_loader: DataLoader containing training data
        epochs: Number of epochs to train (default 10)
    """
    # Use Binary Cross Entropy loss for binary classification
    criterion = nn.BCELoss()
    optimizer = optim.Adam(model.parameters(), lr=0.001)
    
    model.train()
    for epoch in range(epochs):
        total_loss = 0
        for batch_idx, (data, target) in enumerate(train_loader):
            optimizer.zero_grad()
            output = model(data)
            # Reshape target to match output shape if needed
            if target.dim() == 1:
                target = target.unsqueeze(1).float()
            loss = criterion(output, target)
            loss.backward()
            optimizer.step()
            total_loss += loss.item()
        
        print(f'Epoch {epoch+1}/{epochs}, Loss: {total_loss/len(train_loader):.4f}')

def evaluate_model(model, test_loader):
    """
    Evaluate the binary classifier model.
    
    Args:
        model: The trained BinaryClassifier model
        test_loader: DataLoader containing test data
    """
    model.eval()
    correct = 0
    total = 0
    with torch.no_grad():
        for data, target in test_loader:
            outputs = model(data)
            predicted = (outputs > 0.5).float()  # Apply threshold for binary classification
            total += target.size(0)
            if target.dim() == 1:
                target = target.unsqueeze(1).float()
            correct += (predicted == target).sum().item()
    
    accuracy = 100 * correct / total
    print(f'Test Accuracy: {accuracy:.2f}%')
    return accuracy

# Example usage
if __name__ == "__main__":
    # Example: Create model for 10-feature input
    input_size = 10
    model = BinaryClassifier(input_size)
    
    print("Binary Classification Model Architecture:")
    print(model)
    
    # Example of how to use the model
    # Create a sample input tensor
    sample_input = torch.randn(5, input_size)  # 5 samples, 10 features each
    output = model(sample_input)
    print(f"\nSample input shape: {sample_input.shape}")
    print(f"Model output shape: {output.shape}")
    print(f"Output values (probabilities): {output.flatten()}")
    print(f"Predicted classes: {(output > 0.5).int().flatten()}")