import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a Sequential model with exactly one dense layer
model = keras.Sequential([
    layers.Dense(64, activation='relu', input_shape=(10,))  # Single dense layer with 64 units
])

# Compile the model
model.compile(optimizer='adam',
              loss='mse',  # Mean squared error loss
              metrics=['mae'])  # Mean absolute error metric

# Display model summary
model.summary()

print("Model with one dense layer created successfully!")