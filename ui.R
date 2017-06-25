#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

shinyUI(fluidPage(
  titlePanel("U.S. Poverty Rates"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create poverty maps with 
        information from the US Census."),
    
      selectInput("var", 
        label = "Choose a year to display:",
        choices = c("2005", "2010", "2015"),
        selected = "2015"),
    
      sliderInput("range", 
        label = "Range of interest:",
        min = 0, max = 100, value = c(0, 100))
    ),
  
    mainPanel(
      tabsetPanel(type = "tabs", 
        tabPanel("Main",
                 br(),
                 p(strong("Welcome to my Poverty Visualization App!")),
                 p("How to get started:"),
                 p("* All you need is to select a year in the drop down menu on the left. For the moment, the app covers only three years, i.e. 2005, 2010 and 2015. However, more years will be added soon."), 
                 p("* Next, use the slider to choose the range you are interested in, i.e. from 0 to 100 percent. This feature will show you the concentration of households living in poverty in that range."),
                 p("* Finally, go to the tab named “Map” to view the distribution of poverty rates across counties in the lower 48 states."),
                 p("* Summary statistics for the three years are in the tab named “Summary”."),
                 br(),
                 p(strong("R Codes and More:")),
                 p("* The source codes and data used to create this app are available on my ",
                   a("GitHub page.",
                     href = "https://github.com/fafdenis/poverty-shiny-app")),
                 p("* Data for this app were downloaded from the ",
                   a("U.S. Census Small Area and Income Poverty Estimates.",
                     href = "https://www.census.gov/did/www/saipe/index.html")),
                 p("* Interested in making your own Shiny web application? Visit the ",
                 a("Shiny homepage ", 
                 href = "http://www.rstudio.com/shiny"),
                 "for an introduction and live examples.")),
        tabPanel("Map", plotOutput("map")), 
        tabPanel("Summary", verbatimTextOutput("summary"))
      )
    )
  )
))