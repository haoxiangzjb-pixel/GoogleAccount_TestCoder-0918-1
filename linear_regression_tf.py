import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate sample data
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)  # y = 2x + 1 + noise

# Create TensorFlow model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=[1])
])

# Compile the model
model.compile(
    optimizer='sgd',
    loss='mean_squared_error',
    metrics=['mae']
)

# Display model summary
model.summary()

# Train the model
history = model.fit(X, y, epochs=100, verbose=1)

# Evaluate the model
loss, mae = model.evaluate(X, y, verbose=0)
print(f"Final loss: {loss}, Mean Absolute Error: {mae}")

# Make predictions
predictions = model.predict(X[:5])
print(f"Predictions for first 5 samples: {predictions.flatten()}")
print(f"Actual values for first 5 samples: {y[:5].flatten()}")

# Plot results
plt.scatter(X, y, label='Data')
plt.plot(X, model.predict(X), color='red', label='Prediction')
plt.legend()
plt.title('Linear Regression with TensorFlow')
plt.show()

# Save the model
model.save('linear_regression_model.h5')
print("Model saved as 'linear_regression_model.h5'")