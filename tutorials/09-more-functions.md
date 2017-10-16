More about functions
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Naming functions
> -   Technicalities of arguments
> -   Documenting a function
> -   Good practices

------------------------------------------------------------------------

Naming Functions
================

-   Choose meaningful names of functions
-   Prefereably a verb
-   Think about the users (who will use your functions)
-   Think about extreme cases

### Names of functions

Avoid this:

``` r
f <- function(x, y) {
  x + y
}
```

This is better

``` r
add <- function(x, y) {
  x + y
}
```

Function Arguments
------------------

Functions can have any number of arguments (even zero arguments)

``` r
# function with 2 arguments
add <- function(x, y) x + y 

# function with no arguments
hi <- function() print("Hi there!")
hi()
```

    ## [1] "Hi there!"

### Arguments can have default values

``` r
hey <- function(x = "") {
  cat("Hey", x, "\nHow is it going?")
}

hey()
```

    ## Hey  
    ## How is it going?

``` r
hey("Gaston")
```

    ## Hey Gaston 
    ## How is it going?

### Arguments with no defaults

If you specify an argument with no default value, you must give it a value everytime you call the function, otherwise you'll get an error:

``` r
sqr <- function(x) { 
  x^2
}

sqr()
```

    ## Error in sqr(): argument "x" is missing, with no default

### Arguments with no default values

Sometimes you don't want to give default values, but you also don't want to cause an error. We can use `missing()` to see if an argument is missing:

``` r
abc <- function(a, b, c = 3) {
  if (missing(b)) {
    result <- a * 2 + c 
  } else {
    result <- a * b + c 
  }
  result
}
```

### Arguments with no default values

You can also set an argument value to NULL if you don't want to specify a default value:

``` r
abcd <- function(a, b = 2, c = 3, d = NULL) {
  if (is.null(d)) {
    result <- a * b + c
  } else {
    result <- a * b + c * d
  }
  result
}
```

More Arguments
--------------

``` r
# arguments with and without default values
myplot <- function(x, y, col = "#3488ff", pch = 19) {
  plot(x, y, col = col, pch = pch)
}

myplot(1:5, 1:5)
```

-   `x` and `y` have no default values
-   `col` and `pch` have default values (but they can be changed)

### Positional and Named Arguments

``` r
omg <- function(pos1, pos2, name1 = 1, name2 = 2) {
  (pos1 + name1) * (pos2 + name2)
}
```

-   `pos1` positional argument
-   `pos2` positional argument
-   `name1` named argument
-   `name2` named argument

### Arguments

-   Arguments with default values are known as **named** arguments
-   Arguments with no default values are referred to as **positional** arguments

### Argument Matching

Arguments can be matched positionally or by name

``` r
values <- seq(-2, 1, length.out = 20)

# equivalent calls
mean(values)
mean(x = values)
mean(x = values, na.rm = FALSE)
mean(na.rm = FALSE, x = values)
mean(na.rm = FALSE, values)
```

### Partial Matching

Named arguments can also be partially matched:

``` r
# equivalent calls
seq(from = 1, to = 2, length.out = 5)
seq(from = 1, to = 2, length = 5)
seq(from = 1, to = 2, len = 5)
```

`length.out` is partially matched with `length` and `len`

Example with `mean()`
---------------------

``` r
mean(c(NA, 1:9), na.rm = TRUE)

# saving typing
mean(c(NA, 1:9), na.rm = T)

# saving typing but dangerous
mean(c(NA, 1:9), na = T)
```

### Partial matching example

``` r
# Generally you don't need to name all arguments
mean(x = c(NA, 1:9), na.rm = TRUE)

# unusual orders best avoided
mean(na.rm = TRUE, x = c(NA, 1:9))
mean(na = T, c(NA, 1:9))
```

### How many arguments should you remember?

``` r
# Don't need to supply defaults
mean(x = c(NA, 1:9), na.rm = FALSE)

# Need to remember too much about mean()
mean(x = c(NA, 1:9), , TRUE)

# Don't abbreviate too much
mean(c(NA, 1:9), n = T)
```

### Brain Teaser: argument conflict

``` r
f <- function(a = 1, abcd = 1, abdd = 1) {
  print(a)
  print(abcd)
  print(abdd)
}

# what will happen?
f(a = 5)
f(ab = 5)
```

    ## Error in f(ab = 5): argument 1 matches multiple formal arguments

``` r
f(abc = 5)
```

### One more example: naming arguments

Give meaningful names to arguments:

