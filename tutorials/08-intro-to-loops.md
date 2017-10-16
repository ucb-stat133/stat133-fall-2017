Introduction to loops
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Why do you need loops?
> -   Get to know the For loop
> -   Get to know the While loop
> -   Get to know the Repeat loop

------------------------------------------------------------------------

About Loops
===========

-   Many times we need to perform a procedure several times
-   We perform the same operation several times as long as some condition is fulfilled
-   For this purpose we use loops
-   The main idea is that of **iteration**
-   R provides three basic paradigms: `for`, `repeat`, `while`

For Loops
=========

-   Often we want to repeatedly carry out some computation a **fixed** number of times.
-   For instance, repeat an operation for each element of a vector.
-   In R this is done with a **`for`** loop.

Motivation example
------------------

``` r
prices <- c(2.50, 2.95, 3.45, 3.25)

prices
```

    ## [1] 2.50 2.95 3.45 3.25

### Printing prices "manually"

Say you are interested in printing each price individually. You can manually display them one by one, by typing the same command several times:

``` r
cat("Price 1 is", prices[1])
cat("Price 2 is", prices[2])
cat("Price 3 is", prices[3])
cat("Price 4 is", prices[4])
```

    ## Price 1 is 2.5

    ## Price 2 is 2.95

    ## Price 3 is 3.45

    ## Price 4 is 3.25

### Printing prices with a `for` loop

Or you can use a loop structure in which you tell the computer to display the prices a given number of times, but using one command instead of typing it various times:

``` r
for (i in 1:4) {
  cat("Price", i, "is", prices[i], "\n")
}
```

    ## Price 1 is 2.5 
    ## Price 2 is 2.95 
    ## Price 3 is 3.45 
    ## Price 4 is 3.25

Prices of Coffee
----------------

``` r
coffee_prices <- c(
  expresso = 2.50,
  latte = 2.95,
  mocha = 3.45, 
  cappuccino = 3.25)

coffee_prices
```

    ##   expresso      latte      mocha cappuccino 
    ##       2.50       2.95       3.45       3.25

### Printing coffee prices "manually"

``` r
cat("Expresso has a price of", coffee_prices[1])
cat("Latte has a price of", coffee_prices[2])
cat("Mocha has a price of", coffee_prices[3])
cat("Capuccino has a price of", coffee_prices[4])
```

    ## Expresso has a price of 2.5

    ## Latte has a price of 2.95

    ## Mocha has a price of 3.45

    ## Capuccino has a price of 3.25

### Printing coffee prices with a `for` loop

``` r
for (i in 1:4) {
  cat(names(coffee_prices)[i], "has a price of", 
      prices[i], "\n")
}
```

    ## expresso has a price of 2.5 
    ## latte has a price of 2.95 
    ## mocha has a price of 3.45 
    ## cappuccino has a price of 3.25

For Loops
=========

`for` loops are used when **we know exactly how many times** we want the code to repeat

``` r
for (iterator in times) { 
  do_something
}
```

`for()` takes an **iterator** variable and a vector of **times** to iterate through.

``` r
value <- 2

for (i in 1:5) { 
  value <- value * 2 
  print(value)
}
```

    ## [1] 4
    ## [1] 8
    ## [1] 16
    ## [1] 32
    ## [1] 64

The vector of *times* does NOT have to be a numeric vector; it can be any vector

``` r
value <- 2
times <- c('one', 'two', 'three', 'four')

for (i in times) { 
  value <- value * 2 
  print(value)
}
```

    ## [1] 4
    ## [1] 8
    ## [1] 16
    ## [1] 32

### For Loops and Next statement

Sometimes we need to skip a loop iteration if a given condition is met, this can be done with a next statement

``` r
for (iterator in times) { 
  expr1
  expr2
  if (condition) {
    next
  }
  expr3
  expr4
}
```

Example:

``` r
x <- 2

for (i in 1:5) {
  y <- x * i
  if (y == 8) {
    next
  }
  print(y)
}
```

    ## [1] 2
    ## [1] 4
    ## [1] 6
    ## [1] 10

