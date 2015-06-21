#' output indices containing the ouput chunk
#' @param lines file lines
#' @return beginning and end index for output
#' @export
output_indices <- function(lines) {
   yaml_indices <- c(1:length(lines))[stringr::str_detect(lines, "---")][1:2]
   yaml_lines <- lines[yaml_indices[1]:yaml_indices[2]]

   output_start <- stringr::str_detect(yaml_lines, "output")
   if(!any(output_start)) {
     # no output defined so return line number for end of yaml block
     return(yaml_indices[2])
   }

   output_start_index <- c(1:length(yaml_lines))[output_start]

   for (i in (output_start_index+1):length(yaml_lines)) {
     # if leading whitespace then still in output block
     if(stringr::str_detect(yaml_lines[i], "^\\s")) {
       next
     }
     return(c(output_start_index, i-1))
   }
}

#' injects output yaml
#' @param rmd rmarkdown document to change yaml
#' @param write logical whether to overwrite the existing rmd file or just return lines
#' @return TRUE if writing or vector of output lines of write=F
#' @export
inject_yaml_md_output <- function(rmd, write=TRUE, ...) {
  # TODO: change to try catch
  injection_lines <- c("output:",
                       "  md_document:",
                       "    variant: markdown_github")
  rmdlines <- readLines(rmd)
  out_indices <- output_indices(rmdlines)
  if(length(out_indices) > 1) {
    before_output <- rmdlines[1:(out_indices[1]-1)]
    after_output <- rmdlines[(out_indices[2]+1):length(rmdlines)]
  } else {
    # no output declared so inject at end of yaml
    before_output <- rmdlines[1:(out_indices[1]-1)]
    after_output <- rmdlines[out_indices[1]:length(rmdlines)]
  }
  output <- c(before_output, injection_lines, after_output)
  if(write) {
    writeLines(output, rmd)
    return(TRUE)
  } else {
    return(output)
  }

}
