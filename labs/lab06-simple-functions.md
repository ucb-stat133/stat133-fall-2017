Lab 6: Simple Functions
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Get into the habit of writing simple functions
> -   Making sure your functions work
> -   Understand the concept of *vectorization*

------------------------------------------------------------------------

Simple Math Functions
---------------------

Consider the following mathematical functions:

-   *f*(*x*)=*x*<sup>2</sup>
-   *g*(*x*)=2*x* + 5

Write two functions `f()` and `g()` based on the previous equations.

``` r
# your function f()
```

``` r
# your function g()
```

Test your functions with:

``` r
f(2)
f(-5)

g(0)
g(-5/2)
```

Write code to create the following composite functions:

-   `fog()` for the composite function: *f* ∘ *g*(*x*)
-   `gof()` for the composite function: *g* ∘ *f*(*x*)

``` r
# your function fog()
```

``` r
# your function gof()
```

Test your composite functions with:

``` r
fog(2)
fog(-5)

gof(0)
gof(-5/2)
```

------------------------------------------------------------------------

Pythagoras
----------

The pythagoras formula is used to compute the length of the hypotenuse, *c*, of a right triangle with legs of length *a* and *b*.

![hypotenuse](https://wikimedia.org/api/rest_v1/media/math/render/svg/5fd521cee81d583ce94bf6710984cc2a9eb7c3da)

Write a function `pythagoras()` that takes two arguments `a` and `b`, and returns the length of the hypotenuse:

``` r
# your pythagoras() function
```

Test your `pythagoras()` with two leg values: `pythagoras(3, 4)`

``` r
# your test
```

Test `pythagoras()` with just one leg value: `pythagoras(5)`

``` r
# your test
```

------------------------------------------------------------------------

Unit Conversion Formulas
------------------------

The following exercises involve writing simple functions to convert from one type of unit to other.

### Miles to Kilometers

Write a function `miles2kms()` that converts miles into kilometers: 1 mile is equal to 1.6 kilometers. Give the argument a default value of 1.

``` r
miles2kms <- function() {
  # fill in
}
```

Use `miles2kms()` to obtain mile conversions, in order to create a table (i.e. data frame) like the one below. The first ten rows range from 1 to 10 miles, and then from 10 to 100 in 10 mile steps. The second column corresponds to kms.

| miles | kms |
|-------|-----|
| 1     | 1.6 |
| 2     | 3.2 |
| ...   | ... |
| 10    | 16  |
| 20    | 32  |
| ...   | ... |
| 100   | 160 |

### Gallons to Liters, and viceversa

Write a function `gallon2liters()` that converts gallons to liters: 1 gallon is equal to 3.78541 liters:

``` r
# your gallons2liters() function
```

Use `gallon2liters()` to make an inverse function `liters2gallons()`.

``` r
# your liters2gallons() function
```

Use `liters2gallons()` to obtain liter conversions, in order to create a table (i.e. data frame) like the one below. The first ten rows range from 1 to 10 liters, and then from 10 to 100 in 10 liter steps. The second column corresponds to gallons.

| liters | gallons   |
|--------|-----------|
| 1      | 0.2641722 |
| 2      | 0.5283444 |
| ...    | ...       |
| 10     | 2.6417218 |
| 20     | 5.283444  |
| ...    | ...       |
| 100    | 26.417218 |

### Seconds to Years

According to Wikipedia, in 2015 the life expectancy of a person born in the US was 79 years. Consider the following question: Can a newborn baby in USA expect to live for one billion (10<sup>9</sup>) seconds?

To answer this question, write a function `seconds2years()` that takes a number in seconds and returns the equivalent number of years. Test the function with `seconds2years(1000000000)`

``` r
# your code
```

------------------------------------------------------------------------

Gaussian Function
-----------------

The Gaussian (Normal) function, given in the equation below, is one of the most widely used functions in science and statistics:

![gaussian function](https://wikimedia.org/api/rest_v1/media/math/render/svg/8aa9ff808602c27f1d9d63d7b2c115388a34f190)

The parameters *σ* and *μ* are real numbers, where *σ* must be greater than zero.

Make a function `gaussian()` that takes three arguments: `x`, `m`, and `s`. Evaluate the function with *m* = 0, *s* = 2, and *x* = 1.

``` r
# your code
```

Test your `gaussian()` function and compare it with the R function `dnorm()`

``` r
# compare with dnorm()
dnorm(x = 1, mean = 0, sd = 2)
```

    ## [1] 0.1760327

Now try `gaussian()` with a vector `seq(-4.5, 4.5, by = 0.1)`, and pass the values to `plot()` to get a normal curve. Here's code with values obtained from `dnorm()`

``` r
# you should get a plot like this one
x_values <- seq(-4.5, 4.5, by = 0.1)
y_values <- dnorm(x_values, mean = 0, sd = 2)
plot(x_values, y_values, las = 1, type = "l", lwd = 2)
```

![](lab06-simple-functions_files/figure-markdown_github/unnamed-chunk-14-1.png)

Your turn:

``` r
# your code
```

------------------------------------------------------------------------

### Polynomials

In this problem we want to see whether the graph of a given polynomial will cross or touch the *x* axis in a given interval.

Let's begin with the polynomial: *f*(*x*)=*x*<sup>2</sup>(*x* − 1). The first thing to do is write a function for the polynomial, for instance:

``` r
poly1 <- function(x) {
  (x^2) * (x - 1)
}
```

Once you have a function for the polynomial, you can create a set of pairs of points *x* and *y* = *f*(*x*), and then use them to graph the polynomial

``` r
# set of points
x <- seq(-4, 4, length.out = 20)
y <- poly1(x)

# graph polynomial
plot(x, y, type = 'l', lwd = 3, col = "#FB7215", las = 1)
abline(h = 0, v = 0, col = '#888888aa', lwd = 1.5)
title(main = expression(paste(f(x), ' = ', x^2, (x - 1))))
```

![](lab06-simple-functions_files/figure-markdown_github/unnamed-chunk-17-1.png)

Write functions and graph the following polynomials in the x-axis interval -4 to 4:

1.  *f*(*x*)=*x*<sup>3</sup>
2.  *f*(*x*)=(*x*<sup>2</sup> − 1)(*x* + 3)<sup>3</sup>
3.  *f*(*x*)=(*x*<sup>2</sup> − 1)(*x*<sup>2</sup> − 9)

------------------------------------------------------------------------

Descriptive Statistics
----------------------

Write a function `descriptive()` that takes a numeric vector as input, and returns a named vector with the following descriptive statistics:

-   `min`: minimum
-   `q1`: first quartile (Q2)
-   `median`: median
-   `mean`: mean
-   `q3`: third quartile (Q3)
-   `max`: maximum
-   `range`: range or span (max - min)
-   `iqr`: interquartile range (IQR)
-   `sd`: standard deviation

``` r
# your descriptive() function
descriptive <- function() {
  # fill in

}
```

------------------------------------------------------------------------

Solutions
---------

``` r
# pythagoras
pythagoras <- function(a, b = a) {
  sqrt(a^2 + b^2)
}


# miles to kilometers
miles2kms <- function(mi = 1) {
  1.6 * mi
}


# gallons to liters
gallons2liters <- function(gal = 1) {
  3.78541 * gal
}


# liters to gallons
liters2gallons <- function(lit = 1) {
  1 / gallons2liters(lit)
}


# seconds to years
seconds2years <- function(sec = 1) {
  sec / (365 * 24 * 60 * 60)
}


# gaussian
gaussian <- function(x = 1, m = 0, s = 1) {
  constant <- 1/(s * sqrt(2*pi))
  constant * exp(-1/2 * ((x - m) /s)^2)
}


# polynomials
poly_a <- x^3
poly_b <- (x^2 - 1) * (x + 3)^3
poly_c <- (x^2 - 1) * (x^2 - 9)


# descriptive statistics function
descriptive <- function(x, na.rm = FALSE) {
  c(
    "min" = min(x, na.rm = na.rm),
    "q1" = quantile(x, probs = 0.25, na.rm = na.rm),
    "median" = median(x, na.rm = na.rm),
    "mean" = mean(x, na.rm = na.rm),
    "q3" = quantile(x, probs = 0.75, na.rm = na.rm),
    "max" = max(x, na.rm = na.rm),
    "range" = max(x, na.rm = na.rm) - min(x, na.rm = na.rm),
    "iqr" = IQR(x, na.rm = na.rm),
    "sd" = sd(x, na.rm = na.rm)
  )
}
```
