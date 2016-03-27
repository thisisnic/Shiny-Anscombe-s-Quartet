library(shiny)

shinyServer(function(input, output) {

  # a reactive plot
  output$distPlot <- renderPlot({
    
    # get the appropriate values using the radio input
    x = anscombe[,c(as.numeric(input$radio),as.numeric(input$radio)+4)]
  
    # plot the selected values
    plot(x, xlim=c(3,20), ylim=c(3,20), type="p", pch=16)
    
  })
})
