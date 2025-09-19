"""
Simple Linear Regression with TensorFlow
---------------------------------------

This script demonstrates how to build a simple linear regression model using TensorFlow/Keras.

Steps:
1. Generate synthetic data
2. Create a neural network model with one Dense layer
3. Compile the model with optimizer and loss function
4. Train the model on the data
5. Evaluate and visualize results
6. Save the trained model

Requirements:
- tensorflow
- numpy
- matplotlib
"""

import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

def generate_data():
    """Generate synthetic linear data with noise."""
    np.random.seed(42)
    X = np.random.randn(100, 1).astype(np.float32)
    y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)
    return X, y

def create_model():
    """Create a simple linear regression model."""
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(units=1, input_shape=[1])
    ])
    return model

def compile_model(model):
    """Compile the model with optimizer and loss function."""
    model.compile(
        optimizer='sgd',
        loss='mean_squared_error',
        metrics=['mae']
    )

def train_model(model, X, y, epochs=100):
    """Train the model on the provided data."""
    history = model.fit(X, y, epochs=epochs, verbose=1)
    return history

def evaluate_model(model, X, y):
    """Evaluate the model performance."""
    loss, mae = model.evaluate(X, y, verbose=0)
    return loss, mae

def plot_results(X, y, model):
    """Plot the data and model predictions."""
    plt.figure(figsize=(10, 6))
    plt.scatter(X, y, label='Data')
    plt.plot(X, model.predict(X), color='red', label='Prediction')
    plt.xlabel('X')
    plt.ylabel('y')
    plt.legend()
    plt.title('Linear Regression with TensorFlow')
    plt.show()

def main():
    """Main function to execute the linear regression example."""
    print("Generating data...")
    X, y = generate_data()
    
    print("Creating model...")
    model = create_model()
    
    print("Compiling model...")
    compile_model(model)
    
    print("Model Summary:")
    model.summary()
    
    print("Training model...")
    history = train_model(model, X, y)
    
    print("Evaluating model...")
    loss, mae = evaluate_model(model, X, y)
    print(f"Final Loss: {loss:.4f}")
    print(f"Mean Absolute Error: {mae:.4f}")
    
    print("Making predictions...")
    predictions = model.predict(X[:5])
    print(f"Predictions for first 5 samples: {predictions.flatten()}")
    print(f"Actual values for first 5 samples: {y[:5].flatten()}")
    
    print("Plotting results...")
    # plot_results(X, y, model)  # Commented out for environments without display
    
    print("Saving model...")
    model.save('linear_regression_model.h5')
    print("Model saved as 'linear_regression_model.h5'")

# Execute the script
if __name__ == "__main__":
    main()