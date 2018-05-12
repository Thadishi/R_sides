

#Read the data to the envirinment
library("readxl")
Union <- read_excel("Union.xlsx")


#1.
summary(Union)
data(Union)

#2.
fullModel <- lm(STAFF ~ BHTRANS+CHEQUES+INVEST+LOANS+INSURE+LOANINFO+CAPTURE+OTHER, data=Union)
op <-par(mfrow=c(2, 2))

library(car)
scatterplotMatrix(Union, diagonal="density")

#3.
attach(Union)
Union.model <- step(lm(STAFF ~ BHTRANS+CHEQUES+INVEST+LOANS+INSURE+LOANINFO+CAPTURE+OTHER), trace=F)
summary(Union.model)
summary(fullModel)
#4.
plot(Union.model$fitted.values, Union.model$residuals, xlab="Fitted values", ylab = "residuals")
abline(h=0)
#5.