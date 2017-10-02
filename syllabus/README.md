# Syllabus, Stat 133

+ Notes:
    - Tentative calendar (weekly topics), subject to changes depending on the pace of the course.
    - Labs: For the covered topics in a given week, the associated lab takes place on Th/Fr of the current week.


-----


## 0. Course Introduction

+ __Dates__: Aug 23-25
+ __Topics__: Introduction, policies/logistics, and course in a nutshell.
+ __Lecture material__
    + [About the Course](https://docs.google.com/presentation/d/1odMBh760lfSBiRhEh2cNLEq8LY8YcQTl_lLutRVbZhs/pub?start=false&loop=false&delayms=3000) (slides)
    + [Introduction: Big Picture](https://docs.google.com/presentation/d/1q8fIQ_xVo-S1awfh3qA6XqfZeyG4z3KvLgQj1L9ZuAY/pub?start=false&loop=false&delayms=3000) (slides)
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
    + [About R](https://docs.google.com/presentation/d/1n4Wo6lhYIeUi6XPhE7BVhX6cgfcTHkr1_uap0GWmD5Q/pub?start=false&loop=false&delayms=3000) (slides)
    + [First contact with R](../tutorials/01-intro-to-R.md) (tutorial)
    + [Intro to Rmd files](../tutorials/02-intro-to-Rmd-files.md) (tutorial)
    + [Data Types and Vectors](https://docs.google.com/presentation/d/e/2PACX-1vTyI7ymGK8e8G-lXUkYHx7vSfN1bQN39k6MoQwOx0npaoVYyLUixFuQNmt32sr-G2sjtgtnr3mGcOYp/pub?start=false&loop=false&delayms=3000) (slides)
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
    + [Arrays and Factors](https://docs.google.com/presentation/d/e/2PACX-1vSyy1gkP4eG1z_TXMAnY_23HWDW1GQAPFaQll1EQVXMyaOfCiH_bEYQch47ZkywDJoc8T-Ct14vlZby/pub?start=false&loop=false&delayms=3000) (slides)
    + [Lists](https://docs.google.com/presentation/d/e/2PACX-1vRQsS5XHV4wyzMgTRXgtYXm7GoF6XLYPB-hFWvT_IvsMEBM1S_zsaPMEKd5wy2b9Uk7oARM29YxdsK7/pub?start=false&loop=false&delayms=3000) (slides)
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
    + [Filesystem Basics](https://docs.google.com/presentation/d/1V-JPhr3Do3A7Jn-zgFSqD7R171W-G02uEmxWoHZI7bs/pub?start=false&loop=false&delayms=3000) (slides)
    + [Shell Basics](https://docs.google.com/presentation/d/1VTlxM0IrwhzSDVyqPM9a2JLG8wICVpOp3hrHvTcrA6Q/pub?start=false&loop=false&delayms=3000) (slides)
    + [Git Basics](https://docs.google.com/presentation/d/1szPjE9eDD23YdZiq3-Tk85ZprY7d31uRtVxgTXSS_rc/pub?start=false&loop=false&delayms=3000) (slides)
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
    + [Data Tables](https://docs.google.com/presentation/d/1WQIrQxtNXhEEpI0Yd5Ch4r2zwIp3KG2O_BVY5nsdY4Q/pub?start=false&loop=false&delayms=3000) (slides)
    + [Data Frames](https://docs.google.com/presentation/d/e/2PACX-1vQe6DvbQATpBwuDvebpqetMnDEZyGPFtjllqkNpkKlQ07BM9jIJPpTwg-o0o_YSoO2PZkwaaezU6zaz/pub?start=false&loop=false&delayms=3000) (slides)
    + [Importing Tables in R](https://docs.google.com/presentation/d/1vbqZoR2i8z3Zlpc8WxhA3ntKnfB8O1WVKnFVDdxZzdA/pub?start=false&loop=false&delayms=3000) (slides)
    + [Basic manipulation of data frames](https://docs.google.com/presentation/d/1OsxnIgNTZG-gnD0rdTXzqf162_gNqnok_suMHG5KxpU/edit?usp=sharing) (slides)
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
    + [Introduction to the R package `"ggplot2"`](https://docs.google.com/presentation/d/e/2PACX-1vTGKt6asJIPfSXbuO5Jn1qtAOTQbOcWmE0TVXr67z7DOkOUHPj43Vi1Q7hqw-xYTy3pzD2985H9It0T/pub?start=false&loop=false&delayms=3000)
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



## 6. More Wrangling and Graphics (part 2), and Shiny Apps

+ __Dates__: Oct 02-06
+ __Topics__: More `"dplyr"`, `"ggplot2"`, and intro to `"shiny"` apps
+ __Lecture Material__
    + Data pipelines in `"dplyr"`
    + [Mini project](https://docs.google.com/presentation/d/e/2PACX-1vTMRMIlfZM01jAzaEyrbdar-Qxqips_KZii5hM7Ef90h1gMcDL4APl5LpCYlIQGoBEJNUL6CFrXHckp/pub?start=false&loop=false&delayms=3000) (slides)
    + [Introduction to shiny apps](https://docs.google.com/presentation/d/1_XhkkhXA26izACJyoc5JYrWiF_f96a6tD9ZSI5Tm8Os/pub?start=false&loop=false&delayms=3000) (slides)
+ __Lab material__:
    + TBA
+ __Reading__: 
    + [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf) by Hadley Wickham
    + [How to Start Shiny tutorial](https://shiny.rstudio.com/tutorial/) from by Garret Grolemund (RStudio).
+ __Cheat sheet__: 
    + [Shiny Web Apps cheat sheet](../cheat-sheets/shiny-cheatsheet.pdf)


-----



## 7. Programming Basics (for data analysis) part 1

+ __Dates__: Oct 09-13
+ __Topics__: Basics of Functions, R expressions, and conditionals.
+ __Lecture Material__
    + [Introduction to functions](../tutorials/06-intro-to-functions.md)
    + [Introduction to R expressions and conditionals](../tutorials/07-intro-to-expressions-conditionals.md)
+ __Lab material__:
    + [Getting started with functions](../labs/lab06-simple-functions.md)
    + [Getting started with expressions and conditionals](../labs/lab06-simple-conditionals.md)
+ __Reading__: 
    + [chapter 19: Functions](http://r4ds.had.co.nz/functions.html) from _R for Data Science_ by Grolemund and Wickham.
+ __MIDTERM 1__: Fri Oct-13 


-----



## 8. Programming Basics (for data analysis) part 2

+ __Dates__: Oct 16-20
+ __Topics__: Basics of loops, and more about functions.
+ __Lecture Material__
    + [Introduction to loops](../tutorials/08-intro-to-loops.md)
    + [More about functions](../tutorials/09-more-functions.md)
+ __Lab material__: 
    + [Getting started with loops](../labs/lab07-simple-loops.md)
+ __Reading__:
    + [chapter 21: Iteration](http://r4ds.had.co.nz/iteration.html) from _R for Data Science_ by Grolemund and Wickham.
+ __Cheat sheet__: 
+ __HOMEWORK:__ Problem set 3


-----



## 9. Random Numbers and Simulations

+ __Dates__: Oct 23-27
+ __Topics__: Random numbers, sampling, and monte carlo simulation.
+ __Lecture Material__
    + [Introduction to random numbers](../tutorials/10-intro-to-random-numbers.md)
    + [Monte Carlo Simulations](../tutorials/11-intro-to-simulations.md)
+ __Lab material__:
    + [Running Monte Carlo simulations](../labs/lab08-random-numbers.md)
    + [More shiny apps](../labs/08-shiny-simulations.md)
+ __Reading__:
    + TBA.
+ __Cheat sheet__: 
+ __HOMEWORK:__ Problem set 3


-----



## 10. Manipulating Character Strings

+ __Dates__: Oct 30-Nov 03
+ __Topics__: Character strings.
+ __Lecture Material__
    + [Introduction to loops](../tutorials/08-intro-to-loops.md)
    + [More about functions](../tutorials/09-more-functions.md)
+ __Lab material__: 
    + [Getting started with loops](../labs/07-simple-loops.md)
+ __Reading__:
    + [Strings in R](gastonsanchez.com/r4strings) by Gaston Sanchez.
    + [chapter 14: Strings](http://r4ds.had.co.nz/strings.html) from _R for Data Science_ by Grolemund and Wickham.
+ __Cheat sheet__: 


-----



## 11. Regular Expressions

+ __Dates__: Nov 06-10
+ __Topics__: Introduction to Regular Expressions.
+ __Lecture Material__
    + [Introduction to regex](../tutorials/08-intro-to-loops.md)
    + [More about functions](../tutorials/09-more-functions.md)
+ __Lab material__: 
    + [Getting started with loops](../labs/07-simple-loops.md)
+ __Reading__:
    + [Strings in R](gastonsanchez.com/r4strings) by Gaston Sanchez.
+ __Cheat sheet__:
    + [Regular Expressions cheat sheet](../cheat-sheets/regular-expressions-cheatsheet.pdf)
+ __HOMEWORK:__ Problem set 4


-----



## 12. XML

+ __Dates__: Nov 13-17
+ __Topics__: Extensible Markup Language (XML) and related formats.


-----



## 13. Data Visualization

+ __Dates__: Nov 27-Dec 01
+ __Topics__: Visual Perception, Colors, Effective Statistical Graphics


-----



## 14. TBA

+ __Dates__: Dec 04-08
+ __Topics__: TBA
