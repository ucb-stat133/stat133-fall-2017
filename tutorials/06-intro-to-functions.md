Getting started with functions
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Define a function that takes arguments
> -   Return a value from a function
> -   Test a function
> -   Set default values for function arguments

------------------------------------------------------------------------

Motivation
----------

-   R comes with many functions (and packages) that let us perform a wide variety of tasks.
-   Most of the things we do in R is via calling some function.
-   Sometimes, however, there's no function to do what we want to achieve.
-   Now we want to write functions ourselves
-   Idea: avoid repetitive coding (errors will creep in)

### Anatomy of a function

So far you've been using a number of functions in R. Now it is time to see how you can create and use your own functions.

To define a new function in R you use the function `function()`. You need to specify a name for the function, and then assign `function()` to the chosen name. You also need to define optional arguments (i.e. inputs). And of course, you must write the code (i.e. the body) so the function does something when you use it:

``` r
# anatomy of a function
some_name <- function(arguments) {
  # body of the function
}
```

-   Generally, you give a name to a function.
-   A function takes one or more inputs (or none), known as *arguments*.
-   The expressions forming the operations comprise the **body** of the function.
-   Usually, you wrap the body of the functions with curly braces.
-   A function returns a single value.

A less abstract function could have the following structure:

``` r
function_name <- function(arg1, arg2, etc) 
{
  expression_1
  expression_2
  ...
  expression_n
}
```

### From Fahrenheit to Celsius

Let's consider a typical programming example that involves converting fahrenheit degrees into celsius degrees. The conversion formula is (*F* − 32)×5/9 = *C*. Here's some R code to convert 100 fahrenheit degrees into Celsius degrees:

``` r
# fahrenheit degrees
far_deg <- 100

# convert to celsius
(far_deg - 32) * (5/9)
```

    ## [1] 37.77778

What if you want to conver 90 fahrenheit degrees in Celsius degrees? One option would be to rewrite the previous lines as:

``` r
# fahrenheit degrees
far_deg <- 90

# convert to celsius
(far_deg - 32) * (5/9)
```

    ## [1] 32.22222

However, retyping many lines of code can be very boring, tedious, and inefficient. To make your code reusable in a more efficient manner, you will have to write functions.

#### Writing a simple function

So, how do you create a function? The first step is to write code and make sure that it works. In this case we already have the code that converts a number in Fahrenheit units into Celsius.

The next step is to **encapsulate** the code in the form of a function. You have to choose a name, some argument(s), and determine the output. Here's one example with a function `fahrenheit_to_celsius()`

``` r
fahrenheit_to_celsius <- function(x) {
  (x - 32) * (5/9)
}

fahrenheit_to_celsius(100)
```

    ## [1] 37.77778

If you want to get the conversion of 90 fahrenheit degrees, you just simply execute it again by changing its argument:

``` r
fahrenheit_to_celsius(90)
```

    ## [1] 32.22222

And because we are using arithmetic operators (i.e. multiplication, subtraction, division), the function is also vectorized:

``` r
fahrenheit_to_celsius(c(90, 100, 110))
```

    ## [1] 32.22222 37.77778 43.33333

Sometimes it is recommended to add a default value to one (or more) of the arguments. In this case, we can give a default value of `x = 1`. When the user executes the function without any input, `fahrenheit_to_celsius` returns the value of 1 fahrenheit degree to Celsius degrees:

``` r
fahrenheit_to_celsius <- function(x = 1) {
  (x - 32) * (5/9)
}

# default execution
fahrenheit_to_celsius()
```

    ## [1] -17.22222

------------------------------------------------------------------------

Another example
---------------

Let's considet another toy example with a function that squares its argument:

``` r
square <- function(x) {
  x * x
}
```

-   the function name is `"square"`
-   it has one argument: `x`
-   the function body consists of one simple expression
-   it returns the value `x * x`

`square()` works like any other function in R:

``` r
square(10)
```

    ## [1] 100

In this case, `square()` is also vectorized:

``` r
square(1:5)
```

    ## [1]  1  4  9 16 25

Why is `square()` vectorized?

Once defined, functions can be used in other function definitions:

``` r
sum_of_squares <- function(x) {
  sum(square(x))
}

sum_of_squares(1:5)
```

    ## [1] 55

### Simple Expressions

Functions with a body consisting of a **simple expression** can be written with no braces (in one single line!):

``` r
square <- function(x) x * x

square(10)
```

    ## [1] 100

