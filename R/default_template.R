default_template <- function(file, feature_num){
  Utxt <- sapply(1:feature_num, function(ii){
    paste(c('U', ii, ':%x[0,', ii-1, ']\n'), collapse = '')
  })
  
  Btxt <- c('B\n')
  cat(c('# Unigram\n', Utxt,'\n# Bigram\n', Btxt), file = file )
}
