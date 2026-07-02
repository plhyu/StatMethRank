require(StatMethRank)
# APA data application
data(APA)
y = freq2case(APA, freq.col = 1)
y = 6 - y
# number of observed judges
n = dim(y)[1]
# number of items
k = dim(y)[2] 
# number of parameteros of beta
p = k 

beta0 = rep(0, p)
alpha = k + 1 
A0 = diag(100, ncol = p, nrow = p)
P = diag(k + 1, ncol = k - 1, nrow = k - 1)

# Construct Z
Z = array(0, dim = c(n, k, p))
for (j in 1:n)
{
    Z[j, , ] = diag(1, nrow= k, ncol = p)
}
# Total iterations of Gibbs sampling
MAX_ITERATIONS = 10000
# Number of iterations to be reduced(burnt in)
BURN_IN_ITERATIONS = 1000

output_list = mvnos.model(y, p, Z, beta0, A0, alpha, P, 
    MAX_ITERATIONS = MAX_ITERATIONS, BURN_IN_ITERATIONS = BURN_IN_ITERATIONS)


# Constrain muE to 0
mu_trace = output_list$beta_trace[, k] - output_list$beta_trace[, 1:(k-1)]
mu_msci = msci(mu_trace)

names(mu_trace) = c("muA", "muB", "muC", "muD")
names(mu_msci) = c("muA", "muB", "muC", "muD")

# Plot--------------------------------------------------------------
# boxplot
png(filename = "Figure 3 of APA election data.png", width = 1000, height = 1200)
par(mfrow = c(3, 1), cex = 2)
boxplot(mu_trace, outline = FALSE)
title(main = "(a)")
boxplot(output_list$V_trace[c("vAA", "vBB", "vCC", "vDD", "vEE")], outline = FALSE)
title(main = "(b)")
boxplot(output_list$rV_trace, outline = FALSE)
title(main = "(c)")
dev.off()

# ggplot styple
require(ggplot2)
require(reshape2)
require(grid)
png(filename = "Figure 3 of APA election data(ggplot2).png", width = 750, height = 1200)
grid.newpage()
pushViewport(viewport(layout = grid.layout(3, 1)))
vplayout <- function(x, y)
    viewport(layout.pos.row = x, layout.pos.col = y)

df = melt(mu_trace)
p_gplot = ggplot(data = df, aes(variable, value)) + 
    theme(title = element_text(size = 20), axis.text.x = element_text(size = 20), axis.text.y = element_text(size = 20)) + 
    geom_boxplot() + labs(x = "", y = "")

print(p_gplot + labs(title = "(a)"), vp = vplayout(1, 1))
print(p_gplot %+% melt(output_list$V_trace[c("vAA", "vBB", "vCC", "vDD", "vEE")]) + 
    labs(title = "(b)"), vp = vplayout(2, 1))
print(p_gplot %+% melt(output_list$rV_trace) + 
    labs(title = "(c)") , vp = vplayout(3, 1))
dev.off()

#############################################################################################
# Table 11.3
require(bayesm)
require(DARank)
# Observed proportions that a candidate is ranked as first 
colSums(y == 1) / n
# Estimated probabilities (GHK method)
p_trace = matrix(rep(0, k * 500), ncol = k)
for(i in 1:500)
{
    m = as.numeric(output_list$beta_trace[i, ])
    v = triangula2mat(output_list$V_trace[i, ])
    for (j in 1:k)
    {
        A = diag(1, ncol = k, nrow = k)
        A[, j] = -1
        A[j, ] = 1
        s = A %*% v %*% t(A) 
        L = t(chol(s[-j, -j]))
        trunpt = (m[j] - m)[-j]
        above = c(0, 0, 0, 0)
        p_trace[i, j] = ghkvec(L, trunpt, above, 1000)
    }        
}
p_msci = msci(p_trace)
