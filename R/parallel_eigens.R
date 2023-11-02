# Install doFuture package
# Typically do this in an interactive session instead!
if(!require("doFuture")) {
  install.packages("doFuture", lib=Sys.getenv("R_LIBS_USER"),repos="http://cran.us.r-project.org", Ncpus=4)
}
# Load the doFuture package
library(doFuture)

# Enable parallelism
plan(multisession)

# Calculate maximum eigenvalue for 2000 random matrices
y <- foreach(x = 1:2000, .combine = c) %dofuture% {
  A <- matrix(rnorm(160000), nrow=400)
  eig <- eigen(A)
  max(abs(eig$values))
}
