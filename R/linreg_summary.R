#' @export
summary.linregpack <- function(object, ...) {
  cat("Call:\n")
  print(object$call)
  
  # Coefficients table
  coef_table <- cbind(
    Estimate = object$coefficients,
    Std.Error = object$se
  )
  cat("\nCoefficients:\n")
  print(coef_table)
  
  # Residuals summary
  cat("\nResiduals:\n")
  print(summary(object$y - fitted(object)))
  
  invisible(object)
}

#' @export
linreg_summary <- function(fit) {
  summary(fit)
}
