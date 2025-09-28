import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Define the model
model = keras.Sequential([
    layers.Dense(1, activation='relu', input_shape=(10,))
])

# Display the model architecture
model.summary()

# Save the model as a SavedModel format (recommended)
model.save('my_model.h5')

print("Model saved successfully as my_model.h5")
