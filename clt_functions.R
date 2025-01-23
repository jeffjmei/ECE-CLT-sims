# Functions
mod_idx <- function(i, n=1000) {
  (i - 1) %% n + 1
}

conf_int <- function(X) {
  n <- length(X)
  c(
    mean(X) - 1.96 * sd(X) / sqrt(n),
    mean(X) + 1.96 * sd(X) / sqrt(n)
  )
}

Tk <- function(X, Y=NULL, k=1){
  n <- length(X)

  if(is.null(Y)){
    sum((X[mod_idx(1:n, n)] - X[mod_idx(1:n-k, n)])^2)
  }
  else{
    sum(
      (X[mod_idx(1:n, n)] - X[mod_idx(1:n-k, n)]) * 
      (Y[mod_idx(1:n, n)] - Y[mod_idx(1:n-k, n)])
    )
  }
}
