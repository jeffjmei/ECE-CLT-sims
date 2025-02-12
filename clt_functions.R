# Functions
mod_idx <- function(i, n = 1000) {
  (i - 1) %% n + 1
}

conf_int <- function(X) {
  n <- length(X)
  c(
    mean(X) - 1.96 * sd(X) / sqrt(n),
    mean(X) + 1.96 * sd(X) / sqrt(n)
  )
}

Tk <- function(X, Y = NULL, k = 1) {
  n <- length(X)

  if (is.null(Y)) {
    sum((X[mod_idx(1:n, n)] - X[mod_idx(1:n - k, n)])^2)
  } else {
    sum(
      (X[mod_idx(1:n, n)] - X[mod_idx(1:n - k, n)]) *
        (Y[mod_idx(1:n, n)] - Y[mod_idx(1:n - k, n)])
    )
  }
}

test_bound <- function(test_name, true_value, sim_value) {
  ci <- conf_int(sim_value)
  test_that(test_name, {
    expect_true(
      (ci[1] < true_value) & (true_value < ci[2])
    )
  })
}

g <- function(u1, u2, u3, u4, u5, u6) {
  (2 * u5 - u6) / sqrt((2 * u1 - u2) * (2 * u3 - u4))
}

dg <- function(u1, u2, u3, u4, u5, u6) {
  # Theoretical Variance
  dT1 <- -(2 * u3 - u4) * (2 * u5 - u6) /
    ((2 * u1 - u2) * (2 * u3 - u4))^(3 / 2)
  dT2 <- (1 / 2) * (2 * u3 - u4) * (2 * u5 - u6) /
    ((2 * u1 - u2) * (2 * u3 - u4))^(3 / 2)
  dR1 <- -(2 * u1 - u2) * (2 * u5 - u6) /
    ((2 * u1 - u2) * (2 * u3 - u4))^(3 / 2)
  dR2 <- (1 / 2) * (2 * u1 - u2) * (2 * u5 - u6) /
    ((2 * u1 - u2) * (2 * u3 - u4))^(3 / 2)
  dQ1 <- 2 / ((2 * u1 - u2) * (2 * u3 - u4))^(1 / 2)
  dQ2 <- -1 / ((2 * u1 - u2) * (2 * u3 - u4))^(1 / 2)
  return(matrix(c(dT1, dT2, dR1, dR2, dQ1, dQ2), ncol = 1))
}

var_Tk <- function(n, sx, hx, k = 1) {
  12 * n * sx^4 + 8 * k * sx^2 * Tk(hx)
}
cov_Th_Tk <- function(n, sx, hx, k = 1) {
  8 * n * sx^4 + 8 * k * sx^2 * Tk(hx)
}
cov_Tk_Rk <- function(n, sx, sy, sxy, hx, hy, k = 1) {
  k22 <- (1 + 2 * (sxy / (sx * sy))^2)
  4 * n * sx^2 * sy^2 * (k22 - 1) +
    4 * n * sxy^2 + 8 * sxy * k * Tk(hx, hy)
}
cov_Th_Rk <- function(n, sx, sy, sxy, hx, hy, k = 1) {
  k22 <- (1 + 2 * (sxy / (sx * sy))^2)
  4 * n * sx^2 * sy^2 * (k22 - 1) +
    8 * sxy * Tk(hx, hy)
}
cov_Tk_Qk <- function(n, sx, sy, sxy, hx, hy, k = 1) {
  k31 <- 3 * sxy / (sx * sy)
  4 * sxy * k * Tk(hx) +
    4 * sx^2 * k * Tk(hx, hy) +
    4 * n * sx^3 * sy * k31
}
cov_Th_Qk <- function(n, sx, sy, sxy, hx, hy, k = 1) {
  k31 <- 3 * sxy / (sx * sy)
  4 * n * sx^3 * sy * k31 -
    4 * n * sx^2 * sxy +
    4 * sxy * Tk(hx) +
    4 * sx^2 * Tk(hx, hy)
}
cov_Qh_Qk <- function(n, sx, sy, sxy, hx, hy, k = 1) {
  k22 <- (1 + 2 * (sxy / (sx * sy))^2)
  4 * n * (sx^2 * sy^2 * k22 - sxy^2) +
    2 * sy^2 * Tk(hx) +
    2 * sx^2 * Tk(hy) +
    4 * sxy * Tk(hx, hy)
}
var_Qh <- function(n, sx, sy, sxy, hx, hy, k = 1) {
  k22 <- (1 + 2 * (sxy / (sx * sy))^2)
  2 * n * sx^2 * sy^2 * (k22 + 1) +
    2 * n * (sx^2 * sy^2 * k22 - sxy^2) +
    2 * k * sy^2 * Tk(hx, hx) +
    2 * k * sx^2 * Tk(hy, hy) +
    4 * k * sxy * Tk(hx, hy)
}
