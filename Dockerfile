# Use a base image with Python 3.9
FROM python:3.9-slim

# Install pip (it's usually pre-installed with python:3.9-slim, but we'll ensure it's available)
RUN apt-get update && apt-get install -y python3-pip && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the Python script from the host to the container
COPY random_number_generator.py .

# Install any required Python packages (if any) - for now, no additional packages needed
# RUN pip install -r requirements.txt  # Uncomment if you have a requirements.txt file

# Set the default command to run the Python script
CMD ["python", "random_number_generator.py"]