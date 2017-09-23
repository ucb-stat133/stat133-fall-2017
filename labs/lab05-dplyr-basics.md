Lab 5: Manipulating data frames with dplyr
================
Gaston Sanchez

> ### Learning Objectives:
>
> -   Get started with `dplyr`
> -   Get to know the basic dplyr verbs:
> -   `slice()`, `filter()`, `select()`
> -   `mutate()`
> -   `arrange()`
> -   `summarise()`
> -   `group_by()`

------------------------------------------------------------------------

Manipulating Data Frames
------------------------

Last week you started to manipulate data tables (under the class of `"data.frame"` objects) using bracket notation, `dat[ , ]`, and the dollar operator, `dat$name`, in order to select specific rows, columns, or cells.

In this lab, you will start learning about another approach to manipulate tables in R using the functionality of the package `"dplyr"`. This is a fairly recent paradigm introduced a couple of years ago, but it is based on more than a decade of research and work lead by Hadley Wickham.

NBA Players Data
----------------

The data file for this lab is the same you used last week: `nba2017-players.csv`, whic is located in the `data/` folder of the course github repository. I assume that you already downloaded a copy of the csv file to your computer. If that is not the case, here's one option to get your own copy:

``` r
# download RData file into your working directory
github <- "https://github.com/ucb-stat133/stat133-fall-2017/raw/master/"
csv <- "data/nba2017-players.csv"
download.file(url = paste0(github, csv), destfile = 'nba2017-players.csv')
```

To import the data in R you can use the base function `read.csv()`, or you can also use `read_csv()` from the package `"readr"`:

``` r
# with "base" read.csv()
dat <- read.csv('nba2017-players.csv', stringsAsFactors = FALSE)

# with "readr" read_csv()
dat <- read_csv('nba2017-players.csv')
```

------------------------------------------------------------------------

Introduction to `"dplyr"`
-------------------------

In order to use the functions in `"dplyr"`, you must load the package first. Here I'm assuming that you already installed the package. If that's not the case then run on the console the command below (do NOT include this in your `Rmd`):

``` r
install.packages("dplyr")
```

Remember that you only need to install a package once! After a package has been installed in your machine, there is no need to call `install.packages()` again on the same package. What you should always invoke in order to use the functions in a package is the `library()` function:

``` r
library(dplyr)
```

**About loading packages:** Another rule to keep in mind is to always load any required packages at the very top of your script files (`.R` or `.Rmd` or `.Rnw` files). Avoid calling the `library()` function in the middle of a script. Instead, load all the packages before anything else.

### Basic `"dplyr"` verbs

To make the learning process of `"dplyr"` gentler, Hadley Wickham proposes beginning with a set of five *basic verbs* or operations for data frames (each verb corresponds to a function in `"dplyr"`):

-   **filter**: keep rows matching criteria
-   **select**: pick columns by name
-   **arrange**: reorder rows
-   **mutate**: add new variables
-   **summarise**: reduce variables to values

------------------------------------------------------------------------

Filtering, slicing, and selecting
---------------------------------

I've modified Hadley's list of verbs a little bit. The first *verbs* I want you to learn about `"dplyr"` are `filter()`, `slice()`, and `select()`. Why? Because these are the functions to select a subset of rows and columns, which are the most essential type of operations when wrangling data frames.

`slice()` allows you to select rows by position:

``` r
# first three rows
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

`filter()` allows you to select rows by condition:

``` r
# subset rows given a condition
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

`select()` allows you to select columns by name:

``` r
# columns by name
player_height <- select(dat, player, height)
```

### Your turn:

-   use `slice()` to subset the data by selecting the first 5 rows.
-   use `slice()` to subset the data by selecting rows 10, 15, 20, ..., 50.
-   use `slice()` to subset the data by selecting the last 5 rows.
-   use `filter()` to subset those players with height less than 70 inches tall.
-   use `filter()` to subset rows of Golden State Warriors ('GSW').
-   use `filter()` to subset rows of GSW centers ('C').
-   use `filter()` and then `select()`, to subset rows of lakers ('LAL'), and then display their names.
-   use `filter()` and then `select()`, to display the name and salary, of GSW point guards
-   find how to select the name, age, and team, of players with more than 10 years of experience, making 10 million dollars or less.
-   find how to select the name, team, height, and weight, of rookie players, 20 years old, displaying only the first five occurrences (i.e. rows)

