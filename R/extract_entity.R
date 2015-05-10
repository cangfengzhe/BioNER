# extract_entity <- function(data, entity_colnum = ncol(data), B_tag = 'B', O_tag = 'O'){
#   
#   data <- check_feature(data);
#   data <- data[, c(1, entity_colnum)]
#   data <- na.omit(data)
#   O_tag <- paste(c('^', O_tag), collapse = '')
#   B_tag <- paste(c('^', B_tag), collapse = '')
#   noO_tag <- filter(data, grepl(O_tag, data[, 2]) == F)
#   B_tag <- which(grepl(B_tag, noO_tag[, 2]))
#   
#   sapply(1:(length(B_tag) - 1), function(ii){
#      bin <- c(data[B_tag[ii]:(B_tag[ii+1] - 1) else bin = length(B_tag)
#     paste(bin, 1]), collapse = ' ')
#   })
#   flag = T
#  which(grepl('^O', data[B_tag[length(B_tag)]: nrow(data),2])
#   
#   
#   
#   
# }
