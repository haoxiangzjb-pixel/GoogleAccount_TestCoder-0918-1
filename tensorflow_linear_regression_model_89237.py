import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate synthetic data for linear regression
def generate_data(n_samples=100):
    X = np.random.randn(n_samples, 1)
    # True relationship: y = 2*x + 1 + noise
    y = 2 * X + 1 + 0.1 * np.random.randn(n_samples, 1)
    return X.astype(np.float32), y.astype(np.float32)

# Create the model
def create_model():
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,))
    ])
    
    model.compile(
        optimizer='adam',
        loss='mean_squared_error',
        metrics=['mae']
    )
    
    return model

# Main execution
if __name__ == "__main__":
    # Generate data
    X_train, y_train = generate_data(200)
    X_test, y_test = generate_data(50)
    
    # Create and display the model
    model = create_model()
    print("Model Architecture:")
    model.summary()
    
    # Train the model
    print("\nTraining the model...")
    history = model.fit(
        X_train, y_train,
        epochs=100,
        batch_size=32,
        validation_split=0.2,
        verbose=0
    )
    
    # Evaluate the model
    print("\nEvaluating the model...")
    test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
    print(f"Test Loss (MSE): {test_loss:.4f}")
    print(f"Test MAE: {test_mae:.4f}")
    
    # Make predictions
    predictions = model.predict(X_test)
    
    # Get the learned parameters
    weights, bias = model.layers[0].get_weights()
    print(f"\nLearned parameters:")
    print(f"Weight: {weights[0][0]:.4f}")
    print(f"Bias: {bias[0]:.4f}")
    print(f"True parameters: Weight=2.0, Bias=1.0")
    
    # Plot the results
    plt.figure(figsize=(12, 4))
    
    # Plot training history
    plt.subplot(1, 2, 1)
    plt.plot(history.history['loss'], label='Training Loss')
    plt.plot(history.history['val_loss'], label='Validation Loss')
    plt.title('Model Loss Over Epochs')
    plt.xlabel('Epoch')
    plt.ylabel('Loss')
    plt.legend()
    
    # Plot predictions vs actual
    plt.subplot(1, 2, 2)
    plt.scatter(X_test, y_test, alpha=0.6, label='Actual')
    plt.scatter(X_test, predictions, alpha=0.6, label='Predictions')
    plt.title('Actual vs Predicted Values')
    plt.xlabel('X')
    plt.ylabel('y')
    plt.legend()
    
    plt.tight_layout()
    plt.show()
    
    print("\nLinear regression model successfully created and trained!")