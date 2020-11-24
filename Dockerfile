FROM rocker/tidyverse

# install R packages
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('tidyverse')"
RUN Rscript -e "install.packages('lubridate')"
RUN Rscript -e "install.packages('table1')"

# make a project directory in the container
# we will mount our local project directory to this directory
RUN mkdir /project

# copy contents of local folder to project folder in container
COPY ./ /project/

# set working directory
WORKDIR /project

# make R scripts executable
RUN chmod +x /project/*.R


# make container entry point bash
CMD make -C project report
