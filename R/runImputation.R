#' Run the imputation inside Docker
#'
#' @param data_dir Local folder with the input CSV, mounted as /data.
#' @param input_name Name of the input CSV inside data_dir.
#' @param output_name Name of the output CSV written to data_dir.
#' @param image Name of the Docker image.
#' @return Called for its side effect: runs the container.
#' @export
#' @examples
#' \dontrun{
#' runImputation("data", "matrix_missing.csv", "matrix_imputed.csv")
#' }
runImputation <- function(data_dir, input_name, output_name,
                          image = "matriximpute") {
  data_dir <- normalizePath(data_dir, winslash = "/")
  system2("docker", c("run", "--rm",
                      "-v", shQuote(paste0(data_dir, ":/data"), type = "cmd"),
                      image, input_name, output_name))
}