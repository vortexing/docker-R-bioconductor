# Docker inheritance
FROM bioconductor/bioconductor_docker:RELEASE_3_12
# Update apt-get
RUN apt-get update


# Install required packages
RUN R -e "install.packages('remotes',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidyverse',dependencies=TRUE, repos='http://cran.rstudio.com/')"


# Install from Bioconductor
RUN R -e "BiocManager::install('IRanges')"
RUN R -e "BiocManager::install('limma')"

# Install from github (remotes)
RUN R -e "library(remotes); remotes::install_github('genome/bmm', dependencies = TRUE)"
RUN R -e "library(remotes); remotes::install_github('genome/sciClone', dependencies = TRUE)"
