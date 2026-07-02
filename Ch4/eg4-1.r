# Example 4.1
library(StatMethRank)
data(Sutton)
agreement.test(Sutton, method = "spearman")
agreement.test(Sutton, method = "kendall")