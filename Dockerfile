# Stage 1: Build the React app
FROM node:14 as build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the remaining application code
COPY ./src .

# Build the React app
RUN npm run build

# Stage 2: Create a minimal production-ready image
FROM nginx:alpine

# Copy the built app from the 'build' stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80
