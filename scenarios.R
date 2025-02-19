source("~/Documents/Research/Code/functions.r")

scenario1 <- function(s12 = 0, n = 100, signal = 1) {
  # No Change Point
  S <- matrix(c(
    1, s12,
    s12, 1
  ), byrow = T, ncol = 2)

  # Mean Vector
  h1 <- rep(0, n)
  h2 <- rep(0, n)
  h <- signal * cbind(h1, h2)

  # Set A
  L <- 2
  b <- get_weights(L)
  A <- b_to_A(b, n, L)
  eval <- eigen(A)$val

  # Return Parameter Object
  obj <- list(n = n, L = L, S = S, h = h, A = A, eval = eval)
  return(obj)
}

scenario2 <- function(s12 = 0, n = 100, signal = 1) {
  # Single Change Point (Unison)
  S <- matrix(c(
    1, s12,
    s12, 1
  ), byrow = T, ncol = 2)

  h1 <- c(rep(-1 / 2, n / 2), rep(1 / 2, n / 2))
  h2 <- c(rep(-1 / 2, n / 2), rep(1 / 2, n / 2))
  h <- signal * cbind(h1, h2)

  # Set A
  L <- 2
  b <- get_weights(L)
  A <- b_to_A(b, n, L)
  eval <- eigen(A)$val

  # Return Parameter Object
  obj <- list(n = n, L = L, S = S, h = h, A = A, eval = eval)
  return(obj)
}

scenario3 <- function(s12 = 0, n = 100, signal = 1) {
  # Single Change Point (Mirrored)
  S <- matrix(c(
    1, s12,
    s12, 1
  ), byrow = T, ncol = 2)

  h1 <- c(rep(-1 / 2, n / 2), rep(1 / 2, n / 2))
  h2 <- c(rep(1 / 2, n / 2), rep(-1 / 2, n / 2))
  h <- signal * cbind(h1, h2)

  # Set A
  L <- 2
  b <- get_weights(L)
  A <- b_to_A(b, n, L)
  eval <- eigen(A)$val

  # Return Parameter Object
  obj <- list(n = n, L = L, S = S, h = h, A = A, eval = eval)
  return(obj)
}


scenario4 <- function(s12 = 0, n = 100, signal = 1) {
  # Flip-Flop (Unison)
  S <- matrix(c(
    1, s12,
    s12, 1
  ), byrow = T, ncol = 2)

  h1 <- c(rep(0.5, n / 4), rep(-0.5, n / 4), rep(0.5, n / 4), rep(-0.5, n / 4))
  h2 <- c(rep(0.5, n / 4), rep(-0.5, n / 4), rep(0.5, n / 4), rep(-0.5, n / 4))
  h <- signal * cbind(h1, h2)

  # Set A
  L <- 2
  b <- get_weights(L)
  A <- b_to_A(b, n, L)
  eval <- eigen(A)$val

  # Return Parameter Object
  obj <- list(n = n, L = L, S = S, h = h, A = A, eval = eval)
  return(obj)
}

scenario5 <- function(s12 = 0, n = 100, signal = 1) {
  # Flip-Flop (Mirrored)
  S <- matrix(c(
    1, s12,
    s12, 1
  ), byrow = T, ncol = 2)

  h1 <- c(rep(0.5, n / 4), rep(-0.5, n / 4), rep(0.5, n / 4), rep(-0.5, n / 4))
  h2 <- c(rep(-0.5, n / 4), rep(0.5, n / 4), rep(-0.5, n / 4), rep(0.5, n / 4))
  h <- signal * cbind(h1, h2)

  # Set A
  L <- 2
  b <- get_weights(L)
  A <- b_to_A(b, n, L)
  eval <- eigen(A)$val

  # Return Parameter Object
  obj <- list(n = n, L = L, S = S, h = h, A = A, eval = eval)
  return(obj)
}

