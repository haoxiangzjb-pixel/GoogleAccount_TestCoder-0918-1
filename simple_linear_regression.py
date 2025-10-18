import tensorflow as tf
import numpy as np
import random

# Generate random filename
random_filename = f"linear_model_{random.randint(1000, 9999)}.py"

# Create a simple linear regression script content
script_content = '''import tensorflow as tf
import numpy as np

# Generate small dataset for linear regression
num_samples = 100
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

# Train the model briefly
print("Training the model...")
history = model.fit(X, y, epochs=10, verbose=1)  # Reduced epochs

# Evaluate the model
loss, mae = model.evaluate(X, y, verbose=0)
print(f"Final loss: {loss:.4f}")
print(f"Final MAE: {mae:.4f}")

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f} (true: {true_weight})")
print(f"Learned bias: {bias[0]:.4f} (true: {true_bias})")

# Save the model
model.save('simple_linear_regression_model.h5')
print("Model saved as 'simple_linear_regression_model.h5'")
'''

# Write the script to the randomly named file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"TensorFlow linear regression script saved to '{random_filename}'")