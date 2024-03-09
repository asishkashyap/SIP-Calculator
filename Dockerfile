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
FROM node:14

# Set the working directory
WORKDIR /app

# Copy the start.sh file to the image
COPY start.sh /start.sh

# Copy the built app from the 'build' stage
COPY --from=build /app/build /app/build

# Install the production dependencies
RUN npm install --only=production

# Make the start.sh file executable
RUN chmod +x /start.sh

# Set the entrypoint to the start.sh file
ENTRYPOINT ["/start.sh"]