library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  # Because we've got this as an attribute of output, we can just refer to it as plotOutput("distPlot") in the ui file
  output$distPlot <- renderPlot({
    
    # x is a vector of numbers
    
    # get the relevant columns of the dataset
    x = anscombe[,c(as.numeric(input$radio),as.numeric(input$radio)+4)]
  
    # draw the histogram with the specified number of bins
    plot(x, xlim=c(3,20), ylim=c(3,20), type="p", pch=16)
    
  })
})
