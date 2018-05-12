##ONE WAY ANOVA

data("warpbreaks")
op <- par(mfrow =c(1,2))

boxplot(breaks ~ wool, data = warpbreaks)
boxplot(breaks ~ tension, data = warpbreaks)

t.test(breaks ~ wool, data = warpbreaks)
oneway.test(breaks ~ tension, data = warpbreaks)

summary(lm(breaks ~ tension, data = warpbreaks))
anova(lm(breaks ~ tension, data = warpbreaks))

#Test the differences within groups
TukeyHSD(aov(breaks ~ tension, data = warpbreaks))

#good practice to check out diagnostic plots for violation
#of assumptions

op <- par(mfrow = c(2,2))
plot(lm(breaks ~ tension, data = warpbreaks))



#3 when assumptions are violated.
#USe Kruskal wallis to test if residuals are extremely non-normal

kruskal.test(breaks ~ wool, data = warpbreaks)

#IV multi-way/ multi-factor anova

mult <- lm(breaks ~ wool + tension, data = warpbreaks)
summary(mult)

anova(mult)
TukeyHSD(aov(mult))

#interaction between items

interactMult <- lm(breaks ~ wool + tension:tension, data = warpbreaks)

summary(interactMult)


##V multiway ANOVA - calculating group means
m1 <- lm(breaks ~ wool * tension, data = warpbreaks)
sum(summary(m1)$coeff[c(1, 2, 3, 6), 1])

#Unique() to get all combinations of factor levels
unique(warpbreaks[, 2:3])

m1 <- lm(breaks ~ wool + tension + wool:tension, data = warpbreaks)
m1.pv = unique(warpbreaks[, 2:3])
m1.pv$predicted = predict(m1, newdata = unique(warpbreaks[, 2:3]))
m1.pv

tapply(m1$fitted, list(warpbreaks$wool, warpbreaks$tension), mean)


##interactions
anova(lm(breaks ~ wool + tension + wool:tension, data = warpbreaks))

#intereaction.plot() function for chwcking intereactions
with(warpbreaks, interaction.plot(x.factor = tension, wool, response = breaks))

op <- par(mfrow = c(2,2))
plot(lm(breaks ~ tension * wool, data = warpbreaks))
#Including the interaction, greatly increases the model - by a long shot.

##v11 Multi-Way Anova and Tujey
TukeyHSD(aov(breaks ~ wool + tension + wool:tension, data = warpbreaks))

#Tukey
library(agricolae)
data("sweetpotato")
model <- aov(yield ~ virus, data = sweetpotato)
out <- HSD.test(model, "virus", group = TRUE)
out$means
