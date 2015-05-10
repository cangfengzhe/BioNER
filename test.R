library(BioTmR)
data <- read.delim('~/Desktop/train_data.txt', header = F, blank.lines.skip = F)


data <- orth_feature(data)%>% 
  wshape_feature()%>% 
  ch_label(2)
data1 <- data[1:100,c(1:7,17)]
data2 <- data[1:"50000",]
model <- crf_train(data1)
test_data <- crf_test(data2)

write.table(result, '/Users/lipidong/Desktop/result.txt', quote = T, row.names = F)

out <- conlleval(test_data)
View(out)
out1 <- out

system('ls')


