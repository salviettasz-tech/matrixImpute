# matrixImpute

Imputes missing values in a numeric matrix with column medians, locally or inside Docker.

## Installation

```r
remotes::install_github("salviettasz-tech/matrixImpute")
```

## Build the Docker image

From the repository folder:

```
docker build -t matriximpute .
```

## Example command-line run

Put the input CSV in a folder (e.g. `data/`), then:

```
Rscript docker/runImputation_cli.R data matrix_missing.csv matrix_imputed.csv
```

The completed CSV is written to `data/` and the original missing percentage is printed to the terminal.