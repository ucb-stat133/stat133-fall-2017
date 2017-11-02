library(shiny)
library(ggvis)

source("functions.R")

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("select", label = h3("Select variable"), 
                  choices = list("eruptions" = "eruptions", 
                                 "waiting" = "waiting"), 
                  selected = "eruptions"),
      sliderInput("width",
                  "Bind width",
                  min = 0.2,
                  max = 2,
                  value = 1),
      radioButtons("scale", label = h3("choose scale"),
                   choices = list("none" = 1, 
                                  "std units" = 2, 
                                  "scale" = 3), 
                   selected = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      ggvisOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  vis_plot <- reactive({
    # Normally we could do something like props(x = ~HW1, y = ~HW2),
    # but since the inputs are strings, we need to do a little more work.
    xvar <- prop("x", as.symbol(input$select))

    histogram <- faithful %>%
      ggvis(x = xvar) %>%
      layer_histograms(stroke := 'white', width = input$width)
  })
  
  vis_plot %>% bind_shiny("distPlot")
}

# Run the application 
shinyApp(ui = ui, server = server)

