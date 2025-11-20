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
