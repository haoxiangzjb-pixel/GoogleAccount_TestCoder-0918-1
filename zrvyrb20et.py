import tensorflow as tf
import numpy as np
import os
from datetime import datetime

def create_linear_regression_model():
    """
    Creates a simple linear regression model using TensorFlow
    """
    # Create a simple model: y = wx + b
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(units=1, input_shape=(1,))
    ])
    
    # Compile the model with optimizer, loss function, and metrics
    model.compile(
        optimizer='sgd',  # Stochastic Gradient Descent
        loss='mean_squared_error',  # For regression problems
        metrics=['mae']  # Mean Absolute Error
    )
    
    return model

def generate_sample_data(num_samples=100):
    """
    Generate sample data for linear regression: y = 2x + 1 + noise
    """
    X = np.random.randn(num_samples, 1).astype(np.float32)
    y = 2 * X + 1 + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
    
    return X, y

def main():
    print("Creating a simple linear regression model with TensorFlow...")
    
    # Set random seed for reproducibility
    tf.random.set_seed(42)
    np.random.seed(42)
    
    # Create the model
    model = create_linear_regression_model()
    
    # Print model summary
    print("\nModel Summary:")
    model.summary()
    
    # Generate sample data
    print("\nGenerating sample data...")
    X_train, y_train = generate_sample_data(num_samples=1000)
    X_test, y_test = generate_sample_data(num_samples=200)
    
    # Train the model
    print("\nTraining the model...")
    history = model.fit(
        X_train, y_train,
        epochs=50,
        batch_size=32,
        validation_data=(X_test, y_test),
        verbose=1
    )
    
    # Evaluate the model
    print("\nEvaluating the model...")
    test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
    print(f"Test Loss (MSE): {test_loss:.4f}")
    print(f"Test MAE: {test_mae:.4f}")
    
    # Make predictions
    print("\nMaking predictions...")
    sample_predictions = model.predict(X_test[:5])
    print("Sample predictions vs actual values:")
    for i in range(5):
        print(f"  Input: {X_test[i][0]:.2f}, Predicted: {sample_predictions[i][0]:.2f}, Actual: {y_test[i][0]:.2f}")
    
    # Get the learned parameters
    weights, bias = model.layers[0].get_weights()
    print(f"\nLearned parameters:")
    print(f"  Weight (w): {weights[0][0]:.4f}")
    print(f"  Bias (b): {bias[0]:.4f}")
    print(f"  True parameters: w=2.0, b=1.0")
    
    # Save the model
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    model_filename = f"linear_regression_model_{timestamp}.h5"
    model.save(model_filename)
    print(f"\nModel saved as {model_filename}")
    
    print("\nLinear regression model training completed successfully!")

if __name__ == "__main__":
    main()