However, as a general coding rule, you should always write functions using braces.

### Nested Functions

We can also define a function inside another function:

``` r
getmax <- function(a) {
  # nested function
  maxpos <- function(u) which.max(u) 
  # output
  list(position = maxpos(a),
       value = max(a))
}

getmax(c(2, -4, 6, 10, pi))
```

    ## $position
    ## [1] 4
    ## 
    ## $value
    ## [1] 10

Naming Functions
----------------

There are different ways to name functions. The following list provides some examples with different naming styles:

-   `squareroot()`
-   `SquareRoot()`
-   `squareRoot()`
-   `square.root()`
-   `square_root()`

I personally use the *underscore* style. But you may find other programmers employing a different naming format. We strongly suggest using a consistent naming style. Many programming teams define their own style guides. If you are new to programming, it usually takes time to develop a consistent style. However, the sooner you have a defined personal style, the better.

It is also important that you know which names are invalid in R:

-   `5quareroot()`: cannot begin with a number
-   `_square()`: cannot begin with an underscore
-   `square-root()`: cannot use hyphenated names

In addition, avoid using an already existing name, e.g. `sqrt()`

Function Output
---------------

The value of a function can be established in two ways:

-   As the last evaluated simple expression (in the body)
-   An explicitly **returned** value via `return()`

Here's a basic example of a function in which the output is the last evaluated expression:

``` r
add <- function(x, y) {
  x + y
}

add(2, 3)
```

    ## [1] 5

Here's another version of `add()` in which the output is the last evaluated expression:

``` r
add <- function(x, y) {
  z <- x + y
  z
}

add(2, 3)
```

    ## [1] 5

Be careful with the form in which the last expression is evaluated:

``` r
add <- function(x, y) {
  z <- x + y
}

add(2, 3)
```

In this case, it looks like `add()` does not work. If you run the previous code, nothing appears in the console. Can you guess why? To help you answer this question, assign the invocation to an object and then print the object:

``` r
why <- add(2, 3)
why
```

`add()` does work. The issue has to do with the form of the last expression. Nothing gets displayed in the console because the last statement `z <- x + y` is an assignment (that does not print anything).

### The `return()` command

Sometimes the `return()` command is included to explicitly indicate the output of a function:

``` r
add <- function(x, y) {
  z <- x + y
  return(z)
}

add(2, 3)
```

    ## [1] 5

General Strategy for Writing Functions
--------------------------------------

-   Always start simple with test toy-values.
-   Get what will be the body of the function working first.
-   Check out each step of the way.
-   Don't try and do too much at once.
-   Create (encapsulate body) the function once everything works.

### Variance Function Example

The sample variance is given by the following formula:

$$
var(x) = \\frac{1}{n-1} \\sum\_{i = 1}^{n} (x\_i - \\bar{x})
$$

Let's create a `variance()` function that computes the sample variance. The first step should always be writing the code that will become the body of the function:

``` r
# start simple
x <- 1:10

# get working code
sum((x - mean(x)) ^ 2) / (length(x) - 1)
```

    ## [1] 9.166667

``` r
# test it: compare it to var()
var(1:10)
```

    ## [1] 9.166667

One you know your code works, then you can encapsulate with `function()`:

``` r
# encapsulate your code
variance <- function(x) {
  sum((x - mean(x)) ^ 2) / (length(x) - 1)
}

# check that it works
variance(x)
```

    ## [1] 9.166667

Before doing any further changes to `variance()`, you should test it with a handful of other (possibly extreme) cases:

``` r
# consider less simple cases
variance(runif(10))
```

    ## [1] 0.0776688

``` r
variance(c(1:9, NA))
```

    ## [1] NA

``` r
variance(rep(0, 10))
```

    ## [1] 0

You can then start gradually adapting your function to make it more robust, more flexible, more user friendly, etc. For instance, `variance()` returns `NA` when the provided vector contains missing values. But you can include an argument that removes any missing values. Many functions in R have this feature, like `sum()`, `mean()`, `median()`. They all use the so-called `na.rm` argument to specify if missing values should be removed before any computation is done:

``` r
# adapt it gradually
variance <- function(x, na.rm = FALSE) {
  if (na.rm) {
    # removing missing values
    x <- x[!is.na(x)]
  }
  # compute sample variance
  sum((x - mean(x)) ^ 2) / (length(x) - 1)
}

# check that it works
variance(c(1:9, NA), na.rm = TRUE)
```

    ## [1] 7.5
