# An R Docker image for running Shiny maps

This Docker image will pre-build the packages necessary for running an R Shiny map in Heroku, since compiling R and all the required packages can easily take an hour.

The final, generated image includes the following packages:
```
desc
upstartr
tidyr
readr
dplyr
stringr
tibble
feather
jsonlite
glue
shiny
bslib
leaflet
```

### Usage

To use this image, just reference in your Dockerfile like so:

```Dockerfile
FROM ghcr.io/tomcardoso/docker-r-shiny-map

COPY . /app

# Other stuff goes here…
```