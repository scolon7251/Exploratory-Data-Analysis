##ggplot2 Lectures      
library(ggplot2)
str(mpg)
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))

#make histogram
qplot(hwy, data = mpg, fill = drv)

##Facets
qplot(displ, hwy, data = mpg, facets = .~drv)
qplot(hwy, data = mpg, facets = drv ~., binwidth = 2)

##AXIS LIMITS   
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] <- 100 ##Outlier!
plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()

g + geom_line() + coord_cartesian(ylim = c (-3, 3))
