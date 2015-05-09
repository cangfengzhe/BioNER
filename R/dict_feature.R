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

dict_feature <- function(data, dictionary){
  data <- check_feature(data)
  if(!is.character(dictionary)) stop('input dictionary data must be  charactor vector')

   dictionary <- unique(dictionary)
   #(label) label_data <- data[, ncol(data)]
  out <- plyr::ldply(1:length(data[, 1]), .progress = 'text', function(ii){
    d1 = length(grep(paste(c('\\b',data[ii, 1],'\\b'), collapse = ''), dictionary, ignore.case = T) )
    d2 = length(grep(paste(c('^', data[ii, 1], '$'), collapse = ''), dictionary, ignore.case = T))

    c(d1,d2)
  })

  colnames(out) <- c('dictionary_part', 'dictionary_exact')


  out <- cbind(data, out)
  #if(lable) out$label <- label_data;


}