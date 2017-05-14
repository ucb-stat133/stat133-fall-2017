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

Star Wars Data
--------------

The data for this lab is in the file `starwars.csv`, which as you may guess, contains 13 variables measured on 20 famous characters of the Star Wars universe.

To import the data in R you can use the function `read.csv()`:

``` r
dat <- read.csv('../data/starwars.csv', stringsAsFactors = FALSE)
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

    ## [1] 20 13

If you know in advanced how many rows and columns are in the data table, this is a good way to make sure that R was able to read all the records.

Then, depending on the size of the data, you may want to take a peek at its contents with `head()` or `tail()`, just to get an idea of what the data looks like:

``` r
# display first few rows
head(dat)
```

    ##               name gender height weight eyecolor haircolor skincolor
    ## 1 Anakin Skywalker   male   1.88   84.0     blue     blond      fair
    ## 2    Padme Amidala female   1.65   45.0    brown     brown     light
    ## 3   Luke Skywalker   male   1.72   77.0     blue     blond      fair
    ## 4   Leia Skywalker female   1.50   49.0    brown     brown     light
    ## 5     Qui-Gon Jinn   male   1.93   88.5     blue     brown     light
    ## 6   Obi-Wan Kenobi   male   1.82   77.0 bluegray    auburn      fair
    ##     homeland    born     died     jedi species     weapon
    ## 1   Tatooine 41.9BBY     4ABY yes_jedi   human lightsaber
    ## 2      Naboo   46BBY    19BBY  no_jedi   human    unarmed
    ## 3   Tatooine   19BBY unk_died yes_jedi   human lightsaber
    ## 4   Alderaan   19BBY unk_died  no_jedi   human    blaster
    ## 5 unk_planet   92BBY    32BBY yes_jedi   human lightsaber
    ## 6    Stewjon   57BBY     0BBY yes_jedi   human lightsaber

For a more detailed description of how R is treating the data type in each column, you should use the structure function `str()`

``` r
# check the structure
str(dat, vec.len = 1)
```

    ## 'data.frame':    20 obs. of  13 variables:
    ##  $ name     : chr  "Anakin Skywalker" ...
    ##  $ gender   : chr  "male" ...
    ##  $ height   : num  1.88 1.65 ...
    ##  $ weight   : num  84 45 ...
    ##  $ eyecolor : chr  "blue" ...
    ##  $ haircolor: chr  "blond" ...
    ##  $ skincolor: chr  "fair" ...
    ##  $ homeland : chr  "Tatooine" ...
    ##  $ born     : chr  "41.9BBY" ...
    ##  $ died     : chr  "4ABY" ...
    ##  $ jedi     : chr  "yes_jedi" ...
    ##  $ species  : chr  "human" ...
    ##  $ weapon   : chr  "lightsaber" ...

When working with data frames, remember to always take some time inspecting the contents, and checking how R is handling the data types. It is in these early stages of data exploration that you can catch potential issues in order to avoid (disastrous?) consequences or bugs in subsequent stages.

To get information about how R is treating the columns in a data frame you can use the function `str()`. This function displays the dimensions of the data frame, and then a list with the name of all the variables, and their data types (e.g. `chr` character, `num` real, etc). The argument `vec.len = 1` indicates that just the first element in each column should be displayed.

Introduction to `"dplyr"`
-------------------------

In order to use the functions in `"dplyr"`, you must load the package first. Here I'm assuming that you already installed the package. If that's not the case the run:

``` r
install.packages("dplyr")
```

Remember that you only need to install a package once! After a package has been installed in your machine, there is no need to call `install.packages()` on the same package. What you should always invoke in order to use the functions in a package is the `library()` function:

``` r
library(dplyr)
```

**About loading packages:** Another rule to keep in mind is to always load any required packages at the very top of your scripts (`.R` or `.Rmd` or `.Rnw` files). Avoid calling the `library()` function in the middle of a script. Instead, load all the packages before anything else.

### Basic `"dplyr"` verbs

The first *verbs* to learn about `"dplyr"` are `filter()`, `slice()`, and `select()`. Why? Because these are the functions to select a subset of rows and columns, the most essential type of operation when wrangling with data frames.

Select rows by position with `slice()`

``` r
slice(dat, 1:3)
```

    ##               name gender height weight eyecolor haircolor skincolor
    ## 1 Anakin Skywalker   male   1.88     84     blue     blond      fair
    ## 2    Padme Amidala female   1.65     45    brown     brown     light
    ## 3   Luke Skywalker   male   1.72     77     blue     blond      fair
    ##   homeland    born     died     jedi species     weapon
    ## 1 Tatooine 41.9BBY     4ABY yes_jedi   human lightsaber
    ## 2    Naboo   46BBY    19BBY  no_jedi   human    unarmed
    ## 3 Tatooine   19BBY unk_died yes_jedi   human lightsaber

Select rows by condition with `filter()`

``` r
filter(dat, height > 1.9)
```

    ##           name gender height weight eyecolor haircolor skincolor
    ## 1 Qui-Gon Jinn   male   1.93   88.5     blue     brown     light
    ## 2        Dooku   male   1.93   86.0    brown     brown     light
    ## 3    Chewbacca   male   2.28  112.0     blue     brown      <NA>
    ## 4        Jabba   male   3.90     NA   yellow      none tan-green
    ## 5     Grievous   male   2.16  159.0     gold     black    orange
    ##     homeland     born  died     jedi species      weapon
    ## 1 unk_planet    92BBY 32BBY yes_jedi   human  lightsaber
    ## 2    Serenno   102BBY 19BBY yes_jedi   human  lightsaber
    ## 3   Kashyyyk   200BBY 25ABY  no_jedi wookiee   bowcaster
    ## 4   Tatooine unk_born  4ABY  no_jedi    hutt     unarmed
    ## 5      Kalee unk_born 19BBY  no_jedi kaleesh slugthrower

Select columns by name with `select()`

``` r
select(dat, name, height)
```

    ##                name height
    ## 1  Anakin Skywalker   1.88
    ## 2     Padme Amidala   1.65
    ## 3    Luke Skywalker   1.72
    ## 4    Leia Skywalker   1.50
    ## 5      Qui-Gon Jinn   1.93
    ## 6    Obi-Wan Kenobi   1.82
    ## 7          Han Solo   1.80
    ## 8   Sheev Palpatine   1.73
    ## 9             R2-D2   0.96
    ## 10            C-3PO   1.67
    ## 11             Yoda   0.66
    ## 12       Darth Maul   1.75
    ## 13            Dooku   1.93
    ## 14        Chewbacca   2.28
    ## 15            Jabba   3.90
    ## 16 Lando Calrissian   1.78
    ## 17        Boba Fett   1.83
    ## 18       Jango Fett   1.83
    ## 19         Grievous   2.16
    ## 20     Chief Chirpa   1.00

### Your turn:

-   subset the data by selecting the last 5 rows
-   select those individuals with height less than 1.6 meters tall, and of human species
-   of those individuals that are human, select their names and jedi status
-   display the names of jedis

Your Turn
---------

Use functions in `"dplyr"` to answer the following questions:

-   What's the largest height value?

-   What's the minimum height value?

-   What's the overall average height?

-   Who has the smallest height?

-   Who has the largest height?

-   What are the unique weapons?

-   How many different species?

-   Who is the individual with the shortest height?

-   Are there any subjects with weapon "knife"? If so how many and who are they?

-   Are there any subjects with height &gt; 2 meters? If so how many and who are they?

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

# create a data frame `han` with Han Solo's information (i.e. row)


# create a data frame `males` with the data of male subjects


# get the data for those subjects 
# with height less than 1.7 


# get the data for subjects with 
# height less than 1.7 and weight less than 50


# create a data frame `droids_humans` with the data of droids or humans


# create a data frame `non_humans` with the data of non-humans


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


# get the square weight of non-jedis


# get the log of height for subjects
# with blaster or bowcaster weapons


# create a new variable "newvar": height divided by weight


# add 'newvar' to the data frame sw


#
```

