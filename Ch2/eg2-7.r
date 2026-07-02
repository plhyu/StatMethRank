# example 2.7
library(StatMethRank)
data(big4year)
var.names = colnames(big4year) 
big4yr = data.frame(big4year, n = rep(1, dim(big4year)[1]))
result = mdpref(big4yr, rank.vector = TRUE)

plot(result$item[,1], result$item[,2], asp=1, type = "n",
	xlim=c(-1.6, 2.7), main="MDPREF", xlab = "Dimension 1",
	ylab = "Dimension 2", cex.main=1.5, cex.lab=1.2,
	cex.axis=1) 
text(result$item[,1], result$item[,2], labels = var.names, 
	cex = 0.9, col="blue") 
for (i in 1:nrow(big4yr))
{ 
	testx <- c(0,result$ranking[i,6]) 
	testy <- c(0,result$ranking[i,7]) 
	lines(testx, testy, col="red") 
} 
text(result$ranking[,6],result$ranking[,7], labels=row.names(big4yr), adj=0.5, cex=0.7)