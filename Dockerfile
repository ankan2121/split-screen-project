# Use nginx as the web server
FROM nginx:alpine

# Copy the rest of the application files to the container
COPY . .

# Copy the built application to the nginx web root directory
COPY dist /usr/share/nginx/html

# Expose port 80 for incoming traffic
EXPOSE 80

# Start nginx web server when the container starts
CMD ["nginx", "-g", "daemon off;"]
