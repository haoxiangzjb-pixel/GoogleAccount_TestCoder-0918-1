import tensorflow as tf
import numpy as np

# Generate sample data for linear regression
# y = 3x + 2 + noise
np.random.seed(42)
X = np.random.randn(50, 1).astype(np.float32)  # Smaller dataset
y = 3 * X + 2 + 0.1 * np.random.randn(50, 1).astype(np.float32)

# Create a linear regression model using TensorFlow/Keras
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model with optimizer and loss function
model.compile(
    optimizer='sgd',
    loss='mean_squared_error'
)

# Train the model
print("Training the model...")
model.fit(X, y, epochs=10, verbose=1)  # Fewer epochs for faster execution

# Print model parameters
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}, True weight: 3.0")
print(f"Learned bias: {bias[0]:.4f}, True bias: 2.0")

# Make predictions
predictions = model.predict(X[:5])
print("\nSample predictions vs actual values:")
for i in range(5):
    print(f"X: {X[i][0]:.4f}, Predicted y: {predictions[i][0]:.4f}, Actual y: {y[i][0]:.4f}")

# Save the model
model.save('linear_regression_model.h5')
print("\nModel saved as 'linear_regression_model.h5'")