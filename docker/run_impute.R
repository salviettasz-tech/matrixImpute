args <- commandArgs(trailingOnly = TRUE)
source("/app/imputeColumns.R")
res <- imputeColumns(file.path("/data", args[1]),
                     file.path("/data", args[2]))
cat("Original missing percentage:", res$missing_percentage, "%\n")