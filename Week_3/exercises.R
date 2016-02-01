##Exercises for Week 3

##HIERARCHICAL CLUSTERING

set.seed(1234)
par(mar = c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))


##calculating distance
dataFrame <- data.frame(x = x, y = y)
dist(dataFrame)

##making dendrogram
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)

##heatmap

dataFrame <- data.frame(x = x, y = y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame) [sample (1:12),]
heatmap(dataMatrix)

##K-means Clustering
set.seed(1234)
par(mar = c(0,0,0,0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

##using kmeans function
dataFrame <- data.frame(x, y)
kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)
kmeansObj$cluster

##plot kmeans()
par(mar = rep(0.2, 4))
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)

##visualizing kmeans function with heatmaps
set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
kmeansObj2 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1,2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")

##DIMENSION REDUCTION VIDEOS

##Matrix Data
set.seed(12345)
par(mar = rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

##Cluster the data
par(mar = rep(0.2, 4))
heatmap(dataMatrix)

##Add a pattern to the data
set.seed(678910)
for (i in 1:40) {
        ##flip a coin
        coinFlip <- rbinom(1, size = 1, prob = 0.5)
        ##if coin is heads add a common pattern to that row
        if (coinFlip) {
                dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0,3), each = 5)
        }      
}

##plot data
par(mar = rep(0,2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])


##add dendrograms
par(mar = rep(0.2, 4))
heatmap(dataMatrix)

##Plot row and column means
hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order,]
par(mfrow = c(1,3))
par(mar = c(4,4,4,2))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered), 40:1, ,xlab = "Row Mean", ylab = "Row", pch = 19)
plot(colMeans(dataMatrixOrdered), xlab = "Column", ylab = "Column mean", pch = 19)

##MISSING VALUES        
dataMatrix2 <- dataMatrixOrdered
##Randomly insert some missing data
dataMatrix2[sample(1:100, size = 40, replace = FALSE)] <-NA
svd1 <- svd(scale(dataMatrix2)) ## Doesn't work

##Use impute package
library(impute)
dataMatrix2 <- dataMatrixOrdered
dataMatrix2[sample(1:100, size = 40, replace = FALSE)] <- NA
dataMatrix2 <- impute.knn(dataMatrix2)$data
svd1 <- svd(scale(dataMatrixOrdered)); svd2 <- svd(scale(dataMatrix2))
par(mfrow = c(1,2)); plot(svd1$v[,1], pch = 19); plot(svd2$v[,1], pch = 19)

##FACE EXAMPLE  
load("data/face.rda")
image(t(faceData)[, nrow(faceData):1])




