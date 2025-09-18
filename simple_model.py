#!/usr/bin/env python3
"""
A simple Keras model with one dense layer.
This file defines a basic neural network model without training or saving capabilities.
"""

import tensorflow as tf
from tensorflow import keras

def create_model():
    """Create a simple Keras model with one dense layer"""
    # Create a simple Keras model with one dense layer
    model = keras.Sequential([
        keras.layers.Dense(10, activation='relu', input_shape=(5,)),  # One dense layer with 10 units
        keras.layers.Dense(1, activation='sigmoid')  # Output layer
    ])
    
    # Compile the model
    model.compile(optimizer='adam',
                  loss='binary_crossentropy',
                  metrics=['accuracy'])
    
    return model

if __name__ == "__main__":
    # Create and display model
    model = create_model()
    print("Model architecture:")
    model.summary()
    
    # Note: Model saving is commented out as it requires h5py dependency
    # model.save('my_model.h5')
    print("\nModel definition completed.")