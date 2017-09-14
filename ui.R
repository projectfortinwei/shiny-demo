#in ui.R
library(shiny)
shinyUI(bootstrapPage(
  
  headerPanel("Our first Shiny app"),
  
  sidebarPanel(
    
    selectInput(inputId = "n_breaks",label = "number of breaks",choices = c(10, 20, 35, 50),selected = 20),
    checkboxInput(inputId = "individual_obs",label = strong("individual observations"),value = FALSE),
    checkboxInput(inputId = "density",label = strong("density"),value = FALSE)
  ),
  
  mainPanel(
    plotOutput(outputId = "main_plot", height = "300px"),
    
    conditionalPanel(condition = "input.density == true",
                     sliderInput(inputId = "bw_adjust",label = "bandwidth adjustment", min = 0.2, max = 2, value = 1, step = 0.2)
    )
  )
))



