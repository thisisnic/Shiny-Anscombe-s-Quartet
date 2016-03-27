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
      
      tabsetPanel(
        tabPanel("Plot", plotOutput("distPlot")), 
        tabPanel("Description", p("Ancombe's Quartet is a group of 4 datasets constructed in 1973 by Francis Anscombe.  They are commonly used to emphasise the importance of exploratory anlayses."),  p("  Although these datasets all have identical or very similar means of x and y, variances of x and y, and correlations between x and y, when we plot them we can see that they show distinctly different trends in the data."))
      )
      
    )
  )
)
)
