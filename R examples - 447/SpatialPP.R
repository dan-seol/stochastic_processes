SpatialPoisGenerate <- function(t1, t2, s1, s2, r1, r2, lambda){
  # it is assumed t1 <t2 s1< s2
 mu <- (t2-t1)*(s2-s1)*(r2-r1)
 
 N <- rpois(1, lambda*mu)
 xPoints <- runif(N, min=t1, max=t2)
 yPoints <- runif(N, min=s1, max=s2)
 zPoints <- runif(N, min=r1, max=r2)
 
 tuples <- cbind(xPoints, yPoints, zPoints)
 
 colnames(tuples) <- c("xPoints", "yPoints", "zPoints")

 
 return(as.data.frame(tuples))
 
  
}
#RectPoisGenerate(0, 1, 0, 1, 100)
SpatialPoisSim <- function(trials, x1, x2, y1, y2, z1, z2, c1, c2, c3, r, lambda){
  simlist <- numeric(trials)
  for(i in 1:trials){
    tuples <- SpatialPoisGenerate(x1, x2, y1, y2, z1, z2, lambda)
    
    ct <- sum(((tuples$xPoints-c1)^2+(tuples$yPoints-c2)^2+(tuples$zPoints-c3)^2)<=r^2)
    simlist[i] <- ct
    
  }
  return(simlist)
  
}

#RectPoisGenerate(0, 1, 0, 1, 100)
SimResult<-SpatialPoisSim(100000, 0, 1, 0, 1, 0, 1, 0.7, 0.7, 0.7, 0.2, 100)
mean(SimResult)
var(SimResult)
100*pi*0.2^3*4/3