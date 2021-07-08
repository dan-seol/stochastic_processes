set.seed(329)
log.p <- function(x1, x2){
  (-0.5*(x1^2/100+(x2+0.05*x1-100*0.05)^2))
}
nreps <- 10000
sampl0 <- matrix(0, nrow=nreps, 2)
#starting values
samp0[1,] <- c(0,5)
for(irep in 2:nreps){
  #update it using MH
  x1.new <- rnorm(1, samp0[irep-1, 1], 20)
  al <- log.p(x1.new, samp0[]irep-1, 2) - log.p(samp0[irep-1, 1], sampl0[irep-1,2])
  if()
}