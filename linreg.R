#' @export
linreg_fit <- function(formula, data) {
  mf <- model.frame(formula, data=data)
  y <- model.response(mf)
  X <- model.matrix(attr(mf, "terms"), data=mf)
  qrX <- qr(X)
  coef <- qr.coef(qrX, y)
  fitted <- as.vector(X %*% coef)
  resid <- y - fitted
  df <- length(y) - qrX$rank
  sigma2 <- sum(resid^2) / df
  vc = sigma2 * chol2inv(qr.R(qrX))
  se = sqrt(diag(vc))
  out <- list(coefficients=coef, fitted.values=fitted, residuals=resid,
              df.residual=df, sigma=sqrt(sigma2), vcov=vc, se=se,
              call=match.call(), terms=attr(mf, "terms"), model=mf)
  class(out) <- "linregpack"
  out
}

#' @export
predict.linregpack <- function(object, newdata=NULL, ...) {
  if (is.null(newdata)) return(object$fitted.values)
  Xnew <- model.matrix(object$terms, data=newdata)
  as.vector(Xnew %*% object$coefficients)
}

#' @export
linreg_predict <- function(fit, newdata=NULL, ...) {
  predict(fit, newdata=newdata, ...)
}

#' @export
print.linregpack <- function(x, ...) {
  print(x$call)
  print(cbind(Estimate=x$coefficients, SE=x$se))
}

#' @export
summary.linregpack <- function(object, ...) {
  print(object)
}
