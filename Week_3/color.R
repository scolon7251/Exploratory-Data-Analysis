##Plotting and Color
pal <- colorRamp(c("red", "blue"))

##all red
pal(0)

##all blue
pal(1)

#blend
pal(0.5)

#sequence of colors from red to blue
pal(seq(0,1, len = 10))

##colorRampPalette
pal <- colorRampPalette(c("red", "yellow"))
pal(2)

#interpolate from red to yellow
pal(10)

##RColorBrewer!!
library(RColorBrewer)
cols <- brewer.pal(3, "BuGn")
cols
pal <- colorRampPalette(cols)
image(volcano, col = pal(20))

##smoothScatter
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x, y)



