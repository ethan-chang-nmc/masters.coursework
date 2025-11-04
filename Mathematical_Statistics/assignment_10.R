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