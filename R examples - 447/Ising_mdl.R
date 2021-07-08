Ising_mdl <- function(g, beta, N){
  grid <- matrix(sample(c(-1, 1), (g+2)^2, rep=T), nrow=g+2)
  #We pad extra two rows in order to be able to get neighbors even for boundary vertices
  grid[c(1,g+2), ]<- 0
  grid[,c(1,g+2)] <-0
  
  for(k in 1:N)
  {
    #positions are randomly chosen
    i <- sample(2:(g+1), 1)
    j <- sample(2:(g+1), 1)
    # We collect the neighbors
    nbhd <- grid[i,j+1]+grid[i,j-1]+grid[i-1,j]+grid[i+1,j]
    p <- 1/(1+ exp(-beta*2*nbhd))
    
    #Now we sample from uniform determine how to determine our state
    if (runif(1) < p) grid[i,j] <- 1 else grid[i,j] <- -1
  }
  final <- grid[2:(g+1),2:(g+1)]
  image(final, yaxt="n", xaxt="n", col=c(0,1))
}