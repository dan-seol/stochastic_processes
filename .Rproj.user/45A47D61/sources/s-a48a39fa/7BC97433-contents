MHrnorm  <- function(n, epsilon){ 
  #you simulate standard normal random variable 
  #n is your number of trials
  simlist <- numeric(n)
 
  state <- 0
  for(i in 2:n){
    t <- runif(1, min=state-epsilon, max=state+epsilon)
    acc <- exp((state^2-t^2)/2)
    if(acc < runif(1)){
      state <- t
    }
    simlist[i] = state
  }
  return(simlist)
}