``` r
# Avoid this
area_rect <- function(x, y) {
  x * y
}
```

This is better

``` r
area_rect <- function(length, width) {
  length * width
}
```

Even better: give default values (whenever possible)

``` r
area_rect <- function(length = 1, width = 1) {
  length * width
}
```

Avoid this:

``` r
# what does this function do?
ci <- function(p, r, n, ti) { p * (1 + r/p)^(ti * p)
}
```

This is better:

``` r
compound_interest <- 
function(principal, rate, periods, time) {
  principal * (1 + rate/periods)^(time * periods)
}
```

------------------------------------------------------------------------

Messages
========

There are two main functions for generating warnings and errors:

-   `stop()`
-   `warning()`
-   There's also the `stopifnot()` function

Stop Execution
--------------

Use `stop()` to stop the execution (this will raise an error)

``` r
meansd <- function(x, na.rm = FALSE) {
  if (!is.numeric(x)) {
    stop("x is not numeric")
  }
  # output
  c(mean = mean(x, na.rm = na.rm),
    sd = sd(x, na.rm = na.rm))
}
```

Warning Messages
----------------

Use `warning()` to show a warning message

``` r
meansd <- function(x, na.rm = FALSE) {
  if (!is.numeric(x)) {
    warning("non-numeric input coerced to numeric")
    x <- as.numeric(x) 
  }
  # output
  c(mean = mean(x, na.rm = na.rm),
    sd = sd(x, na.rm = na.rm))
}
```

A warning is useful when you don't want to stop the execution, but you still want to show potential problems

Function `stopifnot()`
----------------------

`stopifnot()` ensures the truth of expressions:

``` r
meansd <- function(x, na.rm = FALSE) {
  stopifnot(is.numeric(x))
  # output
  c(mean = mean(x, na.rm = na.rm),
    sd = sd(x, na.rm = na.rm)) 
}

meansd('hello')
```

    ## Error: is.numeric(x) is not TRUE

------------------------------------------------------------------------

Documenting Functions
=====================

So far the examples that you've seen in these tutorials are fairly simple. Moreover, they appear in a somewhat raw format. However, you should strive to always include *documentation* for your functions. What does this mean? Documenting a function involves adding descriptions for the purpose of the function, the inputs it accepts, and the output it produces.

-   Description: what the function does
-   Input(s): what are the inputs or arguments
-   Output: what is the output (returned value)

You can find some inspiration in the `help()` documentation you when search for a given function.

Documenting Functions
---------------------

Documentation outside the function

``` r
# Description: calculates the area of a rectangle
# Inputs
#   length: numeric value
#   width: numeric value
# Output
#   area value
area_rect <- function(length = 1, width = 1) {
  length * width
}
```

Documenting Functions
---------------------

Documentation inside the function's body

``` r
area_rect <- function(length = 1, width = 1) {
  # Description: calculates the area of a rectangle
  # Inputs
  #   length: numeric value
  #   width: numeric value
  # Output
  #   area value
  
  length * width
}
```

Roxygen comments
----------------

Documentation with roxygen documents (good for packaging purposes)

``` r
#' @title Area of Rectangle
#' @description Calculates the area of a rectangle
#' @param length numeric value
#' @param width numeric value
#' @return area (i.e. product of length and width)
#' @examples
#'   area_rect()
#'   area_rect(length = 5, width = 2)
#'   area_rect(width = 2, length = 5)
area_rect <- function(length = 1, width = 1) {
  length * width
}
```

Good Principles
---------------

-   Don't write long functions
-   Rewrite long functions by converting collections of related expressions into separate functions
-   A function often corresponds to a verb of a particular step or task in a sequence of tasks
-   Functions form the building blocks for larger tasks
-   Write functions so that they can be reused in different settings.
-   When writing a function, think about different scenarios and contexts in which it might be used
-   Can you generalize it?
-   Avoid hard coding values that the user might want to provide. Make them default values of new parameters.
-   Make the actions of the function as few as possible, or allow the user to turn off some via logical parameters
-   Always test the functions you've written
-   Even better: let somebody else test them for you

Separate small functions:

-   are easier to reason about and manage
-   clearly identify what they do
-   are easier to test and verify they are correct
-   are more likely to be reusable as they each do less and so you can pick the functions that do specific tasks
-   Make functions parameterizable
-   Allow the user to specify values htat might be computed in the function
-   This facilitates testing and avoiding recomputing the same thing in different calls
-   Use a default value to do those computations that would be in the body of the function
