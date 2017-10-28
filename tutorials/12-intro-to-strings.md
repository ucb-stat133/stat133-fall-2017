Basic manipulation of strings
================
Gaston Sanchez

> ### Learning Objectives:
>
> -   First contact with HTML tables
> -   Read HTML tables with `readHTMLTable()`
> -   Displaying strings &lt; - Processing raw values
> -   Case-folding
> -   Substrings

------------------------------------------------------------------------

Warriors Data Set (2016-2017)
-----------------------------

During the first month of the course, you worked with a handful of data sets from NBA players obtained from the website *Basketball Reference*. Likewise, the data sets you worked with were, for the most part, already cleaned. In fact, you didn't have to worry about dealing with the raw format and transforming some of the variables.

But now we need to talk more about the **Data Preparation** process, which usually involves manipulating characters. For this tutorial we are going to consider the Roster data of Golden State Warriors (GSW, 2016-2017). The original data is in a table that is part of an html document (i.e. a webpage)

<https://www.basketball-reference.com/teams/GSW/2017.html>

![GSW Roster](../images/gsw-2017-roster.png)

I'm assuming that you clicked on the link that takes you to the page containing the Roster table. I'm also assuming that you are using google Chrome as your browser. To see the actual html format of the webpage, go to the menu bar, select *View*, click on *Developer*, and choose *View Source*. You should be able to see the content in html syntax of the html document. Don't worry if you are not familiar with html syntax, it's just another type of markup syntax like Markdown.

The important thing is the fact that html files are also text files, and they are made up of characters. Inspect the contents of the file and find the html table for the Roster data; this table should start at line 1183.

### Download the html file

The first step consists of downloading a copy of the html file. This can be done from R with the function `download.file()`:

``` r
# download html file to your working directory
url <- 'https://www.basketball-reference.com/teams/GSW/2017.html'

download.file(url, destfile = 'gsw-roster-2017.html')
```

### Import an HTML table

There are various ways to read in the content of the `gsw-roster-2017.html` file in R. Because we are just interested in the part of the file that has to do with the Roster table, we can use the function `readHTMLTable()` from the package `"XML"`

``` r
# install.packages("XML")
library(XML)
tbl <- readHTMLTable('gsw-roster-2017.html', which = 1, stringsAsFactors = FALSE)
```

       No.               Player Pos   Ht  Wt         Birth Date    Exp
    1   22          Matt Barnes  SF  6-7 226      March 9, 1980 us  13
    2   21            Ian Clark  SG  6-3 175      March 7, 1991 us   3
    3   30        Stephen Curry  PG  6-3 190     March 14, 1988 us   7
    4   35         Kevin Durant  SF  6-9 240 September 29, 1988 us   9
    5   23       Draymond Green  PF  6-7 230      March 4, 1990 us   4
    6    9       Andre Iguodala  SF  6-6 215   January 28, 1984 us  12
    7   15         Damian Jones   C  7-0 245      June 30, 1995 us   R
    8   34     Shaun Livingston  PG  6-7 192 September 11, 1985 us  11
    9    5         Kevon Looney   C  6-9 220   February 6, 1996 us   1
    10  20 James Michael McAdoo  PF  6-9 230    January 4, 1993 us   2
    11   0        Patrick McCaw  SG  6-7 185   October 25, 1995 us   R
    12   1         JaVale McGee   C  7-0 270   January 19, 1988 us   8
    13  27        Zaza Pachulia   C 6-11 270  February 10, 1984 ge  13
    14  11        Klay Thompson  SG  6-7 215   February 8, 1990 us   5
    15  18     Anderson Varejao   C 6-10 273 September 28, 1982 br  12
    16   2        Briante Weber  PG  6-2 165  December 29, 1992 us   1
    17   3           David West   C  6-9 250    August 29, 1980 us  13
                                     College
    1  University of California, Los Angeles
    2                     Belmont University
    3                       Davidson College
    4          University of Texas at Austin
    5              Michigan State University
    6                  University of Arizona
    7                  Vanderbilt University
    8                                       
    9  University of California, Los Angeles
    10          University of North Carolina
    11       University of Nevada, Las Vegas
    12            University of Nevada, Reno
    13                                      
    14           Washington State University
    15                                      
    16      Virginia Commonwealth University
    17                     Xavier University

### Case Folding

Let's begin with some basic manipulations: converting characters to lower or upper case.

