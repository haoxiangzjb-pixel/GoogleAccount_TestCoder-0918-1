import tensorflow as tf
import numpy as np
import random
import os

# Set random seed for reproducibility
tf.random.set_seed(42)
np.random.seed(42)
random.seed(42)

# Generate random data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weight = 2.5
true_bias = 1.0
y = true_weight * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Create the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

# Print model summary
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X, y, epochs=100, verbose=0, validation_split=0.2)

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.3f} (true: {true_weight})")
print(f"Learned bias: {bias[0]:.3f} (true: {true_bias})")

# Make predictions
predictions = model.predict(X[:5])
print(f"\nFirst 5 predictions: {predictions.flatten()}")
print(f"First 5 actual values: {y[:5].flatten()}")

print("\nModel training completed successfully!")