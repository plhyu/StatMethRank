# example 2.6
library(smacof)
library(StatMethRank)
data(big4year)
res.rect = smacofRect(big4year, itmax=1000) 
plot(res.rect, joint=TRUE, xlim=c(-3,3), asp=1, cex.main=1.5, cex.lab=1.2, cex.axis=1) 
plot(res.rect, plot.type = "Shepard", asp=1, cex.main=1.5, cex.lab=1.2, cex.axis=1)	
