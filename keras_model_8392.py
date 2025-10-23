import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(8,))  # Example: 10 units, ReLU activation, input shape of 8
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Example: Save the model (uncomment the next line if you want to save in Keras format)
# model.save('my_model.h5')

print("Keras model with one dense layer created successfully!")