------------------------------------------------------------------------

Adding new variables: `mutate()`
--------------------------------

Another basic verb is `mutate()` which allows you to add new variables. Let's create a small data frame for the warriors with three columns: `player`, `height`, and `weight`:

``` r
# creating a small data frame step by step
gsw <- filter(dat, team == 'GSW')
gsw <- select(gsw, player, height, weight)
gsw <- slice(gsw, c(4, 8, 10, 14, 15))
gsw
```

    ##           player height weight
    ## 1 Draymond Green     79    230
    ## 2   Kevin Durant     81    240
    ## 3  Klay Thompson     79    215
    ## 4  Stephen Curry     75    190
    ## 5  Zaza Pachulia     83    270

Now, let's use `mutate()` to (temporarily) add a column with the ratio `height / weight`:

``` r
mutate(gsw, height / weight)
```

    ##           player height weight height/weight
    ## 1 Draymond Green     79    230     0.3434783
    ## 2   Kevin Durant     81    240     0.3375000
    ## 3  Klay Thompson     79    215     0.3674419
    ## 4  Stephen Curry     75    190     0.3947368
    ## 5  Zaza Pachulia     83    270     0.3074074

You can also give a new name, like: `ht_wt = height / weight`:

``` r
mutate(gsw, ht_wt = height / weight)
```

    ##           player height weight     ht_wt
    ## 1 Draymond Green     79    230 0.3434783
    ## 2   Kevin Durant     81    240 0.3375000
    ## 3  Klay Thompson     79    215 0.3674419
    ## 4  Stephen Curry     75    190 0.3947368
    ## 5  Zaza Pachulia     83    270 0.3074074

And add more columns, for example height in meters, and weight in kilograms:

``` r
mutate(gsw, ht_m = height * 0.0254, wt_kg = weight * 0.4536)
```

    ##           player height weight   ht_m   wt_kg
    ## 1 Draymond Green     79    230 2.0066 104.328
    ## 2   Kevin Durant     81    240 2.0574 108.864
    ## 3  Klay Thompson     79    215 2.0066  97.524
    ## 4  Stephen Curry     75    190 1.9050  86.184
    ## 5  Zaza Pachulia     83    270 2.1082 122.472

In order to permanently change the data, you need to assign the changes to an object:

``` r
gsw2 <- mutate(gsw, ht_m = height * 0.0254, wt_kg = weight * 0.4536)
gsw2
```

    ##           player height weight   ht_m   wt_kg
    ## 1 Draymond Green     79    230 2.0066 104.328
    ## 2   Kevin Durant     81    240 2.0574 108.864
    ## 3  Klay Thompson     79    215 2.0066  97.524
    ## 4  Stephen Curry     75    190 1.9050  86.184
    ## 5  Zaza Pachulia     83    270 2.1082 122.472

Reordering rows: `arrange()`
----------------------------

The next basic verb of `"dplyr"` is `arrange()` which allows you to reorder rows. For example, here's how to arrange the rows of `gsw` by `height`

``` r
# order rows by height (increasingly)
arrange(gsw, height)
```

    ##           player height weight
    ## 1  Stephen Curry     75    190
    ## 2 Draymond Green     79    230
    ## 3  Klay Thompson     79    215
    ## 4   Kevin Durant     81    240
    ## 5  Zaza Pachulia     83    270

By default `arrange()` sorts rows in increasing. To arrande rows in descending order you need to use the auxiliary function `desc()`.

``` r
# order rows by height (decreasingly)
arrange(gsw, desc(height))
```

    ##           player height weight
    ## 1  Zaza Pachulia     83    270
    ## 2   Kevin Durant     81    240
    ## 3 Draymond Green     79    230
    ## 4  Klay Thompson     79    215
    ## 5  Stephen Curry     75    190

``` r
# order rows by height, and then weight
arrange(gsw, height, weight)
```

    ##           player height weight
    ## 1  Stephen Curry     75    190
    ## 2  Klay Thompson     79    215
    ## 3 Draymond Green     79    230
    ## 4   Kevin Durant     81    240
    ## 5  Zaza Pachulia     83    270

------------------------------------------------------------------------

### Your Turn

-   using the data frame `gsw`, add a new variable `product` with the product of `height` and `weight`.

-   create a new data frame `gsw3`, by adding columns `log_height` and `log_weight` with the log transformations of `height` and `weight`.

