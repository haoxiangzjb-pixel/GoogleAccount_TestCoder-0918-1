import tensorflow as tf
import numpy as np

# Generate dummy data for demonstration
# Features (X) and target (y) with a linear relationship y = 2*X + 1 + noise
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X.squeeze() + 1 + np.random.randn(100).astype(np.float32) * 0.1

# Define the model: A simple linear layer (y = Wx + b)
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model with optimizer, loss, and metrics
model.compile(optimizer='sgd', loss='mean_squared_error', metrics=['mae'])

# Train the model
print("Training the model...")
history = model.fit(X, y, epochs=50, verbose=0)

# Print final loss
print(f"Final loss: {history.history['loss'][-1]:.4f}")

# Get the learned parameters
W, b = model.layers[0].get_weights()
print(f"Learned weight: {W[0][0]:.4f}")
print(f"Learned bias: {b[0]:.4f}")
print(f"Expected weight: 2.0000, Expected bias: 1.0000")