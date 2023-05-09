# Use the official Python image as the parent image
FROM python:3

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Expose port 80 so that it's accessible outside of the container
EXPOSE 80

# Start the web server when the container starts
CMD ["python", "-m", "http.server", "80"]
