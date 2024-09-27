# This is a script to save your own tests for the function
source("FunctionsLR.R")


## Test warnings messages:
n <- 10
p <- 2
X <- matrix(2, nrow = n, ncol = p)
Y <- matrix(1, n, p)
LRMultiClass(X, Y, X, Y)
Xt <- X
X[, 1] <- 1
LRMultiClass(X, Y, Xt, Y)
Xt <- X
y <- matrix(1, n - 1, p)
LRMultiClass(X, y, Xt, y)


# Test to see if the function works:
n <- 10
p <- 3
K <- 3
beta <- matrix(c(0, .11, .1, .01, .05, .1, .04, .1, .01), p, K)
X <- cbind(rep(1, n), runif(10), runif(10))
pk <- calc_pk(X, beta)
y <- apply(pk, 1, which.max) - 1
LRMultiClass(X, y, X, y)
