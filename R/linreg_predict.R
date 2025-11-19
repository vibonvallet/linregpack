#' @export
predict.linregpack <- function(object, newdata = NULL, ...) {
  if (is.null(newdata)) return(as.vector(object$x %*% object$coefficients))
  
  # Get coefficient names
  coef_names <- names(object$coefficients)
  
  # Create model matrix with intercept if present
  if ("(Intercept)" %in% coef_names) {
    Xnew <- cbind(Intercept = 1, newdata)
  } else {
    Xnew <- newdata
  }
  
  # Reorder columns to match coefficients
  Xnew <- Xnew[, coef_names, drop = FALSE]
  
  as.vector(as.matrix(Xnew) %*% object$coefficients)
}

#' @export
linreg_predict <- function(fit, newdata = NULL, ...) {
  predict(fit, newdata = newdata, ...)
}
