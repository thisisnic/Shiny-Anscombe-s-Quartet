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
      labs(x="x", y = "y", title=paste("Dataset ",as.numeric(input$radio))) +
      scale_x_continuous(limits=c(3,20)) + 
      scale_y_continuous(limits=c(3,15))
  
      
    
    # plot(x, xlim=c(3,20), ylim=c(3,15), type="p", pch=16, main=))
  })
  
  output$ans_table <- renderDataTable({
    df <- anscombe_data[,c(as.numeric(input$radio),as.numeric(input$radio)+4)] 
    names(df) <- c("x", "y")
    datatable(df, 
              options=list(bFilter=0,bLengthChange=0,bInfo=0, paging = FALSE))
  })
  
  output$dataset_number<-renderText({
    paste("Dataset ", as.numeric(input$radio))
  })
  
  
  
  output$properties<-renderUI({
    
    number = as.numeric(input$radio)
    
    #dataPropList<-list(paste("Mean (x):",round(mean(anscombe_data[,number])),2),
    #                  paste("Mean (y):", round(mean(anscombe_data[,number+4]),2)),
    #                  paste("Variance (x):",round(var(anscombe_data[,number]),2)),
    #                  paste("Variance (y):",round(var(anscombe_data[,number+4]),2)),
    #                  paste("Correlation (x~y):",round(cor(anscombe_data[,number],anscombe_data[,number+4]),2))
    #)
    
    list(h4(paste("Summary Statistics - Dataset", number)),
         
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
