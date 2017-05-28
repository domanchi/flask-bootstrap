CONTAINER_NAME = bootstrap
IMAGE_NAME = bootstrap

default:
	sudo docker run -p 5000:5000 --name $(CONTAINER_NAME) \
	    -v "$$(pwd)/app":/src $(IMAGE_NAME)

build-all: build
	sudo gem install sass	# install SASS

build:
	sudo docker build -t $(IMAGE_NAME) .

bash:
	sudo docker exec -it $(CONTAINER_NAME) bash

watch:
	sass --watch app/stylesheets:app/static/css

local:
	# If running in a non-Dockerized container
	python app/app.py

clean:
	(sudo docker stop $(CONTAINER_NAME) || true) && \
	    (sudo docker rm $(CONTAINER_NAME) || true)

