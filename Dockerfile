# Use Node.js 14 as the base image
FROM node:14

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

# Expose the port that the app listens on
EXPOSE 3000

# Start the app
CMD ["npm", "start"]