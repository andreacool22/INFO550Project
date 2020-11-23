FROM rocker/tidyverse

# install R packages
RUN Rscript -e "install.packages('dplyr', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('tidyverse', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('lubridate', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('table1', repos='http://cran.us.r-project.org')"

# make a project directory in the container
# we will mount our local project directory to this directory
RUN mkdir /project
RUN mkdir /project/output

# copy contents of local folder to project folder in container
COPY ./ /project/

# make R scripts executable
RUN chmod +x /project/*.R


# make container entry point bash
CMD make -C project report
