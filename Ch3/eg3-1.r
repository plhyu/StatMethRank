# Excample 3.1
library(StatMethRank)
t = 3
u = t(generate.perms(t))
n = factorial(t)
# Spearman Distance
Ds = matrix(rep(0, n^2), ncol = n)
for (i in seq(n))
{
	Ds[i, ] = colSums((u[, i] - u)^2) / 2
}

# Kendall Distance
Dk = matrix(rep(0, n^2), ncol = n)
for (i1 in seq(n))
{
	for (j1 in seq(n))
	{
		v1 = u[, i1]
		v2 = u[, j1]
		for (i2 in seq(t-1))
		{
			for (j2 in seq(from = i2+1,to = t))
			{
				Dk[i1, j1] = Dk[i1, j1] + 1 - 
					sign(v1[j2] - v1[i2]) * sign(v2[j2] - v2[i2])
			}
		}
		
	}
}

# Hamming Distance
Dh = matrix(rep(0, n^2), ncol = n)
for (i in seq(n))
{
		Dh[i, ] = t - colSums(u[, i] == u)
}

# Spearman foot-rule Distance
Df = matrix(rep(0, n^2), ncol = n)
for (i in seq(n))
{
	Df[i, ] = colSums(abs(u[, i] - u))
}