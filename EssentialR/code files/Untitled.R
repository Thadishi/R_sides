
set.seed(6905022)
# flaming distance
cb<-rnorm(12,mean=2,sd=0.3)
fw<-rnorm(11,mean=2.2,sd=0.4)
t.test(cb, fw)
 
boxplot(cb,fw,ylab="Flaming distance (m)",xlab="", col="grey")
axis(side=1,at=1:2,c("Chicken","Flobberworm"))

