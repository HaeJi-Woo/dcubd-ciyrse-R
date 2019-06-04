install.packages("party")
library(party)
str(iris)
iris

ind <- sample(2, nrow(iris), replace=TRUE, prob = c(0.7, 0.3))
trainData <- iris[ind == 1,]
testData <- iris[ind == 2,]

iris_ctree <- ctree(Species ~ Sepal.Length + Sepal.Width + 
                      Petal.Length + Petal.Width, data = trainData)
print(iris_ctree)

plot(iris_ctree)
plot(iris_ctree, type = "simple")
testPred <- predict (iris_ctree, newdata = testData)
testPred

sum(testPred==testData$Species)/length(testPred)*100

df<-read.csv('http://www-bcf.usc.edu/~gareth/ISL/Heart.csv') 
str(df) 
head(df) 
install.packages("rpart")
install.packages("caret")
library(rpart)
library(caret) 
set.seed(1000)
intrain<-createDataPartition(y=df$AHD, p=0.7, list=FALSE) 
train<-df[intrain, ]
test<-df[-intrain, ] 
install.packages("tree")
library(tree) 
treemod<-tree(AHD~. , data=train) 
plot(treemod) 
text(treemod) 
cv.trees<-cv.tree(treemod, FUN=prune.misclass ) 
plot(cv.trees) 
prune.trees <- prune.misclass(treemod, best=6) 
plot(prune.trees) 
text(prune.trees, pretty=0) 
install.packages("e1071") 
library(e1071) 
treepred <- predict(prune.trees, test, type='class') 
confusionMatrix(treepred, test$AHD) 
rpartmod<-rpart(AHD~. , data=train, method="class") 
plot(rpartmod) 
text(rpartmod) 
printcp(rpartmod)
plotcp(rpartmod)
ptree<-prune(rpartmod, cp= rpartmod$cptable[which.min(rpartmod$cptable[,"xerror"]),"CP"]) 
plot(ptree) 
text(ptree) 
rpartpred<-predict(ptree, test, type='class') 
confusionMatrix(rpartpred, test$AHD) 
library(party) 
partymod<-ctree(AHD~., data=train) 
plot(partymod) 
library(party) 
partypred<-predict(partymod, test) 
confusionMatrix(partypred, test$AHD)  
