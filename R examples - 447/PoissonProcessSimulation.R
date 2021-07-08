PPsim <- function(lambda, t){
  N <- rpois(1, lambda*t)
  U <- runif(N, min=0, max=t)
  return(sort(U, decreasing=FALSE))
}

print(PPsim(.5, 30))