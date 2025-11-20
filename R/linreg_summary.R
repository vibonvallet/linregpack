#' @export
print.linregpack <- function(x, ...) {
  print(x$call)
  print(cbind(Estimate=x$coefficients, SE=x$se))
}

#' @export
summary.linregpack <- function(object, ...) {
  print(object)
}
