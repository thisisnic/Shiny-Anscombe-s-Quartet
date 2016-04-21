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
        tabPanel("Description",
                 p("Ancombe's Quartet is a group of 4 datasets constructed in 1973 by Francis Anscombe.
                   They are commonly used to emphasise the importance of exploratory anlayses."),
                 p("Although these datasets all have identical or very similar means of x and y, 
                   variances of x and y, and correlations between x and y, when we plot them we
                   can see that they show distinctly different trends in the data."),
                 p(
                   strong("Toggle through the different datasets on the left and select a tab 
                          to the right to explore the datasets")
                 )
                ),
        tabPanel("View Raw Data", tableOutput("ans_table")),
        tabPanel("View Data Properties",
                 
                 # Although the sidebar shows the number, reflected here so the user can see that...
                 # ...something is being updated.
                 
                 
                 p(h3(textOutput("dataset_number"))),
                 p(strong(tableOutput("properties")))
                 #p(strong("Mean (x):", textOutput("data_meanx"))),
                 #p(strong("Mean (y):", textOutput("data_meany"))),
                 #p(strong("Variance (x):", textOutput("data_varx"))),
                 #p(strong("Variance (y):", textOutput("data_vary"))),
                 #p(strong("Correlation between x and y:", textOutput("correlation")))
                 
                 ),
        tabPanel("Plot Data", plotOutput("distPlot"))
        
      )
      
    )
  )
)
)