scenario6 <- function(s12 = 0, n = 100, signal = 1) {
  # Progression
  S <- matrix(c(
    1, s12,
    s12, 1
  ), byrow = T, ncol = 2)

  h1 <- c(rep(-1, n / 4), rep(-0.5, n / 4), rep(0, n / 4), rep(0.5, n / 4))
  h2 <- c(rep(-1, n / 4), rep(-0.5, n / 4), rep(0, n / 4), rep(0.5, n / 4))
  h <- signal * cbind(h1, h2)

  # Set A
  L <- 2
  b <- get_weights(L)
  A <- b_to_A(b, n, L)
  eval <- eigen(A)$val

  # Return Parameter Object
  obj <- list(n = n, L = L, S = S, h = h, A = A, eval = eval)
  return(obj)
}

scenario7 <- function(s12 = 0, n = 100, signal = 1) {
  # Progression (Mirrored)
  S <- matrix(c(
    1, s12,
    s12, 1
  ), byrow = T, ncol = 2)

  h1 <- c(rep(-1, n / 4), rep(-0.5, n / 4), rep(0, n / 4), rep(0.5, n / 4))
  h2 <- c(rep(1, n / 4), rep(0.5, n / 4), rep(0, n / 4), rep(-0.5, n / 4))
  h <- signal * cbind(h1, h2)

  # Set A
  L <- 2
  b <- get_weights(L)
  A <- b_to_A(b, n, L)
  eval <- eigen(A)$val

  # Return Parameter Object
  obj <- list(n = n, L = L, S = S, h = h, A = A, eval = eval)
  return(obj)
}

scenario8 <- function(s12 = 0, n = 100, signal = 1) {
  # Misspecified Sin (Unison)
  S <- matrix(c(
    1, s12,
    s12, 1
  ), byrow = T, ncol = 2)

  # Mean Vector
  h1 <- sin(1:n / 10)
  h2 <- sin(1:n / 10)
  h <- signal * cbind(h1, h2)

  # Set A
  L <- 2
  b <- get_weights(L)
  A <- b_to_A(b, n, L)
  eval <- eigen(A)$val

  # Return Parameter Object
  obj <- list(n = n, L = L, S = S, h = h, A = A, eval = eval)
  return(obj)
}

scenario9 <- function(s12 = 0, n = 100, signal = 1) {
  # Misspecified Sin (Asynchronous)
  S <- matrix(c(
    1, s12,
    s12, 1
  ), byrow = T, ncol = 2)

  # Mean Vector
  h1 <- sin(1:n / 10)
  h2 <- sin(1:n / 5)
  h <- signal * cbind(h1, h2)

  # Set A
  L <- 2
  b <- get_weights(L)
  A <- b_to_A(b, n, L)
  eval <- eigen(A)$val

  # Return Parameter Object
  obj <- list(n = n, L = L, S = S, h = h, A = A, eval = eval)
  return(obj)
}

scenario10 <- function(s12 = 0, n = 100, signal = 1) {
  # Ultra Flip-Flop (Unison)
  S <- matrix(c(
    1, s12,
    s12, 1
  ), byrow = T, ncol = 2)

  h1 <- rep(c(1, 1, 1, 1, -1, -1, -1, -1), n / 8)
  h2 <- rep(c(1, 1, 1, 1, -1, -1, -1, -1), n / 8)
  h <- signal * cbind(h1, h2)

  # Set A
  L <- 2
  b <- get_weights(L)
  A <- b_to_A(b, n, L)
  eval <- eigen(A)$val

  # Return Parameter Object
  obj <- list(n = n, L = L, S = S, h = h, A = A, eval = eval)
  return(obj)
}

scenario11 <- function(s12 = 0, n = 100, signal = 1, seed = 321) {
  # Wild Style
  S <- matrix(c(
    1, s12,
    s12, 1
  ), byrow = T, ncol = 2)
  K <- n / 10
  cp1 <- 4 * sort(sample(1:(n / 4 - 1), K, replace = F))
  cp1 <- c(0, cp1, n)
  mu1 <- rnorm(K + 1, 0, 1)
  h1 <- unlist(sapply(1:(K + 1), function(i) rep(mu1[i], cp1[i + 1] - cp1[i])))

  cp2 <- 4 * sort(sample(1:(n / 4 - 1), K, replace = F))
  cp2 <- c(0, cp2, n)
  mu2 <- rnorm(K + 1, 0, 1)
  h2 <- unlist(sapply(1:(K + 1), function(i) rep(mu2[i], cp2[i + 1] - cp2[i])))
  h <- signal * cbind(h1, h2)

  # Set A
  L <- 2
  b <- get_weights(L)
  A <- b_to_A(b, n, L)
  eval <- eigen(A)$val

  # Return Parameter Object
  obj <- list(n = n, L = L, S = S, h = h, A = A, eval = eval)
  return(obj)
}

