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

conlleval <- function(x, correct_col = ncol(x) - 1, test_col = ncol(x), tag = 'B'){

  data <- check_feature(x);
  raw_data <- data[,c(1, correct_col, test_col)];

  correct_out <- x_split(raw_data[, 2]) %>%
    filter(grepl(tag, V1)) %>%
    group_by(V2) %>%
    summarise(correct_number = sum(V1)) %>%
    rename(type = V2)

  test_out <- x_split(raw_data[, 3]) %>%
    filter(grepl(tag, V1)) %>%
    group_by(V2) %>%
    summarise(test_number = sum(V1)) %>%
    rename(type = V2)

  both_data <- raw_data[which(raw_data[, 2] == raw_data[, 3]),]

  both_data <- filter(raw_data, raw_data[,2] != 'O')
  b_index_corr <- which(grepl('^B', both_data[, 2]))

  common_map <- sapply(1:length(b_index_corr), function(ii){

    if(ii != length(b_index_corr)) bin <- b_index_corr[ii]: (b_index_corr[ii+1] - 1) else bin = b_index_corr[ii]

    if(all(both_data[bin, 2] == both_data[bin, 3])) both_data[b_index_corr[ii],2] else NA
  })

  common_out <- common_map  %>%
    na.omit() %>%
    x_split() %>%
    group_by(V2) %>%
    summarise(common_number = sum(V1)) %>%
    rename(type = V2)

  out <- correct_out %>%
    left_join(test_out, by = 'type') %>%
    left_join(common_out, by = 'type') %>%
    mutate(recall = common_number/correct_number,
      precise = common_number/test_number,
      F_value = 2 * recall * precise/(recall + precise))


}



x_split <- function(x, split = '-', ...){
  if(!is.character(x)) stop('input x must be charactor vector.')
 split_data <- strsplit(x, split = split,...) %>%
   do.call('rbind', .) %>%
   as.data.frame()

}


