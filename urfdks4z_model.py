import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a Sequential model
model = keras.Sequential()

# Add one dense layer with 10 units and ReLU activation
# Input shape is 8-dimensional for this example
model.add(layers.Dense(10, activation='relu', input_shape=(8,)))

# Add an output layer for binary classification
model.add(layers.Dense(1, activation='sigmoid'))

# Compile the model
model.compile(optimizer='adam',
              loss='binary_crossentropy',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Save the model architecture to a file (optional)
# model.save('my_model.h5')

print("Model created successfully!")