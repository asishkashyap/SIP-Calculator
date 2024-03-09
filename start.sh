#!/bin/bash

# Specify the base port
base_port=8081

# Specify the Docker image name
docker_image="sip_calculator"

# Run the Docker command in a loop
for ((i = 0; i < 100; i++)); do
  # Calculate the current port by adding the loop variable to the base port
  current_port=$((base_port + i))

  # Run the Docker command with the current port
  sudo docker run -d -p "${current_port}:3000" "${docker_image}"

  # Optionally, you can add a sleep command to avoid potential issues with rapid startup
  sleep 1
done