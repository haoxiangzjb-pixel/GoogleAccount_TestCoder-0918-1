import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a Sequential model
model = keras.Sequential([
    layers.Dense(64, activation='relu', input_shape=(10,)),  # One dense layer with 64 units
    layers.Dense(1, activation='sigmoid')  # Output layer
])

# Compile the model
model.compile(optimizer='adam',
              loss='binary_crossentropy',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Save the model architecture to a file (optional)
# model.save('my_model.h5')

print("Model created successfully!")