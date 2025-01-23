# Initialize Parameters
n <- 1000 # sample size
s <- 2
sx <- sqrt(2) # standard deviation of x
sy <- sqrt(3) # standard deviation of y
sxy <- 1 # covariance
rxy <- sxy / (sx * sy) # correlation
S <- matrix(c( # covariance matrix
    sx^2, sxy, 
    sxy, sy^2
  ), nrow=2, ncol=2)

hx <- c(rep(-1, n/2), rep(1, n/2)) # mean vector of x
hy <- c(rep(1, n/2), rep(-1, n/2)) # mean vector of y
h <- hx
