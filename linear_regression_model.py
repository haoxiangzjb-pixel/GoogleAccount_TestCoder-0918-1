import tensorflow as tf
import numpy as np

# Define the linear regression model as a tf.Module
class LinearRegressionModel(tf.Module):
    def __init__(self):
        # Initialize model parameters
        self.W = tf.Variable(tf.random.normal([1]), name='weight')
        self.b = tf.Variable(tf.zeros([1]), name='bias')
        
    @tf.function
    def __call__(self, x):
        return self.W * x + self.b

# Generate sample data for linear regression
# y = 3*x + 2 + noise
np.random.seed(42)
x_data = np.random.randn(100).astype(np.float32)
y_data = 3 * x_data + 2 + np.random.normal(0, 0.1, 100).astype(np.float32)

# Create model instance
model = LinearRegressionModel()

# Define the loss function (Mean Squared Error)
def mean_squared_error(y_pred, y_true):
    return tf.reduce_mean(tf.square(y_pred - y_true))

# Define the optimizer
optimizer = tf.optimizers.SGD(learning_rate=0.01)

# Training function
@tf.function
def train_step(x, y):
    with tf.GradientTape() as tape:
        predictions = model(x)
        loss = mean_squared_error(predictions, y)
    
    # Compute gradients
    gradients = tape.gradient(loss, model.trainable_variables)
    
    # Update weights
    optimizer.apply_gradients(zip(gradients, model.trainable_variables))
    
    return loss

# Training loop
print("Starting training...")
for epoch in range(100):
    loss = train_step(x_data, y_data)
    
    if (epoch + 1) % 10 == 0:
        print(f"Epoch: {epoch+1}, Loss: {loss:.4f}, Weight: {model.W.numpy()[0]:.4f}, Bias: {model.b.numpy()[0]:.4f}")

print(f"\nFinal model: y = {model.W.numpy()[0]:.4f} * x + {model.b.numpy()[0]:.4f}")

# Save the model
tf.saved_model.save(
    model, 
    'linear_regression_saved_model',
    signatures={
        'serving_default': model.__call__.get_concrete_function(
            tf.TensorSpec(shape=[None], dtype=tf.float32, name='x')
        )
    }
)

print("\nModel saved successfully!")