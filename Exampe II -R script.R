

## Data checks

str(example2)
names(example2)



## Question 1:

summary(example2)
library(car) # loading "car"" (Companion to aplied regression) package
scatterplotMatrix(example2, diagonal = "density") # try using different values for arguemnt diagonal; options are "boxplot", "histogram"
cor(example2) # correlation matrix


## Question 2:

attach(example2) 
example2.model <- step(lm(Y ~ X1 + X2 + X3 + X4), trace = F ) # set "trace = T" to see  models fitted
summary(example2.model)


##Question 3:

# producing plot of fittted values vs residuals 
plot(example2.model$fitted.values ,example2.model$residuals, xlab = "Fitted values", ylab = "Residuals")
abline(h=0)

# Or you can let R produce the plot for you, along with other useful diagnostic plots. We are mainly interested in the plot of the residuals vs the fitted values and the quantile-quantile (qqplot).
plot(example2.model)


#So we delete it from the data set and refit our model
example2.model <- update(example2.model, data = example2[-c(14),])

summary(example2.model)
plot(example2.model)


## Question 4:

example2.null <-lm(Y~1, data = example2[-c(14),]) # intercept only model example2.null, fitted without the outlier
(anova(example2.null,example2.model))
confint(example2.model) # confidence intervals of regression parameters

