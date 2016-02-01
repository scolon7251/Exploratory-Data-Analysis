##Base Demo
x <- rnorm(100)
hist(x)
y <- rnorm(100)
plot(x, y)
#adjusting margins
par(mar = c(2,2,2,2))
##not enough room for label, try again
par(mar = c(4,4,2,2))

##plotting symbol
plot(x, y, pch = 25)

#scatterplot with text
y <-rnorm(100)
plot(x,y, pch = 20)
title("Scatterplot")
text(-2, -2, "Label")
legend("topleft", legend = "Data", pch = 20)
##fit linear model
fit <- lm(y ~ x)
abline(fit)
#change line thickness
abline(fit, lwd=3)
#change line thickness and color
abline(fit, lwd = 3, col = "blue")
plot(x, y, xlab = "Weight", ylab = "Height", main = "Scatterplot", pch = 20)
legend("topright", legend = "Data", pch = 20)
fit <- lm(y ~ x)
abline(fit, lwd=3, col = "red")

##put >1 plot on page
z<-rpois(100,2)
par(mfrow = c(2, 1))
plot(x, y, pch = 20)
plot(x, z, pch = 19)
#adjust margin
par(mar = c(2, 2, 1, 1))
plot(x, y, pch = 20)
plot(x, z, pch = 20)
par(mar = c(4,4,2,2))
##add rows
par(mfrow = c(2,2))
plot(x,y)
plot(x,z)
plot(z, x)
plot(y, x)

par(mfrow = c(1,1))
x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2,50)
g <- gl(2,50, labels = c("Male", "Female"))
str(g)

plot(x, y, type = "n")
points(x[g == "Male"], y[g == "Male"], col = "green")
points(x[g == "Female"], y[g == "Female"], col = "red")

##creating a plot for file device
pdf(file = "myplot.pdf")
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.off()

with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.copy(png, file = "geyserplot.png")
dev.off()