``` r
# player name in lower case
tolower(tbl$Player)
```

    ##  [1] "matt barnes"          "ian clark"            "stephen curry"       
    ##  [4] "kevin durant"         "draymond green"       "andre iguodala"      
    ##  [7] "damian jones"         "shaun livingston"     "kevon looney"        
    ## [10] "james michael mcadoo" "patrick mccaw"        "javale mcgee"        
    ## [13] "zaza pachulia"        "klay thompson"        "anderson varejao"    
    ## [16] "briante weber"        "david west"

``` r
# player name in upper case
toupper(tbl$Player)
```

    ##  [1] "MATT BARNES"          "IAN CLARK"            "STEPHEN CURRY"       
    ##  [4] "KEVIN DURANT"         "DRAYMOND GREEN"       "ANDRE IGUODALA"      
    ##  [7] "DAMIAN JONES"         "SHAUN LIVINGSTON"     "KEVON LOONEY"        
    ## [10] "JAMES MICHAEL MCADOO" "PATRICK MCCAW"        "JAVALE MCGEE"        
    ## [13] "ZAZA PACHULIA"        "KLAY THOMPSON"        "ANDERSON VAREJAO"    
    ## [16] "BRIANTE WEBER"        "DAVID WEST"

------------------------------------------------------------------------

Processing Height
-----------------

Let's do something more interesting: transforming the *height* values. Focus on the column `Ht`

``` r
# height
tbl$Ht
```

    ##  [1] "6-7"  "6-3"  "6-3"  "6-9"  "6-7"  "6-6"  "7-0"  "6-7"  "6-9"  "6-9" 
    ## [11] "6-7"  "7-0"  "6-11" "6-7"  "6-10" "6-2"  "6-9"

Notice that the values of `Ht` are formed by one digit number, a dash, and another number of one or two digits. Note also that all values are of type character. How can we transform this values into a height expressed just in inches, and of data type real? Meet the `substr()` function.

### Function `substr()`

Because in this case the `Ht` values follow a simple positional structure, we can use the function `substr()`. This function takes a character vector, a starting position, and a stopping position. `substr()` produces substrings based on the given positions:

``` r
# extract feet
feet <- substr(x = tbl$Ht, start = 1, stop = 1)
feet
```

    ##  [1] "6" "6" "6" "6" "6" "6" "7" "6" "6" "6" "6" "7" "6" "6" "6" "6" "6"

``` r
# extract inches
inches <- substr(x = tbl$Ht, start = 3, stop = 4)
inches
```

    ##  [1] "7"  "3"  "3"  "9"  "7"  "6"  "0"  "7"  "9"  "9"  "7"  "0"  "11" "7" 
    ## [15] "10" "2"  "9"

Because both `feet` and `inches` are character vectors, we need to coerce them as numeric. And then we can compute the hieght in inches:

``` r
feet <- as.numeric(feet)
inches <- as.numeric(inches)
height <- feet * 12 + inches
summary(height)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   74.00   79.00   79.00   79.65   81.00   84.00

------------------------------------------------------------------------

Processing Birth Date
---------------------

Now let's look at the column `Birth Date`. To select refer to the name of this column you need to use back ticks:

``` r
tbl$`Birth Date`
```

    ##  [1] "March 9, 1980"      "March 7, 1991"      "March 14, 1988"    
    ##  [4] "September 29, 1988" "March 4, 1990"      "January 28, 1984"  
    ##  [7] "June 30, 1995"      "September 11, 1985" "February 6, 1996"  
    ## [10] "January 4, 1993"    "October 25, 1995"   "January 19, 1988"  
    ## [13] "February 10, 1984"  "February 8, 1990"   "September 28, 1982"
    ## [16] "December 29, 1992"  "August 29, 1980"

### Function `strsplit()`

How do we extract the month? Notice that month is the first word that appears before the first blank space. But names of months have different lengths, and thus different positions. So we cannot use `substr()`.

The common pattern is the first blank space, and we can use this information to **split** the strings with the function `strsplit()`:

``` r
split_date <- strsplit(x = tbl$`Birth Date`, split = " ")
head(split_date)
```

    ## [[1]]
    ## [1] "March" "9,"    "1980" 
    ## 
    ## [[2]]
    ## [1] "March" "7,"    "1991" 
    ## 
    ## [[3]]
    ## [1] "March" "14,"   "1988" 
    ## 
    ## [[4]]
    ## [1] "September" "29,"       "1988"     
    ## 
    ## [[5]]
    ## [1] "March" "4,"    "1990" 
    ## 
    ## [[6]]
    ## [1] "January" "28,"     "1984"

The object `split_date` is a list. Each element is a character vector formed by the name of the month, the day follwed by a comma, and the year.

To select the months, you would need to iterate through the elements of `split_date`, and select the first element:

``` r
# empty vector of length 0
month_names <- c()