------------------------------------------------------------------------

Solutions
---------

``` r
# selecting the last 5 rows
slice(dat, 15:20)
```

    ##               name gender height weight eyecolor haircolor skincolor
    ## 1            Jabba   male   3.90     NA   yellow      none tan-green
    ## 2 Lando Calrissian   male   1.78     79    brown     blank      dark
    ## 3        Boba Fett   male   1.83     78    brown     black     brown
    ## 4       Jango Fett   male   1.83     79    brown     black     brown
    ## 5         Grievous   male   2.16    159     gold     black    orange
    ## 6     Chief Chirpa   male   1.00     50    black      gray     brown
    ##      homeland     born     died    jedi species      weapon
    ## 1    Tatooine unk_born     4ABY no_jedi    hutt     unarmed
    ## 2     Socorro    31BBY unk_died no_jedi   human     blaster
    ## 3      Kamino  31.5BBY unk_died no_jedi   human     blaster
    ## 4 ConcordDawn    66BBY    22BBY no_jedi   human     blaster
    ## 5       Kalee unk_born    19BBY no_jedi kaleesh slugthrower
    ## 6       Endor unk_born     4ABY no_jedi    ewok       spear

``` r
# individuals with height < 1.6, and of human species
filter(dat, height < 1.6 & species == "human")
```

    ##             name gender height weight eyecolor haircolor skincolor
    ## 1 Leia Skywalker female    1.5     49    brown     brown     light
    ##   homeland  born     died    jedi species  weapon
    ## 1 Alderaan 19BBY unk_died no_jedi   human blaster

``` r
# display names and jedi status of humans
humans <- filter(dat, species == "human")
select(humans, name, jedi)
```

    ##                name     jedi
    ## 1  Anakin Skywalker yes_jedi
    ## 2     Padme Amidala  no_jedi
    ## 3    Luke Skywalker yes_jedi
    ## 4    Leia Skywalker  no_jedi
    ## 5      Qui-Gon Jinn yes_jedi
    ## 6    Obi-Wan Kenobi yes_jedi
    ## 7          Han Solo  no_jedi
    ## 8   Sheev Palpatine  no_jedi
    ## 9             Dooku yes_jedi
    ## 10 Lando Calrissian  no_jedi
    ## 11        Boba Fett  no_jedi
    ## 12       Jango Fett  no_jedi

``` r
# display the names of jedis
jedis <- filter(dat, jedi == "yes_jedi")
select(jedis, name)
```

    ##               name
    ## 1 Anakin Skywalker
    ## 2   Luke Skywalker
    ## 3     Qui-Gon Jinn
    ## 4   Obi-Wan Kenobi
    ## 5             Yoda
    ## 6            Dooku
