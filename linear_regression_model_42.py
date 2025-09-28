import tensorflow as tf
import numpy as np

# Generate dummy data for demonstration
num_samples = 100
X = np.random.randn(num_samples).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(num_samples).astype(np.float32)  # y = 2x + 1 + noise

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=50, verbose=0)

# Print the learned parameters (should be close to w=2, b=1)
weights, biases = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {biases[0]:.4f}")

# Save the entire model to a file
model.save('linear_regression_trained_model.h5')
print("\\nModel saved as 'linear_regression_trained_model.h5'")