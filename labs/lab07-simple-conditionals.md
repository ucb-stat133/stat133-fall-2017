Lab 6: Simple Conditionals
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Get into the habit of writing simple functions
> -   Making sure your functions work
> -   Understand the concept of *vectorization*

------------------------------------------------------------------------

If Conditionals
---------------

Write R code that will "squish" a number into the interval \[0, 100\], so that a number less than 0 is replaced by 0 and a number greater than 100 is replaced by 100.

``` r
z <- 100*pi
# Fill in the following if-else statements. You may (or may not) 
# have to add or subtract else if or else statements.
if (TRUE) { # Replace TRUE with a condition.
  
} else if (TRUE) { # Replace TRUE with a condition.
  
} else {
  
}
```

    ## NULL

### Multiple If's

A common situation involves working with multiple conditions at the same time. You can chain multiple if-else statements:

``` r
y <- 1 # Change this value!

if (y > 0) {
  print("positive")
} else if (y < 0) {
  print("negative")
} else {
  print("zero?")
}
```

    ## [1] "positive"

Even number
-----------

Write a function `is_even()` that determines whether a number is even (i.e. multiple of 2). If the input number is even, the output should be `TRUE`. If the input number is odd, the output should be `FALSE`. If the input is not a number, the output should be `NA`

For example:

``` r
# even number
is_even(10)
```

    ## [1] TRUE

``` r
# odd number
is_even(33)
```

    ## [1] FALSE

``` r
# not a number
is_even('a')
```

    ## [1] NA

Odd number
----------

Use your function `is_even()` to write a function `is_odd()` that determines if a number is odd (i.e. not a multiple of 2). If a number is odd, the output should be `TRUE`; if a number is even the output should be `FALSE`; if the input is not a number the output should be `NA`

For example:

``` r
# odd number
is_odd(1)
```

    ## [1] TRUE

``` r
# even number
is_odd(4)
```

    ## [1] FALSE

``` r
# not a number
is_odd('a')
```

    ## [1] NA

Switch
------

Working with multiple chained if's becomes cumbersome. Consider the following example that uses several if's to convert a day of the week into a number:

``` r
# Convert the day of the week into a number.
day <- "Tuesday" # Change this value!

if (day == 'Sunday') {
  num_day <- 1
} else {
  if (day == "Monday") {
    num_day <- 2
  } else {
    if (day == "Tuesday") {
      num_day <- 3
    } else {
      if (day == "Wednesday") {
        num_day <- 4
      } else {
        if (day == "Thursday") {
          num_day <- 5
        } else {
          if (day == "Friday") {
            num_day <- 6
          } else {
            if (day == "Saturday") {
              num_day <- 7
            }
          }
        }
      }
    }
  }
}


num_day
```

    ## [1] 3

Working with several nested if's like in the example above can be a nigthmare.

In R, you can get rid of many of the braces like this:

``` r
# Convert the day of the week into a number.
day <- "Tuesday" # Change this value!

if (day == 'Sunday') {
  num_day <- 1
} else if (day == "Monday") {
  num_day <- 2
} else if (day == "Tuesday") {
  num_day <- 3
} else if (day == "Wednesday") {
  num_day <- 4
} else if (day == "Thursday") {
  num_day <- 5
} else if (day == "Friday") {
  num_day <- 6
} else if (day == "Saturday") {
  num_day <- 7
}

num_day
```

    ## [1] 3

But still we have too many if's, and there's a lot of repetition in the code. If you find yourself using many if-else statements with identical structure for slightly different cases, you may want to consider a **switch** statement instead:

``` r
# Convert the day of the week into a number.
day <- "Tuesday" # Change this value!

switch(day, # The expression to be evaluated.
  Sunday = 1,
  Monday = 2,
  Tuesday = 3,
  Wednesday = 4,
  Thursday = 5,
  Friday = 6,
  Saturday = 7,
  NA) # an (optional) default value if there are no matches
```

    ## [1] 3

Switch statements can also accept integer arguments, which will act as indices to choose a corresponding element:

``` r
# Convert a number into a day of the week.
day_num <- 3 # Change this value!

switch(day_num,
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday")
```

    ## [1] "Tuesday"

Converting Miles to other units
-------------------------------

The table below shows the different formulas for converting miles (mi) into other scales:

| Units  | Formula         |
|--------|-----------------|
| Inches | mi x 63360      |
| Feet   | mi x 5280       |
| Yards  | mi x 1760       |
| Meters | mi / 0.00062137 |
| Kms    | mi / 0.62137    |

Write the following five functions for each type of conversion. Each function must take one argument `x` with default value: `x = 1`.

-   `miles2inches()`
-   `miles2feet()`
-   `miles2yards()`
-   `miles2meters()`
-   `miles2kms()`

For example:

``` r
miles2inches(2)
```

    ## [1] 126720

``` r
miles2feet(2)
```

    ## [1] 10560

``` r
miles2yards(2)
```

    ## [1] 3520

``` r
miles2meters(2)
```

    ## [1] 3218.694

``` r
miles2kms(2)
```

    ## [1] 3.218694

------------------------------------------------------------------------

Using switch()
--------------

Create a function `convert()` that converts miles into the specified units. Use `switch()` and the previously defined functions---`miles2inches()`, `miles2feet()`, ..., `miles2kms`---to define `convert()`. Use two arguments: `x` and `to`, like this:

``` r
convert(40, to = "in")
```

By default, `to = "km"`, but it can take values such as `"in"`, `"ft"`, `"yd"`, or `"m"`.

For instance:

``` r
convert(3, "in")
convert(3, "ft")
convert(3, "yd")
convert(3, "m")
convert(3, "km")
```

One more swtich
---------------

Write a switch statement to determine if a given lowercase letter is a vowel. Assume that "y" is not a vowel.

``` r
letter <- "e" # Change this value!

switch(letter,
  a = "vowel") # Modify as necessary.
```
