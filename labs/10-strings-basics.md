Lab 10: Basics of strings manipulations
================
Gaston Sanchez

> ### Learning Objectives
>
> -   String manipulation
> -   Base R functions

------------------------------------------------------------------------

The purpose of this lab is to work with some functions to do basic manipulation of strings. You will be using the row names of the data frame `USArrests` (this data comes already in R):

``` r
head(USArrests)
```

    ##            Murder Assault UrbanPop Rape
    ## Alabama      13.2     236       58 21.2
    ## Alaska       10.0     263       48 44.5
    ## Arizona       8.1     294       80 31.0
    ## Arkansas      8.8     190       50 19.5
    ## California    9.0     276       91 40.6
    ## Colorado      7.9     204       78 38.7

``` r
states <- rownames(USArrests)
head(states)
```

    ## [1] "Alabama"    "Alaska"     "Arizona"    "Arkansas"   "California"
    ## [6] "Colorado"

Some functions that you may need to use:

-   `nchar()`
-   `tolower()`
-   `toupper()`
-   `casefold()`
-   `paste()`
-   `paste0()`
-   `substr()`

Number of characters
--------------------

`nchar()` allows you to count the number of characters in a string. Use it on `states` to get the number of characters of each state:

``` r
# number of characters
```

### Case folding

There are 3 functions to do case-folding: `tolower()`, `toupper()`, and `casefold()`. Apply each function on `states` to see what happens:

``` r
# to lower case
```

``` r
# to upper case
```

``` r
# case folding (upper = TRUE)
```

``` r
# case folding (upper = FALSE)
```

### Length of State Names

We just saw how to use `nchar()` to count the number of characters in each state name:

``` r
# number of charcaters
num_chars <- nchar(states)
```

Use the vector `num_chars` to obtain a frequency table called `char_freqs`, and then plot the frequencies with a bar chart:

``` r
# frequency table

# barchart of number-of-characters
```

### Pasting strings

R provides the `paste()` function. This function allows you to **paste** (i.e. append, concatenate) character vectors separated by a blank space:

``` r
paste('Pumpkin', 'Pie')
```

    ## [1] "Pumpkin Pie"

You can give it any number of vector inputs

``` r
paste('a', 'b', 'c', 'd', 'e')
```

    ## [1] "a b c d e"

You can change the separator with `sep`

``` r
paste('a', 'b', 'c', 'd', 'e', sep = '-')
```

    ## [1] "a-b-c-d-e"

`paste()` is vectorized:

``` r
paste('a', 1:5, sep = '.')
```

    ## [1] "a.1" "a.2" "a.3" "a.4" "a.5"

There's a special wrapper around `paste()` called `paste0()` which is equivalent to `paste(..., sep = "")`

``` r
# paste0() -vs- paste(..., sep = "")
paste0('Pumpkin', 'Pie')
```

    ## [1] "PumpkinPie"

``` r
paste('Pumpkin', 'Pie', sep = '')
```

    ## [1] "PumpkinPie"

``` r
# paste0() is also vectorized
paste0('a', 1:5)
```

    ## [1] "a1" "a2" "a3" "a4" "a5"

**Your Turn:** Use `paste()` to form a new vector with the first five states and their number of characters like this:

`"Alabama = 7"  "Alaska = 6"  "Arizona = 7"  "Arkansas = 8"  "California = 10"`

``` r
# paste names with their num-of-chars
```

Now use `paste()`'s argument `collapse = ''` to *collapse* the first five states like this:

`"AlabamaAlaskaArizonaArkansasCalifornia"`

``` r
# collapse first 5 states
```

### Substrings

R provieds the function `substr()` to extract substrings in a character vector:

``` r
# extract first 3 characters
substr('Berkeley', 1, 3)
```

    ## [1] "Ber"

Use `substr()` to shorten the state names using the first 3-letters:

