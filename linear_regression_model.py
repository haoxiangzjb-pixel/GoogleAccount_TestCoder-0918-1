import tensorflow as tf
import numpy as np
import random
import os

# Set random seed for reproducibility
random.seed(42)
np.random.seed(42)
tf.random.set_seed(42)

def create_linear_regression_model():
    """
    Creates a simple linear regression model using TensorFlow
    """
    # Create a simple model with one dense layer (linear)
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,), name='linear_layer')
    ])
    
    # Compile the model with mean squared error loss and stochastic gradient descent optimizer
    model.compile(
        optimizer='sgd',  # Stochastic Gradient Descent
        loss='mean_squared_error',  # Mean Squared Error for regression
        metrics=['mae']  # Mean Absolute Error as additional metric
    )
    
    return model

def generate_sample_data(num_samples=100):
    """
    Generate sample data for linear regression: y = 2x + 1 + noise
    """
    # Generate random x values
    x = np.random.randn(num_samples, 1).astype(np.float32)
    
    # Generate y values with linear relationship and some noise
    y = 2 * x + 1 + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
    
    return x, y

def main():
    print("Creating a simple linear regression model with TensorFlow...")
    
    # Create the model
    model = create_linear_regression_model()
    
    # Print model summary
    model.summary()
    
    # Generate sample data
    x_train, y_train = generate_sample_data(1000)
    x_test, y_test = generate_sample_data(200)
    
    print(f"Training data shape: x={x_train.shape}, y={y_train.shape}")
    
    # Train the model
    print("Training the model...")
    history = model.fit(
        x_train, y_train,
        epochs=50,
        batch_size=32,
        validation_data=(x_test, y_test),
        verbose=1
    )
    
    # Evaluate the model
    print("Evaluating the model...")
    test_loss, test_mae = model.evaluate(x_test, y_test, verbose=0)
    print(f"Test Loss (MSE): {test_loss:.4f}")
    print(f"Test MAE: {test_mae:.4f}")
    
    # Make predictions on a few samples
    print("\nMaking predictions on sample data...")
    sample_predictions = model.predict(x_test[:5])
    for i in range(5):
        print(f"Input: {x_test[i][0]:.3f}, Predicted: {sample_predictions[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")
    
    # Print the learned weights (slope and bias)
    weights, bias = model.layers[0].get_weights()
    print(f"\nLearned parameters:")
    print(f"Slope (weight): {weights[0][0]:.3f}")
    print(f"Bias: {bias[0]:.3f}")
    print(f"Actual parameters were: slope=2.0, bias=1.0")
    
    # Save the model
    model_path = "linear_regression_saved_model"
    model.save(model_path)
    print(f"\nModel saved to {model_path}")

if __name__ == "__main__":
    main()