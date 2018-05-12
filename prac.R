mids <- c(103, 104, 109, 110, 120)

B <- 10000

bootcamp <- numeric(B)
for(i in 1:10000){
  bto <- sample(mids, size = 5, replace = TRUE)
  
  bootcamp[i] <- median(bto)
}

