##Exercises in Week 2 of Exploratory Data Analysis

library(lattice)
library(datasets)
##Simple scatterplot

xyplot(Ozone ~ Wind, data = airquality)

##Convert 'Month' to a factor variable
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

##Lattice Behavior
p <- xyplot(Ozone ~ Wind, data = airquality)  ##Nothing Happens!
print(p) ## Plot appears
xyplot(Ozone ~ Wind, data = airquality) ##Auto-printing
 
##PART TWO
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1))  ##Plot with 2 panels

##Custom panel function
xyplot(y ~ x | f, panel = function (x, y, ...){
        panel.xyplot(x, y, ...) ##First call the defaul panel function for 'xyplot'
        panel.abline(h = median(y), lty = 2) ## Add a horizontal line at the median
        panel.lmline(x, y, col = 2) ##Overlay a simple linear regression line
})


