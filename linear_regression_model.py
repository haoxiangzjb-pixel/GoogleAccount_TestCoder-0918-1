import tensorflow as tf
import numpy as np
import random
import os

# Set random seed for reproducibility
random.seed(42)
np.random.seed(42)
tf.random.set_seed(42)

def generate_random_filename():
    """Generate a random filename for the script"""
    import string
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(10)) + '.py'

def create_linear_regression_model():
    """Create and train a simple linear regression model"""
    # Generate sample data
    X = np.random.randn(1000, 1).astype(np.float32)
    y = 3 * X + 2 + np.random.randn(1000, 1).astype(np.float32) * 0.1  # y = 3x + 2 + noise
    
    # Create the model
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,))
    ])
    
    # Compile the model
    model.compile(optimizer='adam',
                  loss='mean_squared_error',
                  metrics=['mae'])
    
    # Train the model
    print("Training the model...")
    model.fit(X, y, epochs=50, verbose=0)
    
    # Print model summary
    print("Model Summary:")
    model.summary()
    
    # Test the model
    test_X = np.array([[0.0], [1.0], [2.0]], dtype=np.float32)
    predictions = model.predict(test_X)
    print(f"Test predictions for {test_X.flatten()}: {predictions.flatten()}")
    
    return model

if __name__ == "__main__":
    # Create and train the model
    model = create_linear_regression_model()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Saving model code to: {random_filename}")
    
    # Save this script with the random filename
    script_content = '''import tensorflow as tf
import numpy as np

# Set random seed for reproducibility
np.random.seed(42)
tf.random.set_seed(42)

def create_linear_regression_model():
    """Create and train a simple linear regression model"""
    # Generate sample data
    X = np.random.randn(1000, 1).astype(np.float32)
    y = 3 * X + 2 + np.random.randn(1000, 1).astype(np.float32) * 0.1  # y = 3x + 2 + noise
    
    # Create the model
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,))
    ])
    
    # Compile the model
    model.compile(optimizer=''adam'',
                  loss=''mean_squared_error'',
                  metrics=[''mae''])
    
    # Train the model
    print("Training the model...")
    model.fit(X, y, epochs=50, verbose=0)
    
    # Print model summary
    print("Model Summary:")
    model.summary()
    
    # Test the model
    test_X = np.array([[0.0], [1.0], [2.0]], dtype=np.float32)
    predictions = model.predict(test_X)
    print(f"Test predictions for {test_X.flatten()}: {predictions.flatten()}")
    
    return model

if __name__ == "__main__":
    model = create_linear_regression_model()
'''
    
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Successfully created {random_filename}")