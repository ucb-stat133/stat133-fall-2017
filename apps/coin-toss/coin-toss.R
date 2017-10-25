# Shiny app for tossing coin
# Author: Gaston Sanchez

library(shiny)
library(ggplot2)

# toss function
# x: a coin object (i.e. vector)
# times: number of tosses
# prob: optional probability vector
toss <- function(x, times = 1, prob = NULL) {
  sample(x, size = times, replace = TRUE,
         prob = prob)
}


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Frequency of Heads"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        sliderInput("prob",
                    "Prob of heads",
                    min = 0,
                    max = 1,
                    value = 0.5),
        sliderInput("times",
                     "Number of tosses",
                     min = 1,
                     max = 5000,
                     value = 100),
         numericInput("seed", label = "random seed", value = 123)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)


# Define server logic required to draw the plot
server <- function(input, output) {
  
   output$distPlot <- renderPlot({
     coin <- c('heads', 'tails')
     set.seed(input$seed)
     tosses <- toss(coin, times = input$times, 
                    prob = c(input$prob, 1 - input$prob))
     
     head_freqs <- cumsum(tosses == 'heads')
     head_props <- head_freqs / (1:length(tosses))
     
     heads_df <- data.frame(
       num_tosses = 1:length(tosses),
       head_props = head_props
     )
      # draw frequency line
      ggplot(data = heads_df, aes(x = num_tosses, y = head_props)) +
        geom_hline(yintercept = 0.5, col = 'gray50') +
        geom_path(size = 1.5, color = '#4078d1') +
        ylim(0, 1) + 
        xlab("Number of tosses") +
        ylab("Proportion of heads")
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

