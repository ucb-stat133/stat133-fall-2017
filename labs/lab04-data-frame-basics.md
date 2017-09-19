Lab 4: Data Frame Basics
================
Gaston Sanchez

> ### Learning Objectives:
>
> -   Get started with data frames
> -   Understand basic operations
> -   Understand bracket and dollar notations

------------------------------------------------------------------------

Manipulating Data Frames
------------------------

The most common format/structure for a data set is in a tabular format (with row and columns). When your data is in this shape, most of the times you will work with R data frames (or similar structures like a `"matrix"`, `"table"`, etc).

Learning how to manipulate data tables is among the most important *data computing* basic skills. The traditional way of manipulating data frames in R is based on bracket notation, e.g. `dat[ , ]`, to select specific rows, columns, or cells. Also, the use of the dollar `$` operator to handle columns is fundamental. In this part of the lab, you will practice a wide array of data wrangling tasks with the so-called bracket notation, and the dollar operator.

I should say that there are alternative ways for manipulating tables in R Among the most recent paradigms, there is the **plying** framework devised by Hadley Wickham. From his doctoral research, the first tools were available in the packages `"plyr"` and `"reshape"`. Nowadays we have the `"reshape2"` package, and the extremely popular package `"dplyr"` (among other packages). You will have time to learn more about `"dplyr"` in the next weeks. In the meantime, take some time to understand more about the bracket notation.

Creating data frames
--------------------

Most of the (raw) data tables you will be working with will already be in some data file. However, from time to time you will face the need of creating some sort of data table in R. In these situations, you will likely have to create such table with a data frame. So let's look at various ways to "manually"" create a data frame.

**Option 1**: The primary option to build a data frame is with `data.frame()`. You pass a series of vectors (or factors), of the same length, separated by commas. Each vector (or factor) will become a column. Preferably, give names to each column, like `col1`, `col2`, and `col3`, in the example below:

``` r
# creating a basic data frame
my_table1 <- data.frame(
  col1 = LETTERS[1:5],
  col2 = seq(from = 10, to = 50, by = 10),
  col3 = c(TRUE, TRUE, FALSE, TRUE, FALSE)
)

my_table1
```

    ##   col1 col2  col3
    ## 1    A   10  TRUE
    ## 2    B   20  TRUE
    ## 3    C   30 FALSE
    ## 4    D   40  TRUE
    ## 5    E   50 FALSE

**Option 2**: Another way to create data frames is with a `list` (of vectors or factors) converted to a data.frame with `data.frame()`.

``` r
# creating a basic data frame
my_list <- list(
  col1 = LETTERS[1:5],
  col2 = seq(from = 10, to = 50, by = 10),
  col3 = c(TRUE, TRUE, FALSE, TRUE, FALSE)
)

my_table2 <- data.frame(my_list)

my_table2
```

    ##   col1 col2  col3
    ## 1    A   10  TRUE
    ## 2    B   20  TRUE
    ## 3    C   30 FALSE
    ## 4    D   40  TRUE
    ## 5    E   50 FALSE

Remember that a `data.frame` is nothing more than a `list`. So as long as the elements in the list (vectors or factors) are of the same length, we can simply convert the list into a data frame.

By default, `data.frame()` converts character vectors into factors. You can check that by exmining the structure of the data frame with `str()`:

``` r
str(my_table2)
```

    ## 'data.frame':    5 obs. of  3 variables:
    ##  $ col1: Factor w/ 5 levels "A","B","C","D",..: 1 2 3 4 5
    ##  $ col2: num  10 20 30 40 50
    ##  $ col3: logi  TRUE TRUE FALSE TRUE FALSE

To prevent `data.frame()` from converting strings into factors, you must use the argument `stringsAsFactors = FALSE`

``` r
# strings as strings (not as factors)
my_table3 <- data.frame(
  col1 = LETTERS[1:5],
  col2 = seq(from = 10, to = 50, by = 10),
  col3 = c(TRUE, TRUE, FALSE, TRUE, FALSE),
  stringsAsFactors = FALSE
)

str(my_table3)
```

    ## 'data.frame':    5 obs. of  3 variables:
    ##  $ col1: chr  "A" "B" "C" "D" ...
    ##  $ col2: num  10 20 30 40 50
    ##  $ col3: logi  TRUE TRUE FALSE TRUE FALSE

### Your turn

Here's a table with the starting lineup of the Golden State Warriors:

| Player   | Position | Salary     | Points | PPG  | Rookie |
|----------|----------|------------|--------|------|--------|
| Thompson | SG       | 16,663,575 | 1742   | 22.3 | FALSE  |
| Curry    | PG       | 12,112,359 | 1999   | 25.3 | FALSE  |
| Green    | PF       | 15,330,435 | 776    | 10.2 | FALSE  |
| Durant   | SF       | 26,540,100 | 1555   | 25.1 | FALSE  |
| Pachulia | C        | 2,898,000  | 426    | 6.1  | FALSE  |

