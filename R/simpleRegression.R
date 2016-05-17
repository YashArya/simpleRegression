#  simpleRegression
#' Performing simple linear regression
#'
#' Calculates estimate CCP and compares with actual CCP values in file
#'
#' @param M 2D Matrix with 4 columns input and 1 column reference values
#' 
#' @export
#' @importFrom graphics legend par
#' @importFrom scatterplot3d scatterplot3d
#' @return RMSE
#'
#' @examples
#' M <- array(rnorm(10 * 5, mean = 0, sd = 1), c(10, 5))
#' RMSE_calculated = simpleRegression(M)
#'

simpleRegression <- function(M) 
{
  # Check inputs
  stopifnot(is.numeric(M))
  stopifnot(is.numeric(M[, 1]))
  stopifnot(is.numeric(M[, 2]))
  stopifnot(is.numeric(M[, 3]))
  stopifnot(is.numeric(M[, 4]))
  stopifnot(is.numeric(M[, 5]))
  
  # (iii) (a) Calculating CCP estimate
  wts <- c(24.3666,0.11253,0.08435,0.06801,-0.16582)
  rngm5 <- range(M[,5])
  ndm5 <- rngm5[2] - rngm5[1]
  M[,5] <- (M[,5]-rngm5[1])/ndm5
  EST <- wts[1] + M[, 1] * wts[2] + M[, 2] * wts[3] + M[, 3] * wts[4] + M[, 4] * wts[5]
  rngEST <- range(EST)
  ndEST <- rngEST[2] - rngEST[1]
  EST <- (EST-rngEST[1])/ndEST
  #rng
  #nd
  #M[,5]
  #EST
  #length(EST)
  stopifnot(is.numeric(EST))
  
  # (iii) (b) Calculating the Root Mean Square Error
  diff <- (M[, 5] - EST)^2
  RMSE <- mean(diff)^(0.5)
  paste("Root mean square error is: ",RMSE)
  
  # (iv) Plotting the 3D Scatterplots.
  # requireNamespace("scatterplot3d", quietly = TRUE)
  # library(scatterplot3d)
  sPlot <- scatterplot3d(M[, 2], M[, 4], M[, 5], main = "3D ScatterPlot",xlab = "Column2",ylab = "Column 4",zlab = "Reference",color="red")
  sPlot$points3d(M[, 2],M[, 4], EST, col = "black")
  par(xpd=TRUE)
  legend('topleft',inset=c(0,-0.2),c("Reference","Estimated"),pch= 21, col = c('red','black'))
  
  return(RMSE)
}

# set.seed(1101, kind = NULL, normal.kind = NULL)
# M <- array(rnorm(10 * 5, mean = 0, sd = 1), c(10, 5))
# RMSE_calculated = simpleRegression(M)
