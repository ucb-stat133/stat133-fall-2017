# Syllabus, Stat 133

+ Notes:
    - Tentative calendar (weekly topics), subject to changes depending on the pace of the course.
    - Labs: For the covered topics in a given week, the associated lab takes place on Th/Fr of the current week.


-----


## 0. Course Introduction

+ __Dates__: Aug 23-25
+ __Topics__: Introduction, policies/logistics, and course in a nutshell.
+ __Lecture material__
    + [About the Course](../slides/00-about-course.pdf) (slides)
    + [Introduction: Big Picture](../slides/01-big-picture.pdf) (slides)
+ __Lab__: No lab
+ __Reading__:
    + [Course policies](policies.md), and [FAQs](faqs.md)
    - [What is Data Science?](../papers/what-is-data-science.pdf)
+ __To Do__: 
    + Install [__R__](https://cran.cnr.berkeley.edu/) and [RStudio](https://www.rstudio.com/products/rstudio/download/#download) Desktop (open source version, free)


-----


## 1. R Survival Skills

+ __Dates__: Aug 28-Sep 01:
+ __Topics__: Getting started with R, and comprehensive review of the RStudio workspace.
+ __Lecture material__
    + [About R](../slides/02-about-R.pdf) (slides)
    + [First contact with R](../tutorials/01-intro-to-R.md) (tutorial)
    + [Intro to Rmd files](../tutorials/02-intro-to-Rmd-files.md) (tutorial)
    + [Data Types and Vectors](../slides/03-R-vector-types.pdf) (slides)
+ __Lab material__:
    + [Getting started with R](../labs/lab01-R-basics.md)
+ __Reading__:
    + [Markdown tutorial](http://commonmark.org/help/tutorial) by CommonMark
    + [www.markdowntutorial.com/](http://www.markdowntutorial.com)
    + [Introduction to R Markdown](http://rmarkdown.rstudio.com/lesson-1.html) by RStudio
+ __Cheat sheet__: 
    + [RStudio cheat sheet](../cheat-sheets/rstudio-IDE-cheatsheet.pdf)
    + [R markdown cheat sheet](../cheat-sheets/rmarkdown-cheatsheet-2.0.pdf)
+ __WARM-UP 1__: due Sep-09
    + [Markdown practice](../hws/up01-markdown.md)


-----



## 2. Data Types, Vectors and Other Structues

+ __Dates__: Sep 04-08  _(Holiday Sep-04)_
+ __Topics__: Getting to know R vectors and concepts like atomicity, vectorization, recycling, and subsetting.
+ __Lecture material__
    + [Intro to vectors](../tutorials/03-intro-to-vectors.md) (tutorial)
    + [Arrays and Factors](../slides/04-arrays-factors.pdf) (slides)
    + [Lists](../slides/05-lists.pdf) (slides)
+ __Lab material__:
    + [Getting started with vectors, factors, and lists](../labs/lab02-vector-basics.md)
+ __Reading__:
    + [chapter 20: Vectors](http://r4ds.had.co.nz/vectors.html) from _R for Data Science_ by Grolemund and Wickham.
+ __WARM-UP 2__: due Sep-16
    + [Vectors and Factors](../hws/up02-vector-basics.md)


-----



## 3. Housekeeping: Filesystem, Bash, Git, Github

+ __Dates__: Sep 11-15
+ __Topics__: Fundamental low-level stuff for the rest of the course.
+ __Lecture material__
    + [Filesystem Basics](../slides/06-filesystem-basics.pdf) (slides)
    + [Shell Basics](../slides/07-shell-basics.pdf) (slides)
    + [Git Basics](../slides/08-git-basics.pdf) (slides)
+ __Lab material__:
    + [Minimal Bash and Git](../labs/lab03-minimal-bash-git.md)
    + [GitHub repo for your assignments](../labs/lab03-hws-repository.md)
+ __Reading__:
    + Read sections 4 to 9 in Part I [Installation](http://happygitwithr.com/installation-pain.html) from _Happy Git and GitHub for the useR_ by Jenny Bryan et al.
+ __Cheat sheet__:
    + [git cheat sheet](../cheat-sheets/git-cheatsheet.pdf)


-----



## 4. Basics of Tabular Data

+ __Dates__: Sep 18-22
+ __Topics__: Data Tables, typical storage formats, and relation with data frames.
+ __Lecture material__
    + [Data Tables](../slides/09-data-tables.pdf) (slides)
    + [Importing Tables in R](../slides/10-importing-tables.pdf) (slides)
    + [Data Frames](../slides/11-data-frame-basics.pdf) (slides)
 + __Lab material__:
    + [Reading in tables in R](../labs/lab04-reading-tables.md)
    + [Manipulating data frames](../labs/lab04-data-frame-basics.md)
+ __Reading__:
    + [Organizing data in spreadsheets](http://kbroman.org/dataorg/) by Karl Broman
+ __Cheat sheet__:
    + [Data import cheat sheet](../cheat-sheets/data-import-cheatsheet.pdf)
+ __HW 1__: due Sep-24
    + [More Vectors](../hws/hw01-more-vectors.pdf)
 

-----



## 5. Wrangling and Exploring Tables (part 1)

+ __Dates__: Sep 25-29
+ __Topics__: Data wrangling (reshaping, aggregating) with `"dplyr"`, and 
graphs with `"ggplot2"`.
+ __Lecture Material__
    + [Introduction to the R package `"dplyr"`](../slides/12-dplyr-introduction.pdf) (slides by Hadley Wickham)
    + [Introduction to `"dplyr"`](../tutorials/05-intro-to-dplyr.md) (tutorial)
    + [Introduction to the R package `"ggplot2"`](../slides/13-grammar-graphics.pdf) (slides)
    + ["ggplot2" lecture](../slides/14-ggplot-lecture.pdf) (slides by Karthik Ram)
+ __Lab material__:
    + [Getting started with dplyr and ggplot2](../labs/lab05-dplyr-ggplot-basics.md)
+ __Reading__:
    + [Introduction to dplyr](https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html) introductory vignette by Hadley Wickham
+ __Cheat sheet__:
    + [Data transformation cheat sheet](../cheat-sheets/data-transformation-cheatsheet.pdf)
    + [Data visualization with ggplot2](../cheat-sheets/ggplot2-cheatsheet-2.1.pdf)
+ __HW 2__: due Oct-02
    + [Data Frame Basics](../hws/hw02-data-frame-basics.pdf)


-----



## 6. More Wrangling, Graphics (part 2) and PCA

+ __Dates__: Oct 02-06
+ __Topics__: More `"dplyr"`, `"ggplot2"`, and file structure
+ __Lecture Material__
    + Data pipelines in `"dplyr"`
    + [Mini project](https://docs.google.com/presentation/d/e/2PACX-1vTMRMIlfZM01jAzaEyrbdar-Qxqips_KZii5hM7Ef90h1gMcDL4APl5LpCYlIQGoBEJNUL6CFrXHckp/pub?start=false&loop=false&delayms=3000) (slides)
    + [Introduction to PCA](../slides/15-principal-components1.pdf) (slides) and live demo.
+ __Lab material__:
    + [More dplyr, ggplot2, and files' stuff](../labs/lab06-more-dplyr-ggplot.md)
+ __Reading__: 
    + [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf) by Hadley Wickham
RStudio).


-----



## 7. Programming Basics for data analysis (part 1)

+ __Dates__: Oct 09-13
+ __Topics__: Basics of Functions, R expressions, and conditionals.
+ __Lecture Material__
    + [Introduction to functions](../tutorials/06-intro-to-functions.md) (tutorial)
    + [Introduction to R expressions and conditionals](../tutorials/07-intro-to-expressions-conditionals.md) (tutorial)
+ __Lab material__:
    + [Getting started with functions and conditionals](../labs/lab07-simple-functions.md)
+ __Reading__: 
    + [chapter 19: Functions](http://r4ds.had.co.nz/functions.html) from _R for Data Science_ by Grolemund and Wickham.
+ __HW 3__: due Oct-15
    + [More Vectors](../hws/hw03-ranking-teams.pdf)
 + __MIDTERM 1__: Fri Oct-13 


-----



## 8. Programming Basics for data analysis (part 2)

+ __Dates__: Oct 16-20
+ __Topics__: Basics of loops, and intro to `"shiny"` apps.
+ __Lecture Material__
    + [Introduction to loops](../tutorials/08-intro-to-loops.md) (tutorial)
    + [More about functions](../tutorials/09-more-functions.md) (tutorial)
    + [Introduction to shiny apps](https://docs.google.com/presentation/d/1_XhkkhXA26izACJyoc5JYrWiF_f96a6tD9ZSI5Tm8Os/pub?start=false&loop=false&delayms=3000) (slides)
+ __Lab material__: 
    + [Getting started with loops](../labs/lab08-simple-loops.md)
    + [Practice Programming Basics](../hws/practice-programming-basics.pdf) (exercises)
+ __Reading__:
    + [chapter 21: Iteration](http://r4ds.had.co.nz/iteration.html) from _R for Data Science_ by Grolemund and Wickham.
    + [How to Start Shiny tutorial](https://shiny.rstudio.com/tutorial/) by Garret Grolemund
+ __Cheat sheet__: 
    + [Shiny Web Apps cheat sheet](../cheat-sheets/shiny-cheatsheet.pdf)


-----



## 9. Random Numbers and Simulations

+ __Dates__: Oct 23-27
+ __Topics__: R andom numbers, sampling, and monte carlo simulation.
+ __Lecture Material__
    + [Introduction to random numbers](../tutorials/10-intro-to-random-numbers.md)
    + [More Simulations](../tutorials/11-more-simulations.md)
    + [Shiny Tutorial](../slides/16-shiny-tutorial.pdf) by Gerret Grolemund
+ __Lab material__:
    + [Running Monte Carlo simulations](../labs/lab09-random-simulations/lab09-random-simulation.md)
+ __Reading__:
    + [Part 1 - How to build a Shiny app](https://shiny.rstudio.com/tutorial/)
+ __Cheat sheet__: 
    + [Shiny Web Apps cheat sheet](../cheat-sheets/shiny-cheatsheet.pdf)


-----



## 10. Manipulating Character Strings and Testing Functions

+ __Dates__: Oct 30-Nov 03
+ __Topics__: Introduction to character strings and their basic manipulations.
+ __Lecture Material__
    + [String Basics](../slides/17-strings-basics.pdf) (slides)
    + [Intro to Strings](../tutorials/12-intro-to-strings.md) (tutorial)
    + [Getting started with testing](../papers/testthat-wickham.pdf) by Wickham
+ __Lab material__: 
    + [Basic strings manipulations](../labs/lab10-strings-basics.md)
+ __Reading__:
    + [Handling Strings in R](http://www.gastonsanchez.com/r4strings) by GS.
    + [chapter 14: Strings](http://r4ds.had.co.nz/strings.html) from _R for Data Science_ by Grolemund and Wickham.
+ __HOMEWORK:__ [Post 1](../hws/post01-first-post.md) due Oct-31


-----



## 11. Regular Expressions (part 1)

+ __Dates__: Nov 06-10
+ __Topics__: Introduction to Regular Expressions.
+ __Lecture Material__
    + [Introduction to regular expressions](../tutorials/13-intro-to-regex.md)
    + [Regexpal](http://regexpal.com.s3-website-us-east-1.amazonaws.com/) tester tool.
+ __Lab material__: 
    + No lab (veteran's day)
+ __Reading__:
    + [Handling Strings in R](http://www.gastonsanchez.com/r4strings) by GS.
+ __Cheat sheet__:
    + [Regular Expressions cheat sheet](../cheat-sheets/regular-expressions-cheatsheet.pdf)


-----



## 12. Regular Expressions (part 2)

+ __Dates__: Nov 13-17
+ __Topics__: More about Regular Expressions and coding habits.
+ __Lecture Material__
    + [Coding habits](../slides/18-good-habits.pdf)     
+ __Lab material__: 
    + [Regex basics](../labs/lab11-regex-basics.md)
+ __Reading__:
    + [Handling Strings in R](http://www.gastonsanchez.com/r4strings) by GS.
+ __Cheat sheet__:
    + [Regular Expressions cheat sheet](../cheat-sheets/regular-expressions-cheatsheet.pdf)
+ __HOMEWORK:__ [Problem Set 4](../hws/hw04-grades-visualizer.pdf) due Nov-26


-----



## 13. Thanksgiving Week

+ __Dates__: Nov 20-24
+ __Topics__: Data visualization and the DAC
+ __Lecture Material__
    + Comments on Data Visualization and the Data Analysis Cycle (chalk and talk).


-----



## 14. Data Technologies: XML

+ __Dates__: Nov 27-Dec 01
+ __Topics__: Introduction to XML and webscraping
+ __Lecture Material__
    + [Introduction to XML](../slides/19-xml.pdf)
    + [Introduction to "rvest"](../tutorials/14-intro-to-rvest.md)
+ __Lab material__: 
    + [HTML and Web Scraping](../labs/lab12-web-scraping.md)
+ __HOMEWORK:__ [Post 2](../hws/post02-second-post.md) due Nov-30


-----



## 15. RRR week

+ __Dates__: Dec 04-08
+ __Topics__: Prepare for final examination
+ __Lecture Material__
    + No lecture. Instructor will hold OH (4-5pm in 309 Evans)   
+ __FINAL:__ Friday Dec-15th, 8-11am (room TBA)