Nested Loops
============

It is common to have nested loops

``` r
for (iterator1 in times1) { 
  for (iterator2 in times2) {
    expr1
    expr2
    ...
  }
}
```

Example: Nested loops

``` r
# some matrix
A <- matrix(1:12, nrow = 3, ncol = 4)

A
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    4    7   10
    ## [2,]    2    5    8   11
    ## [3,]    3    6    9   12

Example: Nested Loops

``` r
# reciprocal of values less than 6
for (i in 1:nrow(A)) { 
  for (j in 1:ncol(A)) {
    if (A[i,j] < 6) A[i,j] <- 1 / A[i,j] 
  }
}

A
```

    ##           [,1] [,2] [,3] [,4]
    ## [1,] 1.0000000 0.25    7   10
    ## [2,] 0.5000000 0.20    8   11
    ## [3,] 0.3333333 6.00    9   12

------------------------------------------------------------------------

For Loops and Vectorized Computations
=====================================

-   R loops have bad reputation for being slow.

-   Experienced users will tell you: "tend to avoid for loops in R" (me included).

-   It is not really that the loops are slow; the slowness has more to do with the way R handles the *boxing and unboxing* of data objects, which may be a bit inefficient.

-   R provides a family of functions that are usually more efficient than loops (i.e. `apply()` functions).

-   For this course, especially if you have NO programming experience, you should ignore any advice about avoiding loops in R.

-   You should learn how to write loops, and how they work; every programming language provides some type of loop structures.

-   In practice, many (programming) problems can be tackled using some loop.

-   When using R, you may need to start solving a problem using a loop. Once you solved it, try to see if you can find a vectorized alternative.

-   It takes practice and experience to find alternative solutions to `for` loops.

-   There are cases when using `for` loops is not that bad.

------------------------------------------------------------------------

Repeat Loop
===========

`repeat` executes the same code over and over until a stop condition is met:

``` r
repeat { 
  keep_doing_something
  if (stop_condition) break
}
```

The `break` statement stops the loops. If you enter an infinite loop, you can manually break it by pressing the `ESC` key.

``` r
value <- 2

repeat {
  value <- value * 2 
  print(value)
  if (value >= 40) break
}
```

    ## [1] 4
    ## [1] 8
    ## [1] 16
    ## [1] 32
    ## [1] 64

To skip a current iteration, use `next`

``` r
value <- 2

repeat {
  value <- value * 2
  print(value)
  if (value == 16) {
    value <- value * 2
    next
  }
  if (value > 80) break 
}
```

    ## [1] 4
    ## [1] 8
    ## [1] 16
    ## [1] 64
    ## [1] 128

While Loops
===========

It can also be useful to repeat a computation until a condition is false. A `while` loop provides this form of control flow.

``` r
while (condition) { 
  keep_doing_something
}
```

### About while loops

-   `while` loops are backward `repeat` loops
-   `while` checks first and then attempts to execute
-   computations are carried out for as long as the condition is true
-   the loop stops when the condition is FALSE
-   If you enter an infinite loop, break it by pressing `ESC` key

``` r
value <- 2

while (value < 40) { 
  value <- value * 2 
  print(value)
}
```

    ## [1] 4
    ## [1] 8
    ## [1] 16
    ## [1] 32
    ## [1] 64

Repeat, While, For
==================

-   If you don't know the number of times something will be done, you can use either `repeat` or `while`
-   `while` evaluates the condition at the beginning
-   `repeat` executes operations until a stop condition is met
-   If you know the number of times that something will be done, use `for`
-   `for` needs an *iterator* and a vector of *times*

Questions
---------

-   What happens if you pass `NA` as a condition to `if()`?
-   What happens if you pass `NA` as a condition to `ifelse()`?
-   What types of values can be passed as the first argument to `switch()`?
-   How do you stop a `repeat` loop executing?
-   How do you jump to next iteration of a loop?
