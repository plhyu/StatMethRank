# Example 3.3
library(StatMethRank)
t = 3
u = t(generate.perms(t))
# Spearman
Ts = u - (t + 1) / 2
# Kendall
Tk = matrix(rep(0, t * (t - 1) / 2 * factorial(t)), ncol = factorial(t))
for (i in 1:(t-1))
{
	for (j in (i+1):t)
	{
		s = (i - 1) * (t - i / 2) + (j - i)
		Tk[s, ] = sign(u[j, ] - u[i, ])
	}
}
# A faster way:
Tkj = matrix(rep(c(u), rep(0:(t-1), 6)), nrow = 3)
Tki = matrix(rep(c(u), rep((t-1):0, 6)), nrow = 3)
Tk = sign(Tkj - Tki)