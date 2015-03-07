dir <- "sample_proj"

split_rmdbook <- function(x, rmdbook = "rmdbook") {
  split <- stringr::str_split(x, paste0(rmdbook, "/"))
  unlist(lapply(split, function(x) x[length(x)]))
}


ext_rmd_to_md <- function(x) {
  gsub("\\.Rmd", "\\.md", x)
}

strip_summary_files <- function(x) {
  strip <- unlist(lapply(x, function(x) stringr::str_extract(x, "\\(.*\\)")))
  strip <- ifelse(is.na(strip), NA, gsub("\\(|\\)", "", strip))
  strip[!is.na(strip)]
  }

check_toc <- function(dir) {
  # TODO: expand to handle other capitalization schemes
  rmds <- list.files(dir, pattern = "*.Rmd", recursive = T)
  if(!file.exists("SUMMARY.md")) {
    stop("no SUMMARY.md file detected from this directory")
  }
  summary_md <- readLines("sample_proj/SUMMARY.md")
  rmd_names <- split_rmdbook(rmds)
  md_names <- ext_rmd_to_md(rmd_names)
}

