import tensorflow as tf

# Define a simple Sequential model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))  # Single dense layer with 1 input and 1 output
])

# Print the model summary
model.summary()

# Example of saving the model architecture config (optional)
# model.save('my_model.h5') # To save the entire model