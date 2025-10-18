import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # One dense layer with 10 neurons
])

# Display model summary
model.summary()

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Example of how to use the model
# Generate dummy data for demonstration
x_train = np.random.random((100, 5))
y_train = np.random.randint(0, 10, (100,))

# Train the model briefly
model.fit(x_train, y_train, epochs=1, verbose=0)

# Save the model (optional)
# model.save('my_model.h5')

print("Model created successfully with one dense layer!")