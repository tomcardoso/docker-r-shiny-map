# default build target
all::

all:: build
.PHONY: all build run

build:

	docker build \
			--tag docker-r-shiny-map \
			.

run:

	docker run -it --rm docker-r-shiny-map

publish:

	docker push ghcr.io/tomcardoso/docker-r-shiny-map:latest
