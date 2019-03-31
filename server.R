#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# Define server logic plot comparison
server <- function(input, output) {
  
  # print(input)
  
  library(dplyr)
  library(ggplot2)
  
  selected_mtcars <- reactive({
    subset(mtcars, cyl == input$cyl1 | cyl == input$cyl2 | cyl == input$cyl3)
  })
  
  
  output$plot1 <- renderPlot({
    
    
    ggplot(selected_mtcars(), aes(x=wt, y=mpg, fill=cyl)) +
      theme(panel.background = element_rect(fill = NA),
            panel.grid.minor = element_line(color = NA),
            panel.grid.major.x = element_line(color = NA),
            panel.grid.major.y = element_line(color = "grey95"),
            panel.border = element_rect(color = "black", fill = NA, size = 1),
            plot.title = element_text(hjust = 0.5),
            text = element_text(size = 10, color = "black", face = "bold"),
            plot.caption = element_text(hjust = 0.5)) + 
      geom_point(size=2) +
      geom_label(label=rownames(selected_mtcars()), color="white", size=3) + 
      xlim(input$slider2) +
      scale_shape_manual(values = c(1,16)) +
      labs(y = "Miles per Gallon",
           x = "Car weight in 000s pounds",
           title = "Car weight vs MPG by car cylinders")
    
    
  })
  
  output$summary <- renderText({
    print("The developed shiny application visualize the relationship between the car weight and miles per gallon for selected car brands with different number of cylinders. The application enables users
- to select the range of car weight and re-plotting the chart using the range slider
- to select a subset of cars with specific number of cylinders (4, 6 or 8) using the input boxes and investigate how the relationship between car weight and mpg changes by the number of cylinders.
- the results are visualised as a scatter plot with each data point clearly labelle with car brand name.")
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)