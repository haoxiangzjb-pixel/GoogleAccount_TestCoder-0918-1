import tensorflow as tf
import numpy as np
import os
from datetime import datetime

def create_linear_regression_model():
    """
    Creates and trains a simple linear regression model using TensorFlow
    """
    print("Creating a simple linear regression model...")
    
    # Generate sample data
    # y = 2x + 1 + noise
    np.random.seed(42)
    X = np.random.randn(100, 1).astype(np.float32)
    y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)
    
    # Create the model
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,))
    ])
    
    # Compile the model
    model.compile(
        optimizer='adam',
        loss='mean_squared_error',
        metrics=['mae']
    )
    
    print("Model architecture:")
    print(model.summary())
    
    # Train the model
    print("\nTraining the model...")
    history = model.fit(X, y, epochs=100, verbose=0)
    
    print("Training completed!")
    
    # Test the model
    test_x = np.array([[0.5], [1.0], [-0.5]], dtype=np.float32)
    predictions = model.predict(test_x)
    print(f"\nTest predictions for inputs {test_x.flatten()}: {predictions.flatten()}")
    
    # Save the model
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    random_suffix = str(np.random.randint(1000, 9999))
    model_filename = f"linear_regression_model_{timestamp}_{random_suffix}"
    
    model.save(f"{model_filename}.h5")
    print(f"\nModel saved as {model_filename}.h5")
    
    return model

if __name__ == "__main__":
    model = create_linear_regression_model()