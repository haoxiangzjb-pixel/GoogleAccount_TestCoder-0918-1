import tensorflow as tf
import numpy as np

# Generate some dummy data for training
X_train = np.random.random((100, 1)).astype(np.float32)
y_train = 3 * X_train + 2 + np.random.normal(size=(100, 1), scale=0.1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='adam', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X_train, y_train, epochs=100, verbose=0)

# Save the model
model.save('linear_regression_trained_model.h5')
print("Model saved as 'linear_regression_trained_model.h5'")