-   Start by creating vectors for each of the columns.
-   Create a first data frame with `data.frame()`.
-   Check that this data frame is of class `"data.frame"`, and that it is also a list.
-   Create another data frame by first starting with a `list()`, and then passing the list to `data.frame()`.
-   What would you do to obtain a data frame such that when you check its structure `str()` the variables are:
    -   *Player* as character
    -   *Position* as factor
    -   *Salary* as numeric or real (ignore the commas)
    -   *Points* as integer
    -   *PPG* as numeric or real
    -   *Rookie* as logical
-   Find out how to use the *column binding* function `cbind()` to create a tabular object (see what is the class of this object) with your vectors.
-   How could you convert the object in the previous step into a data frame?

Basic Operations
----------------

Now that you have seen some ways to create data frames, let's discuss a number of basic manipulations of data frames. I will show some examples and then you'll have the chance to put in practice the following operations:

-   Selecting table elements
    -   select a given cell
    -   select a set of cells
    -   select a given row
    -   select a set of rows
    -   select a given column
    -   select a set of columns
-   Adding a new column
-   Deleting a new column
-   Renaming a column
-   Moving a column
-   Transforming a column

Let's say you have a data frame `tbl` with the lineup of the Golden State Warriors:

        player position   salary points  ppg rookie
    1 Thompson       SG 16663575   1742 22.3  FALSE
    2    Curry       PG 12112359   1999 25.3  FALSE
    3    Green       PF 15330435    776 10.2  FALSE
    4   Durant       SF 26540100   1555 25.1  FALSE
    5 Pachulia        C  2898000    426  6.1  FALSE

#### Selecting elements

The data frame `tbl` is a 2-dimensional object: the 1st dimension corresponds to the rows, while the 2nd dimension corresponds to the columns. Because `tbl` has two dimensions, the bracket notation involves working with the data frame in this form: `tbl[ , ]`. In other words, you have to specify values inside the brackets for the 1st index, and the 2nd index: `tbl[index1, index2]`.

``` r
# select value in row 1 and column 1
tbl[1,1]
```

    ## [1] "Thompson"

``` r
# select value in row 2 and column 5
tbl[2,5]
```

    ## [1] 25.3

``` r
# select values in these cells
tbl[1:3,3:5]
```

    ##     salary points  ppg
    ## 1 16663575   1742 22.3
    ## 2 12112359   1999 25.3
    ## 3 15330435    776 10.2

If no value is specified for `index1` then all rows are included. Likewise, if no value is specified for `index2` then all columns are included.

``` r
# selecting first row
tbl[1, ]
```

    ##     player position   salary points  ppg rookie
    ## 1 Thompson       SG 16663575   1742 22.3  FALSE

``` r
# selecting third row
tbl[3, ]
```

    ##   player position   salary points  ppg rookie
    ## 3  Green       PF 15330435    776 10.2  FALSE

``` r
# selecting second column
tbl[ ,2]
```

    ## [1] "SG" "PG" "PF" "SF" "C"

``` r
# selecting columns 3 to 5
tbl[ ,3:5]
```

    ##     salary points  ppg
    ## 1 16663575   1742 22.3
    ## 2 12112359   1999 25.3
    ## 3 15330435    776 10.2
    ## 4 26540100   1555 25.1
    ## 5  2898000    426  6.1

#### Adding a column

Perhaps the simplest way to add a column is with the dollar operator `$`. You just need to give a name for the new column, and assign a vector (or factor):

``` r
# adding a column
tbl$new_column <- c('a', 'e', 'i', 'o', 'u')
tbl
```

    ##     player position   salary points  ppg rookie new_column
    ## 1 Thompson       SG 16663575   1742 22.3  FALSE          a
    ## 2    Curry       PG 12112359   1999 25.3  FALSE          e
    ## 3    Green       PF 15330435    776 10.2  FALSE          i
    ## 4   Durant       SF 26540100   1555 25.1  FALSE          o
    ## 5 Pachulia        C  2898000    426  6.1  FALSE          u

Another way to add a column is with the *column binding* function `cbind()`:

``` r
# vector of weights
weight <- c(215, 190, 230, 240, 270)

# adding weights to tbl
tbl <- cbind(tbl, weight)
tbl
```

    ##     player position   salary points  ppg rookie new_column weight
    ## 1 Thompson       SG 16663575   1742 22.3  FALSE          a    215
    ## 2    Curry       PG 12112359   1999 25.3  FALSE          e    190
    ## 3    Green       PF 15330435    776 10.2  FALSE          i    230
    ## 4   Durant       SF 26540100   1555 25.1  FALSE          o    240
    ## 5 Pachulia        C  2898000    426  6.1  FALSE          u    270

