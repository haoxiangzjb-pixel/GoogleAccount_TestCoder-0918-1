#!/usr/bin/env python3
"""
Script to create a scatter plot and save it with a random filename.
"""

import matplotlib.pyplot as plt
import numpy as np
import random
import string
import os

def generate_random_filename(extension='png', prefix='scatter_plot_'):
    """Generate a random filename with the given extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"{prefix}{random_string}.{extension}"

def create_scatter_plot():
    """Create a scatter plot with random data and save it to a file with a random name."""
    # Generate random data
    n_points = 100
    x = np.random.randn(n_points)
    y = 2 * x + np.random.randn(n_points) * 0.5  # Linear relationship with some noise
    
    # Create the scatter plot
    plt.figure(figsize=(10, 6))
    plt.scatter(x, y, alpha=0.7)
    plt.title('Scatter Plot')
    plt.xlabel('X Values')
    plt.ylabel('Y Values')
    plt.grid(True, alpha=0.3)
    
    # Generate random filename and save the plot
    filename = generate_random_filename()
    plt.savefig(filename)
    plt.close()  # Close the figure to free memory
    
    print(f"Scatter plot saved as: {filename}")
    return filename

if __name__ == "__main__":
    create_scatter_plot()