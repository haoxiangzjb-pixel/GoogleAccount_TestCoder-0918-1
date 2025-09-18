import tensorflow as tf
from tensorflow import keras
import numpy as np

# Create a simple Keras model with one dense layer
model = keras.Sequential([
    keras.layers.Dense(10, activation='relu', input_shape=(5,)),  # One dense layer with 10 units
    keras.layers.Dense(1, activation='sigmoid')  # Output layer
])

# Compile the model
model.compile(optimizer='adam',
              loss='binary_crossentropy',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Save the model
model.save('my_model.h5')

print("Model created and saved successfully!")