# Example 3.5
library(StatMethRank)
data(Scores)
attach(Scores)
Arith[c(8, 9)] = NA
Lang[c(4, 6, 9)] = NA
independence.test(Arith, Lang, method = "spearman")
independence.test(Arith, Lang, method = "kendall")
