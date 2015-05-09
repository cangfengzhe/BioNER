library(BioTmR)
data <- read.delim('~/Desktop/train_data.txt', header = F, blank.lines.skip = F)


data <- orth_feature(data)%>% wshape_feature()%>% ch_label(2)
data1 <- data[1:10000,]
data2 <- data[12000:15000,]
model <- crf_train(data1)
test_data <- BioTmR::crf_test(data2)
result <- test_data[,c(1,17:18)]

write.table(result, '/Users/lipidong/Desktop/result.txt', quote = T, row.names = F)

conlleval(result)




