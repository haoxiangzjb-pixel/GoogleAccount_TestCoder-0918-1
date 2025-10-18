import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Define a function to create a model with one dense layer
def create_model():
    model = keras.Sequential([
        layers.Dense(64, activation='relu', input_shape=(784,))  # One dense layer with 64 neurons
    ])
    return model

# Create the model
model = create_model()

# Print model information without calling summary() to avoid initialization
print("Keras model with one dense layer created successfully!")
print(f"Model type: {type(model)}")
print(f"Number of layers: {len(model.layers)}")
print(f"First layer type: {type(model.layers[0])}")
print(f"First layer config: {model.layers[0].get_config() if hasattr(model.layers[0], 'get_config') else 'N/A'}")

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

print("Model compiled successfully!")