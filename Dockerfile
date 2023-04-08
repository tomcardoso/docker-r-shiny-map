ARG RENV_PATHS_ROOT

FROM ghcr.io/virtualstaticvoid/heroku-docker-r:4.2.2

RUN apt-get update -q \
 && apt-get install -qy --no-install-recommends \
      libgdal-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Set up renv files
RUN mkdir -p renv
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.dcf renv/settings.dcf

# Install renv
RUN /usr/bin/R --no-save --quiet --no-echo -e "install.packages('renv', quiet = TRUE)"

# Initialize renv while still empty
RUN /usr/bin/R --no-save --quiet --no-echo -e "renv::init()"

RUN /usr/bin/R --no-save --quiet --no-echo -e "renv:::renv_paths_cache()"
RUN /usr/bin/R --no-save --quiet --no-echo -e "renv:::renv_paths_library()"

# RUN /usr/bin/R --no-save -e "p <- renv::paths; print(p$library())"

# Now copy over lockfile
COPY renv.lock renv.lock

# Expect to see an renv subfolder
# RUN echo $(ls -R /)
# RUN echo $(ls -R /app)

# Move previously-installed renv files from $RENV_PATHS_ROOT to image
# COPY ${RENV_PATHS_ROOT} /.cache/R/renv

# Run a restore
# RUN /usr/bin/R --no-save -e "renv::restore()"

# Need to make sure Rscript can run
# Then make sure renv is installed
# Then copy from $RENV_PATHS_ROOT to the output of renv::paths$root()

CMD ["/usr/bin/R", "--no-save"]