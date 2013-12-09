load("./data/samsungData.rda")
#====exploring data====
n <- ncol(samsungData)
head(samsungData[,c(n-1,n)])
str(samsungData$activity)
table(samsungData$activity)#6 activity categories
any(is.na(samsungData))#no missing values
barplot(table(samsungData$activity),col="blue")#uniform distribution
#====transforming data====
samsungData$activity <- as.factor(samsungData$activity)

#====train and test sets====
trainSet <-data.frame(samsungData[samsungData$subject==c(1,3,5,6),-(n-1)])#not enough data, take more subject
testSet <- data.frame(samsungData[samsungData$subject==c(27,28,29,30),-(n-1)])#not enough data, take more subject
#====fitting a tree model====
library(tree)
tree1 <- tree(activity ~., data=trainSet)
summary(tree1)
predTrain <- predict(tree1, type="class")
predTest <- predict(tree1,newdata=testSet,type="class")
#error rates
print.table(table(testSet$activity,predTest))
missClass = function(values,prediction){sum(prediction!= values)/length(values)}
errorTrain <- missClass(values=trainSet$activity,prediction=predTrain)
errorTest <- missClass(values=testSet$activity,prediction=predTest)

#PLot errors
par(mfrow=c(1,2))
plot(cv.tree(tree1,FUN=prune.tree,method="misclass"),cex.axis=0.8)
plot(cv.tree(tree1), cex.axis=0.8)

#Prune the tree
pruneTree <- prune.tree(tree1,best=8)
predPrune <- predict(pruneTree,newdata=testSet,type="class")
errorPruned <-missClass(values=testSet$activity, prediction=predPrune)

#Plot the final tree
plot(pruneTree)
text(pruneTree)











