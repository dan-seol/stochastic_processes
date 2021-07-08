adjacent <- function(init, n)
  { k <- length(init)
  tot<-0 #total number of 1 s
  new <-c(2, init,2) # pad sequence at the ends 
  for(i in 1:n){
  index <- 1 +sample(1:k,1)
  newbit <- 0 + !new[index]
  if (newbit==0) { 
    new[index] <- 0
  tot <- tot+sum(new) next} else {
    if(new[index-1]==1 | new[index+1]==1) #checking the neighbors
      tot <- tot + sum(new)
  next} else {
    new[index] <- 1
    tot <- tot + sum(new)
  }}
  tot/n-4 } 