scenario <- function(scenario_num = 1, s12 = 0, n = 100, signal = 1, seed = 321) {
  # used to select simulation scenario

  if (scenario_num == 1) {
    params <- scenario1(s12, n, signal)
  } else if (scenario_num == 2) {
    params <- scenario2(s12, n, signal)
  } else if (scenario_num == 3) {
    params <- scenario3(s12, n, signal)
  } else if (scenario_num == 4) {
    params <- scenario4(s12, n, signal)
  } else if (scenario_num == 5) {
    params <- scenario5(s12, n, signal)
  } else if (scenario_num == 6) {
    params <- scenario6(s12, n, signal)
  } else if (scenario_num == 7) {
    params <- scenario7(s12, n, signal)
  } else if (scenario_num == 8) {
    params <- scenario8(s12, n, signal)
  } else if (scenario_num == 9) {
    params <- scenario9(s12, n, signal)
  } else if (scenario_num == 10) {
    params <- scenario10(s12, n, signal)
  } else if (scenario_num == 11) {
    params <- scenario11(s12, n, signal, seed)
  } else {
    stop("No such scenario. Try again.")
  }
  return(params)
}

plot_scenario <- function(params, main = "Scenario Example") {
  e <- mvrnorm(params$n, c(0, 0), params$S)
  X <- params$h + e

  plot(NA,
    xlim = c(1, params$n), ylim = range(X),
    xlab = "Index", ylab = "X", main = main
  )
  points(X[, 1], col = "red")
  points(X[, 2], col = "blue")
  lines(params$h[, 1], type = "s", col = "red", lwd = 3)
  lines(params$h[, 2], type = "s", col = "blue", lwd = 2)
  abline()
}

scenario_name_to_num <- function(name) {
  name_lst <- c(
    "No Change Point",
    "Change Point (Unison)",
    "Change Point (Mirrored)",
    "Flip Flop (Unison)",
    "Flip Flop (Mirrored)",
    "Progression (Unison)",
    "Progression (Flip Flop)",
    "Misspecified Sin (Unison)",
    "Misspecified Sin (Mirrored)"
  )


  if (name == name_lst[1]) {
    return(1)
  } else if (name == name_lst[2]) {
    return(2)
  } else if (name == name_lst[3]) {
    return(3)
  } else if (name == name_lst[4]) {
    return(4)
  } else if (name == name_lst[5]) {
    return(5)
  } else if (name == name_lst[6]) {
    return(6)
  } else if (name == name_lst[7]) {
    return(7)
  } else if (name == name_lst[8]) {
    return(8)
  } else if (name == name_lst[9]) {
    return(9)
  }
}

scenario_num_to_name <- function(scenario_num) {
  name_lst <- c(
    "No Change Point",
    "Change Point (Unison)",
    "Change Point (Mirrored)",
    "Flip Flop (Unison)",
    "Flip Flop (Mirrored)",
    "Progression (Unison)",
    "Progression (Flip Flop)",
    "Misspecified Sin (Unison)",
    "Misspecified Sin (Mirrored)"
  )


  if (scenario_num == 1) {
    return(name_lst[1])
  } else if (scenario_num == 2) {
    return(name_lst[2])
  } else if (scenario_num == 3) {
    return(name_lst[3])
  } else if (scenario_num == 4) {
    return(name_lst[4])
  } else if (scenario_num == 5) {
    return(name_lst[5])
  } else if (scenario_num == 6) {
    return(name_lst[6])
  } else if (scenario_num == 7) {
    return(name_lst[7])
  } else if (scenario_num == 8) {
    return(name_lst[8])
  } else if (scenario_num == 9) {
    return(name_lst[9])
  } else {
    stop("No such scenario. Try again.")
  }
}
