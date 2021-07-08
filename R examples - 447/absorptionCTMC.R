#absorption CTMC.R

absorption <- function(trials, q12, q13, q23){
  simlist <- numeric(trials)
  init <- 1 # initial state of liver cirrhosis
  for (i in 1:trials){
    state <- init
    t <- 0
    while(TRUE){
      if(state == 1){
        qbar12 <- rexp(1, q12)
        qbar13 <- rexp(1, q13)
      }
      if(qbar12 < qbar13){
        t <- t + qbar12
        state <- 2
      } else {
        t <- t+qbar13
        break
      }
      if(state==2){
        qbar23 <- rexp(1, q23)
        t <- t+ qbar23
        break
      }
    }
    simlist[i] <- t
  }
  return(simlist)
}

mean(absorption(100000, 0.0151, 0.0071, 0.0284))