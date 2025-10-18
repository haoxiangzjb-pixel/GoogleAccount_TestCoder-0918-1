import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # Example: 5 input features, 10 neurons in dense layer
])

# Compile the model
model.compile(optimizer='adam',
              loss='mse',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Example: Generate some dummy data to test the model
X_train = np.random.random((100, 5))  # 100 samples, 5 features
y_train = np.random.random((100, 10))  # 100 samples, 10 outputs

# Train the model for a few epochs (just as an example)
model.fit(X_train, y_train, epochs=3, verbose=1)

# Save the model
model.save('my_keras_model.h5')

print("Model created, trained, and saved successfully!")