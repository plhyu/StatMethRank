# 10.1.6 Simulation Study
require(StatMethRank)
require(mvtnorm)

n = 2000
k = 6
p = 1
Sigma_true = matrix(rep(0.5, (k-1)^2), ncol = k - 1)
diag(Sigma_true) = 1
Sigma_true = diag(sqrt(1:(k-1))) %*% Sigma_true %*% diag(sqrt(1:(k-1)))
V_true = sigma2v(Sigma_true)

beta_true = rep(-2, p)
y = matrix(rep(0, n * k), ncol = k)

# Construct Z
Z = array(runif(n = n * k * p, min = -1, max = 1), dim = c(n, k, p))
for(i in 1:n)
{
    eps  = rmvnorm(n = 1, mean = rep(0, k), sigma = V_true)
    y[i, ] = t(as.matrix(Z[i, , ]) %*% as.matrix(beta_true)) + eps
}
y = t(apply(y, 1, rank))
# end of data simulation

# Prior distribution parameters
beta0 = rep(0, p)
alpha = k + 1 
A0 = diag(100, ncol = p, nrow = p)
P = diag((k + 1), ncol = k - 1, nrow = k - 1)
# Total iterates of Gibbs sampling
MAX_ITERATIONS = 10000
# Number of iterates to be reduced(burnt in)
BURN_IN_ITERATIONS = 1000

output_list = mvnos.model(y, p, Z, beta0, A0, alpha, P, 
    MAX_ITERATIONS = MAX_ITERATIONS, BURN_IN_ITERATIONS = BURN_IN_ITERATIONS)

