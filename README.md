Simple Regression!
=================

Performing Simple Regression and plot for BMI 826.

### use
There is only one function in this package. 

Call `simpleRegression` with a N x 5 matrix. First four columns are used as inputs for regression, 5th column has reference values.
A Root Mean Square Error is generated and returned, and a 3D scatter plot is generated. 

```S
M <- array(rnorm(10 * 5, mean = 0, sd = 1), c(10, 5))
RMSE_calculated = simpleRegression(M)
RMSE = simpleRegression(M)
``` 

### Thank you Karl for helping make this into a legitimate package
* [Karl](https://github.com/kbroman), for helping make this into a legitimate package
# simpleRegression
