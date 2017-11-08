Introduction to Regular Expresions
================
Gaston Sanchez

> ### Learning Objectives:
>
> -   First contact with Regex
> -   Regex functions in package `"stringr"`
> -   Text file with log common format

------------------------------------------------------------------------

Getting started with Regex in R
-------------------------------

In this tutorial we'll be mainly using functions from the R package `"stringr"`:

``` r
# install.packages(stringr)
library(stringr)
```

Although R has built-in functios to perform regex operations, I've found that functions from `"stringr"` are more user friendly (i.e. they have a more consistent naming style).

Data Log File
-------------

In this tutorial, we'll be using the text file `may-logs.txt` located in the `data/` folder of the course github repo:

<https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2017/master/data/may-logs.txt>

This file is a **server log file** that contains the recorded events taking place in a web server. The content of the file is in a special format known as *common log format*. According to [wikipedia](https://en.wikipedia.org/wiki/Common_Log_Format):

"The Common Log Format is a standardized text file format used by web servers when generating server log files."

Here's an example of a log recordt (the text should in one line of code, but I've split it into 2 lines for readibility purposes)

    pd9049dac.dip.t-dialin.net - - [01/May/2001:01:51:25 -0700] 
    "GET /accesswatch/accesswatch-1.33/ HTTP/1.0" 200 1004

-   A `"-"` in a field indicates missing data.
-   `pd9049dac.dip.t-dialin.net` is the IP address of the client (remote host) which made the request to the server.
-   `[01/May/2001:01:51:25 -0700]` is the date, time, and time zone that the request was received, by default in strftime format`%d/%b/%Y:%H:%M:%S %z`.
-   `"GET /accesswatch/accesswatch-1.33/ HTTP/1.0"` is the request line from the client.
-   The method `GET, /accesswatch/accesswatch-1.33/` is the resource requested, and `HTTP/1.0` is the HTTP protocol.
-   `200` is the HTTP status code returned to the client.
    -   `2xx` is a successful response
    -   `3xx` a redirection
    -   `4xx` a client error, and
    -   `5xx` a server error
-   `1004` is the size of the object returned to the client, measured in bytes.

If you want to download a copy of the text file to your working directory:

``` r
# download file
github <- "https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2017"
textfile <- "/master/data/may-logs.txt"
download.file(url = paste0(github, textfile), destfile = "may-logs.txt")
```

------------------------------------------------------------------------

Reading the text file
---------------------

The first step involves reading the data in R. How can you do this? One option is with the `readLines()` function which reads any text file into a character vector:

``` r
# one option is to read in the content with 'readLines()'
logs <- readLines('may-logs.txt')
```

Let's check how the content looks like:

``` r
# take a peek at the contents in logs
head(logs)
```

    ## [1] "pd9049dac.dip.t-dialin.net - - [01/May/2001:01:51:25 -0700] \"GET /accesswatch/accesswatch-1.33/ HTTP/1.0\" 200 1004"              
    ## [2] "pd9049dac.dip.t-dialin.net - - [01/May/2001:01:51:26 -0700] \"GET /accesswatch/accesswatch-1.33/img/allifou.jpg HTTP/1.0\" 304 -"  
    ## [3] "pd9049dac.dip.t-dialin.net - - [01/May/2001:01:51:26 -0700] \"GET /sa.inside.jpg HTTP/1.0\" 304 -"                                 
    ## [4] "pd9049dac.dip.t-dialin.net - - [01/May/2001:02:20:19 -0700] \"GET /accesswatch/accesswatch-1.33/ HTTP/1.0\" 200 7791"              
    ## [5] "pd9049dac.dip.t-dialin.net - - [01/May/2001:02:20:20 -0700] \"GET /accesswatch/accesswatch-1.33/img/allifou.jpg HTTP/1.0\" 304 -"  
    ## [6] "pd9049dac.dip.t-dialin.net - - [01/May/2001:02:20:20 -0700] \"GET /accesswatch/accesswatch-1.33/img/blueblock.gif HTTP/1.0\" 304 -"

Because the file contains 26033 lines (or elements), let's get a subset by taking a random sample of size 50:

``` r
# subset a sample of lines
set.seed(98765)
s <- sample(1:length(logs), size = 50)
sublogs <- logs[s]
```

### JPG File requests

To begin our regex experiments, let's try to find out how many requests involved a JPG file.

One way to answer the previous question is by counting how many log lines contain the pattern `"jpg"`. We can use `grep()` to match or detect the this pattern:

``` r
# matching "jpg" (which lements)
grep("jpg", sublogs)
```

    ##  [1]  1  2 10 19 20 33 42 45 46 50

