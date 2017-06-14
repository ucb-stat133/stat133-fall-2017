Vectors and other data structures
================
Gaston Sanchez

> ### Learning Objectives
>
> -   Work with vectors of different data types
> -   Understand the concept of *atomic* structures
> -   Learn how to subset and slice R vectors
> -   Understand the concept of *vectorization*
> -   Understand *recycling* rules in R

------------------------------------------------------------------------

NBA Data
--------

In this tutorial, we are going to consider the starting lineup for the Golden State Warriors:

| Player   | Position | Salary     | Points | PPG  | Rookie |
|----------|----------|------------|--------|------|--------|
| Thompson | SG       | 16,663,575 | 1742   | 22.3 | FALSE  |
| Curry    | PG       | 12,112,359 | 1999   | 25.3 | FALSE  |
| Green    | PF       | 15,330,435 | 776    | 10.2 | FALSE  |
| Durant   | SF       | 26,540,100 | 1555   | 25.1 | FALSE  |
| Pachulia | C        | 2,898,000  | 426    | 6.1  | FALSE  |

From the statistical point of view, we can say that there are six variables measured on five individuals. How would you characterize each variable: quantitative -vs- qualitative?

From the programming point of view, what type of data would you use to encode each variable: character, boolean, integer, real?

Vectors in R
------------

Vectors are the most basic type of data structures in R. Learning how to manipulate data structures in R requires you to start learning how to manipulate vectors.

### Creating vectors with `c()`

Among the main functions to work with vectors we have the **combine** function `c()`. This is the workhorse function to create vectors in R. Here's how to create a vector for the players with `c()`:

``` r
player <- c('Thompson', 'Curry', 'Green', 'Durant', 'Pachulia')
```

You can use the same function to create vectors `position`, `salary`, and `ppg`

``` r
position <- c('SG', 'PG', 'PF', 'SF', 'C')
salary <- c(16663575, 12112359, 15330435, 26540100, 2898000)
ppg <- c(22.3, 25.3, 10.2, 25.1, 6.1)
```

As for `rooky` you can still use `c()` or also the repetition function `rep()`:

``` r
rooky <- c(FALSE, FALSE, FALSE, FALSE, FALSE)

# alternatively
rooky <- rep(FALSE, 5)
```

### Vectors are Atomic structures

The first thing you should learn about R vectors is that they are **atomic structures**, which is just the fancy name to indicate that all the elements of a vector must be of the same type, either all numbers, all characters, or all logical values.

How do you know that a given vector is of a certain data type? There are several functions that allow you to answer this question:

-   `typeof()`
-   `class()`
-   `mode()`

Using `typeof()`

``` r
typeof(player)
```

    ## [1] "character"

``` r
typeof(salary)
```

    ## [1] "double"

``` r
typeof(ppg)
```

    ## [1] "double"

``` r
typeof(rooky)
```

    ## [1] "logical"

Using `mode()`

``` r
mode(player)
```

    ## [1] "character"

``` r
mode(salary)
```

    ## [1] "numeric"

``` r
mode(ppg)
```

    ## [1] "numeric"

``` r
mode(rooky)
```

    ## [1] "logical"

Manipulating Vectors: Subsetting
--------------------------------

Subsetting refers to extracting elements of a vector (or another R object). To do so, you use what is known as **bracket notation**. This implies using (square) brackets `[ ]` to get access to the elements of a vector:

``` r
# first element
player[1]
```

    ## [1] "Thompson"

``` r
# first three elements
player[1:3]
```

    ## [1] "Thompson" "Curry"    "Green"

What type of things can you specify inside the brackets? Basically:

-   numeric vectors
-   logical vectors (the length of the logical vector must match the length of the vector to be subset)
-   character vectors (if the elements have names)

### Subsetting with Numeric Indices

Here are some subsetting examples using a numeric vector inside the brackets:

``` r
# fifth element of 'player'
player[4]
```

    ## [1] "Durant"

``` r
# numeric range
player[2:4]
```

    ## [1] "Curry"  "Green"  "Durant"

``` r
# numeric vector
player[c(1, 3)]
```

    ## [1] "Thompson" "Green"

