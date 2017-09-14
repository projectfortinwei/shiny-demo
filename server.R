#in server.R
library(shiny)
shinyServer(function(input, output) {
  
  output$main_plot <- renderPlot({
    
    hist(faithful$eruptions,
         probability = TRUE,
         breaks = as.numeric(input$n_breaks),
         xlab = "eruptions",
         main = "eruption time")
    if (input$individual_obs) {
      rug(faithful$eruptions)
    }
    if (input$density) {
      dens <- density(faithful$eruptions, adjust = input$bw_adjust)
      lines(dens, col = "blue")
    }
  })
})
