# Example 4.2
# Data of Box and Cox Revisited
# See:
# Box, G. and Cox, D. (1964). An analysis of transformations. Journal of the American Statistical Association, 26:211¨C252.
#
# 3x4 facorial design experement 
# Survival times of animals in a 3x4 factorial expreiment, the 
# factors being 3 poisons and 4 treatments. Each combination of
# the two factors is used for 4 animals, the allocation to animals
# being completely randomized.
library(StatMethRank)
boxcoxdat = array(0, c(3, 4, 4))
# The first position
boxcoxdat[1, , ] = 
matrix(c(
0.31, 0.82, 0.43, 0.45,
0.45, 1.10, 0.45, 0.71,
0.46, 0.88, 0.63, 0.66,
0.43, 0.72, 0.76, 0.62), nrow = 4)
# The second position
boxcoxdat[2, , ] = 
matrix(c(
0.36, 0.92, 0.44, 0.56,
0.29, 0.61, 0.35, 1.02,
0.40, 0.49, 0.31, 0.71,
0.23, 1.24, 0.40, 0.38), nrow = 4)
# The third position
boxcoxdat[3, , ] = 
matrix(c(
0.22, 0.30, 0.23, 0.30,
0.21, 0.37, 0.25, 0.36,
0.18, 0.38, 0.24, 0.31,
0.23, 0.29, 0.22, 0.33), nrow = 4)
# P-value of our row and column rank statistic
interaction.test(boxcoxdat)