``` r
# different order
player[c(3, 1, 2)]
```

    ## [1] "Green"    "Thompson" "Curry"

``` r
# third element (four times)
player[rep(3, 4)]
```

    ## [1] "Green" "Green" "Green" "Green"

### Subsetting with Logical Indices

Logical subsetting involves using a logical vector inside the brackets. This type of subsetting is very powerful because it allows you to extract elements based on some logical condition.

To do logical subsetting, the vector that you put inside the brackets, must match the length of the manipulated vector.

Here are some examples of logical subsetting:

``` r
# salary of Durant
salary[player == 'Durant']
```

    ## [1] 26540100

``` r
# name of players with more than 24 points per game
player[ppg > 24]
```

    ## [1] "Curry"  "Durant"

``` r
# name of players with salary between 10 and 20 millions (exclusive)
player[salary > 10000000 & salary < 20000000]
```

    ## [1] "Thompson" "Curry"    "Green"

``` r
# name of players with salary between 10 and 20 millions (inclusive)
player[salary >= 10000000 & salary <= 20000000]
```

    ## [1] "Thompson" "Curry"    "Green"

### Subsetting with Character Vectors

A third type of subsetting involves passing a character vector inside brackets. When you do this, the characters are supposed to be names of the manipulated vector.

None of the vectors `player`, `salary`, and `ppg`, have names. You can confirm that with the `names()` function applied on any of the vectors:

``` r
names(salary)
```

    ## NULL

Create a new vector `millions` by converting `salary` into millions, and then assign `player` as the names of `millions`

``` r
# create 'millions', rounded to 2 decimals
millions <- round(salary / 1000000, 2)

# assign 'player' as names of 'millions'
names(millions) <- player
```

You should have a vector `millions` with named elements. Now you can use character subsetting:

``` r
millions["Durant"]
```

    ## Durant 
    ##  26.54

``` r
millions[c("Green", "Curry", "Pachulia")]
```

    ##    Green    Curry Pachulia 
    ##    15.33    12.11     2.90

### Adding more elements

Related with subsetting, you can consider adding more elements to a given vector. For example, say you want to include data for three more players: Iguodala, McCaw, and Jones:

| Player   | Position | Salary     | Points | PPG | Rookie |
|----------|----------|------------|--------|-----|--------|
| Iguodala | SF       | 11,131,368 | 574    | 7.6 | FALSE  |
| McCaw    | SG       | 543,471    | 282    | 4.0 | TRUE   |
| Jones    | C        | 1,171,560  | 19     | 1.9 | TRUE   |

You can use bracket notation to add more elements:

``` r
player[6] <- 'Iguodala'
player[7] <- 'McCaw'
player[8] <- 'Jones'
```

Another option is to use `c()` to combine a vector with more values like this:

``` r
position <- c(position, 'SF', 'SG', 'C')
rooky <- c(rooky, FALSE, TRUE, TRUE)
```

Of course, you can combine both options:

``` r
salary[6] <- 11131368
salary <- c(salary, 543471, 1171560)
```

Vectorization
-------------

Say you want to create a vector `log_salary` by taking the logarithm of salaries:

``` r
log_salary <- log(salary)
```

When you create the vector `log_salary`, what you're doing is applying a function to a vector, which in turn acts on all elements of the vector.

This is called **Vectorization** in R parlance. Most functions that operate with vectors in R are **vectorized** functions. This means that an action is applied to all elements of the vector without the need to explicitly type commands to traverse all the elements.

In many other programming languages, you would have to use a set of commands to loop over each element of a vector (or list of numbers) to transform them. But not in R.

Another example of vectorization would be the calculation of the square root of all the points per game `ppg`:

``` r
sqrt(ppg)
```

    ## [1] 4.722288 5.029911 3.193744 5.009990 2.469818

Or the conversion of `salary` into millions:

``` r
salary / 1000000 
```

### Why should you care about vectorization?

If you are new to programming, learning about R's vectorization will be very natural (you won't stop to think about it too much). If you have some previous programming experience in other languages (e.g. C, python, perl), you know that vectorization does not tend to be a native thing.

