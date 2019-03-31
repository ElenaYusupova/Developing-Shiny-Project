#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI that asks the user which experimental diets they want to explore.
ui <- fluidPage(
  pageWithSidebar(
    headerPanel(h3('Car Weight vs Miles per Gallon and Number of Cylinders')),
    sidebarPanel(
      sliderInput('slider2', 'Select range of car weight', min = 0, max = 6, value = c(0, 6)),
      selectInput('cyl1', 'Select cylinder number - Option 1', unique(mtcars$cyl)),
      selectInput('cyl2', 'Select cylinder number - Option 2', unique(mtcars$cyl)),
      selectInput('cyl3', 'Select cylinder number - Option 3', unique(mtcars$cyl))
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput('plot1')),
        tabPanel("Instructions", verbatimTextOutput("summary"))
      )
    )
  )
)

