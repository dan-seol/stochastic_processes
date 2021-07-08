library(expm)
Q <- matrix(c(-2,1,1,1/2,-1,1/2,0,1/3,-1/3), nrow=3, byrow=T)
p <- function(t) {expm(t*Q)}
P(100)