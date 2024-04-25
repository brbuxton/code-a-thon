# Use the official Python image as the parent image
FROM python:latest

# Set the working directory in the container
WORKDIR /app

# Install Flask
RUN pip install Flask

# Install wget and unzip (to download and extract ngrok)
RUN apt-get update && apt-get install -y wget unzip

# Download ngrok
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip

# Unzip ngrok and move it to a known directory for easy execution
RUN unzip ngrok-stable-linux-amd64.zip -d /usr/local/bin && rm ngrok-stable-linux-amd64.zip

# Install pyngrok
RUN pip install pyngrok

# Copy the Flask app's code into the container
COPY . /app

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Expose the ngrok web interface on port 4040
EXPOSE 4040

# Define environment variable
ENV FLASK_APP=main.py
ENV FLASK_RUN_HOST=0.0.0.0

# Command to run Flask
# CMD ["flask", "run"]
