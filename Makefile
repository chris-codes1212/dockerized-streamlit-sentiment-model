IMAGE_NAME := sentiment-app
TAG= latest
CONTAINER_NAME := sentiment-app-container
PORT := 8501


.PHONY: build run stop clean


# build docker image
build:
	docker build -t $(IMAGE_NAME):$(TAG) .


# run the Docker container
run:
	docker run -d --name $(CONTAINER_NAME) -p $(PORT):$(PORT) $(IMAGE_NAME):$(TAG)


# Stop running the Docker container
stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)


# Clean up: remove the Docker image
clean:
	docker rmi $(IMAGE_NAME):$(TAG)

