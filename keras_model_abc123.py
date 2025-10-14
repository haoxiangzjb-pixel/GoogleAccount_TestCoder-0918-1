import tensorflow as tf
from tensorflow import keras

# Create a simple Sequential model
model = keras.Sequential([
    keras.layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 784 input units, 10 output units with ReLU activation
])

# Compile the model (optional for just creation and saving)
# model.compile(optimizer='adam', loss='sparse_categorical_crossentropy')

# Save the model architecture as a Python file
# Note: This saves the config, not the full model state. For full saving, use model.save().
model.save('my_simple_model.keras')

print("Model created and saved as 'my_simple_model.keras'")
print("Model summary:")
print(model.summary())