import tensorflow as tf
import numpy as np


# Generate some synthetic data for demonstration
# y = 3*x + 2 + noise
x_train = np.random.rand(1000, 1).astype(np.float32)
noise = np.random.normal(0, 0.1, size=x_train.shape).astype(np.float32)
y_train = 3 * x_train + 2 + noise

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=[1])
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(x_train, y_train, epochs=100, verbose=0)
print("Training complete.")

# Evaluate the model
loss = model.evaluate(x_train, y_train, verbose=0)
print(f"Final loss: {loss}")

# Print the learned weights
weights, bias = model.layers[0].get_weights()
print(f"Learned Weight: {weights[0][0]:.4f}, Learned Bias: {bias[0]:.4f}")

# Save the model
model.save('linear_regression_model.h5')
print("Model saved to 'linear_regression_model.h5'.")