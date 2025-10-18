import tensorflow as tf
import numpy as np
import random
import string

# Generate random data for linear regression
def generate_data(num_samples=100):
    X = np.random.randn(num_samples, 1).astype(np.float32)
    # True relationship: y = 2.5*x + 1.0 + noise
    y = 2.5 * X + 1.0 + 0.2 * np.random.randn(num_samples, 1).astype(np.float32)
    return X, y

# Generate training data
X_train, y_train = generate_data(200)
X_test, y_test = generate_data(50)

# Build a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='adam',
              loss='mean_squared_error',
              metrics=['mae'])

print("Model architecture:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X_train, y_train, 
                    epochs=50, 
                    validation_data=(X_test, y_test),
                    verbose=1)

# Evaluate the model
print("\nEvaluating the model...")
test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
print(f"Test Loss (MSE): {test_loss:.4f}")
print(f"Test MAE: {test_mae:.4f}")

# Make predictions
predictions = model.predict(X_test[:5])
print("\nFirst 5 predictions vs actual values:")
for i in range(5):
    print(f"X: {X_test[i][0]:.3f}, Predicted: {predictions[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")

# Print learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.3f}, Learned bias: {bias[0]:.3f}")
print(f"True weight: 2.5, True bias: 1.0")