-   use the original data frame to `filter()` and `arrange()` those players with height less than 71 inches tall, in increasing order.

-   display the name, team, and salary, of the top-5 highest paid players

-   display the name, team, and salary, for the top-5 highest paid players

-   display the name, team, and points3, of the top 10 three-point players

-   create a data frame `gsw_mpg` of GSW players, that contains variables for player name, experience, and `min_per_game` (minutes per game), sorted by `min_per_game` (in descending order)

------------------------------------------------------------------------

Summarizing values with `summarise()`
-------------------------------------

So far we've seen the basic verbs to select (or get access to) the elements in a data frame, such as cells, rows, and columns. We've also covered how to add new columns, and rearranging rows.

The next verb is `summarise()`. Conceptually, this involves applying a function on one or more columns, in order to summarize values. This is probably easier to understand with one example.

Say you are interested in calculating the average salary of all NBA players. To do this "a la dplyr" you use `summarise()`, or its synonym function `summarize()`:

``` r
# average salary of NBA players
summarise(dat, avg_salary = mean(salary))
```

    ##   avg_salary
    ## 1    6187014

Calculating an average like this seems a bit *verbose*, especially when you can directly use `mean()` like this:

``` r
mean(dat$salary)
```

    ## [1] 6187014

So let's make things a bit more interessting. What if you want to calculate some summary statistics for `salary`: min, median, mean, and max?

``` r
# some stats for salary (dplyr)
summarise(
  dat, 
  min = min(salary),
  median = median(salary),
  avg = mean(salary),
  max = max(salary)
)
```

    ##    min  median     avg      max
    ## 1 5145 3500000 6187014 30963450

Well, this may still look like not much. You can do the same in base R (there are actually better ways to do this):

``` r
# some stats for salary (base R)
c(min = min(dat$salary), 
  median = median(dat$salary),
  median = mean(dat$salary),
  max = max(dat$salary))
```

    ##      min   median   median      max 
    ##     5145  3500000  6187014 30963450

Grouped operations
------------------

To actually appreciate the power of `summarise()`, we need to introduce the other major basic verb in `"dplyr"`: `group_by()`. This is the function that allows you to do perform data aggregations, or *grouped operations*.

Let's see the combination of `summarise()` and `group_by()` to calculate the average salary by team:

``` r
# average salary, grouped by team
summarise(
  group_by(dat, team),
  avg_salary = mean(salary)
)
```

    ## # A tibble: 30 × 2
    ##     team avg_salary
    ##    <chr>      <dbl>
    ## 1    ATL    6491892
    ## 2    BOS    6127673
    ## 3    BRK    4363414
    ## 4    CHI    6138459
    ## 5    CHO    6683086
    ## 6    CLE    8386014
    ## 7    DAL    6139880
    ## 8    DEN    5225533
    ## 9    DET    6871594
    ## 10   GSW    6579394
    ## # ... with 20 more rows

Here's a similar example with the average salary by position:

``` r
# average salary, grouped by position
summarise(
  group_by(dat, position),
  avg_salary = mean(salary)
)
```

    ## # A tibble: 5 × 2
    ##   position avg_salary
    ##      <chr>      <dbl>
    ## 1        C    6987682
    ## 2       PF    5890363
    ## 3       PG    6069029
    ## 4       SF    6513374
    ## 5       SG    5535260

Here's a more fancy example: average weight and height, by position, displayed in desceding order by average height:

``` r
arrange(
  summarise(
    group_by(dat, position),
    avg_height = mean(height),
    avg_weight = mean(weight)),
  desc(avg_height)
)
```

    ## # A tibble: 5 × 3
    ##   position avg_height avg_weight
    ##      <chr>      <dbl>      <dbl>
    ## 1        C   83.25843   250.7978
    ## 2       PF   81.50562   235.8539
    ## 3       SF   79.63855   220.4699
    ## 4       SG   77.02105   204.7684
    ## 5       PG   74.30588   188.5765

### Your turn:

-   use `summarise()` to get the largest height value.

-   use `summarise()` to get the standard deviation of `points3`.

-   use `summarise()` and `group_by()` to display the median of three-points, by team.

-   display the average triple points by team, in ascending order, of the bottom-5 teams (worst 3pointer teams)

-   obtain the mean and standard deviation of `age`, for Power Forwards, with 5 and 10 years (including) years of experience.

------------------------------------------------------------------------
