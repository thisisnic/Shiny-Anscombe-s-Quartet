library(shiny)
library(shinydashboard)


shinyUI(dashboardPage(
  
  header <- dashboardHeader(title="Exploring Anscombe's Quartet"),
  
  sidebar <- dashboardSidebar(
    
    sidebarMenu(
      menuItem("Description", icon = icon("users"), tabName = "desc"
               ),
      
      menuItem("Explore the data", icon = icon("users"), tabName = "explore",
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
    
      
      tabItem(
        tabName = "desc",
        p("Ancombe's Quartet is a group of 4 datasets constructed in 1973 by Francis Anscombe.
                   They are commonly used to emphasise the importance of exploratory anlayses."),
        p("Although these datasets all have identical or very similar means of x and y, 
          variances of x and y, and correlations between x and y, when we plot them we
          can see that they show distinctly different trends in the data.")
      ),
      tabItems(
        tabItem(
          tabName = "raw",
          tableOutput("ans_table")
        ),
        
        tabItem(
          tabName="stats",
          p(h3(textOutput("dataset_number"))),
          p(tableOutput("properties"))
        ),
        
        tabItem(
          tabName="plots",
          plotOutput("distPlot")
        )
      )
    
    ) # closes body
    
  ) # closes page
  
  
)