``` r
# showing value of matches
grep("jpg", sublogs, value = TRUE)
```

    ##  [1] "202.123.196.17 - - [29/May/2001:20:42:45 -0700] \"GET /testing/images/pshtk.jpg HTTP/1.0\" 200 34301"               
    ##  [2] "210.162.154.147 - - [22/May/2001:21:18:01 -0700] \"GET /testing/images/archi.jpg HTTP/1.1\" 200 18531"              
    ##  [3] "203.61.155.10 - - [27/May/2001:20:13:09 -0700] \"GET /testing/images/pshtk.jpg HTTP/1.0\" 200 34301"                
    ##  [4] "213.41.95.158 - - [22/May/2001:07:37:02 -0700] \"GET /testing/images/archi.jpg HTTP/1.1\" 200 18531"                
    ##  [5] "1cust113.tnt15.sfo3.da.uu.net - - [24/May/2001:04:27:34 -0700] \"GET /testing/images/archi.jpg HTTP/1.1\" 200 18531"
    ##  [6] "host5.aa-jupiter.com - - [24/May/2001:08:56:04 -0700] \"GET /testing/images/archi_servlet.jpg HTTP/1.1\" 304 -"     
    ##  [7] "crash.birdstep.org - - [31/May/2001:05:41:29 -0700] \"GET /testing/images/archi.jpg HTTP/1.1\" 200 18531"           
    ##  [8] "61.132.62.80 - - [28/May/2001:00:50:12 -0700] \"GET /testing/images/archi_servlet.jpg HTTP/1.0\" 200 18646"         
    ##  [9] "63.169.209.209 - - [29/May/2001:14:01:13 -0700] \"GET /testing/images/archi_servlet.jpg HTTP/1.1\" 200 18646"       
    ## [10] "h206013050210.pbdir.com - - [24/May/2001:15:48:10 -0700] \"GET /testing/images/archi.jpg HTTP/1.0\" 200 18531"

We can try to be more specific by defining a pattern `".jpg"` in which the `.` corresponds to the *literal* dot character. To match the dot, we need to escape it with `"\\."`:

``` r
# we could try to be more precise and match ".jpg"
grep("\\.jpg ", sublogs, value = TRUE)
```

    ##  [1] "202.123.196.17 - - [29/May/2001:20:42:45 -0700] \"GET /testing/images/pshtk.jpg HTTP/1.0\" 200 34301"               
    ##  [2] "210.162.154.147 - - [22/May/2001:21:18:01 -0700] \"GET /testing/images/archi.jpg HTTP/1.1\" 200 18531"              
    ##  [3] "203.61.155.10 - - [27/May/2001:20:13:09 -0700] \"GET /testing/images/pshtk.jpg HTTP/1.0\" 200 34301"                
    ##  [4] "213.41.95.158 - - [22/May/2001:07:37:02 -0700] \"GET /testing/images/archi.jpg HTTP/1.1\" 200 18531"                
    ##  [5] "1cust113.tnt15.sfo3.da.uu.net - - [24/May/2001:04:27:34 -0700] \"GET /testing/images/archi.jpg HTTP/1.1\" 200 18531"
    ##  [6] "host5.aa-jupiter.com - - [24/May/2001:08:56:04 -0700] \"GET /testing/images/archi_servlet.jpg HTTP/1.1\" 304 -"     
    ##  [7] "crash.birdstep.org - - [31/May/2001:05:41:29 -0700] \"GET /testing/images/archi.jpg HTTP/1.1\" 200 18531"           
    ##  [8] "61.132.62.80 - - [28/May/2001:00:50:12 -0700] \"GET /testing/images/archi_servlet.jpg HTTP/1.0\" 200 18646"         
    ##  [9] "63.169.209.209 - - [29/May/2001:14:01:13 -0700] \"GET /testing/images/archi_servlet.jpg HTTP/1.1\" 200 18646"       
    ## [10] "h206013050210.pbdir.com - - [24/May/2001:15:48:10 -0700] \"GET /testing/images/archi.jpg HTTP/1.0\" 200 18531"

### Function `str_detect()`

A similar output of `grep()` can be obtained with `str_detect()`, which allows you to *detect* what elements contain a match to the specified pattern:

``` r
# matching "jpg" (which lements)
str_detect(string = sublogs, pattern = "\\.jpg")
```

    ##  [1]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
    ## [12] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE
    ## [23] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
    ## [34] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
    ## [45]  TRUE  TRUE FALSE FALSE FALSE  TRUE

We can do the same for PNG extensions:

``` r
# matching "png" (which lements)
str_detect(string = sublogs, pattern = "\\.png")
```

    ##  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [12] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [23] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
    ## [34] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [45] FALSE FALSE FALSE FALSE FALSE FALSE

### Function `str_extract()`

Another common task when working with regular expressions has to do with pattern extraction. In other words, when you want to extract a matched pattern. For this purposes, we can use `str_extract()`

