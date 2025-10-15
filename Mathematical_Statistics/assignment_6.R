# Ethan Chang, M.S Applied and Computational Mathematics @ JHU
# echang54@jh.edu
# 10/06/2025
# Assignment 6
# Sums of certain random variables will sometimes lead to other common random variables. The (a) iid Poisson(mean=2) and 
# (b) iid exponential(rate=1/4) are two such random variables. For each case identify the resulting distribution from summing 
# 3 of the iid random variables. I’ll describe what needs to be done next in terms of the Poisson. Convince yourself of the 
# correctness of your resulting distribution through the following exercise. First, generate three random deviates from the 
# Poisson distribution using rpois(). Add these to form a single random deviate of the sum of the three Poisson random variables. 
# Establish a vector of 1000 of these. Using your distribution finding, generate 1000 random deviates for the sum of three iid 
# Poisson random variables directly. With so many generated, a quick visual for agreement can be obtained by first sorting each 
# vector, and then plotting them in an x-y plot. Points should fall along the line y=x.
# The Monte Carlo for (b) can be run in the same way; however, I recommend that you trim the extremes, because both distributions 
# will provide a number of outliers that may disrupt the scale of your x-y plot. If v is your vector of random deviates a new 
# vector with v[51:950] should trim enough data to facilitate a good plot result.
sum_pois <- replicate(1000, sum(rpois(3, 2)))
act_pois <- rpois(1000, 3*2)

sort_spois <- sort(sum_pois)
sort_apois <- sort(act_pois)

plot(sort_spois, sort_apois,
      main = "Sum of 3 iid Poisson(2) vs Poisson (6)",
      xlab = "Monte Carlo",
      ylab = "Direct")

sum_exp <- replicate(1000, sum(rexp(3, 1/4)))
act_exp <- rgamma(1000, shape = 3, rate = 1/4)

sort_sexp <- sort(sum_exp)[51:950]
sort_aexp <- sort(act_exp)[51:950]

plot(sort_sexp, sort_aexp,
     main = "Sum of 3 iid Exponential(1/4) vs Gamma(3, 1/4)",
     xlab = "Monte Carlo",
     ylab = "Direct")
