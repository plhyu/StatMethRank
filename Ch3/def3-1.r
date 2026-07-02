# Definition 3.1
library(StatMethRank)
u_star = c(2, NA, 3, 4, 1)
C_set = compatible.rankings(u_star)
is.compatible(C_set, u_star)
