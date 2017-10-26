# Lab 9, Stat 133 Fall 2017, Prof. Sanchez
# Shiny App version 1: Drawing balls from boxes
# Inputs:
#   repetitions: number of repetitions
#
# Outputs:
#   frequency plot of number of blue balls

library(shiny)
library(ggplot2)


# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Drawing Balls Experiment"),
  
  # Sidebar  
  sidebarLayout(
    sidebarPanel(
      sliderInput("repetitions",
                  label = "Number of repetitions:",
                  min = 1,
                  max = 5000,
                  value = 100)
    ),
    
    # Show a plot of the relative frequencies
    mainPanel(
      plotOutput("freqs_plot")
    )
  )
)


# Define server logic required to draw the plot
server <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$freqs_plot <- renderPlot({
    # boxes as character vectors 
    box1 <- c('blue', 'blue', 'red')
    box2 <- c('blue', 'blue', 'red', 'red', 'red', 'white')
    
    size <- 4
    drawn_balls <- matrix("", input$repetitions, size)
    
    for (r in 1:input$repetitions) {
      aux <- runif(1)
      if (aux > 0.5) {
        drawn_balls[r, ] <- sample(box1, size, replace = TRUE)
      } else {
        drawn_balls[r,] <- sample(box2, size)
      }
    }
    
    # number of blue balls in each repetition
    blue_counts <- apply(drawn_balls, 1, function(x) sum(x == 'blue'))
    
    # progression of relative frequencies
    blue_freqs <- vector(mode = "list", length = 5)
    for (num_blue in 0:4) {
      temp_freqs <- cumsum(blue_counts == num_blue) / (1:input$repetitions)
      blue_freqs[[num_blue + 1]] <- temp_freqs
    }
    
    dat <- data.frame(
      reps = rep(1:input$repetitions, 5),
      freqs = unlist(blue_freqs),
      number = factor(rep(0:4, each = input$repetitions))
    )
    
    ggplot(data = dat, aes(x = reps, y = freqs, group = number)) +
      geom_path(aes(color = number)) +
      ggtitle("Relative frequencies of number of blue balls")
  })
}


# Run the application 
shinyApp(ui = ui, server = server)



