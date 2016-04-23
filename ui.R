library(shiny)

shinyUI(fluidPage(
                  
  titlePanel("Exploring Anscombe's Quartet"),
  
  
  sidebarLayout(
    
    sidebarPanel(
      
      # use conditional panels so only display the dataset selector on relevant tabs
      # if the user is not on the 'description' tab, show the dataset selector
      conditionalPanel(
        'input.whichTab != "desc"',
        
        # radio buttons to select which dataset to examine
        radioButtons("radio",
                     "Which dataset would you like to examine?:",
                     choices=list("1" = 1, "2" = 2,
                                  "3" = 3, "4" = 4),
                     selected=1
        )
      ),
      
      # if the user is on the 'description' tab, show some help text
      conditionalPanel(
        'input.whichTab === "desc"',
        helpText("Select a tab to the right to explore the datasets")
      )
                  
    ),
    
    mainPanel(
      
      tabsetPanel(
        id="whichTab",
        
        tabPanel("Description",
                 p("Ancombe's Quartet is a group of 4 datasets constructed in 1973 by Francis Anscombe.
                   They are commonly used to emphasise the importance of exploratory anlayses."),
                 p("Although these datasets all have identical or very similar means of x and y, 
                   variances of x and y, and correlations between x and y, when we plot them we
                   can see that they show distinctly different trends in the data."),
                 value="desc"),
        
        tabPanel("View Raw Data", tableOutput("ans_table"), value="raw"),
        
        tabPanel("View Data Properties",
                 
                 # Although the sidebar already shows the number, it's duplicated... 
                 # ...here so the user can see that something is being updated.
                 p(h3(textOutput("dataset_number"))),
                 p(tableOutput("properties")),
                 value="prop"),
        
        tabPanel("Plot Data", plotOutput("distPlot"), value="plot")
        
      )
    )
  )
)
)
