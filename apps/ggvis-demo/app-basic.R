library(shiny)

source("functions.R")

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("select", label = h3("Select box"), 
                  choices = list("eruptions" = "eruptions", 
                                 "waiting" = "waiting"), 
                  selected = "eruptions"),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      radioButtons("scale", label = h3("choose scale"),
                   choices = list("none" = 1, 
                                  "std units" = 2, 
                                  "scale" = 3), 
                   selected = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[ ,input$select]
    if (input$scale == 1) {
      x
    } else if (input$scale == 2) {
      x <- standardize(x)
    } else {
      x <- rescale(x)
    }
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'blue', border = 'white',
         main = input$select, xlab = input$select)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

