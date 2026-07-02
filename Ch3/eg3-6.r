# Example 3.6
library(StatMethRank)
t = 9
u = t(generate.perms(t))
# Tables under randomness hypothesis for A(u, v) = c - d(u, v)
tables = colSums((u[, 1] - u)^2) / 2
tables = t * (t^2 - 1) / 12  - tables
# Complete data
data(Scores)
attach(Scores)
independence.test(Arith, Lang, method = "spearman") # As = 41 
# P{As >= 41} naive test 
sum(tables >= 41) / length(tables) # 0.252

# Incomplete data
Arith[c(8, 9)] = NA
Lang[c(4, 6, 9)] = NA
independence.test(Arith, Lang, method = "spearman") # As = 33.9286
# Reduced sample
t = 5
u = t(generate.perms(t))
# Reduced data
ind = (is.na(Arith) + is.na(Lang) == 0)
Arith_reduced = Arith[ind]
Lang_reduced = Lang[ind]
independence.test(Arith_reduced, Lang_reduced, method = "spearman") # As = 9
# Tables under randomness hypothesis for A(u, v) = c - d(u, v)
tables = colSums((u[, 1] - u)^2) / 2
tables = t * (t^2 - 1) / 12  - tables
# P{As >= 9}  naive test 
sum(tables >= 9) / length(tables)