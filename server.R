#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# Libraries
library(maps)
library(mapproj)
library(plyr)
library(shiny)

# Load data
load("data/POV05.Rda")
load("data/POV10.Rda")
load("data/POV15.Rda")

# Merge into one data frame
poverty <- join_all(list(poverty2005,poverty2010,poverty2015), by='name', type='left')
poverty <- na.omit(poverty)

# Map function
source("helpers.R")
    
shinyServer(
  function(input, output) {

    # Map poverty rates by year
        output$map <- renderPlot({
            
        data <- switch(input$var, 
                "2005" = poverty$POV05,
                "2010" = poverty$POV10,
                "2015" = poverty$POV15)
     
        color <- switch(input$var, 
                "2005" = "darkgreen",
                "2010" = "darkorange",
                "2015" = "darkviolet")
     
        legend <- switch(input$var, 
                "2005" = "% in 2005",
                "2010" = "% in 2010",
                "2015" = "% in 2015")
      
        percent_map(var = data, 
                color = color, 
                legend.title = legend, 
                max = input$range[2], 
                min = input$range[1])
      
        }) 
    
        # Summary table
        output$summary <- renderPrint({
                summary(poverty)
        })
  
})