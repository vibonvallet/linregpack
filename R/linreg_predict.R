#' @export
predict.linregpack <- function(object, newdata=NULL, ...) {
  if (is.null(newdata)) return(object$fitted.values)
  Xnew <- model.matrix(object$terms, data=newdata)
  as.vector(Xnew %*% object$coefficients)
}

#' @export
linreg_predict <- function(fit, newdata = NULL, ...) {
  predict(fit, newdata = newdata, ...)
}
