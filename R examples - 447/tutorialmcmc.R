library(tidyverse)
#pick a starting value x0

set.seed(329)
N <- 1000
gam <- 2.5
sigg <- 1
X <- rep(0, N)
X[1] <- 0

for(istep in 2:N){
  x <- X[istep-1]
  #sample from proposed density
  Z <- abs(rnorm(1, x, sigg))
  #calculate the acceptance probability
  a1 <- min(1, dgamma(Z, gam)/dgamma(x, gam))
  u <- runif(1)
  if(u < al){
    X[istep] <- Z
  } else{
    X[istep] <- x
  }
}

par(ma= c(4,4,2,0))