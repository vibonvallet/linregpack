#' Predict method for linregpack objects
#'
#' @param object A linregpack object
#' @param newdata Optional new data frame
#' @param ... Additional arguments (ignored)
#' @export
predict.linregpack <- function(object, newdata=NULL, ...) {
  if (is.null(newdata)) return(object$fitted.values)
  Xnew <- model.matrix(object$formula, data=newdata)
  as.vector(Xnew %*% object$coefficients)
}

#' Wrapper function for prediction
#'
#' @param fit A linregpack object
#' @param newdata Optional new data frame
#' @param ... Additional arguments (ignored)
#' @export
linreg_predict <- function(fit, newdata = NULL, ...) {
  predict(fit, newdata = newdata, ...)
}
