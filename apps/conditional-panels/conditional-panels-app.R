###########################################################
# Title: Conditional Panels with mtcars data set
#
# Description:
#   This shiny app contains two tabs; see tabsetPanel()
#   Each tab shows a different sidebar panel.
#   The sibar bar panels are handled with 'conditionalPanel()'
#
# Details:
#   The graphics in each tab are obtained with ggvis
#
# Author: Gaston Sanchez
###########################################################

# required packages
library(shiny)
library(ggvis)
library(dplyr)

# convert some variables as factors, for barcharts
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$am <- as.factor(mtcars$am)
mtcars$gear <- as.factor(mtcars$gear)
mtcars$carb <- as.factor(mtcars$carb)
mtcars$vs <- as.factor(mtcars$vs)

# Variable names for barcharts
categorical <- c('cyl', 'am', 'gear', 'carb', 'vs')

# Variable names for histograms
continuous <- c('mpg', 'disp', 'hp', 'drat', 'wt', 'qsec')


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Conditional Panels"),
  
  # Sidebar with different widgets depending on the selected tab
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(condition = "input.tabselected==1",
                       h3("Panel of 1st tab"),
                       selectInput("var1", "Select a factor", categorical, 
                                   selected = "am"),
                       sliderInput("width", "Bin Width", 
                                   min = 0.2, max = 1, value = 0.2)),
      conditionalPanel(condition = "input.tabselected==2",
                       h3("Panel of 2nd tab"),
                       selectInput("var2", "X-axis variable", continuous, 
                                   selected = "mpg")
      )
    ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Barchart", value = 1, 
                           ggvisOutput("barchart")),
                  tabPanel("Histogram", value = 2, 
                           ggvisOutput("histogram")),
                  id = "tabselected")
    )
  )
)


# Define server logic
server <- function(input, output) {
  # Barchart (for 1st tab)
  vis_barchart <- reactive({
    # Normally we could do something like ggvis(x = ~mpg),
    # but since the inputs are strings, we need to do a little more work.
    var1 <- prop("x", as.symbol(input$var1))
    mtcars %>% 
      ggvis(x = var1, fill := "#ef623b") %>% 
      layer_bars(stroke := '#ef623b', width = input$width,
                 fillOpacity := 0.8, fillOpacity.hover := 1) %>%
      add_axis("y", title = "frequency")
  })
  
  vis_barchart %>% bind_shiny("barchart")
  
  
  # Histogram (for 2nd tab)
  vis_histogram <- reactive({
    # Normally we could do something like ggvis(x = ~mpg),
    # but since the inputs are strings, we need to do a little more work.
    var2 <- prop("x", as.symbol(input$var2))
    
    mtcars %>% 
      ggvis(x = var2, fill := "#abafb5") %>% 
      layer_histograms(stroke := 'white',
                       width = input$bins)
  })
  
  vis_histogram %>% bind_shiny("histogram")
  
}

# Run the application 
shinyApp(ui = ui, server = server)

