Lab 8: Simple Loops
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Forget about vectorized code (pretend it doesn't exist)
> -   Practice writing simple loops
> -   Get familiar with the syntax of a `for` loop
> -   Get familiar with the syntax of a `while` loop
> -   Get familiar with the syntax of a `repeat` loop
> -   Encapsulate loops inside a function call

------------------------------------------------------------------------

Introduction
------------

The majority of functions that work with vectors are vectorized. Remember that vectorized operations are calculations that are applied to all the elements in a vector (element-wsie operations).

In order to learn about loops and iterations, it's good to forget about vectorized operations in R. This means that you will be asked to write code, using some sort of loop structure, to perform tasks for which there is already a vectorized implementation. For example, in this lab you will have to write code with various types of loops to calculate the mean of a numeric vector. This can easily be done using the function `mean()`. But we don't want you to use `mean()`. We want you to think about control-flow structures, which are essential in any programming activity.

For loops
---------

Let's start with a super simple example. Consider a vector `vec <- c(3, 1, 4)`. And suppose you want to add 1 to every element of `vec`. You know that this can easily be achieved using vectorized code:

``` r
vec <- c(3, 1, 4) 

vec + 1
```

    ## [1] 4 2 5

In order to learn about loops, I'm going to ask you to forget about the notion of vectorized code in R. That is, pretend that R does not have vectorized functions.

Think about what you would manually need to do in order to add 1 to the elements in `vec`. This addition would involve taking the first element in `vec` and add 1, then taking the second element in `vec` and add 1, and finally the third element in `vec` and add 1, something like this:

``` r
vec[1] + 1
vec[2] + 1
vec[3] + 1
```

The code above does the job. From a purely arithmetic standpoint, the three lines of code reflect the operation that you would need to carry out to add 1 to all the elements in `vec`.

From a programming point of view, you are performing the same type of operation three times: selecting an element in `vec` and adding 1 to it. But there's a lot of (unnecessary) repetition.

This is where loops come very handy. Here's how to use a `for ()` loop to add 1 to each element in `vec`:

``` r
vec <- c(3, 1, 4) # Change this value!

for (j in 1:3) { # Replace c() with an appropriate sequence.
  print(vec[j] + 1)
}
```

    ## [1] 4
    ## [1] 2
    ## [1] 5

In the code above we are taking each `vec` element `vec[j]`, adding 1 to it, and printing the outcome with `print()` so you can visualize the additions at each iteration of the loop.

**Your turn**: rewrite the `for` loop in order to triple every element in `vec`, and printing the output at each step of the loop:

``` r
vec <- c(3, 1, 4) # Change this value!

for (j in c()) { # Replace c() with an appropriate sequence.
  # Fill in.
  
}
```

What if you want to create a vector `vec2`, in which you store the values produced at each iteration of the loop? Here's one possibility:

``` r
vec <- c(3, 1, 4)  
vec2 <- rep(0, 3)  # "empty" of zeros vector to be filled in the loop

for (i in 1:3) {
  vec2[i] <- vec[i] + 1
}
vec2
```

    ## [1] 4 2 5

------------------------------------------------------------------------

Summation Series
----------------

Write a for loop to compute the following series. Test your code with different values for *n*. Does the series converge as *n* increase?

![series1](lab08-images/sum_series1.png)

$$
\\sum\_{k=0}^{n} \\frac{1}{2^k} = 1 + \\frac{1}{2} + \\frac{1}{4} + \\frac{1}{8} + \\dots + \\frac{1}{2^n}
$$

Write a for loop to compute the following series. Test your code with different values for *n*. Does the series converge as *n* increase?

![series2](lab08-images/sum_series2.png)

$$
\\sum\_{k=0}^{n} \\frac{1}{9^k} =1 + \\frac{1}{9} + \\frac{1}{81} + \\dots + \\frac{1}{9^n}
$$

### Arithmetic Series

Write a for loop to compute the following arithmetic series *a*<sub>*n*</sub> = *a*<sub>1</sub> + (*n* − 1)*d*

![arithmetic series](lab08-images/arith_series.png)

*a*<sub>*n*</sub> = *a*<sub>1</sub> + (*n* − 1)*d*

when *a*<sub>1</sub> = 3, and *d* = 3. For instance: 3 + 6 + 12 + 24 + …. Test your code with different values for *n*. Does the series converge as *n* increase?

### Geometric Sequence

A sequence such as 3, 6, 12, 24, 48 is an example of a geometric sequence. In this type of sequence, the *n*-th term is obtained as:

![geometric sequence](lab08-images/geo_seq.png)

*a*<sub>*n*</sub> = *a*<sub>1</sub> × *r*<sup>*n* − 1</sup>

where: *a*<sub>1</sub> is the first term, *r* is the common ratio, and *n* is the number of terms.

Write a for loop to compute the sum of the first *n* terms of: 3 + 6 + 12 + 24 + …. Test your code with different values for *n*. Does the series converge as *n* increase?

------------------------------------------------------------------------

Sine Approximation
------------------

Consider the following series that is used to approximate the function *s**i**n*(*x*):

![sine approximation](lab08-images/sine_series.png)

$$
sin(x) \\approx x - \\frac{x^3}{3!} + \\frac{x^5}{5!} - \\frac{x^7}{7!} + \\dots
$$

Write a `for` loop to approximate *s**i**n*(*x*). Try different number of terms, *n* = 5, 10, 50, 100. Compare your loop with the `sin()` function.

``` r
# Your for loop
```

------------------------------------------------------------------------

For loop with a matrix
----------------------

Consider the following matrix `A`:

``` r
A <- matrix(1:20, nrow = 5, ncol = 4)
A
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    6   11   16
    ## [2,]    2    7   12   17
    ## [3,]    3    8   13   18
    ## [4,]    4    9   14   19
    ## [5,]    5   10   15   20

Say we want to add 1 to all elements in row 1, add 2 to all elements in row 2, add 3 to all elements in row 3, and so on. To do this without using vectorized coe, you need to work with two `for()` loops. One loop will control how you traverse the matrix by rows, the other loop will control how you traverse the matrix by columns. Here's how:

``` r
# empty matrix B
B <- matrix(NA, nrow = 5, ncol = 4)

# for loop to get matrix B
for (i in 1:nrow(A)) {
  for (j in 1:ncol(A)) {
    B[i,j] <- A[i,j] + i
  }
}

B
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    2    7   12   17
    ## [2,]    4    9   14   19
    ## [3,]    6   11   16   21
    ## [4,]    8   13   18   23
    ## [5,]   10   15   20   25

### Your turn

Consider the following matrix `X`:

``` r
set.seed(123)
X <- matrix(rnorm(12), nrow = 4, ncol = 3)
X
```

    ##             [,1]       [,2]       [,3]
    ## [1,] -0.56047565  0.1292877 -0.6868529
    ## [2,] -0.23017749  1.7150650 -0.4456620
    ## [3,]  1.55870831  0.4609162  1.2240818
    ## [4,]  0.07050839 -1.2650612  0.3598138

Write code in R, using loops, to get a matrix `Y` such that the negative numbers in `A` are transformed into squared values, while the positive numbers in `A` are transformed into square root values

``` r
# for loops to get Y
```

------------------------------------------------------------------------

Dividing a number by 2 multiple times
-------------------------------------

The following examples involve dividing a number by 2 until it becomes odd.

### Using a `repeat` loop

``` r
# Divide a number by 2 until it becomes odd.
val_rep <- 898128000 # Change this value!

repeat {
  print(val_rep)
  if (val_rep %% 2 == 1) { # If val_rep is odd,
    break                  # end the loop.
  }
  val_rep <- val_rep / 2 # Divide val_rep by 2 since val_rep was even.
  # When the end of the loop is reached, return to the beginning of the loop.
}
```

    ## [1] 898128000
    ## [1] 449064000
    ## [1] 224532000
    ## [1] 112266000
    ## [1] 56133000
    ## [1] 28066500
    ## [1] 14033250
    ## [1] 7016625

### Using a `while` Loop

``` r
# Divide a number by 2 until it becomes odd.
val_while <- 898128000 # Change this value!

while (val_while %% 2 == 0) { # Continue the loop as long as val_while is even.
  print(val_while)
  val_while <- val_while / 2
}
```

    ## [1] 898128000
    ## [1] 449064000
    ## [1] 224532000
    ## [1] 112266000
    ## [1] 56133000
    ## [1] 28066500
    ## [1] 14033250

``` r
print(val_while)
```

    ## [1] 7016625

Make a `reduce()` function
--------------------------

Now generalize the above code to create a function `reduce()` which performs the same operation. (You should change very little.)

``` r
# your reduce() function
reduce <- function(x) {
  # Fill in.
  
}

reduce(898128000)
```

------------------------------------------------------------------------

Average
-------

The average of *n* numbers *x*<sub>1</sub>, *x*<sub>2</sub>, …, *x*<sub>*n*</sub> is given by the following formula:

![arithmetic mean](lab08-images/arith_mean.png)

$$
\\bar{x} = \\frac{1}{n} \\sum\_{i=1}^{n} x\_i = \\frac{x\_1 + x\_2 + \\dots + x\_n}{n}
$$

Write R code, using each type of loop (e.g. `for`, `while`, `repeat`) to implement the arithmetic mean of the vector `x = 1:100`

Standard Deviation
------------------

The sample standard deviation of a list of *n* numbers *x*<sub>1</sub>, *x*<sub>2</sub>, …, *x*<sub>*n*</sub> is given by the following formula:

![standard deviation](lab08-images/std_dev.png)

$$
SD = \\sqrt{ \\frac{1}{n-1} \\sum\_{i=1}^{n} (x\_i - \\bar{x})^2 }
$$

Write R code, using each type of loop (e.g. `for`, `while`, `repeat`) to implement the sample standard deviation of the vector `x = 1:100`

Geometric Mean
--------------

The geometric mean of *n* numbers *x*<sub>1</sub>, *x*<sub>2</sub>, …, *x*<sub>*n*</sub> is given by the following formula:

![geometric mean](lab08-images/geom_mean.png)

$$
\\bar{x} = \\left ( \\prod\_{i=1}^{n} x\_i \\right )^{1/n}
$$

Write R code, using each type of loop (e.g. `for`, `while`, `repeat`) to implement the geometric mean of the vector `x = 1:50`

------------------------------------------------------------------------

More Practice
-------------

To keep working with the basic programming concepts, take a look at the file [../hws/practice-programming-basics.pdf](practice-programming-basics.pdf)
