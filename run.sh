#!/bin/bash

# Define your image name and container name
IMAGE_NAME="nextjs-demo"
CONTAINER_NAME="nextjs-demo"

# Build the Docker image
echo "Building the Docker image..."
docker build -t $IMAGE_NAME .

# Check if the container is running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Container $CONTAINER_NAME is running. Restarting..."
    docker restart $CONTAINER_NAME
else
    echo "Starting a new container..."
    docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME
fi

echo "Container $CONTAINER_NAME is up and running."
