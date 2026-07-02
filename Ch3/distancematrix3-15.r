# Using expression(3.15) to calculate the distance matrix
# Compare the results with Example 3.1
library(StatMethRank)
t = 3
J = rep(1, factorial(t)) %*% t(rep(1, factorial(t)))
Cs = t * (t^2 - 1) / 12
Ck = t * (t - 1) / 2

u = t(generate.perms(t))
# Spearman
Ts = u - (t + 1) / 2
# Kendall
Tkj = matrix(rep(c(u), rep(0:(t-1), 6)), nrow = 3)
Tki = matrix(rep(c(u), rep((t-1):0, 6)), nrow = 3)
Tk = sign(Tkj - Tki)

Ds = Cs * J - t(Ts) %*% Ts
Dk = Ck * J - t(Tk) %*% Tk