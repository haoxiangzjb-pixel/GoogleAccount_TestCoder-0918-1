import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # Example: 5 input features, 10 neurons
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Example: Create some dummy data to test the model
x_train = np.random.random((100, 5))  # 100 samples, 5 features each
y_train = np.random.randint(0, 10, (100,))  # 100 labels, values from 0 to 9

# Train the model for a few epochs (just for demonstration)
print("Training the model...")
model.fit(x_train, y_train, epochs=3, verbose=1)

# Make predictions
print("\nMaking predictions...")
predictions = model.predict(x_train[:5])  # Predict on first 5 samples
print("Predictions shape:", predictions.shape)