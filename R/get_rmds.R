#' gets all rmd files in a directory to render
#' @param dir directory to search
#' @param exclude vector of rmarkdown doc names to exclude
#' @param recursive whether to search recursively default to TRUE
#' @return vector of Rmd files with full normalized paths
get_rmds <- function(
  dir,
  exclude = NULL,
  recursive = TRUE
) {
  files <- list.files(dir, pattern = "*.Rmd", recursive = recursive, full.names=T)
  return(normalizePath(files))
}


