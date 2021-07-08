# Psubordination.R
Q <- matrix(c(-2,1,1,1,-3,2,0,1,-1), nrow=3, byrow=T);
colnames(Q) <- c(1,2,3)
rownames(Q) <- c(1,2,3)
#Q
lambda <- 3
R <- (1/lambda)*Q+diag(3)
#R


sim1 <- function(trials){
  simlist <- numeric(trials)
  for(i in 1:trials){
    
    s <- 0 # time
    state <- 1
    newstate <- 1
    while(s < 1.5){
      state <- newstate
      s <- s+rexp(1, lambda)
      newstate <- sample(1:3, 1,prob=R[state,])
    }
    simlist[i] <- state
    
  }
  return(table(simlist)/trials)
  
}

simlist<-sim1(100000)
simlist
expm(1.5*Q)[1,]