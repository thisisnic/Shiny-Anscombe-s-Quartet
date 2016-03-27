library(shiny)

shinyUI(fluidPage(
                  
  titlePanel("Exploring Anscombe's Quartet"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      # radio buttons to select which dataset to examine
      radioButtons("radio",
                  "Which dataset would you like to examine?:",
                  choices=list("1" = 1, "2" = 2,
                               "3" = 3, "4" = 4),
                  selected=1
      )
                  
    ),
    
    
    mainPanel(
     
      plotOutput("distPlot")
    )
  )
)
)
