args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 3) stop("Usage: Rscript runImputation_cli.R <data_dir> <input> <output>")
source("R/runImputation.R")
runImputation(args[1], args[2], args[3])