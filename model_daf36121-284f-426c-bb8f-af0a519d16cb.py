import keras

# Create a Sequential model
model = keras.Sequential()

# Add a Dense layer with 10 units and ReLU activation, specifying the input shape directly using the 'Dense' layer's input_shape parameter
model.add(keras.layers.Dense(units=10, activation='relu', input_shape=(1,))) # Assumes 1-dimensional input

# Compile the model (optional for just saving the architecture)
model.compile(optimizer='adam', loss='mse')

# Save the model
model.save('my_model.keras')

print("Model created and saved successfully!")