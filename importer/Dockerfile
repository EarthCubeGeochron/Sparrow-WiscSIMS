FROM r-base
LABEL version="1.1"

RUN R -e "install.packages(c('readxl', 'plyr'), dependencies=TRUE, repos='http://cran.rstudio.com')"
RUN R -e "install.packages(c('jsonlite'), dependencies=TRUE, repos='http://cran.rstudio.com')"
RUN R -e "install.packages(c('tidyr'), dependencies=TRUE, repos='http://cran.rstudio.com')"
RUN R -e "install.packages(c('purr'), dependencies=TRUE, repos='http://cran.rstudio.com')"

RUN apt-get update && apt-get install libssl-dev libcurl4-openssl-dev -y

RUN apt-get update && apt-get install -y libxml2-dev


RUN R -e "install.packages('httr')"
RUN R -e "install.packages(c('rlist','xml2'))"
RUN R -e "install.packages('stringr')"
RUN R -e "install.packages('dplyr')"

COPY *.R /code/
COPY **/*.R /code/

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

# CMD R -e "Rserve(args="--no-save")"

CMD echo "This is empty right now!"
