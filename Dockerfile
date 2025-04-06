# Use official Python 3.12 base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy project files into the container
COPY . /app

# Update OS packages and install dependencies
RUN apt-get update -y && \
    apt-get install -y awscli ffmpeg libsm6 libxext6 unzip && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose the port GCP , AWS and Azure  uses
EXPOSE 8080

# Command to run your Flask app using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
