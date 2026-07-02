# Example 3.4
library(StatMethRank)
t = 3
k = 2
u = t(generate.perms(t))
v = incomplete.rankings(t, k)
# Generate Compatibility Matrix
C = apply(v, 2, is.compatible, complete_ranking = u)
C[C == TRUE] = 1
# Average pairwise Spearman distances for incomplete rankings
n = factorial(t)
a = n / factorial(k)
Ds = matrix(rep(0, n^2), ncol = n)
for (i in seq(n))
{
	Ds[i, ] = colSums((u[, i] - u)^2) / 2
}
t(C) %*% Ds %*% C / a^2