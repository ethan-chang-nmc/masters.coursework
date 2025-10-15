# Ethan Chang, M.S Applied and Computational Mathematics @ JHU
# echang54@jh.edu
# 09/22/2025
# Assignment 4
# We will confirm your results in the HW for problems 3.10.4 and 3.10.6. To do this, you can use the 
# Inverse Transform Sampling Method for random number generation from an arbitrary continuous distribution 
# having an inverse. For a continuous random variable, X, having distribution 𝐹𝑥 (𝑥), it is possible to 
# generate random deviates of X by forming F𝑥-1(𝑢), where 𝑢 is a random number from a uniform distribution 
# on [0,1].

# MC 3.10.4
# Find the cdf for the density in problem 3.10.4. Use that to randomly generate a sample of size 5, call it y. 
# Sort the sample and determine if the interval Y’ 1 to Y’ 5 contains 0.60. The interval is y[1] to y[5]. 
# Repeat for 1000 trials and compare with your theoretical result.
trial.4 <- function()
{
    unif_samples <- runif(5)
    y <- sqrt(unif_samples)
    y_sort <- sort(y)
    return(y_sort[1] <= 0.6 && y_sort[5] >= 0.6)
}

results <- replicate(1000, trial.4())
mean(results)

# MC 3.10.6
# After determining n analytically from problem 3.10.6, sample n values repeatedly from the distribution of Y. 
# You will use the approach above, first finding the distribution function and then using the inverse distribution 
# evaluated at a random uniform value on [0,1] to generate a random deviate for Y. For each of the repetitions 
# of n values, sort the y values and identify the minimum y[1] for comparison to to 0.2. Compute the sample 
# proportion in 1000 trials of n values to see if the P(Ymin<0.2)>0.9. If your computed n is correct, the 
# probability should be very close to 0.9.
trial.6 <- function()
{
    u <- runif(12)
    y <- -log(1 - u)
    y_min <- min(y)
    return(y_min < 0.2)
}

results <- replicate(1000, trial.6())
mean(results)