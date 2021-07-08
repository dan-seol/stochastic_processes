powerlaw.sim <- function(n){
  simlist <- numeric(n)
  #Initialize the first element as 2
  simlist[1] <- 2
  for (i in 2:n){
    
    if(simlist[i-1]==1){
    #Deal out cases where an entry is 1  
    p <- (0.5)^(2.5)
    #Here we sample from a binary setting since it is more simple
    b1 <- sample(c(1,2),1,prob=c(1-p,p))
    simlist[i] <- b1 
    } else {
      #Here we sample from cts uniform instead of discrete var to
      #1. to show there are different ways to "flip a coin" with a p
        U1 <- runif(1)
        if(U1<=0.5){
          simlist[i] <- simlist[i-1]-1}
        else {
          pi <- (i/(i+1))^(1.5)
          U2 <- runif(1)
          if(U2 <= pi){
            simlist[i] <- simlist[i-1]+1
          } else{
            simlist[i] <- simlist[i-1]
          }
        }
        }
  }
  tab <- table(simlist)/n
  return(tab)
  }
