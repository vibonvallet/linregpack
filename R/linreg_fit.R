#' Fit a Linear Regression Model
#'
#' `linreg_fit` performs ordinary least squares (OLS) regression
#' on a formula and data frame, returning coefficients, fitted values,
#' residuals, and model diagnostics.
#'
#' @param formula A formula specifying the model, e.g., y ~ x1 + x2
#' @param data A data frame containing the variables in the formula
#'
#' @return A list with components:
#' \describe{
#'   \item{coef}{Estimated regression coefficients}
#'   \item{fitted}{Fitted values from the model}
#'   \item{resid}{Residuals (observed - fitted)}
#'   \item{df}{Residual degrees of freedom}
#' }
#'
#' @export
linreg_fit <- function(formula, data) {
  # Create model frame and matrices
  mf <- model.frame(formula, data)
  y <- model.response(mf)
  X <- model.matrix(attr(mf, "terms"), data = mf)
  
  # Remove linearly dependent columns
  qrX <- qr(X)
  if (qrX$rank < ncol(X)) {
    message("Some columns are linearly dependent and will be removed.")
    X <- X[, qrX$pivot[1:qrX$rank], drop = FALSE]
  }
  
  # OLS coefficients
  beta <- solve(t(X) %*% X) %*% t(X) %*% y
  
  # Fitted values and residuals
  y_hat <- X %*% beta
  residuals <- y - y_hat
  
  # R-squared
  ss_total <- sum((y - mean(y))^2)
  ss_res <- sum(residuals^2)
  r_squared <- 1 - ss_res / ss_total
  
  # Return as list
  list(
    coefficients = setNames(as.vector(beta), colnames(X)),
    fitted.values = setNames(as.vector(y_hat), rownames(X)),
    residuals = setNames(as.vector(residuals), rownames(X)),
    r_squared = r_squared
  )
}
