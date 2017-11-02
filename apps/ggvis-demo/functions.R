#' @title standardize
#' @description convert x to standard units
#' @param x numeric vector
#' @param na.rm whether to remove missing values
#' @return vector in standardized units
#' @example 
#' standardize(1:5)
standardize <- function(x, na.rm = FALSE) {
  if (!is.numeric(x)) {
    stop("non-numeric argument")
  }
  x_bar <- mean(x, na.rm = na.rm)
  x_sd <- sd(x, na.rm = na.rm)
  z <- (x - x_bar) / x_sd
  return(z)
}


#' @title rescale
#' @description rescale a vector by its range
#' @param y numeric vector
#' @param na.rm whether to remove missing values
#' @return vector in rescaled units
#' @example 
#' rescale(1:5)
rescale <- function(y, na.rm = FALSE) {
  if (!is.numeric(y)) {
    stop("'y' is not numeric")
  }
  ymin <- min(y, na.rm = na.rm)
  ymax <- max(y, na.rm = na.rm)
  (y - ymin) / (ymax - ymin)
}
