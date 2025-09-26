import tensorflow as tf
import numpy as np

# Generate random data for demonstration
num_samples = 100
X = np.random.rand(num_samples).astype(np.float32)
y = 3.5 * X + 2.0 + np.random.randn(num_samples).astype(np.float32) * 0.1  # y = 3.5x + 2 + noise

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Print the learned parameters
weights, biases = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {biases[0]:.4f}")

# Make a prediction
sample_input = np.array([0.5], dtype=np.float32)
prediction = model.predict(sample_input, verbose=0)
print(f"Prediction for input {sample_input[0]}: {prediction[0][0]:.4f}")
