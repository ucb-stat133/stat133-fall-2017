Warm-Up 02 - Stat 133, Fall 2017
================

**Due date:** Saturday Sep-16, 2017 (before midnight)

The purpose of this assignment is to work with vectors of different data types: numeric (integer and real), character, logical, and factors.

Introduction
------------

In this assignment you will summarize quantitative and qualitative variables graphically and numerically. These tasks are often the first step in analyzing most data sets. Technically, this involves performing a univariate analysis, that is, analyzing one variable at a time. In future assignments you will work on analyzing two or more variables simultaneously.

Keep in mind that summarizing and describing data, as simple as it may sound, can be tricky. Why? Because there is not one right way to analyze data, but there are wrong ways. Do your best to describe what you see. Jot down notes to capture your thinking as you go. It does not matter if you lack the technical terminology to write such descriptions: use your own words. It takes practice to learn to describe distributions and write an analysis. You will work on these skills over the rest of the semester.

This HW is the second *dummy* or warming-up assignment (i.e. it won't count towards your final grade). Tackle any logistic problems, and make sure R, RStudio, bCourses, and your computer work nicely---without being penalized. Later on you will also include version control tools such as Git and Github.

Research Question and Data
--------------------------

As I mentioned in class, the starting research question is: **"the more points a player scores, the higher his salary?"**

You are NOT going to try to answer this question in this assignment. What you have to do is start to get to know the data.

### Data

The data set for this assignment is data about NBA players during the regular season of 2016-2017. The corresponding files are in a github repo specifically created for HW assignments:

<https://github.com/ucb-stat133/stat133-hws-fall17/tree/master/warmup02/data>

You will find a data file `nba2017-salary-points.RData`. This is a binary file (native's R binary format), which means that you won't be able to see its contents with a text editor (only R knows how to open this type of files).

There is also a data dictionary file `nba2017-salary-points-dictionary.md` that provides more information about the contents in `nba2017-salary-points.RData`. Please read the contents of the data dictionary.

### Download the data file

To read the data in R, we recommend that you download the `.RData` to your computer. You can use the function `download.file()` to do this. The file will be downloaded to the specified destination (`destfile`). In the code below, the binary file woud be downloaded to your [working directory](https://www.computerhope.com/jargon/c/currentd.htm):

``` r
download.file(
  url = "https://github.com/ucb-stat133/stat133-hws-fall17/tree/master/warmup02/data",
  destfile = "nba2017-salary-points.RData")
```

You only have to download the file once. By the way, there is NO need to include the previous command in your source `.Rmd` file. Otherwise, everytime you knit the file, R will download the file.

### Importing the data

Open a new `.Rmd` file (this will be your source file). Once you have `nba2017-salary-points.RData` in your computer, use the `load()` function, which allows you to import `.RData` files into R:

``` r
# load the objects
load("nba2017-salary-points.RData")

# list the available objects
ls()
```

Inspect the objects in the `.RData` file:
-----------------------------------------

The first step is to inspect the data. This is actullay the *first contact* stage. And to be honest, most of the work you do in this stage never gets reported. But this does not mean that it is worthless or less important. Here are various questions for you to consider while "getting to know the data":

-   Make sure you have all the objects described in the data dictionary.
-   What class of objects are in the file?
-   Are there any vectors, factors, lists?
-   What flavor is each vector (i.e. variable)?
-   Check that all objects have the same length.

Exploratory Data Analysis
-------------------------

Pick at least one categorical variable and at least one quantitative variable to explore. You willl have to perform a complete exploratory analysis. This involves getting summary statistics as well as visual displays.

### Quantitative Variable

For the selected quantitative variable, describe the overall pattern (shape, center, and spread) and striking deviation from the pattern.

-   Use the `summary()` function to get a quick summary of descriptive statitstics for each numeric vector
-   Now, look up for functions that allow you to get the following statistics:
    -   mean (i.e. average)
    -   standard deviation
    -   minimum value
    -   maximum value
    -   median
    -   quartiles
-   What are the typical values in each vector?
-   What's the spread in each vector?
-   Look at the distribution: use `hist()` and `boxplot()`.
-   You can also try to get a density curve (or density polygon). Find out how to do this.

### Qualitative Variable

-   Pick one of the categorical variables: `team` or `position`.
-   If the variable that you choose is not an R factor, then use `factor()` to convert the object into a factor.
-   Use `table()` to get a frequency table (i.e. counts of each category).
-   Find out how to use the obtained frequency table to calculate relative frequencies (proportions).
-   Use the frequencies (counts) and relative frequencies (proportions) to describe the overall distribution.
-   Use `barplot()` to display the frequencies with a barchart.

What are we looking for from your work?
---------------------------------------

-   Recall that this is a \_warm-up\_assignment, meaning it won't count for your final score.
-   Feel free to use a variety of summary stats, tables, figures.
-   We're NOT expecting high production value (yet). Aesthetics, design elements, and grammar are not very important right now.
-   Make observations about shape, center, spread and outliers (if there are any).
-   Try to explain why your observations are important or interesting.
-   Try to describe the graphs in a comprehensive way:
    -   What is the overall shape?
    -   What is the typical center?
    -   Overall range, along with an interval of typical measurements.
-   Add transitions to your narrative that help tie your observations.
-   Use lots of inline code! Especially when writing paragraphs describing data and related values. Try not to hard-code values---this breaks computational reproducibility.
-   Keep practicing with Markdown syntax: use bullet/itemized lists, embed bullets within lists, italics, bold, links, headings of different levels, pre-format (i.e. code), horizontal rules, etc.

If this (and future) assignment looks more like an English (writing) assignment, you are right. We want to remind you that *Computing with Data* (CwD) is not just about computations, solving problems, and obtaining results. CwD also involves making sense of the computed results. Whether you work as a consultant, scientist, analyst, journalist, programmer, etc, you will have to explain your findings, report your work, and communicate it to several audiences.

Report your process
-------------------

In addition to summarizing and describing the analyzed variables, include a section in your report to reflect on what was hard/easy, problems you solved, helpful tutorials you read, etc.

-   What things were hard, even though you saw them in class?
-   What was easy(-ish) even though we haven't done it in class?
-   What type of "errors" you struggled with (if any)?
-   What are the parts you are not fully understanding?
-   What was the most time consuming part?
-   Did you collaborate with other students? If so, with who? In what manner?
-   Was there any frustrating issue? (e.g. RStudio cryptic error, one or more package not playing nice)

But I want to do more!
----------------------

For people who want to take things further. You can try to look for:

-   How to use the R package `"xtable"` to produce nicely formatted tables.
-   Mess around with graphical parameters for creating plots. See `?plot` and `?par`. Try to add colors, change widths, etc.
-   Start playing with different ways to study the relationship between `points` and `salary`. We are going to tackle this in the next assignment.

------------------------------------------------------------------------

Submission
----------

Name your `Rmd` file using the following structure: `up02-first-last.Rmd` where "first" and "last" are your first and last names. E.g. `up02-gaston-sanchez.Rmd`.

Please submit your source `.Rmd` file, as well as the knitted (i.e. compiled) html file to bCourses.

In addition to submitting files to bCourses, try adding, committing and pushing (i.e. uploading) your `.Rmd` file and html knitted file to your GitHub repository.\_
