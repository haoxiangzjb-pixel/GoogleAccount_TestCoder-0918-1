import tensorflow as tf
import numpy as np

# Generate some dummy data for training
# Features (X) and labels (y) with a linear relationship y = 2*X + 1 plus some noise
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + np.random.randn(100, 1).astype(np.float32) * 0.1

# Define the model using tf.keras.Sequential
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model with an optimizer and a loss function
model.compile(optimizer='sgd', loss='mean_squared_error')

# Print a summary of the model
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
model.fit(X, y, epochs=50, verbose=0)

# Print the learned parameters (weights and bias)
weights, biases = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {biases[0]:.4f}")

# Make a prediction with the trained model
sample_input = np.array([[0.5]], dtype=np.float32)
prediction = model.predict(sample_input)
print(f"\nPrediction for input {sample_input[0][0]}: {prediction[0][0]:.4f}")