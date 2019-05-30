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
