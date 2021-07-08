Cas_Geor_trivariate <- function(trials){
  
  X <- numeric(trials+1)
  P <- numeric(trials+1)
  N <- numeric(trials+1)
  
  X[1] <- 1
  P[1] <- .5
  N[1] <- 2
  for (i in 2:(trials+1)) {
    X[i] <- rbinom(1, N[i-1], P[i-1])
    P[i] <- rbeta(1, X[i]+1, N[i-1]-X[i]+1)
    N[i] <- rpois(1, 4*(1-P[i]))+X[i]
  }
  
  mat <- cbind(X, P, N)
  colnames(mat) <- c("X", "P", "N")
  return(mat)
  
}
sim <- Cas_Geor_trivariate(5000)
plot(sim[2:5001, 1], sim[2:5001, 2], pch=20,xlab="x",ylab="y",main="")
plot(sim[2:5001, 1], sim[2:5001, 3], pch=20,xlab="x",ylab="y",main="")
plot(sim[2:5001, 2], sim[2:5001, 3], pch=20,xlab="x",ylab="y",main="")