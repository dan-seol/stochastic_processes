#Computing the transition function from infinitesimal generator Q
#P(t) = e^{tQ} = \sum_{n \in \mathbb{N}_0} \frac{1}{n!}(tQ)^n
library(expm)
Q <- matrix(c(-.25, .25, 0,0,0,.2,-9/20,1/4,0,0,0,.2,-9/20,.25,0,0,0,.2,-9/20,.25,0,0,0,.2,-.2), nrow=5, byrow=T)
Q

P <- function(t) expm(t*Q)
P(2.5)