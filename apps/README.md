# Shiny Apps

This is a collcetion of Shiny apps used during lecture.

- [Tossing a coin](coin-toss)


## Running the apps

Assuming that you have both R and RStudio, the other thing you need is the R package `"shiny"`. In case of doubt, run:

```R
install.packages("shiny")
```

The easiest way to run an app is with the `runGitHub()` function from the `"shiny"` package. For instance, to run the app contained in the [coin-toss](coin-toss) folder, run the following code in R:

```R
library(shiny)

# Run an app from a subdirectory in the repo
runGitHub("stat133-fall-2017", "ucb-stat133", subdir = "apps/coin-toss")
```

