biStNormGibbs <- function(N, rho){
  X <- numeric(N+1)
  Y <- numeric(N+1)
  sigma <- sqrt(1-rho^2)
  X[1] = 0
  Y[1] = 0
for(i in 2:(N+1)){ 


X[i] <- rnorm(1, mean = rho*Y[i-1], sd= sigma)
Y[i] <- rnorm(1, mean = rho*X[i], sd= sigma)
}
  
  mtx <- cbind(X, Y)
  colnames(mtx) <- c("X", "Y")
  return(mtx)
   
  

}

plot(biStNormGibbs(10000, -0.6),pch=20,xlab="x",ylab="y",main="")