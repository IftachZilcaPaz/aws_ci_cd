#!/bin/bash

# Stop all running containers
docker stop $(docker ps -aq)

# Remove all containers
docker rm $(docker ps -aq)

# Remove all images
docker rmi $(docker images -q)


# Build the new image with a unique tag
#COMMIT_HASH=$(git rev-parse --short HEAD)
docker build -t myimage /home/ubuntu -f /home/ubuntu/Dockerfile

# Run the new container
docker run -d --name mycontainer -p 80:80 myimage

# Optional: Clean up old images
#docker image prune -a -f

