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
pos_feature <- function(data, feature = c('word_stem', 'part_of_speech', 'chunk_tags')){
  data <- check_feature(data)
  tmp <- paste(data[,1], collapse = ' ')
  pos_path <- paste(c(tempdir(), 'postag_out_data_', rnorm(1)), collapse = '')
  cat(tmp, file = pos_path)
  tag <- genia_tagger(file = pos_path)
  feature <- c('word', feature)
  out <- tag[,feature]
  out
}
