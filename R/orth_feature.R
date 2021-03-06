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
orth_feature <- function(data, features = c('all_caps', 'init_caps', 'cap_mix', 'single_char', 'has_digit', 'single_digit', 'double_digit', 'natural_number', 'real_number', 'has_dash', 'init_dash', 'end_dash', 'alpha_num', 'roman')){
 # orthographical features
  data <- check_feature(data)
  #if(label)  label_data <- data[, ncol(data)]

  features <- match.arg(features, several.ok = TRUE)
  out <- sapply(features, function(x){
    get(x)(data)
  })

    out <- cbind(data, out)

  #if(label)   out$label <- label_data


  out
}



all_caps <- function(df) as.integer(grepl('^[A-Z]+$', df[,1], perl = T))
init_caps <- function(df) as.integer(grepl('^[A-Z].+', df[,1], perl = T))

# CAPSMIX .*[A-Z][a-z].*|.*[a-z][A-Z].*
cap_mix <- function(df) as.integer(grepl('([A-Z].*[a-z])|([a-z].*[A-Z])',df[,1], perl = T))
#SINGLECHAR [A-Za-z]
single_char <- function(df) as.integer(grepl('[A-Z].*[a-z]', df[,1], perl = T))
#HASDIGIT .*[0-9].*
has_digit <- function(df) as.integer(grepl('[0-9]', df[,1], perl = T))
#SINGLEDIGIT [0-9]
single_digit <- function(df) as.integer(grepl('^[0-9]$', df[,1], perl = T))
#DOUBLEDIGIT [0-9][0-9]
double_digit <- function(df) as.integer(grepl('^[0-9]{2}$', df[,1], perl = T))
#NATURALNUMBER
natural_number <- function(df) as.integer(grepl('^[0-9]+$', df[,1], perl = T))
#REALNUMBER [-0-9]+[.,]+[0-9.,]+
real_number <- function(df) as.integer(grepl('^[-0-9]+[.,]?[0-9.,]+$', df[,1], perl = T))
#HASDASH .*-.*
has_dash <- function(df) as.integer(grepl('.*-.*', df[,1], perl = T))
# INITDASH -.*
init_dash <- function(df) as.integer(grepl('^-', df[,1], perl = T))
# ENDDASH .*-
end_dash <- function(df) as.integer(grepl('-$',df[,1], perl = T))
# ALPHANUMERIC (.*[A-Za-z].*[0-9].*)|(.*[0-9].*[A-Za-z].*)'
alpha_num <- function(df) as.integer(grepl('([A-Za-z].*[0-9])|([0-9].*[A-Za-z])', df[,1], perl = T))

roman <- function(df) as.integer(grepl('[IVXDLCM]+', df[,1], perl = T))




