library(shiny)
library(shinydashboard)


# Make the dataset available in the global environment
anscombe_data <- anscombe

shinyServer(function(session, input, output) {
  
  
  # a reactive plot
  output$distPlot <- renderPlot({
    
    # get the appropriate values using the radio input
    # the +4 refers to the fact that the corresponding x and y columns are 4 columns apart
    x = anscombe_data[,c(as.numeric(input$radio),as.numeric(input$radio)+4)]
    
    # plot the selected values
    # the xlim and ylim have been set here manually so all plots are the same size and do not crop any data
    plot(x, xlim=c(3,20), ylim=c(3,15), type="p", pch=16, main=paste("Dataset ",as.numeric(input$radio)))
  })
  
  output$ans_table <- renderTable({
    anscombe_data[,c(as.numeric(input$radio),as.numeric(input$radio)+4)] 
  }
  )
  
  output$dataset_number<-renderText({
    paste("Dataset ", as.numeric(input$radio))
  })
  
  
  output$properties<-renderTable({
    
    number = as.numeric(input$radio)
    
    dataPropLabels<-c("Mean (x): ",
                      "Mean (y): ",
                      "Variance (x): ",
                      "Variance (y): ",
                      "Correlation (x~y): "
                      )
    
    dataProperties<-c(mean(anscombe_data[,number]),
                      mean(anscombe_data[,number+4]),
                      var(anscombe_data[,number]),
                      var(anscombe_data[,number+4]),
                      cor(anscombe_data[,number],anscombe_data[,number+4])
                      )
    
   data.frame(row.names = dataPropLabels, Value=dataProperties)
    
   
   
  })
  
  output$tabLabel <- renderText({paste0("You are viewing tab \"", input$whichTab, "\"")})
  
})
