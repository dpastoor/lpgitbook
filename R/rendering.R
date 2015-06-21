#' render all rmds
#' @param dir
#' @param ignore
#' @export
render_rmds_to_md <- function(dir, ignore = NULL) {
  if(!is.null(ignore)) {
    # TODO: handle ignore files
  }
  rmds <- get_rmds(dir)
  vapply(rmds, inject_yaml_md_output, logical(1))

  vapply(rmds, rmarkdown::render, character(1))

}

#' copy all files to temp dir to prepare to render
#' @param dir
#' @export
#' @return path of book directory for rendering
prepare_book_dir <- function(dir) {
  path <- normalizePath(dir)
  folder <- basename(path)
  new_folder <- paste0("_temp_", folder)
  new_path <- gsub(folder, new_folder, path, fixed=T)
  if (!dir.exists(new_path)) {
    message("creating temp directory")
    dir.create(new_path)
  }
  message("copying all files to temp dir")
  file.copy(paste0(path, "."), new_path, overwrite=TRUE, recursive = TRUE)
  return(new_path)
}