#### Deleting a column

The inverse operation of adding a column consists of **deleting** a column. This is possible with the `$` dollar operator. For instance, say you want to remove the column `new_column`. Use the `$` operator to select this column, and assign it the value `NULL` (think of this as *NULLifying* a column):

``` r
# deleting a column
tbl$new_column <- NULL
tbl
```

    ##     player position   salary points  ppg rookie weight
    ## 1 Thompson       SG 16663575   1742 22.3  FALSE    215
    ## 2    Curry       PG 12112359   1999 25.3  FALSE    190
    ## 3    Green       PF 15330435    776 10.2  FALSE    230
    ## 4   Durant       SF 26540100   1555 25.1  FALSE    240
    ## 5 Pachulia        C  2898000    426  6.1  FALSE    270

#### Renaming a column

What if you want to rename a column? There are various options to do this. One way is by changing the column names attribute:

``` r
# attributes
attributes(tbl)
```

    ## $names
    ## [1] "player"   "position" "salary"   "points"   "ppg"      "rookie"  
    ## [7] "weight"  
    ## 
    ## $row.names
    ## [1] 1 2 3 4 5
    ## 
    ## $class
    ## [1] "data.frame"

which is more commonly accessed with the `names()` function:

``` r
# column names
names(tbl)
```

    ## [1] "player"   "position" "salary"   "points"   "ppg"      "rookie"  
    ## [7] "weight"

Notice that `tbl` has a list of attributes. The element `names` is the vector of column names.

You can directly modified the vector of `names`; for example let's change `rookie` to `rooky`:

``` r
# changing `rookie` to `rooky`
attributes(tbl)$names[6] <- "rooky"

# display column names
names(tbl)
```

    ## [1] "player"   "position" "salary"   "points"   "ppg"      "rooky"   
    ## [7] "weight"

By the way: this way of changing the name of a variable is very low level, and probably unfamiliar to most useRs.

#### Moving a column

A more challenging operation is when you want to move a column to a different position. What if you want to move `salary` to the last position (last column)? One option is to create a vector of column names in the desired order, and then use this vector (for the index of columns) to reassign the data frame like this:

``` r
reordered_names <- c("player", "position", "points", "ppg", "rooky", "weight", "salary")

# moving salary at the end
tbl <- tbl[ ,reordered_names]
tbl
```

    ##     player position points  ppg rooky weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE    215 16663575
    ## 2    Curry       PG   1999 25.3 FALSE    190 12112359
    ## 3    Green       PF    776 10.2 FALSE    230 15330435
    ## 4   Durant       SF   1555 25.1 FALSE    240 26540100
    ## 5 Pachulia        C    426  6.1 FALSE    270  2898000

#### Transforming a column

A more common operation than deleting or moving a column, is to transform the values in a column. THis can be easily accomplished with the `$` operator. For instance, let's say that we want to transform `salary` from dollars to millions of dollars:

``` r
# salary in millions of dollars
tbl$salary <- tbl$salary / 1000000
tbl
```

    ##     player position points  ppg rooky weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE    215 16.66358
    ## 2    Curry       PG   1999 25.3 FALSE    190 12.11236
    ## 3    Green       PF    776 10.2 FALSE    230 15.33043
    ## 4   Durant       SF   1555 25.1 FALSE    240 26.54010
    ## 5 Pachulia        C    426  6.1 FALSE    270  2.89800

Likewise, instead of using the `$` operator, you can refer to the column with bracket notation. Here's how to transform weight from pounds to kilograms (1 pound = 0.453592 kilograms):

``` r
# weight in kilograms
tbl[ ,"weight"] <- tbl[ ,"weight"] * 0.453592
tbl
```

    ##     player position points  ppg rooky    weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE  97.52228 16.66358
    ## 2    Curry       PG   1999 25.3 FALSE  86.18248 12.11236
    ## 3    Green       PF    776 10.2 FALSE 104.32616 15.33043
    ## 4   Durant       SF   1555 25.1 FALSE 108.86208 26.54010
    ## 5 Pachulia        C    426  6.1 FALSE 122.46984  2.89800

There is also the `transform()` function which transform values *interactively*, that is, temporarily:

``` r
# transform weight to inches
transform(tbl, weight = weight / 0.453592)
```

    ##     player position points  ppg rooky weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE    215 16.66358
    ## 2    Curry       PG   1999 25.3 FALSE    190 12.11236
    ## 3    Green       PF    776 10.2 FALSE    230 15.33043
    ## 4   Durant       SF   1555 25.1 FALSE    240 26.54010
    ## 5 Pachulia        C    426  6.1 FALSE    270  2.89800

`transform()` does its job of modifying the values of `weight` but only temporarily; if you inspect `tbl` you'll see what this means:

