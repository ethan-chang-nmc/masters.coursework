# Ethan Chang, M.S Applied and Computational Mathematics @ JHU
# echang54@jh.edu
# 09/29/2025
# Assignment 5
# Using a generator for a binomial distribution, we will test the results of Example 3.8.2. Using software 
# generate 500 random deviates for X from a B(10, 0.3) distribution and 500 random deviates for Y from a 
# B(5, 0.3) distribution. Add corresponding random deviates from each distribution to form an empirical W=X+Y. 
# Then use the theoretical result of Example 3.8.2 and directly generate another 500 random deviates for W, 
# call it W1 from a B(15, 0.3). Order the result of the sum of W=X+Y and of W1. As an empirical test of the 
# equivalence of the distributions, you could do a few things. You could create a scatterplot of the random 
# deviates of W1 on the random deviates of W=X+Y. It won’t be real pretty, but values should follow a line y=x. 
# Or you could plot histograms of W1 and W on the same graph. (In R you call the two histogram commands and on 
# the 2nd add the argument, add=T).
X <- rbinom(500, size = 10, prob = 0.3)
Y <- rbinom(500, size = 10, prob = 0.3)

W <- X + Y

W1 = rbinom(500, size = 15, prob = 0.3)

W_sorted <- sort(W)
W1_sorted <- sort(W1)

plot(W_sorted, W1_sorted, main="3.8.2",
     xlab="Empirical W = X+Y", ylab="Theoretical W1 ~ Bin(15,0.3)",
     pch=19, col=rgb(0,0,1,0.5))

# Take the same approach for Example 3.8.5, first simulating W=Y/X and then simulating from the distribution 
# representing the theoretical result of the ratio of Y and X. You need a little more guidance here. By Example 
# 3.8.5 any exponential with rate lambda will suffice for Y and X, just use the same lambda, say lambda =1. 
# The ratio will give random values for W. To establish random values of W directly from the density found 
# for Example 3.8.5; that is, 1/(1+w)^2, you need a little help. And here it is. A random deviate for w can 
# be delivered by {1/(1-r)}-1. I would generate a couple thousand random deviates for W=Y/X and for Wdev={1/(1-r)}-1. 
# Next sort both random number sets from smallest to largest. Next, trim maybe the top 5%. That is, eliminate 
# them. The reason is that if you don’t, the Y/X is going to occasionally give you some huge values, which when 
# plotted the way I am recommending will change the scale substantially. So just be satisfied with the lower 95%. 
# Last plot the lower 95% ordered Y/X with the lower 95% Wdev to assess agreement. You should see values on a line with slope 1.
# Where did {1/(1-r)}-1 come from? For continuous distributions, the distribution function F(w) is distributed as a 
# U(0,1) random variable. We use this fact to establish random deviates. So we equate a uniform random number r with 
# the distribution function F(w). You can verify this, by getting F(w) for yourself, but it works out to be r=1-1/(1+w). 
# Solving for w gives the relationship above. That is how most random number generators are established for specific distributions!
X <- rexp(2000, rate = 1)
Y <- rexp(2000, rate = 1)

W <- Y/X

r <- runif(2000)
W_dev <- (1/(1-r)) - 1

cutoff <- floor(0.95* length(W))
W_sorted <- sort(W)[1:cutoff]
W_dev_sorted <- sort(W_dev)[1:cutoff]

plot(W_ratio_sorted, W_dev_sorted, main="3.8.5",
     xlab="Empirical W = Y/X", ylab="Theoretical W_dev",
     pch=19, col=rgb(0,0.5,0,0.5))
abline(0,1,col="red", lwd=2)  # y=x reference line