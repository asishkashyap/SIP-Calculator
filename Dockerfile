# Use Node.js 14 as the base image
FROM node:14 as build

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the source code
COPY . .

# Build the application
RUN npm run build

# Use Nginx as the production image
FROM nginx:alpine

# Copy the built files from the first stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose the Nginx port
EXPOSE 80