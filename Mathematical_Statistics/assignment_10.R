# Ethan Chang, M.S Applied and Computational Mathematics @ JHU
# echang54@jh.edu
# 11/03/2025
# Assignment 10

# The conduct of a randomization or permutation test for the equality of two population means is as follows. 
# Under the null hypothesis, there is no difference in the populations. Thus, the assignment of values to one 
# population or the other is regarded as one arbitrary permutation. The question is how unusual is the test 
# statistic under this permutation in relation to other permutations. For problem 9.2.20, consider the fixed 
# and ARM rates. As the data appear, compute the difference in mean rates between them. Then combined the 
# values from ARM and fixed into one vector. Sample without replacement from that vector a set of 10 rates. 
# The “sample” function will help. The rates chosen represent one rate plan; the rates not chosen represent 
# the other. For each of these permutations, take the difference of means between the rates chosen and the 
# rates not chosen. Keep track for 1000 permutations of the test statistic. Determine how many of the test 
# statistics resulting from permuted rates are more unusual than the initial difference between rates from 
# the way the data are given in the problem. The proportion of the mean difference in rates more unusual 
# (extreme) than the initial difference is interpretable as a p-value. Report your p-value from the randomization test.

fix_rate <- c(3.525, 3.625, 3.685, 3.621, 3.791, 3.941, 3.780, 3.733)
arm <- c(2.923, 3.385, 3.363, 3.326, 3.283, 3.427, 3.347, 3.448)

obs_diff <- mean(fix_rate) - mean(arm)
obs_diff

combined <- c(fix_rate, arm)
n_fixed <- length(fix_rate)
n_perm <- 1000  # number of permutations

perm_diffs <- numeric(n_perm)
for (i in 1:n_perm) {
  perm_fixed <- sample(combined, n_fixed, replace = FALSE)
  perm_arm <- setdiff(combined, perm_fixed)
  
  perm_diffs[i] <- mean(perm_fixed) - mean(perm_arm)
}

p_value <- mean(perm_diffs >= obs_diff)
p_value

hist(perm_diffs, breaks = 30, main = "Permutation Distribution", 
     xlab = "Difference in Means (Fixed - ARM)", col = "lightblue", border = "white")
abline(v = obs_diff, col = "red", lwd = 2)
