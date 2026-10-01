#' Impute missing values with column medians
#'
#' @param input_file Path to a CSV with a numeric matrix.
#' @param output_file Path where the completed CSV is written.
#' @return A named list with \code{n_missing} and \code{missing_percentage}.
#' @importFrom stats median
#' @importFrom utils read.csv write.csv
#' @export
#' @examples
#' tmp_in <- tempfile(fileext = ".csv")
#' write.csv(data.frame(a = c(1, NA, 3), b = c(4, 5, NA)), tmp_in, row.names = FALSE)
#' imputeColumns(tmp_in, tempfile(fileext = ".csv"))
imputeColumns <- function(input_file, output_file) {
  mat <- as.matrix(read.csv(input_file, header = TRUE, check.names = FALSE))
  n_missing <- sum(is.na(mat))
  missing_percentage <- n_missing / length(mat) * 100
  for (j in seq_len(ncol(mat))) {
    miss <- is.na(mat[, j])
    if (any(miss)) {
      mat[miss, j] <- median(mat[, j], na.rm = TRUE)
    }
  }
  write.csv(mat, output_file, row.names = FALSE)
  return(list(n_missing = n_missing,
              missing_percentage = missing_percentage))
}
