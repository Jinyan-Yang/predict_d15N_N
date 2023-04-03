rf.kfolde.n15 <- readRDS('cache/rf.kFold.n15.rds')

select.index <- rf.kfolde.n15$control$index$Fold02
train.cv.df <- rf.kfolde.n15$trainingData[select.index,]
test.cv.df <- rf.kfolde.n15$trainingData[-select.index,]

write.csv(train.cv.df,'cache/train_CV.csv',row.names = F)
write.csv(test.cv.df,'cache/test_CV.csv',row.names = F)
