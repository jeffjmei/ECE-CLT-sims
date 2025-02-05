source("scenarios.R")

# Initialize Parameters
scenario_num <- 2
n <- 1000 # sample size
s <- 2
sx <- sqrt(2) # standard deviation of x
sy <- sqrt(3) # standard deviation of y
sxy <- 0.5 # covariance
rxy <- sxy / (sx * sy) # correlation
k31 <- sx^3 * sy * 3 * rxy
S <- matrix(c( # covariance matrix
  sx^2, sxy,
  sxy, sy^2
), nrow = 2, ncol = 2)


# Scenario 2: single change point
# Scenario 5: flip flop
# Scenario 10: ultra flip flop
# Scenario 11: wild style
scenario_params <- scenario(
  # WARN: this function is not designed to handle the covariance matrix
  scenario_num = scenario_num,
  n = n
)
hx <- scenario_params$h[, 1]
hy <- scenario_params$h[, 2]
h <- hx
