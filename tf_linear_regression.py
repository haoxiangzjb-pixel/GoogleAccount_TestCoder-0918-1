import tensorflow as tf
import numpy as np

# Generate random data for linear regression
num_samples = 100
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weight = 2.5
true_bias = 0.5
y = true_weight * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Create a simple linear regression model using the Functional API to avoid issues
inputs = tf.keras.Input(shape=(1,))
outputs = tf.keras.layers.Dense(1)(inputs)
model = tf.keras.Model(inputs=inputs, outputs=outputs)

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error', metrics=['mae'])

# Train the model
print("Training the model...")
model.fit(X, y, epochs=5, verbose=1)  # Even fewer epochs for faster execution

# Print the learned weights
learned_weight, learned_bias = model.layers[1].get_weights()  # Dense layer is at index 1
print(f"Learned weight: {learned_weight[0][0]:.3f}, True weight: {true_weight}")
print(f"Learned bias: {learned_bias[0]:.3f}, True bias: {true_bias}")

# Save the model
model.save('linear_regression_model.h5')
print("Model saved as 'linear_regression_model.h5'")