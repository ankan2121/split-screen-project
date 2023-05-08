# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Build the application
RUN npm run build

# Use nginx as the web server
FROM nginx:alpine

# Copy the built application to the nginx web root directory
COPY --from=0 /app/dist /usr/share/nginx/html

# Expose port 80 for incoming traffic
EXPOSE 80

# Start nginx web server when the container starts
CMD ["nginx", "-g", "daemon off;"]
