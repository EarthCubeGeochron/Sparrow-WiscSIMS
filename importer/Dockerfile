FROM r-base
LABEL version="1.1"

RUN R -e "install.packages(c('readxl', 'plyr'), dependencies=TRUE, repos='http://cran.rstudio.com')"
RUN R -e "install.packages(c('jsonlite'), dependencies=TRUE, repos='http://cran.rstudio.com')"
RUN R -e "install.packages(c('httr'), dependencies=TRUE, repos='http://cran.rstudio.com')"

COPY *.R /code/

WORKDIR /code/


# # Install general and build dependencies
#
# COPY ./requirements.txt /install/requirements.txt
# RUN pip install --no-cache -r /install/requirements.txt
#
# COPY ./docker.cfg /config/docker.cfg
# # These values should not change between installations
# ENV SPARROW_BACKEND_CONFIG=/config/docker.cfg
#
# # Make sure we don't litter our mounted code directories
# # with useless bytecode
# ENV PYTHONDONTWRITEBYTECODE=1
#
# COPY ./docker-scripts/* /bin/
# RUN mkdir /app
# WORKDIR /app
#
# ## Copy app code
# COPY ./setup.py /app
# COPY ./sparrow /app/sparrow
# COPY ./core_plugins /app/core_plugins
#
# RUN pip install -e .
#
# CMD ["/bin/run"]
