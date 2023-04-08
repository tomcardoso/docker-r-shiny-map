# An R Docker image for running Shiny maps

This Docker image will pre-build the packages necessary for running an R Shiny map in Heroku, since compiling R and all the required packages can easily take an hour. To use this image, just reference in your Dockerfile like so:

```Dockerfile
FROM ghcr.io/tomcardoso/docker-r-shiny-map

COPY . /app

# Other stuff goes here…
```