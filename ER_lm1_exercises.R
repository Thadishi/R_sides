setwd("~/Documents/r_project")

library(MASS)
data(mammals)
model1 <- lm(brain ~ body, data = mammals)
summary(model1)
plot(model1)

with(mammals, plot(body, brain))
with(mammals, plot(body, brain, log = "xy"))

beans <- read.csv("../r_project/EssentialR/Data/BeansData.csv", comm = "#")
rtModel <- lm(RtDM ~ rt.len, data = beans)
summary(rtModel)

##Arrange the plots in one frame
op <- par(mfrow = c(2, 2))
plot(rtModel)
#plot(rtModel$fitted.values, rtModel$resid)
#plot(density(rtModel$resid))

par(op)

#log model
model2 <- lm(log(RtDM) ~ log(rt.len), data = beans)
summary(model2)

po <- par(mfrow = c(2, 2))
plot(model2)
#When the data is log transformed, the residuals seem to normalise
#this means the data is explained

#2. Hyp testing
shtModel <- lm(ShtDM ~ RtDM, data = beans)
summary(shtModel)

B1 <- summary(shtModel)$coeff[2, 1:2]
t <- (B1[1] -1)/B1[2]
