import tensorflow as tf
import numpy as np
import random

# Set random seed for reproducibility
random.seed(42)
np.random.seed(42)
tf.random.set_seed(42)

# Generate random data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
# True parameters for the linear relationship: y = 2*x + 1 + noise
true_weights = 2.0
true_bias = 1.0
noise = 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
y = true_weights * X + true_bias + noise

# Split data into training and testing sets
train_size = int(0.8 * num_samples)
X_train, X_test = X[:train_size], X[train_size:]
y_train, y_test = y[:train_size], y[train_size:]

# Build the linear regression model using Keras
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

# Display model architecture
print("Model Architecture:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(
    X_train, y_train,
    epochs=100,
    batch_size=32,
    validation_split=0.2,
    verbose=0
)

# Evaluate the model on test data
print("\nEvaluating the model...")
test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
print(f"Test Loss (MSE): {test_loss:.4f}")
print(f"Test MAE: {test_mae:.4f}")

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weights: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")
print(f"True weights: {true_weights}")
print(f"True bias: {true_bias}")

# Make predictions on a few samples
sample_indices = [0, 1, 2]
sample_predictions = model.predict(X_test[sample_indices], verbose=0)
print(f"\nSample predictions vs actual values:")
for i, idx in enumerate(sample_indices):
    print(f"X: {X_test[idx][0]:.4f}, Predicted: {sample_predictions[i][0]:.4f}, Actual: {y_test[idx][0]:.4f}")