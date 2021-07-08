#Based on bmhitting.R
#written in the parametric form
#
# The original script for bmhitting.R
# # mu<-0.5
# # sig<-1
# # a<-10
# # simlist<-numeric(1000)
# # 
# # for(i in 1:1000){
# #   t<-80
# #   n<-50000
# #   bm<-c(0,cumsum(rnorm(n,0,sqrt(t/n))))
# #   xproc<-mu*seq(0,t,t/n)+sig*bm
# #   simlist[i]<-which(xproc>=a)[1]*(t/n)
# # }
# # 
# # mean(simlist)
# # var(simlist)

bmhitting<-function(mu,sig,a,N,t,n){
  #Simultating N number of trials for a Brownian motion process on [0,t]
  simlist<-numeric(N)
  for(i in 1:N){
  bm<-c(0,cumsum(rnorm(n,0,sqrt(t/n))))
  xproc<-mu*seq(0,t,t/n)+sig*bm
  simlist[i]<-which(xproc>=a)[1]*(t/n)
  }
  return(simlist)
}

bmh<-bmhitting(1/2,1,10,5000,80,50000)
mean(bmh)
var(bmh)