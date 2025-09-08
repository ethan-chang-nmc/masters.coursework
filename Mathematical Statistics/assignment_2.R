# Ethan Chang, M.S Applied and Computational Mathematics @ JHU
# echang54@jh.edu
# 09/08/2025
# Assignment 2

# Consider a Baseball World Series (best of 7 game series) in which team A theoretically has a 0.55 chance of winning each game against team B. Games are considered independent. 
# Simulate the probability that team A would win a World Series against team B by simulating 1000 World Series. You many use any software to conduct the simulation. This is easily 
# derived from a binomial or negative binomial distribution, but I would like you to simulate it on a game x game basis. You may recognize that winning 4 in 4, 5, 6, or 7 games is 
# equivalent to winning at least 4 in 7 games.
sim_num = 1000

world_series <- function(A_prob)
{
    sample_num = runif(1)

    if (sample_num < A_prob)
    {
        return(1)
    }
    else
    {
        return(0)
    }
}