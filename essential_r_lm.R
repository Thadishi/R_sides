setwd("~/Documents/r_project")

#1. Violation of Assumption and Transformation of Data
library(MASS)
data(mammals)
model1 <- lm(brain~body, data=mammals)
summary(model1)
plot(model1)


#data=subset(Weights, age>7)
with(mammals, plot(body, brain))
with(mammals, plot(body, brain, log="xy"))

#Model2
model2 <- lm(log(brain) ~ log(body), data=mammals)
summary(model2)
plot(model2)


#plots
op <- par(mfrow = c(1,2), mar=c(2,3,2,1))
plot(density(model1$resid), main = "model1")
plot(density(model2$resid), main = "model2")

par(op)

#Weigths stRT HERE

Weights <- read.csv("../r_project/EssentialR/Data/WeightData.csv", comm="#")
hist(Weights$age, main = "")
plot(weight ~ age, data= Weights)

op<- par(mfrow=c(1,2), mar=c(2,3,1.5,0.5))
plot(log(weight) ~age, data=Weights)
abline(v=7, lty=2)
plot(log(weight) ~ age, data = subset(Weights, age>7))

m1 <- lm(weight ~ age, data= Weights)
m2 <- lm(log(weight) ~ age, data = subset(Weights, age >7))

#Compare the rediuals of the models and shit.
op <- par(mfrow = c(2,2), mar=c(2,3,1.5,0.5))
plot(m1$fitted.values, m1$resid)
plot(density(m1$resid))
plot(m2$fitted.values, m2$resid)
plot(density(m2$resid))
par(op)


#Hypothesis testing 
beans <- read.csv("../r_project/EssentialR/Data/BeansData.csv", comm="#")
plot(RtDM ~ ShtDM, data= beans, col=P.lev)


m3 <- lm(RtDM ~ ShtDM, data = beans)
summary(m3)
plot(m3$resid ~ m3$fitted.values)

B1 <- summary(m3)$coeff[2,1:2]
t <- (B1[1] - 1)/B1[2]
pt(t, df=22, lower.tail = TRUE)  #p-value of the model m3

#We are  hypothesising a new value - I think.
summary(lm(RtDM ~ ShtDM + offset(1 * ShtDM), data = beans))
plot(RtDM ~ ShtDM, data = beans)
abline(m3, lty=2)


#Predictions and Confidence intervals
new.vals <- c(2, 2.1,2.2, 3.5)
preds = predict(m3, newdata = data.frame(ShtDM = new.vals))
plot(new.vals ~ preds)
points(new.vals, preds, col ="red", pch=24)

ci <- predict(m3, data.frame(ShtDM = sort(beans$ShtDM)), level = 0.95, interval = "confidence")
head(ci)

plot(RtDM ~ ShtDM, data = beans)
abline(m3, lty = 1)
lines(sort(beans$ShtDM), ci[, 2], col = "red")
lines(sort(beans$ShtDM), ci[, 3], col = "red")


pri <- predict(m3, data.frame(ShtDM = sort(beans$ShtDM)), level = 0.95, interval = "prediction")
lines(sort(beans$ShtDM), pri[, 2],lty = 2)
lines(sort(beans$ShtDM), pri[, 3], lty = 2)
