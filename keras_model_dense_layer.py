import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a Sequential model
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 10 neurons, ReLU activation, input shape (784,)
])

# Compile the model (optional, but common practice)
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Print model summary
model.summary()

# Save the model definition as a Python script
model.save('my_keras_model.h5')

print("Keras model created and saved as my_keras_model.h5")