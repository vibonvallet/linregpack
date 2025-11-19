#' @export
residuals.linregpack <- function(object, ...) object$residuals

#' @export
fitted.linregpack <- function(object, ...) object$fitted.values

#' @export
coef.linregpack <- function(object, ...) object$coefficients

#' @export
vcov.linregpack <- function(object, ...) object$vcov
