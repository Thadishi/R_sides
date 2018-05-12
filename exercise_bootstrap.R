#Bootstrapping in R
#Load the full sample of the 30 payments

pdelays <- c(37, 43, 38, 44, 39, 35, 43, 41, 42, 38, 36, 34, 37, 42, 36, 38, 41, 39, 39, 37, 34,
             34, 41, 41, 40, 38, 38, 46, 38, 42)
##Sample() to create a single bootstrap sample
bootx <- sample(pdelays, size =30, replace = TRUE)

#To create many bootstrap samples we put the code in a loop

#Set up a matrix to store 5000 bootstrap samples in rows.
all_bootsx <- matrix(NA, nrow = 5000, ncol = 30)
for(i in 1:5000){
  #draw a single bootsrap ample
  boot <- sample(pdelays, size = 30, replace = TRUE)
  #store that bootstap in row i
  all_bootsx[i,] <- boot
}

#extract bootstrap means using apply()
bs_means <- apply(all_bootsx, MARGIN = 1, FUN = mean)

op <- par(mfrow = c(1, 2))

boxplot(bs_means, ylab="Days", main="Boxplot")
hist(bs_means, breaks = 10, xlab="Days", main="Histogram")


#few summary statistics
mean(bs_means)
sd(bs_means)
min(bs_means)
max(bs_means)
