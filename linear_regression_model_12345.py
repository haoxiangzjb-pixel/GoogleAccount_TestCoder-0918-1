import tensorflow as tf
import numpy as np

# Generate random data for demonstration
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weight = 2.5
true_bias = 0.5
y = true_weight * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Print final weights
final_weight, final_bias = model.layers[0].get_weights()
print(f"Learned weight: {final_weight[0][0]:.4f}, Learned bias: {final_bias[0]:.4f}")
print(f"True weight: {true_weight:.4f}, True bias: {true_bias:.4f}")

# Save the model
model.save('linear_regression_model.h5')
print("\nModel saved as 'linear_regression_model.h5'")
