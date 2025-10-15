# Ethan Chang, M.S Applied and Computational Mathematics @ JHU
# echang54@jh.edu
# 09/15/2025
# Assignment 3

# 1. Using the function rbinom in R, generate 1000 random deviates from a B(20,.4) distribution, 
#compute the sample mean and compare with the theoretical expectation.
binomial_sample <- rbinom(1000, size = 20, prob = 0.4)
bin_mean <- mean(binomial_sample)
bin_theoretical <- 20 * 0.4
cat("Sample mean, binomial =", bin_mean, "\n")
cat("Theoretical expectation =", bin_theoretical, "\n\n")

# 2. Using the function rhyper in R, generate 1000 random deviates from a hypergeometric distribution 
# with 4 white balls, 8 black balls, and 3 balls drawn without replacement. Compute the sample mean 
# and compare with the theoretical expectation.
hg_sample <- rhyper(1000, m = 4, n = 8, k = 3)
hg_mean <- mean(hg_sample)
hg_theoretical <- 3 * 4 / (4 + 8)
cat("Sample mean, hypergeometric =", hg_mean, "\n")
cat("Theoretical expectation =", hg_theoretical, "\n\n")

# 3. Using the function rexp in R, generate 1000 random deviates from an exponential with lambda=3. 
# Compute the sample mean and compare with the theoretical expectation, which is 1/lambda.
exp_sample <- rexp(1000, rate = 3)
exp_mean <- mean(exp_sample)
exp_theoretical <- 1 / 3
cat("Sample mean, exponential =", exp_mean, "\n")
cat("Theoretical expectation =", exp_theoretical, "\n")