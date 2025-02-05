---
title: $Var(T_k(X, Y))$
date: 2024-12-17
tags: 
---

```{R, message=FALSE, warning=FALSE}
source("~/Documents/Research/Code/Simulations/CLT/clt_functions.R")
source("~/Documents/Research/Code/Simulations/CLT/parameters.R")
library(tidyverse)
library(MASS)
library(testthat)
k <- 2
```

# $Var(T_k(X, Y))$

```{R, warning=FALSE, message=FALSE}
sim_var <- map(1:1000, ~ {
  sim <- map(1:100, ~ {
    # Generate Data
    e <- mvrnorm(n, mu = c(0, 0), Sigma = S)
    ex <- e[, 1]
    ey <- e[, 2]
    X <- hx + ex
    Y <- hy + ey

    return(
      list(
        TkXY = Tk(X, Y, k=k)
      )
    )
  })

  # Get Covariance
  TkXY <- map_dbl(sim, "TkXY")
  return(
    list(
      var_TkXY = var(TkXY)
    )
  )
})
var_TkXY <- map_dbl(sim_var, "var_TkXY") %>% conf_int()
```

```{R, warning=FALSE, message=FALSE}
# Evaluate Theory
var_TkXY_theory <- 6 * n * (sx^2 * sy^2 + sxy^2) + 
  2 * k * sy^2 * Tk(hx, hx) + 
  2 * k * sx^2 * Tk(hy, hy) +
  4 * k * sxy * Tk(hx, hy)

test_that("Variance", {
  expect_true(
    (var_TkXY[1] < var_TkXY_theory) &
    (var_TkXY[2] > var_TkXY_theory)
  )
})

# PASS: empirical results align with theoretical results
```





