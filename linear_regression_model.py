import tensorflow as tf
import numpy as np
import os

# Set random seed for reproducibility
tf.random.set_seed(42)
np.random.seed(42)

# Generate synthetic data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_slope = 2.5
true_intercept = 1.0
noise = 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
y = true_slope * X + true_intercept + noise

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
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
history = model.fit(
    X, y,
    epochs=100,
    batch_size=32,
    validation_split=0.2,
    verbose=1
)

# Evaluate the model
print("\nEvaluating the model...")
loss, mae = model.evaluate(X, y, verbose=0)
print(f"Final Loss: {loss:.4f}")
print(f"Mean Absolute Error: {mae:.4f}")

# Print the learned parameters
weights, biases = model.layers[0].get_weights()
print(f"Learned slope: {weights[0][0]:.4f}")
print(f"Learned intercept: {biases[0]:.4f}")
print(f"True slope: {true_slope}, True intercept: {true_intercept}")

# Save the trained model
model_save_path = "trained_linear_regression_model"
model.save(model_save_path)
print(f"\nModel saved to {model_save_path}")

# Make a prediction with the model
sample_input = np.array([[1.0], [2.0], [3.0]], dtype=np.float32)
predictions = model.predict(sample_input)
print(f"\nSample predictions for {sample_input.flatten()}: {predictions.flatten()}")