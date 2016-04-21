library(shiny)

shinyServer(function(input, output) {
  
  
  # a reactive plot
  output$distPlot <- renderPlot({
    
    # get the appropriate values using the radio input
    # the +4 refers to the fact that the corresponding x and y columns are 4 columns apart
    x = anscombe[,c(as.numeric(input$radio),as.numeric(input$radio)+4)]
    
    # plot the selected values
    # the xlim and ylim have been set here manually so all plots are the same size and do not crop any data
    plot(x, xlim=c(3,20), ylim=c(3,15), type="p", pch=16, main=paste("Dataset ",as.numeric(input$radio)))
  })
  
  output$ans_table <- renderTable({
    anscombe[,c(as.numeric(input$radio),as.numeric(input$radio)+4)] 
  }
  )
  
  output$data_meanx <- renderText({
    number = as.numeric(input$radio)
    mean(anscombe[,number])
  })
  
  output$data_meany <- renderText({
    number = as.numeric(input$radio)
    mean(anscombe[,number+4])
  })
  
  output$dataset_number<-renderText({
    paste("Dataset ", as.numeric(input$radio))
  })
  
  output$data_varx <- renderText({
    number = as.numeric(input$radio)
    var(anscombe[,number])
  })
  
  output$data_vary <- renderText({
    number = as.numeric(input$radio)
    var(anscombe[,number+4])
  })
  
  output$correlation <- renderText({
    number = as.numeric(input$radio)
    cor(anscombe[,number],anscombe[,number+4])
  })
  
  output$properties<-renderTable({
    
    number = as.numeric(input$radio)
    
    dataPropLabels<-c("Mean (x): ",
                      "Mean (y): ",
                      "Variance (x): ",
                      "Variance (y): ",
                      "Correlation (x~y): "
                      )
    
    dataProperties<-c(mean(anscombe[,number]),
                      mean(anscombe[,number+4]),
                      var(anscombe[,number]),
                      var(anscombe[,number+4]),
                      cor(anscombe[,number],anscombe[,number+4])
                      )
    
   data.frame(row.names = dataPropLabels, Value=dataProperties)
    
   
   
  })
  
})
