# Use an official Python base image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Copy your local project files into the container
COPY . .

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-distutils \
    git \
    && apt-get clean

# Install Python dependencies
RUN pip install --upgrade pip setuptools
RUN pip install -r requirements.txt

# Download NLTK data
RUN python -c "import nltk; nltk.download('stopwords'); nltk.download('wordnet')"

# Expose the Flask default port
EXPOSE 5000

# Command to start the Flask app
CMD ["python", "app.py"]
