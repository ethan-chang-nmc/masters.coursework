# Ethan Chang, M.S Applied and Computational Mathematics @ JHU
# echang54@jh.edu
# 10/21/2025
# Assignment 8

# Review example 5.4.5 on page 314 in the text. Simulate the estimators mu_hat_1 and mu_hat_2, 
# 1000 times using a normal distribution with mean 10 and standard deviation 5. Each of your 
# three random sample values will come from this distribution. Form the estimates and compare 
# to the theoretical expectation (discussed in Example 5.4.3) and theoretical variance given in 
# Example 5.4.5. You will be using the function rnorm in R.
mu <- 10
sigma <- 5
n_sim <- 1000 

mu_hat1 <- numeric(n_sim)
mu_hat2 <- numeric(n_sim)

for (i in 1:n_sim) 
{
  x <- rnorm(3, mean = mu, sd = sigma) 

  mu_hat1[i] <- mean(x)
  mu_hat2[i] <- (1/4)*x[1] + (1/2)*x[2] + (1/4)*x[3]
}

emp_mean1 <- mean(mu_hat1)
emp_var1  <- var(mu_hat1)
emp_mean2 <- mean(mu_hat2)
emp_var2  <- var(mu_hat2)

theo_mean1 <- mu
theo_var1  <- sigma^2 / 3
theo_mean2 <- mu
theo_var2  <- 3 * sigma^2 / 8

cat("Estimator mu_hat1:\n")
cat("  Empirical mean =", emp_mean1, "\n  Theoretical mean =", theo_mean1, "\n")
cat("  Empirical var  =", emp_var1,  "\n  Theoretical var  =", theo_var1,  "\n\n")

cat("Estimator mu_hat2:\n")
cat("  Empirical mean =", emp_mean2, "\n  Theoretical mean =", theo_mean2, "\n")
cat("  Empirical var  =", emp_var2,  "\n  Theoretical var  =", theo_var2,  "\n")