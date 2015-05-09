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
prefix_feature <- function(data, num = c(3,4,5)){
  data <- check_feature(data)
  # if(label)  label_data <- data[, ncol(data)]
  out <- sapply(num, function(ii){
    substring(data[,1], 1, ii)
  })


    out <- cbind(data, out)

 out
}