# memory inefficient loop
for (elem in 1:5) {
  month_names <- c(month_names, split_date[[elem]][1])
}
month_names
```

    ## [1] "March"     "March"     "March"     "September" "March"

The previous code works, but it can be inefficient due to the way we are building `month_names`: at each iteration, we create a new vector `month_names` inside `c()`.

Here's another option to get the names of the months:

``` r
# empty vector of length 0
month_names <- c()

# memory inefficient loop
for (elem in 1:5) {
  month_names[elem] <- split_date[[elem]][1]
}
month_names
```

    ## [1] "March"     "March"     "March"     "September" "March"

The previous code works, but it is also inefficient because `month_names` gets expanded by one element at each iteration.

It would be better to allocate the object with the adequate length from the beginning:

``` r
# empty vector with 5 elements
month_names <- rep('', 5)

# memory efficient loop
for (elem in 1:5) {
  month_names[elem] <- split_date[[elem]][1]
}
month_names
```

    ## [1] "March"     "March"     "March"     "September" "March"

Now let's run the loop with all the month names:

``` r
month_names <- rep('', length(split_date))

for (elem in 1:length(split_date)) {
  month_names[elem] <- split_date[[elem]][1]
}
```

### Vectorized loops: `lapply()` and `sapply()`

Alternatively, you can use the `lapply()` and/or `sapply()` functions, which are vectorized loops. These functions are part of the `apply()` family, which allow you to apply a function to the elements of a given R object.

To use `lapply()` you need to identify what is the function that must be applied. In this example, the function is selecting the first value of each element in `split_date`.

Here's how to use `lapply()`, specifying a nonym function in the `FUN =` argument:

``` r
# anonym function within `lapply()`
lmonths <- lapply(split_date, FUN = function(u) u[1])
head(lmonths, n = 5)
```

    ## [[1]]
    ## [1] "March"
    ## 
    ## [[2]]
    ## [1] "March"
    ## 
    ## [[3]]
    ## [1] "March"
    ## 
    ## [[4]]
    ## [1] "September"
    ## 
    ## [[5]]
    ## [1] "March"

Notice that `lapply()` returns an R list; this is why it's *lapply*: for "list apply".

A related function is `sapply()` which attempts to return a simplified object when possible. In this example the output can be *simplified* from a list to a vector:

``` r
# anonym function within `sapply()`
month_names <- sapply(split_date, FUN = function(u) u[1])
month_names
```

    ##  [1] "March"     "March"     "March"     "September" "March"    
    ##  [6] "January"   "June"      "September" "February"  "January"  
    ## [11] "October"   "January"   "February"  "February"  "September"
    ## [16] "December"  "August"

How would you extract:

-   the day values?
-   the year values?

------------------------------------------------------------------------

Processing Experience
---------------------

You've worked with *Experience* before in a couple of assignments.

``` r
tbl$Exp
```

    ##  [1] "13" "3"  "7"  "9"  "4"  "12" "R"  "11" "1"  "2"  "R"  "8"  "13" "5" 
    ## [15] "12" "1"  "13"

The variable `Exp` contains numbers and the letter `"R"`. A value of `"R"` indicates that the player is a *Rookie*, which means the player has 0 years of experience in the NBA.

One option to replace `"R"` with zeros is with a logical subsetting operation:

``` r
experience <- tbl$Exp
experience[tbl$Exp == 'R'] <- 0
experience <- as.numeric(experience)
experience
```

    ##  [1] 13  3  7  9  4 12  0 11  1  2  0  8 13  5 12  1 13

Another option is with the `sub()` function which takes a `pattern`, a `replacement` value, and an object `x` on which to perform the substitution:

``` r
exp_years <- tbl$Exp
exp_years <- sub(pattern = 'R', replacement = 0, exp_years)
exp_years <- as.numeric(exp_years)
```
