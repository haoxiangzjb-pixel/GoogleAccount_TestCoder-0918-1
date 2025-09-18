"""
Simple Keras Model with One Dense Layer
This script defines a basic Keras model structure.
"""

# Import statements (would be needed if running the script)
# import tensorflow as tf
# from tensorflow import keras

def create_model():
    """
    Creates a simple Keras model with one dense layer.
    """
    # Model definition (commented out since we can't run it without TensorFlow)
    # model = keras.Sequential([
    #     keras.layers.Dense(10, activation='relu', input_shape=(5,)),
    #     keras.layers.Dense(1, activation='sigmoid')
    # ])
    
    # For demonstration purposes, we're just showing the structure
    model_structure = {
        "layers": [
            {"type": "Dense", "units": 10, "activation": "relu", "input_shape": "(5,)"},
            {"type": "Dense", "units": 1, "activation": "sigmoid"}
        ],
        "optimizer": "adam",
        "loss": "binary_crossentropy",
        "metrics": ["accuracy"]
    }
    
    return model_structure

if __name__ == "__main__":
    model = create_model()
    print("Model structure defined:")
    print(model)
    # In a real environment with TensorFlow, you would save the model like this:
    # model.save('simple_model.h5')
    print("In an environment with TensorFlow, this model would be saved as 'simple_model.h5'")