``` r
# extracting "jpg" (which lements)
str_extract(string = sublogs, pattern = "\\.jpg")
```

    ##  [1] ".jpg" ".jpg" NA     NA     NA     NA     NA     NA     NA     ".jpg"
    ## [11] NA     NA     NA     NA     NA     NA     NA     NA     ".jpg" ".jpg"
    ## [21] NA     NA     NA     NA     NA     NA     NA     NA     NA     NA    
    ## [31] NA     NA     ".jpg" NA     NA     NA     NA     NA     NA     NA    
    ## [41] NA     ".jpg" NA     NA     ".jpg" ".jpg" NA     NA     NA     ".jpg"

`str_extract()` actually let us confirm that we are matching the desired patterns. Notice that when there is no match, `str_extract()` returns a missing value `NA`.

### Image files

Now let's try to detect all types of image files: JPG, PNG, GIF, ICO

``` r
# looking for image file extensions
jpgs <- str_detect(logs, pattern = "\\.jpg ")
sum(jpgs)
```

    ## [1] 5509

``` r
pngs <- str_detect(logs, pattern = "\\.png ")
sum(pngs)
```

    ## [1] 1374

``` r
gifs <- str_detect(logs, pattern = "\\.gif")
sum(gifs)
```

    ## [1] 8818

``` r
icos <- str_detect(logs, pattern = "\\.ico ")
sum(icos)
```

    ## [1] 100

### How to match image files with one regex pattern?

We can use character sets to define a more generic pattern. For instance, to match `"jpg"` or `"png"`, we could join three character sets: `"[jp][pn][g]"`. The first set `[jp]` looks for `j` or `p`, the second set `[pn]` looks for `p` or `n`, and the third set simply looks for `g`.

``` r
# matching "jpg" or "png"
jpg_png_lines <- str_detect(sublogs, "[jp][pn][g]")
sum(jpg_png_lines)
```

    ## [1] 11

Including the dot, we can use: `"\\.[jp][pn][g]"`

``` r
# matching "jpg" or "png"
jpg_png_lines <- str_detect(sublogs, "\\.[jp][pn][g]")
sum(jpg_png_lines)
```

    ## [1] 11

We could generalize the pattern to include the GIF and ICO extensions:

``` r
# matching "jpg" or "png" or "gif"
image_lines1 <- str_detect(sublogs, "[jpgi][pnic][gfo]")
sum(image_lines1)
```

    ## [1] 46

To confirm that we are actually matching `jpg`, `png`, `gif` and `ico`, let's use `str_extract()`

``` r
# are we correctly extracting image file extensions?
str_extract(sublogs, "[jpgi][pnic][gfo]")
```

    ##  [1] "ing" "ing" "ing" "gif" NA    "ing" "ing" "gif" "ing" "ing" "gif"
    ## [12] "ing" "gif" "ing" "ing" "ing" "ing" "gif" "ing" "ing" "ing" "ing"
    ## [23] "ing" "ing" "ing" "gif" "ing" "ing" "ing" "ing" NA    "ing" "ing"
    ## [34] "ing" "ing" NA    "ing" "ing" "ing" "ing" "ing" "ing" "inf" "ing"
    ## [45] "ing" "ing" NA    "ing" "gif" "ing"

The previous pattern does not quite work: note that we are matching the pattern frmed by `"ing"` which does not correspond to a file extension.

An alternative way to detect JPG and PNG is by grouping patterns inside parentheses, and separating them with the metacharacter `"|"` which means *OR*:

``` r
# detecting .jpg OR .png
jpg_png <- str_detect(sublogs, "(\\.jpg)|(\\.png)")
sum(jpg_png)
```

    ## [1] 11

Here's how to detect all the extension in one single pattern:

``` r
# matching "jpg" or "png" or "gif" or "ico"
image_lines <- str_detect(sublogs, "(\\.jpg)|(\\.png)|(\\.gif)|(\\.ico)")
sum(image_lines)
```

    ## [1] 29

To make sure our regex operation is successful, let's see the output of `str_extract()`:

``` r
images_output <- str_extract(sublogs, "(\\.jpg)|(\\.png)|(\\.gif)|(\\.ico)")
images_output
```

    ##  [1] ".jpg" ".jpg" NA     ".gif" NA     ".gif" NA     ".gif" NA     ".jpg"
    ## [11] ".gif" ".gif" ".gif" ".gif" NA     NA     ".gif" ".gif" ".jpg" ".jpg"
    ## [21] ".gif" ".gif" NA     NA     NA     ".gif" NA     ".png" NA     NA    
    ## [31] NA     ".ico" ".jpg" NA     ".gif" NA     NA     ".gif" NA     NA    
    ## [41] NA     ".jpg" NA     ".gif" ".jpg" ".jpg" NA     ".gif" ".gif" ".jpg"

Let's aply the search on the entire log file and count how many files of each type:

``` r
# frequencies
img_extensions <- str_extract(logs, "(\\.jpg)|(\\.png)|(\\.gif)|(\\.ico)")
table(img_extensions)
```

    ## img_extensions
    ## .gif .ico .jpg .png 
    ## 8818  100 5509 1374
