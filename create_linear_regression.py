import tensorflow as tf
import numpy as np
import random
import string

def generate_random_filename():
    """Generate a random filename for the script"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(10)) + '.py'

# Generate the random filename
random_filename = generate_random_filename()

# Content for the linear regression script
script_content = '''import tensorflow as tf
import numpy as np

# Set random seed for reproducibility
np.random.seed(42)
tf.random.set_seed(42)

def create_linear_regression_model():
    """Create and train a simple linear regression model"""
    # Generate sample data: y = 2x + 1 + noise
    X = np.random.randn(1000, 1).astype(np.float32)
    y = 2 * X + 1 + np.random.randn(1000, 1).astype(np.float32) * 0.1
    
    # Create the model
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,), name='linear_layer')
    ])
    
    # Compile the model
    model.compile(optimizer='adam',
                  loss='mean_squared_error',
                  metrics=['mae'])
    
    print("Training the linear regression model...")
    # Train the model
    history = model.fit(X, y, epochs=50, verbose=0)
    
    print("Model training completed!")
    print("Model Summary:")
    model.summary()
    
    # Test the model with a few samples
    test_X = np.array([[0.0], [1.0], [2.0], [-1.0]], dtype=np.float32)
    predictions = model.predict(test_X)
    expected = 2 * test_X + 1  # True values without noise
    print(f"\\nTest results:")
    for i in range(len(test_X)):
        print(f"  x={test_X[i][0]:.1f}, predicted y={predictions[i][0]:.2f}, expected y={expected[i][0]:.1f}")
    
    return model

if __name__ == "__main__":
    model = create_linear_regression_model()
'''

# Write the content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Successfully created linear regression script: {random_filename}")