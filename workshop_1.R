everyFive <- c(11, 1, 3, 0, 3, 6, 1, 3, 8, 2, 8, 6)

xbarS <- mean(everyFive)
stdev <- sd(everyFive)

n = 12

op <- par(mfrow =c(2, 1))

hist(everyFive)

B <- 1000
bootstrap <- c()
for(i in 1:1000){
  bot <- sample(everyFive, 12, replace = T)
  
  bootstrap[i] <- bot
}

#t-statistic
#lower limit
ll <- xbarS+ qt(0.025, df= n-1)* sd(everyFive)/sqrt(n)

#Upper limit
ul <- xbarS+ qt(0.975, df= n-1)* sd(everyFive)/sqrt(n)

