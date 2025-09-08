# Ethan Chang, M.S Applied and Computational Mathematics @ JHU
# echang54@jh.edu
# 09/01/2025
# Assignment 1

# In the game of Risk, armies battle via dice throws. Suppose, a defender's position is so weak 
# that only one 6-sided die can be thrown. The attacker on the other hand has sufficient armies 
# to justify up to three dice if desired. In a battle, the defending die is compared with the 
# attacking dice. If any of the attacking dice strictly exceed the defending die, the attacker 
# wins. Simulate the probability that the attacker wins when choosing to roll [a] 1 die, [b] 2 dice, 
# or [c] 3 dice. The answer is accessible with conditional probability, but let's simulate it here.
sim_num = 10000

# Function to simulate battles based on how many die the attacker has
battle <- function(attack_num_dice)
{
  defender <- sample(1:6, 1, replace = TRUE)
  attacker <- sample(1:6, attack_num_dice, replace = TRUE)
  
  score <- any(attacker > defender)
}

# Function to sample battles to find probability of attacker wins
win_prob <- sapply(1:3, function(k)
{ 
  mean(replicate(sim_num, battle(k)))
})

win_prob
