#' A test of knitr
#' Some important text describing what this data is about
# This is a comment
a<-1:25
b<-sort(rnorm(25)) # by default mean=0 and sd=1
mean(b)
sd(b)
#' Note mean and sd match the default values of sd=1 and mean=0
plot(a,b,type="l",col="red",lwd=2)
#' figures are included


