Lab 4: Basics of dplyr
================
Gaston Sanchez

> ### Learning Objectives:
>
> -   Get started with `dplyr`
> -   Understand basic verbs
> -   Understand the pipe `%>%` operator
> -   How to install packages

------------------------------------------------------------------------

Manipulating Data Frames
------------------------

The most common format/structure for a data set is in a tabular format, with row and columns. When your data is in this shape, most of the times you will work with R data frames (or similar structures).

You need to learn how to manipulate data tables. In the past (before 2014), R users manipulated data frames using bracket notation, e.g. `dat[ , ]`, in order to select specific rows, columns, or cells. This is still possible and it is a good skill to learn. But nowadays there is an interesting alternative for *data wrangling* provided with the functionality of the package `"dplyr"`.

NBA Players Data
----------------

The data for this lab is in the file `nba2017-players.csv`, which as you may guess, contains 15 variables measured on 441 players.

To import the data in R you can use the function `read.csv()`:

``` r
dat <- read.csv('../data/nba2017-players.csv', stringsAsFactors = FALSE)
```

Notice that I'm spcifying the argument `stringsAsFactors = FALSE` to avoid the conversion of characters into R factors. Why do you think this is a good practice?

All the default reading table functions generate a data frame. Typically, everytime I read new data set which I'm not familiar with, or a data set that I haven't worked on in a long time, I always like to call a couple of functions to inspect its contents:

-   `dim()`
-   `head()`
-   `tail()`
-   `str()`
-   `summary()`

A first check-up is to examine the dimensions of the data frame with `dim()`:

``` r
# dimensions (# of rows, # of columns)
dim(dat)
```

    ## [1] 441  15

If you know in advanced how many rows and columns are in the data table, this is a good way to make sure that R was able to read all the records.

Then, depending on the size of the data, you may want to take a peek at its contents with `head()` or `tail()`, just to get an idea of what the data looks like:

``` r
# display first few rows
head(dat)
```

    ##              player team position height weight age experience
    ## 1        Al Horford  BOS        C     82    245  30          9
    ## 2      Amir Johnson  BOS       PF     81    240  29         11
    ## 3     Avery Bradley  BOS       SG     74    180  26          6
    ## 4 Demetrius Jackson  BOS       PG     73    201  22          0
    ## 5      Gerald Green  BOS       SF     79    205  31          9
    ## 6     Isaiah Thomas  BOS       PG     69    185  27          5
    ##                         college   salary games minutes points points3
    ## 1         University of Florida 26540100    68    2193    952      86
    ## 2                               12000000    80    1608    520      27
    ## 3 University of Texas at Austin  8269663    55    1835    894     108
    ## 4      University of Notre Dame  1450000     5      17     10       1
    ## 5                                1410598    47     538    262      39
    ## 6      University of Washington  6587132    76    2569   2199     245
    ##   points2 points1
    ## 1     293     108
    ## 2     186      67
    ## 3     251      68
    ## 4       2       3
    ## 5      56      33
    ## 6     437     590

For a more detailed description of how R is treating the data type in each column, you should use the structure function `str()`

``` r
# check the structure
str(dat, vec.len = 1)
```

    ## 'data.frame':    441 obs. of  15 variables:
    ##  $ player    : chr  "Al Horford" ...
    ##  $ team      : chr  "BOS" ...
    ##  $ position  : chr  "C" ...
    ##  $ height    : int  82 81 ...
    ##  $ weight    : int  245 240 ...
    ##  $ age       : int  30 29 ...
    ##  $ experience: int  9 11 ...
    ##  $ college   : chr  "University of Florida" ...
    ##  $ salary    : num  26540100 ...
    ##  $ games     : int  68 80 ...
    ##  $ minutes   : int  2193 1608 ...
    ##  $ points    : int  952 520 ...
    ##  $ points3   : int  86 27 ...
    ##  $ points2   : int  293 186 ...
    ##  $ points1   : int  108 67 ...

When working with data frames, remember to always take some time inspecting the contents, and checking how R is handling the data types. It is in these early stages of data exploration that you can catch potential issues in order to avoid (disastrous?) consequences or bugs in subsequent stages.

To get information about how R is treating the columns in a data frame you can use the function `str()`. This function displays the dimensions of the data frame, and then a list with the name of all the variables, and their data types (e.g. `chr` character, `num` real, etc). The argument `vec.len = 1` indicates that just the first element in each column should be displayed.

Introduction to `"dplyr"`
-------------------------

In order to use the functions in `"dplyr"`, you must load the package first. Here I'm assuming that you already installed the package. If that's not the case the run:

``` r
install.packages("dplyr")
```