``` r
# shorten state names with first 3 characters
substr(states, 1, 3)
```

    ##  [1] "Ala" "Ala" "Ari" "Ark" "Cal" "Col" "Con" "Del" "Flo" "Geo" "Haw"
    ## [12] "Ida" "Ill" "Ind" "Iow" "Kan" "Ken" "Lou" "Mai" "Mar" "Mas" "Mic"
    ## [23] "Min" "Mis" "Mis" "Mon" "Neb" "Nev" "New" "New" "New" "New" "Nor"
    ## [34] "Nor" "Ohi" "Okl" "Ore" "Pen" "Rho" "Sou" "Sou" "Ten" "Tex" "Uta"
    ## [45] "Ver" "Vir" "Was" "Wes" "Wis" "Wyo"

Use `substr()` to shorten the state names using the last 3-letters:

``` r
# shorten state names with last 3 characters
```

How would you shorten the state names using the first letter and the last 3-letters? For instance: `"Aama"` `"Aska"` `"Aona"` `"Asas"` etc.

``` r
# shorten state names with first 3 characters
```

### Challenge

We already obtained a frequency table `char_freqs` with the counts of state names by number of characters. You can use those frequencies to get those state-names with 4-characters or 10-characters:

``` r
# 4-char states
states[num_chars == 4]
```

    ## [1] "Iowa" "Ohio" "Utah"

``` r
# 10-char states
states[num_chars == 10]
```

    ## [1] "California" "New Jersey" "New Mexico" "Washington"

You can use `paste()` to join the 4-character states in one single string (i.e. *collapsing*) like this---separated by a comma and space---:

``` r
# collapse 4-char states
paste(states[num_chars == 4], collapse = ", ")
```

    ## [1] "Iowa, Ohio, Utah"

**Here's one challenge for you:** write code (using a for-loop) to obtain a list `states_list` containing the collapsed names by number of characters. If the number of characters is an even number, then the state names should be in capital letters. Otherwise, they should be in lower case letters.

Each list element of `states_list` must be named with the number of characters, followed by a dash, followed by the word `chars`: e.g. `'4-chars'`, `'5-chars'`, etc. In total, `states_list` should have the same length as `char_freqs`.

Here's what `states_list` should look like for the first three elements:

    $`4-chars`
    [1] "IOWA, OHIO, UTAH"

    $`5-chars`
    [1] "idaho, maine, texas"

    $`6-chars`
    [1] "ALASKA, HAWAII, KANSAS, NEVADA, OREGON"

------------------------------------------------------------------------

Converting from Fahrenheit Degrees
----------------------------------

Here are four functions that convert from Fahrenheit degrees to other temperature scales:

``` r
to_celsius <- function(x = 1) {
  (x - 32) * (5/9)
}

to_kelvin <- function(x = 1) {
  (x + 459.67) * (5/9)
}

to_reaumur <- function(x = 1) {
  (x - 32) * (4/9)
}

to_rankine <- function(x = 1) {
  x + 459.67
}
```

We can use the previous functions to create a more general function `temp_convert()`:

``` r
temp_convert <- function(x = 1, to = "celsius") {
  switch(to,
         "celsius" = to_celsius(x),
         "kelvin" = to_kelvin(x),
         "reaumur" = to_reaumur(x),
         "rankine" = to_rankine(x))
}

temp_convert(30, 'celsius')
```

    ## [1] -1.111111

`temp_convert()` works fine when the argument `to = 'celsius'`. But what happens if you try `temp_convert(30, 'Celsius')` or `temp_convert(30, 'CELSIUS')`?

**Your turn**. Rewrite `temp_convert()` such that the argument `to` can be given in upper or lower case letters. For instance, the following three calls should be equivalent:

``` r
temp_convert(30, 'celsius')
temp_convert(30, 'Celsius')
temp_convert(30, 'CELSIUS')
```

``` r
# your function temp_convert
```

------------------------------------------------------------------------

Names of files
--------------

