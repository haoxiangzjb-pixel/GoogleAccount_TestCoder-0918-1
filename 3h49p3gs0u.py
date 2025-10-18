import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple Keras model with one dense layer
model = keras.Sequential([
    layers.Dense(64, activation='relu', input_shape=(784,))  # Single dense layer with 64 units
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Print model summary
print("Model Summary:")
model.summary()