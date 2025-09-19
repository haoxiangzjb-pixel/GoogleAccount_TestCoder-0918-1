import tensorflow as tf
import numpy as np

# Load the saved model
loaded_model = tf.saved_model.load('linear_regression_saved_model')

# Get the serving signature
infer = loaded_model.signatures["serving_default"]

# Test the loaded model with some sample data
test_x = tf.constant([1.0, 2.0, 3.0, 4.0], dtype=tf.float32)
predictions = infer(x=test_x)

print("Predictions from loaded model:")
for i in range(len(test_x)):
    print(f"Input: {test_x[i].numpy():.1f}, Prediction: {predictions['output_0'][i].numpy():.4f}")