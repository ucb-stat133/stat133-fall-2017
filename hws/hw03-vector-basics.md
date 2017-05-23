HW03 - Stat 133, Fall 2017
================

The purpose of this assignment is to work with vectors of different data types: numeric (integer and real), character, logical, and factors.

Introduction
------------

Summarizing variables and creating graphs is often the first step in analyzing data.

In this assignment you will summarize quantitative and qualitative variables graphically and numerically. Technically, this involves performing a univariate analysis, that is, analyzing one variable at a time. In future assignments you will work on analyzing two or more variables simultaneously.

Do your best to describe what you see. Jot down notes to capture your thinking as you go. It takes practice to learn to describe distributions and write an analysis. You will work on these skills over the entire semester.

In this activity, you will practice describing data in a univariate way. This can be tricky because there is not one right way to analyze data, but there are wrong ways.

You will focus on writing a thesis statement and providing accurate observations aboubt the data to support it.

Research Question
-----------------

The research question that we are considering is: "the more points a player scores, the higher his salary?"

Data
----

The data set for this assignment is data about the NBA players. The corresponding file is `nba2017-salary-points.RData`. This is a binary file (native's R binary format). Read the data dictionary file `nba2017-salary-points-dictionary.md`

Inspect the objects in the `.RData` file:
-----------------------------------------

The first step is to inspect the data. This is actullay the *first contact* stage. And to be honest, most of the work you do in this stage never gets reported. But this does not mean that it is worthless or less important. Here are various questions for you to consider while "getting to know the data":

-   What class of objects are in the file?
-   Are there any vectors, factors, lists?
-   What flavor is each vector (i.e. variable)?
-   Can you imagine different functions being useful in different contexts?

-   Check that all objects have the same length.
-   How many players?

Exploratory Data Analysis
-------------------------

-   Explore individual variables
-   Pick at least one categorical variable and at least one quantitative variable to explore. Choose two variables: one quantitative, and one qualitative. You willl have to perform a complete exploratory analysis. This involves getting summary statistics as well as visual displays.

### Quantitative Variable

To be more precise, describe the overall pattern (shape, center, and spread) and striking deviation from the pattern.

-   Use the `summary()` function to get a quick summary of descriptive statitstics for each numeric vector
-   Now, look up for functions that allow you to get the following statistics:
    -   mean (i.e. average)
    -   standard deviation
    -   minimum value
    -   maximum value
    -   median
    -   quartiles
-   Use `hist()` and `boxplot()` to look at the distributions
-   For those variables that are categorical, use `table()` to get the frequencies.
-   How would you get the **relative** frequencies (i.e. proportions)?
-   Use `barplot()` to visualize the frequencies
-   Create a scatter diagram with `plot()`
    -   add the names with `text()`

### Qualitative Variable

-   Pick one of the categorical variables: `team` or `position`.
-   If the variable that you choose is not an R factor, then use `factor()` to convert the object into a factor.
-   Use `table()` to get a frequency table (i.e. counts of each category).
-   Find out how to use the obtained frequency table to calculate relative frequencies (proportions).
-   Use the frequencies (counts) and relative frequencies (proportions) to describe the overall distribution.
-   Use `barplot()` to display the frequencies with a barchart.

Characterize what's possible, i.e. all possible values or max vs. min ... whatever's appropriate. What's typical? What's the spread? What's the distribution? Etc., tailored to the variable at hand. Feel free to use summary stats, tables, figures. We're NOT expecting high production value (yet). Explore various plot types

Make a few plots, probably of the same variable you chose to characterize numerically. Try to explore more than one plot type. Just as an example of what I mean:

-   A scatterplot of two quantitative variables.
-   A plot of one quantitative variable. Maybe a histogram or densityplot or frequency polygon.
-   A plot of one quantitative variable and one categorical. Maybe boxplots for several continents or countries.
-   You don't have to use all the data in every plot! It's fine to filter down to one country or small handful of countries.

But I want to do more!
----------------------

For people who want to take things further. You can try to look for:

-   How to use the R package `"xtable"` to produce nicely formatted tables.
-   Mess around with graphical parameters for creating plots. See `?plot` and `?par`. Try to add colors, change widths, etc.

What are we looking for from your work?
---------------------------------------

-   Develop a thesis statement that addresses the research question(s).
-   Make observations about shape, center, spread and outliers (if there are any).
-   Try to explain why your observations are important or interesting.
-   Try to describe the graphs in a comprehensive way:
    -   What is the overall shape?
    -   What is the typical center?
    -   Overall range, along with an interval of typical measurements.
-   Add transitions that help tie your observations.
-   Use lots of inline code! Especially when writing paragraphs describing data and related values. Try not to hard-code values---this breaks computational reproducibility.
-   Keep practicing with Markdown syntax: use bullet/itemized lists, embed butllets within bullets, italics, bold, links, heading of different levels, pre-format (i.e. code), horizontal rules, etc.

If this (and future) assignment looks more like an English (writing) assignment, you are right. We want to remind you that *Computing with Data* (CwD) is not just about computations, solving problems, and obtaining results. CwD also involves making sense of the computed results, and answering questions. Whether you work as a consultant, scientist, analyst, journalist, programmer, etc, you will have to explain your findings, report your work, and communicate with several audiences.

Report your process
-------------------

Reflect on what was hard/easy, problems you solved, helpful tutorials you read, etc.

-   What things were hard, even though you saw them in class?
-   What was easy(-ish) even though we haven't done it in class?
-   What was the most time consuming part?
-   Did you collaborate with other students? If so, with who? In what manner?
-   Was there any frustrating part? (e.g. RStudio cryptic error, one or more package not playing nice)

Submit the assignment
---------------------

Follow instructions on How to submit homework