Remember that you only need to install a package once! After a package has been installed in your machine, there is no need to call `install.packages()` again on the same package. What you should always invoke in order to use the functions in a package is the `library()` function:

``` r
library(dplyr)
```

**About loading packages:** Another rule to keep in mind is to always load any required packages at the very top of your scripts (`.R` or `.Rmd` or `.Rnw` files). Avoid calling the `library()` function in the middle of a script. Instead, load all the packages before anything else.

### Basic `"dplyr"` verbs

The first *verbs* to learn about `"dplyr"` are `filter()`, `slice()`, and `select()`. Why? Because these are the functions to select a subset of rows and columns, which are the most essential type of operations when wrangling data frames.

Select rows by position with `slice()`

``` r
slice(dat, 1:3)
```

    ##          player team position height weight age experience
    ## 1    Al Horford  BOS        C     82    245  30          9
    ## 2  Amir Johnson  BOS       PF     81    240  29         11
    ## 3 Avery Bradley  BOS       SG     74    180  26          6
    ##                         college   salary games minutes points points3
    ## 1         University of Florida 26540100    68    2193    952      86
    ## 2                               12000000    80    1608    520      27
    ## 3 University of Texas at Austin  8269663    55    1835    894     108
    ##   points2 points1
    ## 1     293     108
    ## 2     186      67
    ## 3     251      68

Select rows by condition with `filter()`

``` r
filter(dat, height > 85)
```

    ##               player team position height weight age experience
    ## 1        Edy Tavares  CLE        C     87    260  24          1
    ## 2   Boban Marjanovic  DET        C     87    290  28          1
    ## 3 Kristaps Porzingis  NYK       PF     87    240  21          1
    ## 4        Roy Hibbert  DEN        C     86    270  30          8
    ## 5      Alexis Ajinca  NOP        C     86    248  28          6
    ##                 college  salary games minutes points points3 points2
    ## 1                          5145     1      24      6       0       3
    ## 2                       7000000    35     293    191       0      72
    ## 3                       4317720    66    2164   1196     112     331
    ## 4 Georgetown University 5000000     6      11      4       0       2
    ## 5                       4600000    39     584    207       0      89
    ##   points1
    ## 1       0
    ## 2      47
    ## 3     198
    ## 4       0
    ## 5      29

Select columns by name with `select()`

``` r
player_height <- select(dat, player, height)
```

### Your turn:

-   subset the data by selecting the last 5 rows.
-   select those players with height less than 70 inches tall.
-   of those players that are centers (position `C`), select their names and salaries.
-   display the names of the lakers (`'LAL'`).

Your Turn
---------

Use functions in `"dplyr"` to answer the following questions:

-   What's the largest height value?

-   What's the minimum height value?

-   What's the overall average height?

-   Who is the tallest player?

-   Who is the shortest player?

-   Which are the unique teams?

-   How many different teams?

-   Who is the oldest player?

-   What is the median salary?

-   Are there any players from "University of California, Berkeley"? If so how many and who are they?

-   Are there any players from "University of California, Los Angeles"? If so how many and who are they?

-   Are there any players with weight greater than 260 pounds? If so how many and who are they?

### Sorting

-   Obtain height values in increasing order

-   Obtain weight values in decreasing order

-   Sort data by height in increasing order

-   Sort data by weight in decreasing order

-   Sort data by gender in increasing order

-   Sort data by species in increasing order

------------------------------------------------------------------------

``` r
# =====================================================
# Subsetting operations
# =====================================================

# create a data frame `durant` with Kevin Durant's information (i.e. row)


# create a data frame `ucla` with the data of players from college UCLA


# create a data frame `rookies` 
# with those players with 0 years of experience 


# create a data frame `rookie_centers` with the data of Center rookie players 


# create a data frame for players with more than 50 games 
# and more than 100 minutes


#
```

------------------------------------------------------------------------

``` r
# =====================================================
# More Wrangling
# =====================================================

# get the data of those above the average weight?


# how many unarmed humans?


# standard deviation of weight in non-humans 


# which humans use a lightsaber


# median height of unarmed non-humans


# add a column 'weight_kgm' for weight to kilograms


# get the log of height for players
# with age less than or equal to 25 years


#
```

------------------------------------------------------------------------

Solutions
---------

``` r
# selecting the last 5 rows
slice(dat, 15:20)

# individuals with height < 1.6, and of human species
filter(dat, height < 1.6 & species == "human")

# display names and jedi status of humans
humans <- filter(dat, species == "human")
select(humans, name, jedi)

# display the names of jedis
jedis <- filter(dat, jedi == "yes_jedi")
select(jedis, name)
```
