# First stage: development
FROM node:14 as build-stage

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json into the working directory
COPY package*.json ./

# Install any needed packages
RUN npm install

# Copy the rest of the application into the working directory
COPY . .

# Build the application
RUN npm run build

# Second stage: production
FROM nginx:alpine

# Copy the built app from the first stage
COPY --from=build-stage /app/build /usr/share/nginx/html

# Make port 80 available to the world outside this container
EXPOSE 80

# Start the nginx service
CMD ["nginx", "-g", "daemon off;"]