Imagine that you need to generate the names of 10 data `.csv` files. All the files have the same prefix name but each of them has a different number: `file1.csv`, `file2.csv`, ... , `file10.csv`.

How can you generate a character vector with these names in R? Come up with at least three different ways to get such a vector:

``` r
# vector of file names
```

Now imagine that you need to rename the characters `file` into `dataset`. In other words, you want the vector of file names to look like this: `dataset1.csv`, `dataset2.csv`, ... , `dataset10.csv`. Take the previous vector of file names and rename its elements:

``` r
# rename vector of file names
```

------------------------------------------------------------------------

Using function `cat()`
----------------------

Run the following code:

``` r
# name of output file
outfile <- "output.txt"

# writing to 'outfile.txt'
cat("This is the first line", file = outfile)
# insert new line
cat("\n", file = outfile, append = TRUE)
cat("A 2nd line", file = "output.txt", append = TRUE)
# insert 2 new lines
cat("\n\n", file = outfile, append = TRUE)
cat("\nThe quick brown fox jumps over the lazy dog\n",
    file = outfile, append = TRUE)
```

After running the previous code, look for the file `output.txt` in your working directory and open it. One of the uses of `cat()` is to write contents to a text file. Note that the first call to `cat()` does not include the argument `append`. The rest of the calls do include `append = TRUE`.

**Your turn**. Modify the script such that the content of `output.txt` looks like the *yaml* header of an `.Rmd` file with your information:

    ---
    title: "Some title"
    author: "Your name"
    date: "today's date"
    output: html_document
    ---

    This is the first line
    A 2nd line


    The quick brown fox jumps over the lazy dog

------------------------------------------------------------------------

Valid Color Names
-----------------

The function `colors()` returns a vector with the names (in English) of 657 colors available in R. Write a function `is_color()` to test if a given name---in English---is a valid R color. If the provided name is a valid R color, `is_color()` returns `TRUE`. If the provided name is not a valid R color `is_color()` returns `FALSE`.

``` r
# your is_color() function



# test it:
is_color('yellow')  # TRUE

is_color('blu')     # FALSE

is_color('turkuoise') # FALSE
```

Plot with a valid color
-----------------------

Use `is_color()` to create the function `colplot()` that takes one argument `col` (the name of a color) to produce a simple scatter plot with random numbers (e.g. use `runif()` or `rnorm()` to get point coordinates).

If `col` is a valid name---say "blue"---, the scatterplot should show a title `"Testing color blue"`.

If the provided `col` is not a valid color name, e.g. "blu", then the function must stop, showing an **error message** `"invalid color blu"`.

``` r
# this should plot
colplot('tomato')

# this stops with error message
colplot('tomate')
```

------------------------------------------------------------------------

Counting number of vowels
-------------------------

Consider the following vector `letrs` which contains various letters randomly generated:

``` r
# random vector of letters
set.seed(1)
letrs <- sample(letters, size = 100, replace = TRUE)
head(letrs)
```

    ## [1] "g" "j" "o" "x" "f" "x"

If you were to count the number of vowels in `letrs` you would get the following counts:

-   a: 2
-   e: 2
-   i: 6
-   o: 2
-   u: 8

Write code in R to count the number of vowels in vector `letrs`. Test your code with `letrs` and verify that you get the same counts for each vowel.

``` r
# count number of vowels
```

Now do the same but for the consonants, that is, count the frequencies of consonants in `letrs`. You should get the following counts:

    b c d f g h j k l m n p q r s t v w x y z 
    3 3 3 4 6 1 5 6 4 7 2 2 5 4 5 3 4 5 4 3 1

------------------------------------------------------------------------

Number of letters, vowels, and consonants
-----------------------------------------

Write a function `count_letters()` that takes a vector of letters (e.g. `letrs`) and computes the total number of letters, the total number of vowels, and the total number of consonants. For instance, given the vector `letrs`, the function will print on console:

    "letters: 100"
    "vowels: 20"
    "consonants: 80"

``` r
# your function count_letters()
```
