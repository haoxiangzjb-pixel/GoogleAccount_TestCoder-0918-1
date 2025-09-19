import numpy as np
import json

class SimpleDenseLayer:
    def __init__(self, input_size, output_size, activation='relu'):
        self.input_size = input_size
        self.output_size = output_size
        self.activation = activation
        
        # Initialize weights and biases
        self.weights = np.random.randn(input_size, output_size) * np.sqrt(2.0 / input_size)
        self.biases = np.zeros((1, output_size))
        
    def relu(self, x):
        return np.maximum(0, x)
        
    def forward(self, x):
        self.input = x
        self.z = np.dot(x, self.weights) + self.biases
        if self.activation == 'relu':
            self.output = self.relu(self.z)
        else:
            self.output = self.z
        return self.output
        
    def get_config(self):
        return {
            'input_size': self.input_size,
            'output_size': self.output_size,
            'activation': self.activation
        }
        
    def get_weights(self):
        return [self.weights, self.biases]

class SimpleModel:
    def __init__(self):
        self.layers = []
        
    def add(self, layer):
        self.layers.append(layer)
        
    def forward(self, x):
        for layer in self.layers:
            x = layer.forward(x)
        return x
        
    def summary(self):
        print("Simple Model")
        print("-------------")
        total_params = 0
        for i, layer in enumerate(self.layers):
            layer_params = layer.weights.size + layer.biases.size
            total_params += layer_params
            print(f"Layer {i+1}: Dense ({layer.input_size} -> {layer.output_size}) - Params: {layer_params}")
        print(f"Total params: {total_params}")
        
    def save_model(self, filepath):
        model_config = {
            'layers': [layer.get_config() for layer in self.layers]
        }
        
        # Save model architecture
        with open(filepath + '_config.json', 'w') as f:
            json.dump(model_config, f)
            
        # Save weights
        weights_data = {}
        for i, layer in enumerate(self.layers):
            layer_weights, layer_biases = layer.get_weights()
            weights_data[f'layer_{i}_weights'] = layer_weights.tolist()
            weights_data[f'layer_{i}_biases'] = layer_biases.tolist()
            
        with open(filepath + '_weights.json', 'w') as f:
            json.dump(weights_data, f)
            
        print(f"Model saved to {filepath}_config.json and {filepath}_weights.json")

# Create a simple model
model = SimpleModel()

# Add one dense layer with 10 units
layer1 = SimpleDenseLayer(5, 10, activation='relu')
model.add(layer1)

# Add output layer
output_layer = SimpleDenseLayer(10, 1, activation=None)
model.add(output_layer)

# Print model summary
model.summary()

# Create dummy data for demonstration
x_train = np.random.random((100, 5))
y_train = np.random.random((100, 1))

# Run forward pass
output = model.forward(x_train)
print(f"Output shape: {output.shape}")

# Save the model
model.save_model('simple_model')

print("Model saved successfully!")