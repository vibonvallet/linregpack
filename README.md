# linregpack
linregpack is a R package that implements ordinary least squares (OLS) linear regression from scratch. It is designed for comparison with R’s built-in lm() function. The primary goals of linregpack are to illustrate how linear regression works internally, without relying on lm(), to provide an implementation that is transparent and easy to read, and to enable comparison of your own implementation to R’s built-in version.

## Installation
```r
# install.packages("devtools")
devtools::install_github("vibonvallet/linregpack")
```

## Quick Start
```r
library(linregpack)

# Simple regression
x <- 1:10
y <- 2 + 3*x + rnorm(10)
df <- data.frame(x = x, y = y)
fit <- simple_lm(y ~ x, data = df)

fit$coefficients
fit$r_squared

# Multiple regression
df <- data.frame(y = 1:10 + rnorm(10), x1 = 1:10, x2 = 10:1)
fit2 <- simple_lm(y ~ x1 + x2, data = df)
fit2$coefficients
fit2$r_squared
```
