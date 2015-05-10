## this shows you how to write roxygen comments

#' First line is title
#'
#' This is a brief description.
#'
#' Anything else after the description goes to the Details section.
#'
#' You can write several paragraphs.
#' @param x explanation of \code{x}
#' @param ... explanation of \code{...}
#' @return The value returned by this function.
#' @author Who are you?
#' @seealso \code{\link[tools]{file_ext}}, \code{\link[tools]{file_path_sans_ext}}
#' @references \url{https://github.com/yihui/rmini}
#' @importFrom tools file_ext file_path_sans_ext
#' @export
#' @examples split_filename('foo.bar')
#' @useDynLib BioTmR
genia_tagger <- function(file="/Users/lipidong/Desktop/genia.txt",named_entity = F){
  
  if(!file.exists(file)) stop('the file does not exist.')
  tag_path <- paste(c(tempdir(), 'tag_data_', rnorm(1)), collapse = '')
  txt <- readr::read_lines(file) 
  txt <- paste(txt, collapse = ' ') 
  txt <- gsub('(?<=[?!\\.])\\s+(?=[A-Z])', '\\\n', txt, perl = T)
  cat(txt, file = tag_path)
  
  
  tryCatch({
    path = getwd();
    raw_txt <- genia_(tag_path, path)
  }, error=function(e){
        stop('your data is invalid.')
  })

  out <- strsplit(raw_txt, '\\n') %>%
    unlist() %>%
    strsplit('\\t') %>%
    do.call('rbind', .) %>%
    as.data.frame(., stringsAsFactors = F)
  colnames(out) <- c('word', 'word_stem', 'part_of_speech', 'chunk_tags', 'named_entity')

  if(!named_entity) {
    out <- out[,-5]
  }
  out
}

