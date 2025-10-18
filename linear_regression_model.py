import tensorflow as tf
import numpy as np
import random
import os

# Set random seed for reproducibility
random_seed = random.randint(1, 10000)
tf.random.set_seed(random_seed)
np.random.seed(random_seed)
random.seed(random_seed)

# Generate random filename
random_filename = f"linear_model_{random.randint(1000, 9999)}.py"

# Generate synthetic data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weight = 2.5
true_bias = 1.0
y = true_weight * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Create the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

# Train the model
print("Training the model...")
history = model.fit(X, y, epochs=100, verbose=0, validation_split=0.2)

# Evaluate the model
loss, mae = model.evaluate(X, y, verbose=0)
print(f"Final loss: {loss:.4f}")
print(f"Final MAE: {mae:.4f}")

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f} (true: {true_weight})")
print(f"Learned bias: {bias[0]:.4f} (true: {true_bias})")

# Save the model
model.save('linear_regression_trained_model.h5')
print("Model saved as 'linear_regression_trained_model.h5'")

# Create a new script with the same functionality but with random name
script_content = '''import tensorflow as tf
import numpy as np

# Generate synthetic data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weight = 2.5
true_bias = 1.0
y = true_weight * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Create the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

# Train the model
print("Training the model...")
history = model.fit(X, y, epochs=100, verbose=0, validation_split=0.2)

# Evaluate the model
loss, mae = model.evaluate(X, y, verbose=0)
print(f"Final loss: {{loss:.4f}}")
print(f"Final MAE: {{mae:.4f}}")

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {{weights[0][0]:.4f}} (true: {true_weight})")
print(f"Learned bias: {{bias[0]:.4f}} (true: {true_bias})")

# Save the model
model.save('linear_regression_trained_model.h5')
print("Model saved as 'linear_regression_trained_model.h5'")
'''

# Write the script to the randomly named file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"TensorFlow linear regression script saved to '{random_filename}'")