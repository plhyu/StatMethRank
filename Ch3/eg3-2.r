# Example 3.2
library(StatMethRank)
data(Scores)
attach(Scores)
independence.test(Arith, Lang, method = "spearman")
independence.test(Arith, Lang, method = "kendall")

t = 9
Cs = t * (t^2 - 1) / 12
Ck = t * (t - 1) / 2
# The spearman correlation, As = 41
41 / Cs
# The kendall correlation, Ak = 18
18 / Ck
# You can also try the cor function in stats package
cor(Lang, Arith, method = "spearman")
cor(Lang, Arith, method = "kendall")
