ARG RENV_PATHS_ROOT

FROM ubuntu:22.04

# Set default locale
ENV LANG C.UTF-8

# Set default timezone
ENV TZ UTC

RUN apt-get update -q \
 && apt-get install -qy --no-install-recommends \
      libgdal-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Set up renv files
COPY renv.lock renv.lock
RUN mkdir -p renv
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.dcf renv/settings.dcf

# Move previously-installed renv files from $RENV_PATHS_ROOT to image
# COPY $RENV_PATHS_ROOT

RUN R --no-save --no-echo -e "renv::paths$root()"
# RUN R --no-save --no-echo -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"

# RUN R --no-save --no-echo -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
# RUN R --no-save --no-echo -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
# RUN R --no-save --no-echo -e "renv::restore()"
# ARG LOCAL_RENV_PATHS_ROOT=

# Need to make sure Rscript can run
# Then make sure renv is installed
# Then copy from $RENV_PATHS_ROOT to the output of renv::paths$root()

CMD ["Rscript", "--no-save"]