Vectorization is essential in R. It saves you from typing many lines of code, and you will exploit vectorization with other useful functions known as the *apply* family functions (we'll talk about them later in the course).

Recycling
---------

Closely related with the concept of *vectorization* we have the notion of **Recycling**. To explain *recycling* let's see an example.

`salary` is given in dollars, but what if you need to obtain the salaries in euros?. Let's create a new vector `euros` with the converted salaries in euros. To convert from dollars to euros use the following conversion: 1 dollar = 0.9 euro

``` r
# your code here
```

What you just did (assuming that you did things correctly) is called **Recycling**. To understand this concept, you need to remember that R does not have a data structure for scalars (single numbers). Scalars are in reality vectors of length 1.

Converting dollars to euros requires this operation: `salary * 0.9`. Although it may not be obvious, we are multiplying two vectors: `salary` and `0.9`. Moreover (and more important) **we are multiplying two vectors of different lengths!**. So how does R know what to do in this cases?

Well, R uses the **recycling rule**, which takes the shorter vector (in this case `0.9`) and recycles its elements to form a temporary vector that matches the length of the longer vector (i.e. `salary`).

### Another recycling example

Here's another example of recycling. Salaries of elements in an odd number positions will be divided by two; salaries of elements in an even number position will be divided by 10:

``` r
units <- c(1/2, 1/10)
new_salary <- salary * units
```

The elements of `units` are recycled and repeated as many times as elements in `salary`. The previous command is equivalent to this:

``` r
new_units <- rep(c(1/2, 1/10), length.out = length(salary))
salary * new_units
```

------------------------------------------------------------------------

Factors
-------

As mentioned before, vectors are the most essential type of data structure in R. They are *atomic* structures (can contain only one type of data): integers, real numbers, logical values, characters, complex numbers.

Related to vectors, there is another important data structure in R called **factor**. Factors are data structures exclusively designed to handle categorical data.

The term *factor* as used in R for handling categorical variables, comes from the terminology used in *Analysis of Variance*, commonly referred to as ANOVA. In this statistical method, a categorical variable is commonly referred to as *factor* and its categories are known as *levels*.

### Creating Factors

To create a factor you use the homonym function `factor()`, which takes a vector as input. The vector can be either numeric, character or logical.

Looking at the available variables, we can treat *Position* and *Rooky* as categorical variables. This means that we can convert the corresponding vectors `position`, and `rooky` into factors.

``` r
# convert to factor
position <- factor(position)

position
```

    ## [1] SG PG PF SF C  SF SG C 
    ## Levels: C PF PG SF SG

``` r
rooky <- factor(rooky)
```

Notice how `position` and `rooky` are displayed. Even though the elements are the same in both the vector and the factor, they are printed in different formats. The letters in the factor are printed without quotes.

### How does R store factors?

Under the hood, a factor is internally stored using two arrays (R vectors): one is an integer array containing the values of the categories, the other array is the "levels" which has the names of categories which are mapped to the integers.

One way to confirm that the values of the categories are mapped as integers is by using the function `storage.mode()`

``` r
# storage of factor
storage.mode(position)
```

    ## [1] "integer"

### Manipulating Factors

Because factors are internally stored as integers, you can manipulate factors as any other vector:

``` r
position[1:5]
```

    ## [1] SG PG PF SF C 
    ## Levels: C PF PG SF SG

``` r
position[c(1, 3, 5)]
```

    ## [1] SG PF C 
    ## Levels: C PF PG SF SG

``` r
position[rep(1, 5)]
```

    ## [1] SG SG SG SG SG
    ## Levels: C PF PG SF SG

``` r
rooky[player == 'Iguodala']
```

    ## [1] FALSE
    ## Levels: FALSE TRUE

``` r
rooky[player == 'McCaw']
```

    ## [1] TRUE
    ## Levels: FALSE TRUE

### Why using R factors?

When or/and why to use factors? The simplest answer is: use R factors when you want to handle categorical data as such. Often, statisticians think about variables as categorical data, expressed in several scales: binary, nominal, and ordinal. And R lets you handle this type of data through factors. Many functions in R are specifically dedicated for factors, and you can (should) take advantage of such behavior.

------------------------------------------------------------------------
