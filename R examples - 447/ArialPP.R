
branch <- function(n, lam) { # Poisson
  z <- c(1, rep(0, n))
  for(i in 2:(n+1)){
    z[i] <- sum(rpois(z[i-1], lam))
  }
  return(z)
}
branch(10, 1/4)
replicate(5, branch(10, 1/4))
n <- 5000
simlist <- replicate(n, branch(10, 1/4)[11])
sum(simlist==0)/n

branch(10, 3/4)
replicate(5, branch(10, 1))
n <- 5000
simlist1 <- replicate(n, branch(10, 1/4)[11])
sum(simlist1==0)/n