``` r
# did weight really change?
tbl
```

    ##     player position points  ppg rooky    weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE  97.52228 16.66358
    ## 2    Curry       PG   1999 25.3 FALSE  86.18248 12.11236
    ## 3    Green       PF    776 10.2 FALSE 104.32616 15.33043
    ## 4   Durant       SF   1555 25.1 FALSE 108.86208 26.54010
    ## 5 Pachulia        C    426  6.1 FALSE 122.46984  2.89800

To make the changes permanent with `transform()`, you need to reaassign them to the data frame:

``` r
# transform weight to inches (permanently)
tbl <- transform(tbl, weight = weight / 0.453592)
tbl
```

    ##     player position points  ppg rooky weight   salary
    ## 1 Thompson       SG   1742 22.3 FALSE    215 16.66358
    ## 2    Curry       PG   1999 25.3 FALSE    190 12.11236
    ## 3    Green       PF    776 10.2 FALSE    230 15.33043
    ## 4   Durant       SF   1555 25.1 FALSE    240 26.54010
    ## 5 Pachulia        C    426  6.1 FALSE    270  2.89800

------------------------------------------------------------------------

NBA Players Data
----------------

The data file for this lab is `nba2017-players.csv`, located in the `data/` folder of the course github repository. This file contains 15 variables measured on 441 players. Download a copy of the csv file to your computer.

``` r
# download csv file into your working directory
csv <- "https://github.com/ucb-stat133/stat133-fall-2017/raw/master/data/nba2017-players.csv"
download.file(url = csv, destfile = 'nba2017-players.csv')
```

To import the data in R you can use the function `read.csv()`:

``` r
dat <- read.csv('nba2017-players.csv', stringsAsFactors = FALSE)
```

Notice that I'm specifying the argument `stringsAsFactors = FALSE` to avoid the conversion of characters into R factors. Why do you think this is a good practice?

All the default reading table functions generate a data frame. Typically, everytime I read a new data set which I'm not familiar with, or a data set that I haven't worked on in a long time, I always like to call a couple of functions to inspect its contents:

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

For a more detailed description of how R is treating the data type in each column, you should use the structure function `str()`.

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

This function `str()` displays the dimensions of the data frame, and then a list with the name of all the variables, and their data types (e.g. `chr` character, `num` real, etc). The argument `vec.len = 1` indicates that just the first element in each column should be displayed.

When working with data frames, remember to always take some time inspecting the contents, and checking how R is handling the data types. It is in these early stages of data exploration that you can catch potential issues in order to avoid disastrous consequences or bugs in subsequent stages.

------------------------------------------------------------------------

### Your turn:

Use bracket notation, the dollar operator, as well as concepts of logical subsetting and indexing to:

-   Display the last 5 rows of the data.

-   Display those rows associated to players having height less than 70 inches tall.

-   Of those players that are centers (position `C`), display their names and salaries.

-   Create a data frame `durant` with Kevin Durant's information (i.e. row).

-   Create a data frame `ucla` with the data of players from college UCLA.

-   Create a data frame `rookies` with those players with 0 years of experience.

-   Create a data frame `rookie_centers` with the data of Center rookie players.

-   Create a data frame for players with more than 50 games and more than 100 minutes played.

-   What's the largest height value?

-   What's the minimum height value?

-   What's the overall average height?

-   Who is the tallest player?

-   Who is the shortest player?

-   Which are the unique teams?

-   How many different teams?

-   Who is the oldest player?

-   What is the median salary?

-   How many players scored 4 points or less?

-   Who are those players (who scored 4 points or less)?

-   Who is the player with 0 points?

-   Are there any players from "University of California, Berkeley"? If so how many and who are they?

-   Are there any players from "University of California, Los Angeles"? If so how many and who are they?

-   Are there any players with weight greater than 260 pounds? If so how many and who are they?

-   How many players did not attend a college in the US?

-   Who is the player with the maximum rate of points per minute?

-   Who is the player with the maximum rate of three-points per minute?

-   Who is the player with the maximum rate of two-points per minute?

-   Who is the player with the maximum rate of one-points (free-throws) per minute?

### Sorting

Use `sort()`, `order()`, `rev()`, together with data frame manipulations, to:

-   Obtain height values in increasing order

-   Obtain weight values in decreasing order

-   Sort data by height in increasing order

-   Sort data by weight in decreasing order

-   Sort data by gender in increasing order

-   Sort data by species in increasing order

### Group by

Group-by operations are very common in data analytics. Without dedicated functions, these operations tend to be very hard (labor intensive).

**Quick try**: Using just bracket notation, try to create a data frame with two columns: the team name, and the team payroll (addition of all player salaries).

So what functions can you use in R to perform group by operations? In base R, there are two major functions: `aggregate()` and `tapply()`

-   Create a data frame with the the average height, average weight, and average age per team.

------------------------------------------------------------------------
