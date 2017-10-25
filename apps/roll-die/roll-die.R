# Title: Chevalier De Mere's game 1
# Description: this app simulates playing De Mere's game 1
#              getting at least one six in 4 rolls of a die
# Author: Gaston Sanchez


library(shiny)

roll <- function(x, times = 1) {
  sample(x, size = times, replace = TRUE)
}


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("De Mere's Game 1"),
  
  # Sidebar with a slider input for number of games 
  sidebarLayout(
    sidebarPanel(
      sliderInput("games",
                  "Number of games:",
                  min = 1,
                  max = 1000,
                  value = 100),
      sliderInput("wager",
                  "Wager (money you bet per game)",
                  min = 1,
                  max = 50,
                  value = 1),
      numericInput("seed",
                   "Random Seed",
                   value = 1234),
      hr(),
      helpText("Wins"),
      verbatimTextOutput("wins"),
      helpText("Losses"),
      verbatimTextOutput("losses"),
      helpText("Net gain"),
      verbatimTextOutput("gain")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("dist_plot")
    )
  )
)

# Define server logic required to draw the plot
server <- function(input, output) {

  sixes <- reactive({
    set.seed(input$seed)
    sixes <- rep(0, input$games)
    for (g in 1:input$games) {
      rolls <- roll(die, times = 4)
      sixes[g] <- sum(rolls == 6)
    }
    sixes
  })
  
  gain <- reactive({
    results <- rep(0, input$games)
    results[sixes() != 0 ] <- 1
    results[sixes() == 0] <- -1
    cumsum(results)
  })
  
  losses <- reactive(sum(sixes() == 0))
  wins <- reactive(input$games - losses())
  net_gain <- reactive(input$wager * (wins() - losses()))
  
  output$dist_plot <- renderPlot({
    # draw the barchart with the distribution for number of sixes
    colors <- rep("#4078d1", input$games)
    colors[gain() < 0] <- "#d1405f"
    colors[gain() == 0] <- "gray50"
    plot(gain(), pch = 20,
            las = 1, col = colors,
            xlab = "Number of games",
            ylab = "Net Gain",
            main = "Net Gain")
    #lines(1:input$games, gain(), col = colors)
    abline(h = 0, col = 'gray70', lwd = 2)
  })
  
  output$wins <- renderText({
    wins()
  })
  output$losses <- renderText({
    losses()
  })
  output$gain <- renderText({
    net_gain()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

