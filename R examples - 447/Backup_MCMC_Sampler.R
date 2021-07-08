library(tidyverse)

ldborel = function(x,mu){
  -mu*x + (x-1)*(log(mu)+log(x)) - lfactorial(x)  
}

borel_prop = function(current,p_up=0.5){
  if(current==1){ return(2)} 
  else {return(sample(c(current-1,current+1),
                      prob=c(1-p_up,p_up),size=1))}
}

run_sampler = function(iter,start,mu,p_up){
  
  my_samples = rep(NA,iter+1)
  my_samples[1] = start
  accept=0
  for(i in 2:(iter+1)){
    current = my_samples[i-1]
    prop = borel_prop(current,p_up)
    if(prop>current) up = 1 else up = -1
    log_den_ratio = ldborel(prop,mu) - ldborel(current,mu)
    log_jump_ratio = up*(log(1-p_up)-
                           log(ifelse(min(current,prop)==1,1,p_up)))
    log_hastings = log_den_ratio + log_jump_ratio
    if(runif(1,0,1)<=exp(log_hastings)){
      my_samples[i] = prop
      accept = accept+1
    }
    else{ my_samples[i] = current}
  }
  return(list(samples=my_samples,acc_prop = accept/iter))
}

iter=100000
start = 30 
mu=0.7
p_up = 0.2
mysamples = run_sampler(iter,start,mu,p_up)
plotdata = data_frame(iter=0:iter,y=mysamples[[1]])
real_probs = data_frame(x=1:max(mysamples[[1]]),probs=exp(ldborel(x,mu)))
g1 = ggplot(plotdata,aes(x=iter,y=y)) + geom_line() + ylim(0,max(mysamples[[1]]))+ 
  geom_label(data=data_frame(xlab=0.9*iter,ylab=max(mysamples[[1]])), 
             aes(x=xlab,y=ylab,label=paste("Acceptance Rate:",mysamples[[2]],sep="")))
g2 = ggplot(plotdata,aes(x=y)) + geom_bar(mapping=aes(y=..prop..,group=1)) + ylab("Proportion") + 
  geom_label(data=data_frame(xlab=0.9*max(mysamples[[1]]),ylab=0.9), 
             aes(x=xlab,y=ylab,label=paste("Sample mean:",round(mean(mysamples[[1]]),3),sep=""))) + 
  ylim(c(0,1)) + geom_point(data=real_probs,aes(x=x,y=probs),col="red")
grid.arrange(g1,g2)

