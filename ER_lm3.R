##Model Linear Models
#MLR

data("stackloss")
summary(lm(stack.loss ~ Air.Flow, data = stackloss))$coef

summary(lm(stack.loss ~ Water.Temp, data = stackloss))$coef

##interacton
summary(lm(stack.loss ~ Air.Flow*Water.Temp*Acid.Conc., data = stackloss))$coef

Rye <- read.csv("./EssentialR/Data/Rye-ANCOVA-2008.csv", comm = "#")
