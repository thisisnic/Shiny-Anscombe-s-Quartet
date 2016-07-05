library(shiny)
library(shinydashboard)


shinyUI(dashboardPage(
  
  header <- dashboardHeader(title="Exploring Anscombe's Quartet", titleWidth = 300),
  
  sidebar <- dashboardSidebar(
    
    width=300,
    
    sidebarMenu(
      
      menuItem("Description", icon = icon("info"), tabName = "desc"
               ),
      
      menuItem("Explore the data", icon = icon("bar-chart"), tabName = "explore",
               menuSubItem("Raw Data", tabName="raw"),
               menuSubItem("Summary Statistics", tabName="stats"),
               menuSubItem("Plots", tabName="plots"),
               
               
               radioButtons("radio",
                            "Which dataset would you like to explore?:",
                            choices=list("1" = 1, "2" = 2,
                                         "3" = 3, "4" = 4),
                            selected=1
               )
      )
    ) # closes sidebarmenu
  ),
  body <- dashboardBody(
    
      
      
      tabItems(
        tabItem(
          tabName = "desc",
          box(title="About Anscombe's Quartet", width=12, color="orange",
            p("Ancombe's Quartet is a group of 4 datasets constructed in 1973 by Francis Anscombe.
            They are commonly used to emphasise the importance of exploratory anlayses."),
            p("Although these datasets all have identical or very similar means of x and y, 
              variances of x and y, and correlations between x and y, when we plot them we
              can see that they show distinctly different trends in the data.")
            
          ) 
        ),
          
        tabItem(
          tabName = "raw",
          box(title="Raw Data", width = 4,
              tableOutput("ans_table")
              
              )
        ),
        
        tabItem(
          tabName="stats",
          box(title="Summary Statistics", width = 6,
              p(h4(textOutput("dataset_number"))),
              p(tableOutput("properties"))    
              )
          
        ),
        
        tabItem(
          tabName="plots",
          box(title="Plots", width=12,
              plotOutput("distPlot")    
              )
        )
        
      )
    
    ) # closes body
    
  ) # closes page
  
  
)