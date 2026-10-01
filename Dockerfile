FROM rocker/r-ver:4.4.1
RUN R -e "install.packages('ggplot2', repos='https://cloud.r-project.org')"
WORKDIR /app
COPY R/imputeColumns.R /app/imputeColumns.R
COPY docker/run_impute.R /app/run_impute.R
ENTRYPOINT ["Rscript", "/app/run_impute.R"]