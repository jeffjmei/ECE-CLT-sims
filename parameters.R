# Initialize Parameters
n <- 1000
s <- 2
sx <- sqrt(2)
sy <- sqrt(3)
sxy <- 1
S <- matrix(c(
    sx^2, sxy, 
    sxy, sy^2
  ), nrow=2, ncol=2)

hx <- c(rep(-1, n/2), rep(1, n/2))
hy <- c(rep(1, n/2), rep(-1, n/2))
h <- hx
