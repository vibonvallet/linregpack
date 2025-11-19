# linregpack
linregpack is a R package that implements ordinary least squares (OLS) linear regression from scratch. It is designed for comparison with R’s built-in lm() function. The primary goals of linregpack are to illustrate how linear regression works internally, without relying on lm(), to provide an implementation that is transparent and easy to read, and to enable comparison of your own implementation to R’s built-in version.

## Installation
```r
# devtools::install_github("yourusername/linregpack")
```

## Quick Start
```r
library(linregpack)

# Fit model
fit <- linreg_fit(Sepal.Length ~ Sepal.Width + Petal.Length, data = iris)

# Print results
fit
summary(fit)

# Predictions
predict(fit, newdata = iris[1:5, ])
```
