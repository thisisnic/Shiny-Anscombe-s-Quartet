library(shiny)
library(shinydashboard)


shinyUI(dashboardPage(skin="yellow",
  
  header <- dashboardHeader(title="Exploring Anscombe's Quartet", titleWidth = 300),
  
  sidebar <- dashboardSidebar(
    
    width=300,
    
    sidebarMenu(
      
      menuItem("About", icon = icon("info"), tabName = "about"
               ),
      
      menuItem("Data", icon = icon("bar-chart"), tabName = "data"),
               
               
              
      
      radioButtons("radio",
                   "Which dataset would you like to explore?:",
                   choices=list("1" = 1, "2" = 2,
                                "3" = 3, "4" = 4),
                   selected=1
      )
    ) # closes sidebarmenu
  ),
  body <- dashboardBody(
    
      
      
      tabItems(
        tabItem(
          tabName = "about",
          box(title="About", width=12, color="orange",
            p("Ancombe's Quartet is a group of 4 datasets constructed in 1973 by Francis Anscombe.
            They are commonly used to emphasise the importance of exploratory anlayses."),
            p("Although these datasets all have identical or very similar means of x and y, 
              variances of x and y, and correlations between x and y, when we plot them we
              can see that they show distinctly different trends in the data."),
            p("Click on the Data tab to view each of the datasets in Anscombe's Quartet.")
            
          ) 
        ),
          
        tabItem(
          tabName = "data",
          box(title="Data statistics and plot", width = 12,
              
              fluidRow(
                column(12, h3(textOutput("datasetNumber")))
                       ),
              fluidRow(
                column(2,dataTableOutput("ans_table")),
                column(4,
                       uiOutput("properties")),
                column(6,
                       plotOutput("distPlot")
                )
                )
             
              )
          #box(title="Plots", width=12,
                 
          #)
        )
    
      )
    
    ) # closes body
    
  ) # closes page
  
  
)