#Thabo Kopane
#KPNTHA001\
#Tutorial 11

setwd("~/Documents/R_project/Tut_11")
library(readxl)
Union <- read_excel("~/Documents/R_project/Tut_11/Union.xlsx")

View(Union)
print(Union)
#attach(Union)


#1. Obtain the summary of all the thingys
op <- par(mfrow = c(2, 2))
model2 <- lm(STAFF~BHTRANS+CHEQUES+INVEST+LOANS+INSURE+LOANINFO+CAPTURE+OTHER, data = Union)
summary(model2)

#2. Variable selection
#Using the OLS fucntion

olsrr::ols_all_subset(model2)
somplot <- olsrr::ols_all_subset(model2)
plot(somplot)
olsrr::ols_best_subset(model2)


mod <- step(model2)
summary(mod)
summary(model2)

#3. Model diagnostics
model3 <- lm(STAFF~LOANS+CAPTURE, data = Union)
plot(model3)
#The Q-Q plot shows that the error are normarly distributed
#Residuals vs Fitted shows random plots, which is accepted
#The scale-location also shows random plots.
#the resdiuals vs Leverage doesn't necessarily show a random thingy

#4. ANOVA

anova(model3)

