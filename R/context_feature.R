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
context_feature <- function(data,col, win, ...){
  data <- check_feature(data)
  data[,col] <- as.character(data[,col])
  #if(label) label_data <- data[, ncol(data)]
  win_min <- min(win)
  out <- llply(win,..., function(ii){
   print(paste('processing the  window',ii))
    out1 <- ldply(1:length(data[,1]), .progress = 'text', function(jj){

      if((jj+ii)>0) {
        data[jj+ii, col]
      }else{
          data[jj, col]
        }

    })

  })
  out <- do.call('cbind', out)

  out <- cbind(data, out)
  #if(lable) out$label <- label_data;

  out
}