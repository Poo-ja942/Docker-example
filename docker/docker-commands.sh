#!/bin/bash

# Function to build the Docker image
build() {
    echo "Building the Docker image..."
    docker build -t nestjs-app .
}

# Function to run the Docker container
run() {
    echo "Running the Docker container..."
    docker run -d -p 3000:3000 --name nestjs-app-container nestjs-app
}

# Function to stop the Docker container
stop() {
    echo "Stopping the Docker container..."
    docker stop nestjs-app-container
    docker rm nestjs-app-container
}

# Function to start the Docker container
start() {
    echo "Starting the Docker container..."
    docker start nestjs-app-container
}

# Function to rebuild the Docker image without cache
rebuild() {
    echo "Rebuilding the Docker image without cache..."
    docker build --no-cache -t nestjs-app .
}

# Function to build and run the Docker containers using Docker Compose
compose_up() {
    echo "Building and running the Docker containers using Docker Compose..."
    docker-compose up --build -d
}

# Function to stop and remove the Docker containers using Docker Compose
compose_down() {
    echo "Stopping and removing the Docker containers using Docker Compose..."
    docker-compose down
}

# Function to show usage
usage() {
    echo "Usage: $0 {build|run|stop|start|rebuild|compose_up|compose_down}"
    exit 1
}

# Check if at least one argument is passed
if [ $# -lt 1 ]; then
    usage
fi

# Call the appropriate function based on the argument
case "$1" in
    build)
        build
        ;;
    run)
        run
        ;;
    stop)
        stop
        ;;
    start)
        start
        ;;
    rebuild)
        rebuild
        ;;
    compose_up)
        compose_up
        ;;
    compose_down)
        compose_down
        ;;
    *)
        usage
        ;;
esac
