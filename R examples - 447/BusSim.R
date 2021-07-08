BusSim <- function(N){

  # buswaiting.R
  amy <- numeric(N)
  zach <- numeric(N)
  for (i in 1:N) {
    bus <- rexp(1,1/30)
    amy[i] <- bus
    while (bus < 10) { bus <- bus + rexp(1,1/30) }
    zach[i] <- bus-10 }
  return(list(amy, zach))
}

sim <- BusSim(10000)
mean(sim[[1]])
mean(sim[[2]])

