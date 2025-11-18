# Ethan Chang, M.S Applied and Computational Mathematics @ JHU
# echang54@jh.edu
# 11/17/2025
# Assignment 12

cases <- list(
  list(r=1, s=1, n=4,  k=3),
  list(r=1, s=1, n=20, k=11),
  list(r=4, s=4, n=4,  k=3),
  list(r=4, s=4, n=20, k=11)
)

par(mfrow = c(2,2), mar = c(4.2,4.2,2.5,1.2))
theta <- seq(0, 1, length.out = 1001)
results <- data.frame(r = numeric(0), s = numeric(0), n = numeric(0), k = numeric(0),
                      a_post = numeric(0), b_post = numeric(0), P_theta_gt_0.5 = numeric(0))

for(i in seq_along(cases)) {
  c <- cases[[i]]
  r <- c$r; s <- c$s; n <- c$n; k <- c$k
  a_prior <- r; b_prior <- s
  a_post <- r + k
  b_post <- s + n - k
  prior_density <- dbeta(theta, a_prior, b_prior)
  post_density  <- dbeta(theta, a_post, b_post)
  ymax <- max(prior_density, post_density) * 1.08
  plot(theta, prior_density, type = "l", lwd = 2, ylim = c(0, ymax),
       xlab = expression(theta), ylab = "density",
       main = paste0("prior(", a_prior, ",", b_prior, ") & post(", a_post, ",", b_post, ")"))
  lines(theta, post_density, lwd = 2, lty = 2)
  legend("topright", legend = c(paste0("prior Beta(",a_prior,",",b_prior,")"),
                                paste0("post Beta(",a_post,",",b_post,")")),
         lty = c(1,2), lwd = 2, bty = "n")
  p_gt_half <- 1 - pbeta(0.5, a_post, b_post)
  mtext(paste0("n=", n, ", k=", k, "; P(θ>0.5)=", signif(p_gt_half, 5)), side = 3, line = 0.2, cex = 0.9)
  results[nrow(results) + 1, ] <- c(r, s, n, k, a_post, b_post, p_gt_half)
}

par(mfrow = c(1,1))

print("Summary: posterior parameters and P(theta > 0.5)")
print(results)
