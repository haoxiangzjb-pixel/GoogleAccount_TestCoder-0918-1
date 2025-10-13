import tensorflow as tf
import numpy as np

# Generate some dummy data for linear regression y = 2x + 1
x_train = np.random.random((100, 1))
y_train = 2 * x_train + 1 + 0.1 * np.random.randn(100, 1) # Adding some noise

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(x_train, y_train, epochs=50, verbose=0)

# Print the learned weights (should be close to slope=2 and intercept=1)
weights, bias = model.layers[0].get_weights()
print(f"Learned slope: {weights[0][0]:.2f}")
print(f"Learned intercept: {bias[0]:.2f}")