library(shiny)
library(shinydashboard)
library(ggplot2)
library(DT)

# Make the dataset available in the global environment
anscombe_data <- anscombe

shinyServer(function(session, input, output) {
  
  
  # a reactive plot
  output$distPlot <- renderPlot({
    
    # get the appropriate values using the radio input
    x <- anscombe_data[,c(as.numeric(input$radio),as.numeric(input$radio)+4)]
    names(x) <- c("x1", "y1")
    
    # plot the selected values
    # the xlim and ylim have been set here
    # manually so all plots are the same size and do not crop any data
    ggplot(x, aes(x=x1, y=y1)) +
      geom_point(size=3) +
      geom_smooth(method = "lm") +
      labs(x="x", y = "y") +
      scale_x_continuous(limits=c(3,20)) + 
      scale_y_continuous(limits=c(3,15))
  
      
    
    # plot(x, xlim=c(3,20), ylim=c(3,15), type="p", pch=16, main=))
  })
  
  
  output$plot1 <- renderPlot({
    
    # get the appropriate values using the radio input
    x <- anscombe_data[,c(1,5)]
    names(x) <- c("x1", "y1")
    
    # plot the selected values
    # the xlim and ylim have been set here
    # manually so all plots are the same size and do not crop any data
    ggplot(x, aes(x=x1, y=y1)) +
      geom_point(size=3) +
      geom_smooth(method = "lm") +
      labs(x="x", y = "y", title="Dataset 1") +
      scale_x_continuous(limits=c(3,20)) + 
      scale_y_continuous(limits=c(3,15))
    
  })
  
  output$plot2 <- renderPlot({
    
    # get the appropriate values using the radio input
    x <- anscombe_data[,c(2,6)]
    names(x) <- c("x1", "y1")
    
    # plot the selected values
    # the xlim and ylim have been set here
    # manually so all plots are the same size and do not crop any data
    ggplot(x, aes(x=x1, y=y1)) +
      geom_point(size=3) +
      geom_smooth(method = "lm") +
      labs(x="x", y = "y", title="Dataset 2") +
      scale_x_continuous(limits=c(3,20)) + 
      scale_y_continuous(limits=c(3,15))
    
  })
  
  output$plot3 <- renderPlot({
    
    # get the appropriate values using the radio input
    x <- anscombe_data[,c(3,7)]
    names(x) <- c("x1", "y1")
    
    # plot the selected values
    # the xlim and ylim have been set here
    # manually so all plots are the same size and do not crop any data
    ggplot(x, aes(x=x1, y=y1)) +
      geom_point(size=3) +
      geom_smooth(method = "lm") +
      labs(x="x", y = "y", title="Dataset 3") +
      scale_x_continuous(limits=c(3,20)) + 
      scale_y_continuous(limits=c(3,15))
    
  })
  
  output$plot4 <- renderPlot({
    
    # get the appropriate values using the radio input
    x <- anscombe_data[,c(4,8)]
    names(x) <- c("x1", "y1")
    
    # plot the selected values
    # the xlim and ylim have been set here
    # manually so all plots are the same size and do not crop any data
    ggplot(x, aes(x=x1, y=y1)) +
      geom_point(size=3) +
      geom_smooth(method = "lm") +
      labs(x="x", y = "y", title="Dataset 4") +
      scale_x_continuous(limits=c(3,20)) + 
      scale_y_continuous(limits=c(3,15))
    
  })
  
  
  output$ans_table <- renderTable({
    df <- anscombe_data[,c(as.numeric(input$radio),as.numeric(input$radio)+4)] 
    names(df) <- c("x", "y")
    df
  })
  
  output$datasetNumber<-renderText({
    paste("Dataset ", as.numeric(input$radio))
  })
  
  output$radios <- renderUI({
    
    radioButtons("radio",
                 "Which dataset would you like to explore?:",
                 choices=list("1" = 1, "2" = 2,
                              "3" = 3, "4" = 4),
                 selected=1
    )
    
  })
  
  
  output$properties<-renderUI({
    
    number = as.numeric(input$radio)
    
    list(
         
         column(width=12,
                fluidRow(
                  valueBox(round(mean(anscombe_data[,number]),2),
                           "Mean (x)", color="yellow", width=6),
                  valueBox(round(mean(anscombe_data[,number+4]),2),
                           "Mean (y)", color="yellow", width=6)
                )),
         
         column(width=12,
                fluidRow(
                  valueBox(round(var(anscombe_data[,number]),2),
                           "Variance (x)", color="yellow", width=6),
                  valueBox(round(var(anscombe_data[,number+4]),2),
                           "Variance (y)", color="yellow", width=6)
                )),
         
         column(width=12,
                fluidRow(
                valueBox(round(cor(anscombe_data[,number],anscombe_data[,number+4]),2),
                         "Correlation (x~y)", color="yellow", width=12, icon=icon("line-chart"))
                ))
         

    )
   
  })
  
})
